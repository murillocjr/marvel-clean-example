//
//  RemoteMarvelUserRepository.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities


protocol BackendDataHandlerDelegateProtocol {
    func transformAndCallExternalCompletion(loginResponseDTO: LoginResponseDTO)
    func handleBackendError(error: Error)
}
class BackendDataHandlerDelegate: BackendDataHandlerDelegateProtocol {
    var completion: (Result<MarvelUser, Error>) -> Void
    
    init(completion: @escaping (Result<MarvelUser, Error>) -> Void) {
        self.completion = completion
    }
    func transformAndCallExternalCompletion(loginResponseDTO: LoginResponseDTO) {
        completion(.success(loginResponseDTO.data.toDomainUser()))
    }
    func handleBackendError(error: Error) {
        completion(.failure(error))
    }
}



final class RemoteMarvelUserRepository: MarvelUserRepositoryProtocol {
    var dataSource: UserDataSourceProtocol  //importante que esto es un protocolo y no una clase concreta
    
    init(dataSource: UserDataSourceProtocol) {
        self.dataSource = dataSource
    }
    public func performLogin(username: String,
                                password: String,
                                completion: @escaping (Result<MarvelUser, Error>) -> Void) -> Void {

        let requestDTO = LoginRequestDTO(username: username, password: password)
        var backendDataHandlerDelegate = BackendDataHandlerDelegate(completion: completion)

        dataSource.delegate = backendDataHandlerDelegate
        dataSource.login(loginRequestDTO: requestDTO)
    }
}
