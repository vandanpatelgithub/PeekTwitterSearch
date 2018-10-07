//
//  TweetSearchResult.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

struct TweetSearchResult: Codable {
    let statuses: [Status]
    let searchMetadata: SearchMetadata

    private enum CodingKeys: String, CodingKey {
        case statuses
        case searchMetadata = "search_metadata"
    }
}

struct Status: Codable {
    let user: User
    let tweetText: String

    private enum CodingKeys: String, CodingKey {
        case user
        case tweetText = "text"
    }
}

struct User: Codable {
    let name: String
    let screenName: String
    let imageURL: String

    private enum CodingKeys: String, CodingKey {
        case name
        case screenName = "screen_name"
        case imageURL   = "profile_image_url_https"
    }
}

struct SearchMetadata: Codable {
    let nextResults: String?

    private enum CodingKeys: String, CodingKey {
        case nextResults = "next_results"
    }
}
