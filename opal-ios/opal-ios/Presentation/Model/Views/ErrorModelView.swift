//
//  ErrorModelView.swift
//  opal-ios
//
//  Created by Cynara Costa on 19/02/25.
//

import SwiftUI

struct ErrorModelView: View {
    var errorMessage: String = "Error while fetching model."
    var retryAction: (() -> Void)?
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.red)
                Text(errorMessage)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                if let retryAction = retryAction {
                    Button(action: retryAction) {
                        Text("Try again!")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ErrorModelView()
}

