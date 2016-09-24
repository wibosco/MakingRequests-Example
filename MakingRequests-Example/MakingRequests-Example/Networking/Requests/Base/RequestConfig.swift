//
//  APIConfig.swift
//  MakingRequests-Example
//
//  Created by William Boles on 18/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class RequestConfig: NSObject {
    
    // MARK: Networking
    
    lazy var APIHost: String = {
        var APIHost: String?
        
        #if DEBUG
            APIHost = "https://development.platform.example.com"
        #elseif RELEASE
            APIHost = "https://platform.example.com"
        #endif
        
        assert(APIHost != nil, "Host API URL not set")
        
        return APIHost!
    }()
    
    lazy var APIVersion: Double = {
        var APIVersion: Double?
        
        #if DEBUG
            APIVersion = 2.0
        #elseif RELEASE
            APIVersion = 1.8
        #endif
        
        assert(APIVersion != nil, "API version not set")
        
        return APIVersion!
    }()
    
    lazy var timeInterval: NSTimeInterval = {
        return 45
    }()
    
    lazy var cachePolicy: NSURLRequestCachePolicy = {
        return .UseProtocolCachePolicy
    }()
}
