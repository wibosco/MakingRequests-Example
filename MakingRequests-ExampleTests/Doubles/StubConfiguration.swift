//
//  TestConfiguration.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

@testable import MakingRequests_Example

struct StubConfiguration: EnvironmentConfiguration{
    let urlComponents: URLComponents
    let headers: [String: String]
    let cachePolicy: URLRequest.CachePolicy
    let timeoutInterval: TimeInterval
    
    init(urlComponents: URLComponents = URLComponents(string: "http://williamboles.com/making-a-request-with-a-side-of-testing/")!,
         headers: [String: String] = [:],
         cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData,
         timeoutInterval: TimeInterval = 30) {
        self.urlComponents = urlComponents
        self.headers = headers
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
    }
}
