//
//  SignInUseCase.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

public final class SignInUseCase {
    private let repository: AuthRepository

    public init(repository: AuthRepository) {
        self.repository = repository
    }

    public func execute(username: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.signIn(username: username, password: password, completion: completion)
    }
}
