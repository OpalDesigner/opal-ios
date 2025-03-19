//
//  Shimmer.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI

struct ShimmerView: View {
    @State private var phase: CGFloat = -0.5

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.gray.opacity(0.2),
                Color.gray.opacity(0.4),
                Color.gray.opacity(0.2)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(
            Rectangle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.1),
                        Color.white.opacity(0.4),
                        Color.white.opacity(0.1)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .rotationEffect(.degrees(30))
                .offset(x: phase * 300)
        )
        .onAppear {
            withAnimation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                phase = 1.5
            }
        }
    }
}

struct ShimmerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                ShimmerView().mask(content)
            )
    }
}

extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}
