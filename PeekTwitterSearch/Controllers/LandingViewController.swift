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
    var tweetViewModel = [TweetViewModel]()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        guard let theData = getJSONData(forResource: "StubbedTweetSearchResponse", ofType: "json") else { return }
        let tweetSearchResult = try? JSONDecoder().decode(TweetSearchResult.self, from: theData)
        tweetViewModel = tweetSearchResult?.statuses.map( { return TweetViewModel(status: $0) } ) ?? []
        tableView.reloadData()

    }
}

// MARK: Tableview DataSource
extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TweetCell else {
            return UITableViewCell()
        }
        cell.tweetViewModel = tweetViewModel[indexPath.row]
        return cell
    }
}

// MARK: Tableview Delegate
extension LandingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118.0
    }
}
