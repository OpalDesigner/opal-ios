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
}
