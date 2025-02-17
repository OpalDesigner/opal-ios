//
//  PrettyTextFieldModifier.swift
//  amplify-test
//
//  Created by Cynara Costa on 16/02/25.
//

import SwiftUI

struct PrettyTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .padding(.bottom, 10)
    }
}

extension View {
    func pretty() -> some View {
        self.modifier(PrettyTextFieldModifier())
    }
}
