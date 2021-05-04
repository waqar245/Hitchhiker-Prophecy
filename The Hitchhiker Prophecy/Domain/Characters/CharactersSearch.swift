//
//  CharactersSearch.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

extension Characters.Search {
    struct Input: Codable {
        let timeStamp: String
        let apiKey: String
        let hash: String
        let offset: Int
        let limit: Int
        let orderBy: Order
        
        enum CodingKeys: String, CodingKey {
            case timeStamp = "ts"
            case apiKey = "apikey"
            case hash, offset, limit, orderBy
        }
    }
}

extension Characters.Search.Input {
    enum Order: String, Codable {
        case nameAscending = "name"
        case modifiedDateAscending = "modified"
        case nameDescending = "-name"
        case modifiedDateDescending = "-modified"
    }
}

// MARK: - Output
extension Characters.Search {
    struct Output: Codable {
        let code: Int
        let status, copyright, attributionText, attributionHTML: String
        let etag: String
        var data: Results
    }
}

// MARK: - Results
extension Characters.Search {
    struct Results: Codable {
        let offset, limit, total, count: Int
        var results: [Character]
    }
}
// MARK: - Character
extension Characters.Search {
    struct Character: Codable {
        let id: Int
        let name, resultDescription: String
        let modified: String
        let thumbnail: Thumbnail
        let resourceURI: String
        let comics, series: Comics
        let stories: Stories
        let events: Comics
        let urls: [URLElement]
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case resultDescription = "description"
            case modified, thumbnail, resourceURI, comics, series, stories, events, urls
        }
    }
}
// MARK: - Comics
extension Characters.Search.Character {
    struct Comics: Codable {
        let available: Int
        let collectionURI: String
        let items: [ComicsItem]
        let returned: Int
    }
}

// MARK: - ComicsItem
extension Characters.Search.Character.Comics {
    struct ComicsItem: Codable {
        let resourceURI: String
        let name: String
    }
}

// MARK: - Stories
extension Characters.Search.Character {
    struct Stories: Codable {
        let available: Int
        let collectionURI: String
        let items: [StoriesItem]
        let returned: Int
    }
}

// MARK: - StoriesItem
extension Characters.Search.Character.Stories {
    struct StoriesItem: Codable {
        let resourceURI: String
        let name: String
        let type: String
    }
}

// MARK: - Thumbnail
extension Characters.Search.Character {
    struct Thumbnail: Codable {
        let path: String
        let thumbnailExtension: String
        
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }
}

// MARK: - URLElement
extension Characters.Search.Character {
    struct URLElement: Codable {
        let type: URLType
        let url: String
    }
}

extension Characters.Search.Character.URLElement {
    enum URLType: String, Codable {
        case comiclink = "comiclink"
        case detail = "detail"
        case wiki = "wiki"
    }
}
