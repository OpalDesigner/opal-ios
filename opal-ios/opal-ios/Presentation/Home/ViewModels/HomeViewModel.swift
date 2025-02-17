import SwiftUI
import Amplify

final class HomeViewModel: ObservableObject {
    let user: AuthUserEntity
    private let sessionManager: SessionManager
    
    init(user: AuthUserEntity, sessionManager: SessionManager) {
        self.user = user
        self.sessionManager = sessionManager
    }
    
    func signOut() {
        sessionManager.signOut()
    }
}
