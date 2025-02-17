//
//  opal_iosApp.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI
import Amplify
import AmplifyPlugins

@main
struct opal_iosApp: App {
    @StateObject private var opalContext = OpalDesignContextSingleton.shared
    @StateObject private var sessionManager = SessionManager()
    
    init() {
        configureAmplify()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(opalContext)
                .environmentObject(sessionManager)
                .onAppear {
                    sessionManager.getCurrentAuthUser()
                }
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
