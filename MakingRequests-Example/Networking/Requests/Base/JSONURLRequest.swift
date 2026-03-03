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
    
    static let requestDateFormatter: DateFormatter = {
        let requestDateFormatter = DateFormatter()
        requestDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        requestDateFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        return requestDateFormatter
    }()
    
    // MARK: - Properties
    
    var parameters: [String: AnyObject]? {
        didSet {
            self.httpBody = try! JSONSerialization.data(withJSONObject: parameters!, options: JSONSerialization.WritingOptions(rawValue: 0))
        }
    }
    
    var endpoint: String? {
        didSet {
            let stringURL = "\(requestConfig.APIHost)/v\(requestConfig.APIVersion)/\(endpoint!)"
            self.url = URL(string: stringURL)
        }
    }
    
    var requestConfig: RequestConfig
    
    // MARK: - Init
    
    init(requestConfig: RequestConfig = RequestConfig()) {
        self.requestConfig = requestConfig
        super.init(url: URL(string: requestConfig.APIHost)!,
                   cachePolicy: requestConfig.cachePolicy,
                   timeoutInterval: requestConfig.timeInterval)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
