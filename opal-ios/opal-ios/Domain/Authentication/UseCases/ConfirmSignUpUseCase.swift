//
//  ConfirmSignUpUseCase.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

public final class ConfirmSignUpUseCase {
    private let repository: AuthRepository

    public init(repository: AuthRepository) {
        self.repository = repository
    }

    public func execute(username: String, code: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.confirmSignUp(username: username, code: code, completion: completion)
    }
}
