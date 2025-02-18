//
//  StorageRepositoryImpl.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import Foundation
import Combine
import Amplify

class ModelAssetRepositoryImpl: ModelAssetRepository {
    
    func fetchAll() -> AnyPublisher<[ModelItemEntity], Error> {
        Future<[ModelItemEntity], Error> { promise in
            Amplify.Storage.list { event in
                switch event {
                case .success(let listResult):
                    let grouped = self.groupFilesByNameBase(listResult.items)
                    promise(.success(grouped))
                    
                case .failure(let storageError):
                    promise(.failure(storageError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func downloadData(for key: String) -> AnyPublisher<Data, Error> {
        Future<Data, Error> { promise in
            Amplify.Storage.downloadData(key: key) { result in
                switch result {
                case .success(let data):
                    promise(.success(data))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    private func groupFilesByNameBase(_ items: [StorageListResult.Item]) -> [ModelItemEntity] {
        var dict = [String: (String?, String?)]()
        
        for item in items {
            let fileKey = item.key
            
            if let dotIndex = fileKey.lastIndex(of: ".") {
                let baseName = String(fileKey[..<dotIndex])
                let extensionName = String(fileKey[fileKey.index(after: dotIndex)...])
                
                if dict[baseName] == nil {
                    dict[baseName] = (nil, nil)
                }
                
                if extensionName.lowercased() == "png" || extensionName.lowercased() == "jpg" {
                    dict[baseName]?.0 = fileKey
                } else if extensionName.lowercased() == "usdz" {
                    dict[baseName]?.1 = fileKey
                }
            }
        }
        
        return dict.map { (key, value) in
            ModelItemEntity(name: key, imageKey: value.0, modelKey: value.1)
        }
    }
}
