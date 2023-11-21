//
//  UserDataSourceProtocol.swift
//  Login
//
//  Created by Jorge Murillo on 6/1/21.
//

protocol UserDataSourceProtocol {
    var delegate: BackendDataHandlerDelegateProtocol? { get set }
    func login(
        loginRequestDTO: LoginRequestDTO
    )
}
