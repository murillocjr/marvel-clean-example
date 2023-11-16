//
//  LoginRequestDTO+Mapping.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//
//
//
import Foundation

// MARK: - Data Transfer Object

struct LoginRequestDTO: Encodable {
    private enum CodingKeys: String, CodingKey {
        case username
        case password
    }
    let username: String
    let password: String
}
