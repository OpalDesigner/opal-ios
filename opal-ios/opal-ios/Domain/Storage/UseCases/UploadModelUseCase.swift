//
//  UploadModelUseCase.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//

import Combine
import SwiftUI

protocol UploadAssetDataUseCase {
    func execute(data: Data, key: String) -> AnyPublisher<String, Error>
}

class UploadAssetDataUseCaseImpl: UploadAssetDataUseCase {
    private let repository: ModelAssetRepository
    
    init(repository: ModelAssetRepository) {
        self.repository = repository
    }
    
    func execute(data: Data, key: String) -> AnyPublisher<String, Error> {
        return repository.uploadModel(data: data, for: key)
    }
}
