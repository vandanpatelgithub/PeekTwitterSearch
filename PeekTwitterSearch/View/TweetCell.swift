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
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!

    let networkManager = NetworkManager()


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var tweetViewModel: TweetViewModel! {
        didSet {
            usernameLabel.text     = tweetViewModel.username
            tweetLabel.text        = tweetViewModel.tweetText
            networkManager.getImageData(for: tweetViewModel.imageURL) { [weak self] (data, error) in
                guard let theData = data else {
                    DispatchQueue.main.async { self?.profileImageView.image = UIImage() }
                    return
                }
                DispatchQueue.main.async { self?.profileImageView.image = UIImage(data: theData) }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
