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
    public typealias HitType = T
    public let page: Int
    public let params: String
    public let processingTimeMS: Int
    public let query: String
    public let exhaustiveNbHits: Int
    public let nbPages: Int
    public let hits: [HitType]
    public let hitsPerPage: Int
    public let nbHits: Int
}

public struct FacetValuesResponse: Decodable {
    public struct Content: Decodable {
        public let value: String
        public let highlighted: String
        public let count: Int
    }

    public let facetHits: [Content]
}
