//
//  ProductionEnvironmentConfiguration.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct ProductionEnvironmentConfiguration: EnvironmentConfiguration {
    let urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.example.com"
        
        return components
    }()
    
    let headers: [String: String] = {
        var headers = [String: String]()
        
        let info = Bundle.main.infoDictionary
        
        let app = info?["CFBundleName"] as? String ?? "Unknown"
        let version = info?["CFBundleShortVersionString"] as? String ?? "0"
        let build = info?["CFBundleVersion"] as? String ?? "0"
        let bundleID = Bundle.main.bundleIdentifier ?? "unknown"
        let os = ProcessInfo.processInfo.operatingSystemVersion
        let osVersion = "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
        
        headers["User-Agent"] = "\(app)/\(version) (\(bundleID); build:\(build); iOS \(osVersion))"
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        
        return headers
    }()
    
    let cachePolicy: URLRequest.CachePolicy = {
        return .useProtocolCachePolicy
    }()
    
    let timeoutInterval: TimeInterval = {
        return 60
    }()
}
