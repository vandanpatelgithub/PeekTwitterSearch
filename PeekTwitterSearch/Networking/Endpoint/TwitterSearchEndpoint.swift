//
//  TwitterSearchEndpoint.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

public enum TweetSearchAPI {
    case popularTweets(searchText: String, resultType: ResultType)
}

public enum ResultType: String {
    case popular, recent, mixed
}

public enum SearchKey: String {
    case q, result_type
}

extension TweetSearchAPI: EndPointType {
    var baseURL: URL {
        switch self {
        case .popularTweets:
            guard let url = URL(string: "https://api.twitter.com/1.1/search/tweets.json") else {
                fatalError("Base url couldn't be configured")
            }
            return url
        }
    }

    var path: String {
        switch self {
        case let .popularTweets(searchText, resultType):
            return "?\(SearchKey.q.rawValue)=\(searchText)&\(SearchKey.result_type.rawValue)=\(resultType.rawValue)"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .popularTweets:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .popularTweets:
            return .request
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .popularTweets:
            return nil
        }
    }
}
