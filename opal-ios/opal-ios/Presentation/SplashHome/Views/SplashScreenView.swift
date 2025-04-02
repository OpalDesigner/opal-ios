//
//  SplashScreenView.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var opacity = 0.0
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }

    var body: some View {
        ZStack {
            context.colors.background.splash.ignoresSafeArea()

            VStack {
                OpalImage(
                    imageName: context.images.logo,
                    style: .onBrandSplash,
                    size: .medium
                )
            }
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.0)) {
                    opacity = 1.0
                }
            }
        }
    }
}
