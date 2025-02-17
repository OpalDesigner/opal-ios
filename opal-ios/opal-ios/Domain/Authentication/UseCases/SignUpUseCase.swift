//
//  SignUpUseCase.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

public final class SignUpUseCase {
    private let repository: AuthRepository

    public init(repository: AuthRepository) {
        self.repository = repository
    }

    public func execute(username: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.signUp(username: username, email: email, password: password, completion: completion)
    }
}
