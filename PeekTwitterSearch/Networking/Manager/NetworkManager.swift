//
//  NetworkManager.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

struct NetworkManager {
    private let router = Router<TweetSearchAPI>()

    func getPopularTweets(for searchText: String,
                          and resultTyle: ResultType,
                          completion: @escaping () -> ()) {

    }
}
