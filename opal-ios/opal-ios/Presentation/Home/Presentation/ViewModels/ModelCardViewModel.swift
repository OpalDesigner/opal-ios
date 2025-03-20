//
//  ModelCardViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI
import Combine

class ModelCardViewModel: ObservableObject {
    let model: ModelItemEntity
    private let downloadAssetDataUseCase: DownloadAssetDataUseCase

    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    private var hasLoaded = false
    
    private var cancellables = Set<AnyCancellable>()

    init(model: ModelItemEntity, downloadAssetDataUseCase: DownloadAssetDataUseCase) {
        self.model = model
        self.downloadAssetDataUseCase = downloadAssetDataUseCase
    }
    
    func loadImage() {
        guard !hasLoaded else { return }
        hasLoaded = true
        
        guard let imageKey = model.imageKey else {
            hasError = true
            return
        }

        isLoading = true
        downloadAssetDataUseCase.execute(key: imageKey)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .failure(_):
                    self.hasError = true
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.image = UIImage(data: data)
            }
            .store(in: &cancellables)
    }
}
