//
//  GetAllModelsUseCase.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import Combine

protocol GetAllModelsUseCase {
    func execute() -> AnyPublisher<[ModelItemEntity], Error>
}

class GetAllModelsUseCaseImpl: GetAllModelsUseCase {
    private let repository: ModelAssetRepository
    
    init(repository: ModelAssetRepository) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[ModelItemEntity], Error> {
        return repository.fetchAll()
    }
}
