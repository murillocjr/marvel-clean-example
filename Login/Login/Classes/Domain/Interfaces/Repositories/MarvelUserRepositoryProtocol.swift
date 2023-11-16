//
//  MarvelUserRepository.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import CoreEntities

protocol MarvelUserRepositoryProtocol {
    func performLogin(username: String,
                         password: String,
                         completion: @escaping (Result<MarvelUser, Error>) -> Void) -> Void
}
