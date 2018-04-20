//
//  User.swift
//  Algent_Example
//
//  Created by kazuya-miura on 2018/04/20.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

enum Gender: String, Decodable {
    case male = "male"
    case female = "female"
    case other

    init(rawValue: String) {
        switch rawValue {
        case "male": self = .male
        case "female": self = .female
        default: self = .other
        }
    }
}

struct User: Decodable {
    let objectID: String
    let name: String
    let bio: String
    let gender: Gender
    let isActive: Bool
    let followerCount: Int
    let followeeCount: Int
    let _tags: [String]
}
