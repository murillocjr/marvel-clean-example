//
//  HomeUseCase.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities

protocol HomeUseCaseProtocol {
    func execute(completion: @escaping (Result<[MarvelComic], Error>) -> Void) -> Void
}

final class MainHomeUseCase: HomeUseCaseProtocol {

    private let marvelComicRepository: MarvelComicRepositoryProtocol

    init( marvelComicRepository: MarvelComicRepositoryProtocol ) {

        self.marvelComicRepository = marvelComicRepository
    }

    func execute(completion: @escaping (Result<[MarvelComic], Error>) -> Void) -> Void {

        marvelComicRepository.performListRequest(completion: { result in
            completion(result)
        })
    }
}
