//
//  UserDataSourceProtocol.swift
//  Login
//
//  Created by Jorge Murillo on 6/1/21.
//

protocol UserDataSourceProtocol {
    func login(
        loginRequestDTO: LoginRequestDTO,
        completion: @escaping (Result<LoginResponseDTO, Error>) -> Void
    )
}


////
///descripcion de comportamiento o caracteristicas
///
///esto vuela
///esto tiene plumas
///             ---> protocolo animal_volador


//I : interface segregation


// si puedes extender protocolos

// no puedes hacer subclases de structs

//protcolo: volador
//    -->viaja_por_el aire
//
//protocolo: nadador
//    -->viaja_por_el agua
//
//
//
//Paloma: volador
//Pato: <volador, nadador>
