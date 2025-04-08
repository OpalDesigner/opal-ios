//
//  HomeSplashViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

final class HomeSplashViewModel: ObservableObject {
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func goTologin() {
        sessionManager.showLogin()
    }
    
    func goToSignUp() {
        sessionManager.showSignUp()
    }
}
