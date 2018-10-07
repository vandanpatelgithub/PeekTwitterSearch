//
//  TweetViewModel.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import UIKit

struct TweetViewModel {
    let tweetText: String
    let username: String
    let profileImage: UIImage

    init(status: Status) {
        self.tweetText = status.tweetText
        self.username = status.user.screenName
        self.profileImage = UIImage()
    }
}

