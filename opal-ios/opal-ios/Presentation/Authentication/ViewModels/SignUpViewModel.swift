//
//  SignUpViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func signUp() {
        sessionManager.signUp(username: username, email: email, password: password)
    }
    
    func showLogin() {
        sessionManager.showLogin()
    }
}
