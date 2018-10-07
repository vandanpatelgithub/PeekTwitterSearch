//
//  TweetCell.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var tweetTextView: UITextView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var tweetViewModel: TweetViewModel! {
        didSet {
            profileImageView.image = tweetViewModel.profileImage
            usernameTextField.text = tweetViewModel.username
            tweetTextView.text     = tweetViewModel.tweetText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
