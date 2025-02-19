//
//  ARModelViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI
import Combine

class ARModelViewModel: ObservableObject {
    @Published var modelFileURL: URL? = nil
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    
    private let downloadAssetDataUseCase: DownloadAssetDataUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(downloadAssetDataUseCase: DownloadAssetDataUseCase) {
        self.downloadAssetDataUseCase = downloadAssetDataUseCase
    }
    
    func loadUSDZ(modelKey: String) {
        isLoading = true
        hasError = false
        
        downloadAssetDataUseCase.execute(key: modelKey)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Erro ao baixar .usdz: \(error)")
                    self.hasError = true
                case .finished:
                    break
                }
            } receiveValue: { data in
                do {
                    let tempURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(modelKey)
                    
                    try? FileManager.default.createDirectory(
                        at: tempURL.deletingLastPathComponent(),
                        withIntermediateDirectories: true
                    )
                    
                    try data.write(to: tempURL)
                    self.modelFileURL = tempURL
                } catch {
                    print("Error saving .usdz locally: \(error)")
                    self.hasError = true
                }
            }
            .store(in: &self.cancellables)
    }
}
