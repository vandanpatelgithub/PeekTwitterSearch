//
//  TwitterSearchEndpoint.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

private let APIKEY       = "ePabCwc1Lt6ffveIwLJ6czDcC"
private let APISECRETKEY = "ZC3JIyGVwemdS5p8NOwfYHeZeFZM3ilUdjHPd7NM3JxNA0LjpT"

public enum TweetSearchAPI {
    case popularTweets(searchText: String, resultType: ResultType, nextResults: String?)
    case imageData(imageURL: String)
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
        case let .imageData(imageURL):
            guard let url = URL(string: imageURL) else {
                fatalError("Base url couldn't be configured")
            }
            return url
        }
    }

    var path: String? {
        switch self {
        case let .popularTweets(_, _, nextResults):
            if let next = nextResults, !next.isEmpty {
                return "\(next)"
            } else {
                return nil
            }
        case .imageData:
            return nil
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .popularTweets, .imageData:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case let .popularTweets(searchText, resultType, _):
            let urlParameters = [ "q": searchText, "result_type": resultType.rawValue]
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: urlParameters, additionalHeaders: headers)
        case .imageData:
            return .request
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .popularTweets:
            return [
                "Authorization" :
                """
                OAuth oauth_consumer_key="ePabCwc1Lt6ffveIwLJ6czDcC",oauth_consumer_secret_key="ZC3JIyGVwemdS5p8NOwfYHeZeFZM3ilUdjHPd7NM3JxNA0LjpT",
                oauth_signature_method="HMAC-SHA1"
                """.addEncoding()
            ]
        case .imageData:
            return nil
        }
    }
}
