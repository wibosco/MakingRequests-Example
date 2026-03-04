//
//  StagingEnvironmentConfiguration.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct StagingEnvironmentConfiguration: EnvironmentConfiguration {
    let urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "staging.example.com"
        
        return components
    }()
    
    let headers: [String: String] = {
        var headers = [String: String]()
        
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        headers["X-Environment"] = "staging"
        
        return headers
    }()
    
    let cachePolicy: URLRequest.CachePolicy = {
        return .useProtocolCachePolicy
    }()
    
    let timeoutInterval: TimeInterval = {
        return 60
    }()
}
