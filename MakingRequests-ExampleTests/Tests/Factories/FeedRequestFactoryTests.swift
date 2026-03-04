//
//  FeedRequestFactoryTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

class FeedRequestFactoryTests: XCTestCase {
    var sut: FeedRequestFactory!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        let urlBuilderFactory = StubURLBuildingFactory()
        urlBuilderFactory.urlBuilderToReturn = URLRequestBuilder(configuration: StubConfiguration())
        sut = FeedRequestFactory(urlBuilderFactory: urlBuilderFactory)
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenRequestFactory_whenCreateFeedGETRequestIsCalled_withDefaultOrdering_thenURLRequestIsCorrectlyBuilt() throws {
        let request = try sut.createFeedGetRequest()
        
        XCTAssertEqual(request.url?.path, "/v2/feed")
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertTrue(request.url?.query?.contains("order=ascending") ?? false)
    }
    
    func test_givenRequestFactory_whenCreateFeedGETRequestIsCalled_withAscendingOrdering_thenURLRequestIsCorrectlyBuilt() throws {
        let request = try sut.createFeedGetRequest(order: .ascending)
        
        XCTAssertTrue(request.url?.query?.contains("order=ascending") ?? false)
    }
    
    func test_givenRequestFactory_whenCreateFeedGETRequestIsCalled_withDescendingOrdering_thenURLRequestIsCorrectlyBuilt() throws {
        let request = try sut.createFeedGetRequest(order: .descending)
        
        XCTAssertTrue(request.url?.query?.contains("order=descending") ?? false)
    }
}
