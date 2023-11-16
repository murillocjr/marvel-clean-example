//
//  User.swift
//  CoreEntities
//
//  Created by Jorge Murillo on 5/28/21.
//

public struct MarvelUser: Codable {
    
    public let idUser: String
    public let username: String
    public let firstname: String
    public let lastname: String
    
    public init(idUser: String, username: String, firstname: String, lastname: String) {
        self.idUser = idUser
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
    }
}
