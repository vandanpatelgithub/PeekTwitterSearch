//
//  TweetSearchResultTests.swift
//  PeekTwitterSearchTests
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import XCTest
@testable import PeekTwitterSearch

class TweetSearchResultTests: XCTestCase {

    func testDecodingTweetSearchResponseForSuccess() {
        guard let data = getJSONData(forResource: "StubbedTweetSearchResponse", ofType: "json") else {
            XCTFail("Getting JSONData failed")
            return
        }

        do {
            let tweetSearchResult = try JSONDecoder().decode(TweetSearchResult.self, from: data)
            XCTAssertEqual(tweetSearchResult.statuses.count, 15)
            XCTAssertEqual(tweetSearchResult.searchMetadata.nextResults,
                           "?max_id=1047843021075763199&q=Peek&include_entities=1&result_type=popular")
        } catch {
            XCTFail("Decoding Failed")
        }
    }
}
