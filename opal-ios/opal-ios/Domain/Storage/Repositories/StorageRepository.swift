//
//  StorageRepository.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import Foundation
import Combine

protocol ModelAssetRepository {
    func fetchAll() -> AnyPublisher<[ModelItemEntity], Error>
    
    func downloadData(for key: String) -> AnyPublisher<Data, Error>
}
