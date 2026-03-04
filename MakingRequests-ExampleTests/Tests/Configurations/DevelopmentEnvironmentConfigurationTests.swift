//
//  DevelopmentEnvironmentConfigurationTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

class DevelopmentEnvironmentConfigurationTests: XCTestCase {
    var sut: DevelopmentEnvironmentConfiguration!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        sut = DevelopmentEnvironmentConfiguration()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenConfiguration_thenUrlComponentsIsCorrect() {
        XCTAssertEqual(sut.urlComponents, URLComponents(string: "http://localhost:8080"))
    }
    
    func test_givenConfiguration_thenHeadersIsCorrect() {
        XCTAssertEqual(sut.headers, ["X-Environment": "development",
                                     "Accept": "application/json",
                                     "Content-Type": "application/json"])
    }
    
    func test_givenConfiguration_thenCachePolicyIsCorrect() {
        XCTAssertEqual(sut.cachePolicy, .reloadIgnoringLocalCacheData)
    }
    
    func test_givenConfiguration_thenTimeoutIntervalIsCorrect() {
        XCTAssertEqual(sut.timeoutInterval, 120)
    }
}
