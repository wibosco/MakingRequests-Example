//
//  ProductionEnvironmentConfigurationTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

class ProductionEnvironmentConfigurationTests: XCTestCase {
    var sut: ProductionEnvironmentConfiguration!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        sut = ProductionEnvironmentConfiguration()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenConfiguration_thenUrlComponentsIsCorrect() {
        XCTAssertEqual(sut.urlComponents, URLComponents(string: "https://api.example.com"))
    }
    
    func test_givenConfiguration_thenHeadersIsCorrect() {
        let info = Bundle.main.infoDictionary
        
        let app = info?["CFBundleName"] as? String ?? "Unknown"
        let version = info?["CFBundleShortVersionString"] as? String ?? "0"
        let build = info?["CFBundleVersion"] as? String ?? "0"
        let bundleID = Bundle.main.bundleIdentifier ?? "unknown"
        let os = ProcessInfo.processInfo.operatingSystemVersion
        let osVersion = "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
        
        XCTAssertEqual(sut.headers, ["Accept": "application/json",
                                     "User-Agent": "\(app)/\(version) (\(bundleID); build:\(build); iOS \(osVersion))",
                                     "Content-Type": "application/json"])
    }
    
    func test_givenConfiguration_thenCachePolicyIsCorrect() {
        XCTAssertEqual(sut.cachePolicy, .useProtocolCachePolicy)
    }
    
    func test_givenConfiguration_thenTimeoutIntervalIsCorrect() {
        XCTAssertEqual(sut.timeoutInterval, 60)
    }
}
