//
//  SearchResult.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import Foundation

// MARK: - Welcome
struct SearchResult: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let status, userTier: String
    let total, startIndex, pageSize, currentPage: Int
    let pages: Int
    let orderBy: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id: String
    let type: TypeEnum
    let sectionID, sectionName: String
    let webPublicationDate: String
    let webTitle: String
    let webURL, apiURL: String
    let fields: Fields
    let isHosted: Bool

    enum CodingKeys: String, CodingKey {
        case id, type
        case sectionID = "sectionId"
        case sectionName, webPublicationDate, webTitle
        case webURL = "webUrl"
        case apiURL = "apiUrl"
        case fields
        case isHosted
    }
}

// MARK: - Fields
struct Fields: Codable  {
    let headline:String
    let trailText: String
    let shortURL: String
    let thumbnail: String?
    let body: String

    enum CodingKeys: String, CodingKey {
        case headline
        case trailText
        case shortURL = "shortUrl"
        case thumbnail
        case body

    }
}

enum TypeEnum: String, Codable {
    case article = "article"
    case liveblog = "liveblog"
}

