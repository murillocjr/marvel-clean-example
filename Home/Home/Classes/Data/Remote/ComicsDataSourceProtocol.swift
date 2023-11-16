//
//  ComicsDataSourceProtocol.swift
//  Home
//
//  Created by Jorge Murillo on 6/1/21.
//

protocol ComicsDataSourceProtocol {
    func list(completion: @escaping (Result<ComicsResponseDTO, Error>) -> Void)
}
