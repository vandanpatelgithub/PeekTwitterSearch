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
                          nextResults: String?,
                          completion: @escaping (_ tweetSearchResult: TweetSearchResult?, _ error: String?) -> ()) {
        router.request(.popularTweets(searchText: searchText,
                                      resultType: resultTyle,
                                      nextResults: nextResults)) { (data, response, error) in
            if error != nil {
                completion(nil, "Please check your network connection. Click OK to fetch offline data.")
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }

                    do {
                        let tweetSearchResult = try JSONDecoder().decode(TweetSearchResult.self, from: responseData)
                        completion(tweetSearchResult, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case let .failure(networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }

    func getImageData(for imageURL: String ,completion: @escaping (_ imageData: Data?, _ error: String?) -> ()) {
        router.request(.imageData(imageURL: imageURL)) { (data, response, error) in
            if error != nil {
                completion(nil, "Please check your network connection. Click OK to fetch offline data.")
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    completion(responseData, nil)
                case let .failure(networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

enum NetworkResponse: String {
    case success
    case authenticationError        = "You need to be authenticated first"
    case badRequest                 = "Bad Request"
    case outdated                   = "The URL you requested is outdated"
    case failed                     = "Network request failed"
    case noData                     = "Response returned with no data to decode"
    case unableToDecode             = "We could not decode the resopnse"
    case unableToCaptureFeed        = "We could not conver set to array"
}

enum Result<String> {
    case success
    case failure(String)
}
