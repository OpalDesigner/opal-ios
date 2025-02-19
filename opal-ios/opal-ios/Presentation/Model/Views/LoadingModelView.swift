//
//  LoadingModelVIew.swift
//  opal-ios
//
//  Created by Cynara Costa on 19/02/25.
//

import SwiftUI

struct LoadingModelView: View {
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    var body: some View {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: context.colors.font.one))
                        .scaleEffect(2)
                }
            }
        }
}

#Preview {
    LoadingModelView()
}
