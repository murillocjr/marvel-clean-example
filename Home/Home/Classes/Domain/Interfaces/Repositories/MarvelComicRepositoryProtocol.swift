//
//  MarvelUserRepository.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//

import CoreEntities

protocol MarvelComicRepositoryProtocol {
    func performListRequest(completion: @escaping (Result<[MarvelComic], Error>) -> Void) -> Void
}
