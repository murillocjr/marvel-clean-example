//
//  MarvelComic.swift
//  CoreEntities
//
//  Created by Jorge Murillo on 5/31/21.
//

public struct MarvelComic: Codable {
    
    public let idComic: Int
    public let title: String
    public let pageCount: Int
    
    public init(idComic: Int, title: String, pageCount: Int) {
        self.idComic = idComic
        self.title = title
        self.pageCount = pageCount
    }
    
    public func tableItemFormat() -> String {
        return title + ", " + String(pageCount) + " pages"
    }
}
