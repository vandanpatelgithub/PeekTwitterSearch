//
//  ViewController.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let cellIdentifier = "tweetCell"
    let tweetViewModel = [TweetViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Tableview DataSource
extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TweetCell else {
            return UITableViewCell()
        }
        return cell
    }
}
