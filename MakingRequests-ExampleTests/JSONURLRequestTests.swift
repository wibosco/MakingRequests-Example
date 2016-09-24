//
//  JSONURLRequestTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 18/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class JSONURLRequestTests: XCTestCase {
    
    // MARK: - Properties
    
    var request: JSONURLRequest!
    var config: RequestConfig!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        config = RequestConfig()
        config.APIHost = "https://example.com"
        config.APIVersion = 2
        
        request = JSONURLRequest(requestConfig: config)
    }
    
    // MARK: - Tests
    
    // MARK: timeoutInterval
    
    func test_timeoutInterval_set() {
        XCTAssertEqual(request.timeoutInterval, config.timeInterval)
    }
    
    // MARK: cachePolicy
    
    func test_cachePolicy_set() {
        XCTAssertEqual(request.cachePolicy, config.cachePolicy)
    }
    
    // MARK: endpoint
    
    func test_endpoint_setURL() {
        let endpoint = "something/example"
        
        request.endpoint = endpoint
        
        let expectedURL = NSURL(string: "\(config.APIHost)/v\(config.APIVersion)/\(endpoint)")!
        
        XCTAssertEqual(expectedURL, request.URL!)
    }
    
    // MARK: parameters
    
    func test_parameters_setHTTPBody() {
        let parameters = ["email_address" : "test@example.com"]
        
        request.parameters = parameters
        
        let expectedHTTPBody = try! NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions(rawValue: 0))
        
        XCTAssertEqual(expectedHTTPBody, request.HTTPBody)
    }
}
