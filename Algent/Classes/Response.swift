//
//  Response.swift
//  Agent
//
//  Created by miup on 2017/10/12.
//

import Foundation

public enum AlgoliaResponseError: Error {
    case cannnotDecodeResponse(Error)
    case algoliaSearchError(Error)
}

public struct AlgoliaResponse<T: Decodable>: Decodable {
    private struct DummyCodable: Codable {}

    private enum Keys: String, CodingKey {
        case page
        case params
        case processingTimeMS
        case query
        case exhaustiveNbHits
        case nbPages
        case hits
        case hitsPerPage
        case nbHits
    }

    public typealias HitType = T
    public let page: Int
    public let params: String
    public let processingTimeMS: Int
    public let query: String
    public let exhaustiveNbHits: Bool
    public let nbPages: Int
    public let hits: [HitType]
    public let hitsPerPage: Int
    public let nbHits: Int

    public init(from decoder: Decoder) throws {
        var hits: [HitType] = []
        let container = try decoder.container(keyedBy: Keys.self)
        var hitsContainer = try container.nestedUnkeyedContainer(forKey: .hits)
        while !hitsContainer.isAtEnd {
            if let hit = try? hitsContainer.decode(HitType.self) {
                hits.append(hit)
            } else {
                // next container
                _ = try? hitsContainer.decode(DummyCodable.self)
            }
        }
        self.hits = hits
        self.page = try container.decode(Int.self, forKey: .page)
        self.params = try container.decode(String.self, forKey: .params)
        self.processingTimeMS = try container.decode(Int.self, forKey: .processingTimeMS)
        self.query = try container.decode(String.self, forKey: .query)
        self.exhaustiveNbHits = try container.decode(Bool.self, forKey: .exhaustiveNbHits)
        self.nbPages = try container.decode(Int.self, forKey: .nbPages)
        self.hitsPerPage = try container.decode(Int.self, forKey: .hitsPerPage)
        self.nbHits = try container.decode(Int.self, forKey: .nbHits)
    }
}

public struct FacetValuesResponse: Decodable {
    public struct Content: Decodable {
        public let value: String
        public let highlighted: String
        public let count: Int
    }

    public let facetHits: [Content]
}
