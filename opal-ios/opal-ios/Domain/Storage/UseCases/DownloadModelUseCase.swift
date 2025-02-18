//
//  DownloadModelUseCase.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import Combine
import SwiftUI

protocol DownloadAssetDataUseCase {
    func execute(key: String) -> AnyPublisher<Data, Error>
}

class DownloadAssetDataUseCaseImpl: DownloadAssetDataUseCase {
    private let repository: ModelAssetRepository
    
    init(repository: ModelAssetRepository) {
        self.repository = repository
    }
    
    func execute(key: String) -> AnyPublisher<Data, Error> {
        return repository.downloadData(for: key)
    }
}
