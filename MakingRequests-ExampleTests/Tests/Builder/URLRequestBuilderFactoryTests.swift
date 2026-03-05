//
//  URLRequestBuilderFactoryTests.swift
//  MakingRequests-ExampleTests
//
//  Created by William Boles on 05/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

final class URLRequestBuilderFactoryTests: XCTestCase {
    var sut: URLRequestBuilderFactory!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()

        sut = URLRequestBuilderFactory()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenAFactory_whenTheEnvironmentIsDevelopment_thenURLBuilderShouldHoldTheCorrectConfiguration() {
        let builder = sut.createBuilder(for: .development)
        
        XCTAssertTrue(builder.configuration is DevelopmentEnvironmentConfiguration)
    }
    
    func test_givenAFactory_whenTheEnvironmentIsStaging_thenURLBuilderShouldHoldTheCorrectConfiguration() {
        let builder = sut.createBuilder(for: .staging)
        
        XCTAssertTrue(builder.configuration is StagingEnvironmentConfiguration)
    }
    
    func test_givenAFactory_whenTheEnvironmentIsProduction_thenURLBuilderShouldHoldTheCorrectConfiguration() {
        let builder = sut.createBuilder(for: .production)
        
        XCTAssertTrue(builder.configuration is ProductionEnvironmentConfiguration)
    }
}
