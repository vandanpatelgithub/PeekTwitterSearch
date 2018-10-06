//
//  HTTPTask.swift
//  PeekTwitterSearch
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/6/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

public enum HTTPTask: Equatable {
    public static func == (lhs: HTTPTask, rhs: HTTPTask) -> Bool {
        switch (lhs, rhs) {
        case (.request, .request):
            return true
        default:
            return false
        }
    }

    case request

    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)

    case requestParametersAndHeaders(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionalHeaders: HTTPHeaders?
    )
}
