//
//  EndpointType.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

protocol EndPointType {
    var baseURL: URL { get }
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

