//
//  Response.swift
//  Agent
//
//  Created by miup on 2017/10/12.
//

import Foundation

public enum AlgoliaResponseError: Error {
    case cannnotDecodeResponse
}

public struct AlgoliaResponse<T: Decodable>: Decodable {
    typealias HitType = T
    let page: Int
    let params: String
    let processingTimeMS: Int
    let query: String
    let exhaustiveNbHits: Int
    let nbPages: Int
    let hits: [HitType]
    let hitsPerPage: Int
    let nbHits: Int
}

public struct FacetValuesResponse: Decodable {
    struct Content: Decodable {
        let value: String
        let highlighted: String
        let count: Int
    }

    let facetHits: [Content]
}
