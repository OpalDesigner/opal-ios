//
//  ContentView.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI


struct ContentView: View {
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    @EnvironmentObject var sessionManager: SessionManager
    
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
            } else {
                Group {
                    switch sessionManager.authState {
                    case .home:
                        HomeSplashView(viewModel: HomeSplashViewModel(sessionManager: sessionManager))
                    case .login:
                        LoginView(viewModel: LoginViewModel(sessionManager: sessionManager))
                    case .signUp:
                        SignUpView(viewModel: SignUpViewModel(sessionManager: sessionManager))
                    case .confirmCode(let username):
                        ConfirmCodeView(viewModel: ConfirmCodeViewModel(username: username, sessionManager: sessionManager))
                    case .session(let user):
                        HomeView(viewModel: HomeViewModel(user: user, sessionManager: sessionManager))
                    }
                }
            }
        }
        .onAppear {
            sessionManager.getCurrentAuthUser()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}



//#Preview {
//    ContentView()
//}
