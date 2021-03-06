//
//  HelperFunctions.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

func getJSONData(forResource resource: String, ofType type: String) -> Data? {
    guard let path = Bundle.main.path(forResource: resource, ofType: type) else { return nil }
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return data
    } catch {
        return nil
    }
}

extension String {
    func addEncoding() -> String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
