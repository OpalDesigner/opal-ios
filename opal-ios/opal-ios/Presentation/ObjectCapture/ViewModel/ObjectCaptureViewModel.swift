//
//  ObejctCaptureViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//

import SwiftUI

final class ObjectCaptureViewModel: ObservableObject {
    @Published var modelName: String = ""
    @Published var modelCategory: String = "other"
    @Published var selectedImageURL: URL? = nil
    
    private let uploadAssetDataUseCase: UploadAssetDataUseCase
    
    init(
        uploadAssetDataUseCase: UploadAssetDataUseCase = UploadAssetDataUseCaseImpl(repository: ModelAssetRepositoryImpl())
    ) {
        self.uploadAssetDataUseCase = uploadAssetDataUseCase
    }
    
    func addNameAndCategory() {
        print("CYNARA Model Name: \(modelName) | Category: \(modelCategory)")
    }
    
    func uploadModel(data: Data, key: String) {
        let result = uploadAssetDataUseCase.execute(data: data, key: key)
        print("CYNARA UPLOAD: \(result)")
    }
    
    func saveImageToDocuments(image: UIImage, format: ImageFormat = .png) {
        let name = modelName.trimmingCharacters(in: .whitespacesAndNewlines)
        let validName = name.isEmpty ? "model" : name.lowercased()
        
        let fileName = "\(validName).\(format.fileExtension)"
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Failed to access the documents directory.")
            return
        }

        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        let imageData: Data?
        switch format {
        case .png:
            imageData = image.pngData()
        case .jpeg, .jpg:
            imageData = image.jpegData(compressionQuality: 1.0)
        }

        guard let data = imageData else {
            print("Failed to convert image to data.")
            return
        }

        do {
            try data.write(to: fileURL)
            print("Image saved at: \(fileURL)")
            self.selectedImageURL = fileURL
            return
        } catch {
            print("Error saving image: \(error)")
            return
        }
    }
    
    func printSelectedImageStatus() {
        guard let url = selectedImageURL else {
            print("No image URL found.")
            return
        }

        let fileExists = FileManager.default.fileExists(atPath: url.path)

        if fileExists {
            print("Image file exists at: \(url)")
        } else {
            print("Image file not found at: \(url)")
        }
    }
}
