//
//  HomeResponseDTO+Mapping.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation
import CoreEntities

struct ComicsResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case status
        case code
        case data
    }
    let status: String
    let code: Int
    let data: ComicsDataDTO
}

struct ComicsDataDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case limit
        case total
        case results
    }
    let limit: Int
    let total: Int
    let results: [ComicDTO]
}
struct ComicDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idComic = "id"
        case title
        case pageCount
    }
    let idComic: Int
    let title: String
    let pageCount: Int
}
// MARK: - Mappings to Domain

extension ComicDTO {
    func toDomainComic() -> MarvelComic {
        return .init(
            idComic: idComic,
            title: title,
            pageCount: pageCount
        )
    }
}
