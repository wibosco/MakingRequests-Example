//
//  JSONURLRequest.swift
//  MakingRequests-Example
//
//  Created by William Boles on 18/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

enum HTTPRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

class JSONURLRequest: NSMutableURLRequest {
    
    // MARK: - Static
    
    static let requestDateFormatter: NSDateFormatter = {
        let requestDateFormatter = NSDateFormatter()
        requestDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        requestDateFormatter.timeZone = NSTimeZone(name:"UTC")
        
        return requestDateFormatter
    }()
    
    // MARK: - Properties
    
    var parameters: [String: AnyObject]? {
        didSet {
            self.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(parameters!, options: NSJSONWritingOptions(rawValue: 0))
        }
    }
    
    var endpoint: String? {
        didSet {
            let stringURL = "\(requestConfig.APIHost)/v\(requestConfig.APIVersion)/\(endpoint!)"
            self.URL = NSURL(string: stringURL)
        }
    }
    
    var requestConfig: RequestConfig
    
    // MARK: - Init
    
    init(requestConfig: RequestConfig = RequestConfig()) {
        self.requestConfig = requestConfig
        super.init(URL: NSURL(string: requestConfig.APIHost)!, cachePolicy: requestConfig.cachePolicy, timeoutInterval: requestConfig.timeInterval)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
