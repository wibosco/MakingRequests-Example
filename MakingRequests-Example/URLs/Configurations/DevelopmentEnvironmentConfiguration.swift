//
//  DevelopmentEnvironmentConfiguration.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct DevelopmentEnvironmentConfiguration: EnvironmentConfiguration {
    let urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 8080
        
        return components
    }()
    
    let headers: [String: String] = {
        var headers = [String: String]()
        
        let info = Bundle.main.infoDictionary
        
        let app = info?["CFBundleName"] as? String ?? "Unknown"
        let version = info?["CFBundleShortVersionString"] as? String ?? "0"
        let build = info?["CFBundleVersion"] as? String ?? "0"
        
        headers["User-Agent"] = "\(app)/\(version) (build:\(build); development)"
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        headers["X-Environment"] = "development"
        
        return headers
    }()
    
    let cachePolicy: URLRequest.CachePolicy = {
        return .reloadIgnoringLocalCacheData // Don't cache in development
    }()
    
    let timeoutInterval: TimeInterval = {
        return 120 // Longer timeout for debugging
    }()
}
