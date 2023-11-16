//
//  RemoteMarvelUserRepository.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities

final class RemoteMarvelUserRepository: MarvelUserRepositoryProtocol {
    var dataSource: UserDataSourceProtocol  //importante que esto es un protocolo y no una clase concreta
    
    init(dataSource: UserDataSourceProtocol) {
        self.dataSource = dataSource
    }
    public func performLogin(username: String,
                                password: String,
                                completion: @escaping (Result<MarvelUser, Error>) -> Void) -> Void {

        let requestDTO = LoginRequestDTO(username: username, password: password)
        
        dataSource.login(
            loginRequestDTO: requestDTO,
            completion: { result in
                switch result {
                case .success(let loginResponseDTO):
                    completion(.success(loginResponseDTO.data.toDomainUser()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
}
