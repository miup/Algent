//
//  UserRequest.swift
//  Algent_Example
//
//  Created by kazuya-miura on 2018/04/20.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Algent

struct SarchUserRequest: AlgoliaRequestProtocol {
    // set search result type
    typealias HitType = User

    let page: Int
    let per: Int
    let text: String?
    let hashtags: [String]?

    var indexName: String {
        return "user"
    }

    var query: AlgentQuery {
        let query = AlgentQuery(query: text)
        query.page = UInt(page)
        query.hitsPerPage = UInt(per)
        if let hashtags = hashtags {
            query.tagFilters = hashtags
        }
        return query
    }

    init(page: Int, per: Int, text: String? = nil, hashtags: [String]? = nil) {
        self.page = page
        self.per = per
        self.text = text
        self.hashtags = hashtags
    }
}
