//
//  ARModelScreen.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI

struct ARModelScreen: View {
    let model: ModelItemEntity
    
    @StateObject private var viewModel = ARModelViewModel(
        downloadAssetDataUseCase: DownloadAssetDataUseCaseImpl(
            repository: ModelAssetRepositoryImpl()
        )
    )
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                LoadingModelView()
            } else if viewModel.hasError {
                ErrorModelView()
            } else if let fileURL = viewModel.modelFileURL {
                SceneKitModelView(modelFileURL: fileURL)
                    .edgesIgnoringSafeArea(.all)
            } else {
                EmptyView()
            }
        }
        .onAppear {
            if let key = model.modelKey {
                viewModel.loadUSDZ(modelKey: key)
            } else {
                viewModel.hasError = true
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(model.name.capitalized)
                    .font(.headline)
                    .foregroundStyle(.fontOne)
            }
        }
    }
}
