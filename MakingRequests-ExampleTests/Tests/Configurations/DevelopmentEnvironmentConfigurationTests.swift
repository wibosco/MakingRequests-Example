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
        let info = Bundle.main.infoDictionary
        
        let app = info?["CFBundleName"] as? String ?? "Unknown"
        let version = info?["CFBundleShortVersionString"] as? String ?? "0"
        let build = info?["CFBundleVersion"] as? String ?? "0"
        
        XCTAssertEqual(sut.headers, ["X-Environment": "development",
                                     "Accept": "application/json",
                                     "User-Agent": "\(app)/\(version) (build:\(build); development)",
                                     "Content-Type": "application/json"])
    }
    
    func test_givenConfiguration_thenCachePolicyIsCorrect() {
        XCTAssertEqual(sut.cachePolicy, .reloadIgnoringLocalCacheData)
    }
    
    func test_givenConfiguration_thenTimeoutIntervalIsCorrect() {
        XCTAssertEqual(sut.timeoutInterval, 120)
    }
}
