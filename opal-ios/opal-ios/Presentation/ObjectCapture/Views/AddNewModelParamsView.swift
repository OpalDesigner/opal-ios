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

    
    var isFormValid: Bool {
        !viewModel.modelName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
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

            Spacer()
            
            if !isFormValid {
                OpalText(
                    text: "You must provide the model name!",
                    style: .description,
                    alignment: .leading
                ).frame(maxWidth: .infinity, alignment: .leading)
            }
            
            NavigationLink(destination: ObjectCaptureCreationView(viewModel: viewModel)) {
                OpalButton(
                    title: "Create model",
                    style:
                        isFormValid
                    ? .primary
                    : .disable)
            }.disabled(!isFormValid)
        }
        .padding()
    }
}
