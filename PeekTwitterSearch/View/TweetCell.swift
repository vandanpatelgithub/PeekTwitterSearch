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
    let activityIndicator = UIActivityIndicatorView(style: .gray)


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var tweetViewModel: TweetViewModel! {
        didSet {
            activityIndicator.center = profileImageView.center
            contentView.addSubview(activityIndicator)

            usernameLabel.text     = tweetViewModel.username
            tweetLabel.text        = tweetViewModel.tweetText
            activityIndicator.startAnimating()
            networkManager.getImageData(for: tweetViewModel.imageURL) { [weak self] (data, error) in
                DispatchQueue.main.async { self?.activityIndicator.stopAnimating() }
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

    override func prepareForReuse() {
        super.prepareForReuse()
        activityIndicator.stopAnimating()
    }
}
