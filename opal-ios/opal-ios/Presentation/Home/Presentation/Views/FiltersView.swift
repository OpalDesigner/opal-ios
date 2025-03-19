//
//  FiltersView.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/03/25.
//

import SwiftUI

struct FilterGridView: View {
    @ObservedObject var viewModel: FilterViewModel
    let horizontalPadding = 2.0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.filters.indices, id: \.self) { index in
                    OpalFilter(
                        text: viewModel.filters[index].text,
                        style: viewModel.filters[index].style,
                        icon: viewModel.filters[index].icon
                    ) {
                        viewModel.toggleFilter(at: index)
                    }
                    .padding(.horizontal, horizontalPadding)
                }
            }
        }
        .sheet(isPresented: $viewModel.showModal, onDismiss: {
            viewModel.deselectFilter(at: 0)
        }) {
            ModalView()
                .presentationDetents([.fraction(0.5)])
                .presentationCornerRadius(32)
        }
    }
}

struct ModalView: View {
    var body: some View {
        VStack {
            Text("Open Modal!")
                .font(.title)
                .padding()
//            Button("Close Modal") {
//                
//            }
//            .padding()
        }
    }
}
