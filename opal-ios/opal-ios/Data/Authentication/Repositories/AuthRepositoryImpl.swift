//
//  AuthRepositoryImpl.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import Amplify

class AuthRepositoryImpl: AuthRepository {
    func getCurrentUser() -> AuthUserEntity? {
        if let user = Amplify.Auth.getCurrentUser() {
            return AuthUserEntity(id: user.userId, username: user.username)
        }
        return nil
    }
    
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        let attributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: attributes)
        
        _ = Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                switch signUpResult.nextStep {
                case .done, .confirmUser:
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func confirmSignUp(username: String, code: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: code) { result in
            switch result {
            case .success(let confirmResult):
                if confirmResult.isSignupComplete {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "ConfirmSignUp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Signup não finalizado"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func signIn(username: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        _ = Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success(let signInResult):
                if signInResult.isSignedIn {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "SignIn", code: 0, userInfo: [NSLocalizedDescriptionKey: "Usuário não autenticado"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func signOut(completion: @escaping (Result<Void, any Error>) -> Void) {
        _ = Amplify.Auth.signOut { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
