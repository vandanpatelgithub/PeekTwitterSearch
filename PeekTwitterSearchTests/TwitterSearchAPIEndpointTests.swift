//
//  TwitterSearchAPIEndpointTests.swift
//  PeekTwitterSearchTests
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import XCTest
@testable import PeekTwitterSearch

class TwitterSearchAPIEndpointTests: XCTestCase {

    func testTwitterEndpointWithoutNext() {
        let endpoint = TweetSearchAPI.popularTweets(searchText: "Peek", resultType: .popular, nextResults: nil)
        XCTAssertEqual(endpoint.baseURL.absoluteString, "https://api.twitter.com/1.1/search/tweets.json")
        XCTAssertNil(endpoint.path)
        XCTAssertEqual(endpoint.httpMethod, .get)
        XCTAssertNotNil(endpoint.headers)
    }

    func testTwitterEndpointWithNext() {
        let endpoint = TweetSearchAPI.popularTweets(
            searchText: "Peek",
            resultType: .popular,
            nextResults: "?max_id=1047843021075763199&q=Peek&include_entities=1&result_type=popular")
        XCTAssertEqual(endpoint.baseURL.absoluteString, "https://api.twitter.com/1.1/search/tweets.json")
        XCTAssertEqual(endpoint.path, "?max_id=1047843021075763199&q=Peek&include_entities=1&result_type=popular")
        XCTAssertEqual(endpoint.httpMethod, .get)
        XCTAssertNotNil(endpoint.headers)
    }
}
