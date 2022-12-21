//
//  SearchListResponse.swift
//  STEntities
//
//  Created by SEMİHT on 20.12.2022.
//

import Foundation

public struct SearchListResponse: Codable {
    let resultCount : Int?
    let searchResults : [SearchResult]?

    enum CodingKeys: String, CodingKey {
        case resultCount
        case searchResults = "results"
    }
}
