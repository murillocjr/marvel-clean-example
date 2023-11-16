//
//  UserRemoteDataSource.swift
//  Login
//
//  Created by Jorge Murillo on 6/1/21.
//

class UserRemoteDataSource: UserDataSourceProtocol {
    func login(
        loginRequestDTO: LoginRequestDTO,
        completion: @escaping (Result<LoginResponseDTO, Error>) -> Void)
    {
            
            
            
            LoginTask.doLogin(
                requestDTO: loginRequestDTO,
                completion: completion
            )
            
            
    }
}
