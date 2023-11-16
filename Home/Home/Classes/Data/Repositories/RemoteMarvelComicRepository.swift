//
//  RemoteMarvelComicRepository.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities

final class RemoteMarvelComicRepository: MarvelComicRepositoryProtocol {
    var dataSource: ComicsDataSourceProtocol
    
    init(dataSource: ComicsDataSourceProtocol) {
        self.dataSource = dataSource
    }
    func performListRequest(completion: @escaping (Result<[MarvelComic], Error>) -> Void) {
        
        dataSource.list(completion: { result in
            switch result {
            case .success(let comicsResponseDTO):
                var comicDomainArray: [MarvelComic] = []
                for comicDTO in comicsResponseDTO.data.results {
                    comicDomainArray.append(comicDTO.toDomainComic())
                }
                completion(.success(comicDomainArray))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
