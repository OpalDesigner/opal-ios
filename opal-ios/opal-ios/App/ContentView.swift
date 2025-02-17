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

    var body: some View {
        Group {
            switch sessionManager.authState {
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
        .onAppear {
            sessionManager.getCurrentAuthUser()
        }
    }
    
    
}

//#Preview {
//    ContentView()
//}
