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
        var dict = [String: (String?, String?, String?)]()
        
        for item in items {
            let fileKey = item.key
            let components = fileKey.split(separator: "/").map { String($0) }
                    
            let category: String? = components.count > 1 ? components[0] : nil
            let fileName = components.last ?? fileKey
            
            
            if let dotIndex = fileName.lastIndex(of: ".") {
                let baseName = String(fileName[..<dotIndex])
                let extensionName = String(fileName[fileName.index(after: dotIndex)...])
                
                let uniqueKey = "\(category ?? "other")/\(baseName)"
                
                if dict[uniqueKey] == nil {
                    dict[uniqueKey] = (category, nil, nil)
                }
                
                if extensionName.lowercased() == "png" || extensionName.lowercased() == "jpg" {
                    dict[uniqueKey]?.1 = fileKey
                } else if extensionName.lowercased() == "usdz" {
                    dict[uniqueKey]?.2 = fileKey
                }
            }
        }
        
        return dict.map { (key, value) in
            ModelItemEntity(name: key.split(separator: "/").last.map(String.init) ?? key, category: value.0, imageKey: value.1, modelKey: value.2)
        }
    }
}
