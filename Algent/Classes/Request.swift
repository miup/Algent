//
//  Request.swift
//  Agent
//
//  Created by miup on 2017/10/12.
//

import AlgoliaSearch

public protocol AlgoliaRequestProtocol {
    associatedtype HitType: Decodable
    var query: AlgentQuery { get }
    var indexName: String { get }
}

public protocol FacetValuesRequestProtocol {
    var query: AlgentQuery? { get }
    var indexName: String { get }
    var key: String { get }
    var keyword: String { get }
}
