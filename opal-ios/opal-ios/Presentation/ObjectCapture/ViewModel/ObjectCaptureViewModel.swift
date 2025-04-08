//
//  ObejctCaptureViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//

import SwiftUI
import SceneKit
import QuickLookThumbnailing

final class ObjectCaptureViewModel: ObservableObject {
    @Published var modelName: String = ""
    @Published var modelCategory: String = "other"
    @Published var selectedImageURL: URL? = nil
    @Published var imageFormat: String = "jpeg"
    @Published var homeViewModel: HomeViewModel
    
    private let uploadAssetDataUseCase: UploadAssetDataUseCase
    
    init(
        uploadAssetDataUseCase: UploadAssetDataUseCase = UploadAssetDataUseCaseImpl(repository: ModelAssetRepositoryImpl()),
        homeViewModel: HomeViewModel
    ) {
        self.uploadAssetDataUseCase = uploadAssetDataUseCase
        self.homeViewModel = homeViewModel
    }
    
    func uploadModel(data: Data, key: String) {
        _ = uploadAssetDataUseCase.execute(data: data, key: key)
    }
    
    func generateThumbnailJPEG(
        for usdzURL: URL,
        size: CGSize = CGSize(width: 256, height: 256),
        compressionQuality: CGFloat = 0.8,
        completion: @escaping (Data?) -> Void
    ) {
        let scale = UIScreen.main.scale
        let request = QLThumbnailGenerator.Request(fileAt: usdzURL, size: size, scale: scale, representationTypes: .all)
        let generator = QLThumbnailGenerator.shared
        
        generator.generateRepresentations(for: request) { (thumbnail, type, error) in
            DispatchQueue.main.async {
                if thumbnail == nil || error != nil {
                    print("Error while generating thumbnail \(String(describing: error))")
                } else {
                    DispatchQueue.main.async {
                        if let thumbnail = thumbnail,
                           let jpegData = thumbnail.uiImage.jpegData(compressionQuality: compressionQuality) {
                            completion(jpegData)
                        }
                    }
                }

            }
        }
    }
    
    func updateHomeModels() {
        homeViewModel.loadAllObjects()
    }
}
