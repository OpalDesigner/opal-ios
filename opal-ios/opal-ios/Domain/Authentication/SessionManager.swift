import Combine
import Foundation

enum AuthState {
    case home
    case signUp
    case login
    case confirmCode(username: String)
    case session(user: AuthUserEntity)
}

final class SessionManager: ObservableObject {
    @Published var authState: AuthState = .home

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
                self.authState = .home
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
        authState = .home
    }
}
