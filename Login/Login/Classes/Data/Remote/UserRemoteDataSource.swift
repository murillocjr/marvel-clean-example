//
//  UserRemoteDataSource.swift
//  Login
//
//  Created by Jorge Murillo on 6/1/21.
//

class UserRemoteDataSource: UserDataSourceProtocol {
    public var delegate: BackendDataHandlerDelegateProtocol?
    
    func login(
        loginRequestDTO: LoginRequestDTO
    )
    {
            LoginTask.doLogin(
                requestDTO: loginRequestDTO,
                delegate: delegate
            )
    }
}
