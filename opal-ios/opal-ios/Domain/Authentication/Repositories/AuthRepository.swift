//
//  AuthRepository.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

public protocol AuthRepository {
    func getCurrentUser() -> AuthUserEntity?
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func confirmSignUp(username: String, code: String, completion: @escaping (Result<Void, Error>) -> Void)
    func signIn(username: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func signOut(completion: @escaping (Result<Void, Error>) -> Void)
}
