//
//  AddNewModelParamsView.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//
import SwiftUI
import UIKit

struct AddNewModelParamsView: View {
    @ObservedObject var viewModel: ObjectCaptureViewModel
    @ObservedObject var filtersViewModel: FilterViewModel

    @State private var showImagePicker = false
    @State private var showImageSourceDialog = false
    @State private var imageFormat: ImageFormat = .jpeg
    @State private var selectedSourceType: UIImagePickerController.SourceType = .photoLibrary

    @State private var tempImage: UIImage? = nil
    
    let verticalPadding = 16.0
    let cornerRadiusImage = 8.0

    var body: some View {
        VStack {
            OpalTextField(
                placeholder: "Model Name",
                text: $viewModel.modelName,
                style: .primary,
                isSecure: false
            )
            .padding(.vertical, verticalPadding)

            OpalPicker(
                placeholder: "Category",
                selection: $viewModel.modelCategory,
                options: filtersViewModel.filters.dropFirst().map { $0 },
                style: .primary
            ).padding(.bottom, verticalPadding)

            Button(action: {
                showImageSourceDialog = true
            }) {
                if let url = viewModel.selectedImageURL,
                   let data = try? Data(contentsOf: url),
                   let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(cornerRadiusImage)
                } else {
                    OpalButton(title: "Add Image", style: .primary)
                }
            }
            .confirmationDialog("Select Image Source", isPresented: $showImageSourceDialog) {
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    Button("Camera") {
                        selectedSourceType = .camera
                        showImagePicker = true
                    }
                }
                Button("Photo Library") {
                    selectedSourceType = .photoLibrary
                    showImagePicker = true
                }
                Button("Cancel", role: .cancel) {}
            }

            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $tempImage, sourceType: selectedSourceType)
                    .onDisappear {
                        if let image = tempImage {
                            viewModel.saveImageToDocuments(
                                image: image,
                                format: imageFormat
                            )
                        }
                        viewModel.printSelectedImageStatus()
                    }
            }

            Spacer()

            NavigationLink(destination: ObjectCaptureCreationView(viewModel: viewModel)) {
                OpalButton(title: "Create model", style: .primary)
            }
        }
        .padding()
    }
}
