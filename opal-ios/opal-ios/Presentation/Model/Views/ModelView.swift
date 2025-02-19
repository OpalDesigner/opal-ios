//
//  ARModelScreen.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI

struct ModelView: View {
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
        .navigationBarTitle(model.name.capitalized, displayMode: .inline)
    }
}
