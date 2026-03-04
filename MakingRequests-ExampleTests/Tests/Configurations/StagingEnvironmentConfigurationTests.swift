//
//  StagingEnvironmentConfigurationTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

class StagingEnvironmentConfigurationTests: XCTestCase {
    var sut: StagingEnvironmentConfiguration!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        sut = StagingEnvironmentConfiguration()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenConfiguration_thenUrlComponentsIsCorrect() {
        XCTAssertEqual(sut.urlComponents, URLComponents(string: "https://staging.example.com"))
    }
    
    func test_givenConfiguration_thenHeadersIsCorrect() {
        XCTAssertEqual(sut.headers, ["X-Environment": "staging",
                                     "Accept": "application/json",
                                     "Content-Type": "application/json"])
    }
    
    func test_givenConfiguration_thenCachePolicyIsCorrect() {
        XCTAssertEqual(sut.cachePolicy, .useProtocolCachePolicy)
    }
    
    func test_givenConfiguration_thenTimeoutIntervalIsCorrect() {
        XCTAssertEqual(sut.timeoutInterval, 60)
    }
}
