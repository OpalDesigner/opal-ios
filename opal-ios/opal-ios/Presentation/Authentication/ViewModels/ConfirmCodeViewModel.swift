//
//  ConfirmCodeViewModel.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import SwiftUI

final class ConfirmCodeViewModel: ObservableObject {
    @Published var code: String = ""
    private let sessionManager: SessionManager
    
    let username: String
    
    init(username: String, sessionManager: SessionManager) {
        self.username = username
        self.sessionManager = sessionManager
    }
    
    func confirm() {
        sessionManager.confirm(username: username, code: code)
    }
    
    func showLogin() {
        sessionManager.showLogin()
    }
}
