//
//  ModelCardView.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI

struct ModelCardView: View {
    @ObservedObject var viewModel: ModelCardViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 157, height: 157)
                    .shimmer()
            }
            else if let image = viewModel.image, !viewModel.hasError {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 157, height: 157)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            else {
                EmptyView()
            }
        }
        .onAppear {
            viewModel.loadImage()
        }
    }
}
