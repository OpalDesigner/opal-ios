//
//  ContentView.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI
import Amplify
import AmplifyPlugins

struct ContentView: View {
    @ObservedObject var sessionManager = SessionManager()
    
    init() {
        configureAmplify()
        sessionManager.getCurrentAuthUser()
    }
    
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    
    var body: some View {
        switch sessionManager.authState {
        case .login:
            LoginView()
                .environmentObject(sessionManager)
        case .signUp:
            SignUpView()
                .environmentObject(sessionManager)
        case .confirmCode(let username):
            ConfirmationView(username: username)
                .environmentObject(sessionManager)
        case .session(let user):
            SessionView(user: user)
                .environmentObject(sessionManager)
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
            print("Amplify configured successfully")
        } catch {
            print("Could not initialize Amplify", error)
        }
    }
}

#Preview {
    ContentView()
}
