//
//  LoginViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func login() {
        sessionManager.login(username: username, password: password)
    }
    
    func showSignUp() {
        sessionManager.showSignUp()
    }
}
