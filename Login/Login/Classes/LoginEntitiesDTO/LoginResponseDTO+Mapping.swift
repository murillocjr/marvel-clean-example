//
//  LoginResponseDTO+Mapping.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities

struct LoginResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case status
        case code
        case data
    }
    let status: String
    let code: Int
    let data: LoginUserDTO
}

struct LoginUserDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idUser = "id"
        case username
        case firstname
        case lastname
    }
    let idUser: String
    let username: String
    let firstname: String
    let lastname: String
}
// MARK: - Mappings to Domain

extension LoginUserDTO {
    func toDomainUser() -> MarvelUser {
        return .init(
            idUser: idUser,
            username: username,
            firstname: firstname,
            lastname: lastname
        )
    }
}
