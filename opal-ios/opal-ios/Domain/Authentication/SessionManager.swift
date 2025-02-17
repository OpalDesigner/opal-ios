import Combine
import Foundation

enum AuthState {
    case signUp
    case login
    case confirmCode(username: String)
    case session(user: AuthUserEntity)
}

final class SessionManager: ObservableObject {
    @Published var authState: AuthState = .login

    private let signUpUseCase: SignUpUseCase
    private let signInUseCase: SignInUseCase
    private let confirmSignUpUseCase: ConfirmSignUpUseCase
    private let authRepository: AuthRepository

    init(repository: AuthRepository = AuthRepositoryImpl()) {
        self.authRepository = repository
        self.signUpUseCase = SignUpUseCase(repository: repository)
        self.signInUseCase = SignInUseCase(repository: repository)
        self.confirmSignUpUseCase = ConfirmSignUpUseCase(repository: repository)
        self.getCurrentAuthUser()
    }

    func getCurrentAuthUser() {
        if let user = authRepository.getCurrentUser() {
            DispatchQueue.main.async {
                self.authState = .session(user: user)
            }
        } else {
            DispatchQueue.main.async {
                self.authState = .login
            }
        }
    }

    func showSignUp() {
        authState = .signUp
    }

    func showLogin() {
        authState = .login
    }

    func signUp(username: String, email: String, password: String) {
        signUpUseCase.execute(username: username, email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.authState = .confirmCode(username: username)
                case .failure(let error):
                    print("Erro no signUp: \(error)")
                }
            }
        }
    }

    func confirm(username: String, code: String) {
        confirmSignUpUseCase.execute(username: username, code: code) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.showLogin()
                case .failure(let error):
                    print("Erro ao confirmar: \(error)")
                }
            }
        }
    }

    func login(username: String, password: String) {
        signInUseCase.execute(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.getCurrentAuthUser()
                case .failure(let error):
                    print("Erro no login: \(error)")
                }
            }
        }
    }

    func signOut() {
        authRepository.signOut { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.getCurrentAuthUser()
                case .failure(let error):
                    print("Erro no signOut: \(error)")
                }
            }
        }
    }
}

//import Amplify
//
//enum AuthState {
//    case signUp
//    case login
//    case confirmCode(username: String)
//    case session(user: AuthUser)
//}
//
//final class SessionManager: ObservableObject {
//    @Published var authState: AuthState = .login
//    
//    func getCurrentAuthUser() {
//        if let user = Amplify.Auth.getCurrentUser() {
//            authState = .session(user: user)
//        } else {
//            authState = .login
//        }
//    }
//    
//    func showSignUp() {
//        authState = .signUp
//    }
//    
//    func showLogin() {
//        authState = .login
//    }
//    
//    func signUp(username: String, email: String, password: String) {
//        let attributes = [AuthUserAttribute(.email, value: email)]
//        let options = AuthSignUpRequest.Options(userAttributes: attributes)
//        
//        _ = Amplify.Auth.signUp(
//            username: username,
//            password: password,
//            options: options
//        ) { [weak self] result in
//            switch result {
//            case .success(let signUpResult):
//                print("Sign Up result:", signUpResult)
//                
//                switch signUpResult.nextStep {
//                case .done:
//                    print("Finished sign up")
//                case .confirmUser(let details, _):
//                    print(details ?? "no details")
//                    
//                    DispatchQueue.main.async {
//                        self?.authState = .confirmCode(username: username)
//                    }
//                }
//                
//            case .failure(let error):
//                print("Sign Up errror:", error)
//            }
//        }
//    }
//    
//    func confirm(username: String, code: String) {
//        _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: code) {
//            [weak self] result in
//            
//            switch result {
//            case .success(let confirmResult):
//                print(confirmResult)
//                if confirmResult.isSignupComplete {
//                    DispatchQueue.main.async {
//                        self?.showLogin()
//                    }
//                }
//                
//            case .failure(let error):
//                print("failed to confirm code:", error)
//            }
//        }
//    }
//    
//    func login(username: String, password: String) {
//        _ = Amplify.Auth.signIn(username: username, password: password) { [weak self] result in
//            switch result {
//            case .success(let signInResult):
//                print(signInResult)
//                if signInResult.isSignedIn {
//                    DispatchQueue.main.async {
//                        self?.getCurrentAuthUser()
//                    }
//                }
//                
//            case .failure(let error):
//                print("Login error:", error)
//            }
//        }
//    }
//    
//    func signOut() {
//        _ = Amplify.Auth.signOut { [weak self] result in
//            switch result {
//            case .success:
//                DispatchQueue.main.async {
//                    self?.getCurrentAuthUser()
//                }
//                
//            case .failure(let error):
//                print("Sign out error:", error)
//            }
//            
//        }
//    }
//}
