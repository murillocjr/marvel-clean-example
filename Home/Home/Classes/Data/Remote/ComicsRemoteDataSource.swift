//
//  ComicsRemoteDataSource.swift
//  Home
//
//  Created by Jorge Murillo on 6/1/21.
//

class ComicsRemoteDataSource: ComicsDataSourceProtocol {
    func list(completion: @escaping (Result<ComicsResponseDTO, Error>) -> Void) {
        HomeTask.doRequest(completion: completion)
    }
}
