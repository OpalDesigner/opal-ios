//
//  HomeSplashView.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

struct HomeSplashView: View {
    @ObservedObject var viewModel: HomeSplashViewModel

    var body: some View {
        VStack {
            OpalText(text: "Start 3D scanning for your Holodeck", style: .heading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            OpalButton(title: "Log In", style: .primary, action: viewModel.goTologin)
            OpalButton(title: "Sign Up", style: .secondary, action: viewModel.goToSignUp)
        }.padding()
    }
}
