//
//  LoginUseCase.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities

protocol LoginUseCaseProtocol {
    func execute(requestValue: LoginUseCaseRequestValue,
                 completion: @escaping (Result<MarvelUser, Error>) -> Void) -> Void
}

final class MainLoginUseCase: LoginUseCaseProtocol {

    private let marvelUserRepository: MarvelUserRepositoryProtocol

    init( marvelUserRepository: MarvelUserRepositoryProtocol ) {
        self.marvelUserRepository = marvelUserRepository
    }

    func execute(requestValue: LoginUseCaseRequestValue,
                 completion: @escaping (Result<MarvelUser, Error>) -> Void) -> Void {
        marvelUserRepository.performLogin(username: requestValue.username,
                                          password: requestValue.password,
                                          completion: { result in
                                            completion(result)
        })
    }
}
