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
    var urlRequestBuilder: StubURLRequestBuilding!
    var urlBuilderFactory: StubURLBuildingFactory!
    var sut: FeedRequestFactory!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        urlRequestBuilder = StubURLRequestBuilding()
        urlBuilderFactory = StubURLBuildingFactory()
        urlBuilderFactory.urlBuilderToReturn = urlRequestBuilder
        
        sut = FeedRequestFactory(urlBuilderFactory: urlBuilderFactory)
    }
    
    override func tearDown() {
        urlRequestBuilder = nil
        urlBuilderFactory = nil
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenRequestFactory_whenCreateFeedGetRequestIsCalled_withDefaultOrdering_thenValuesOnURLRequestAreCorrectlySet() throws {
        let requestToReturn = URLRequest(url: URL(string: "https://williamboles.com")!)
        urlRequestBuilder.urlRequestToReturn = requestToReturn
        
        let request = try sut.createFeedGetRequest()
        
        XCTAssertEqual(request, requestToReturn)
        
        XCTAssertEqual(urlRequestBuilder.events, [
            .path("/v2/feed"),
            .method(.GET),
            .queryItems([URLQueryItem(name: "order", value: FeedRequestFactory.FeedOrder.ascending.rawValue)]),
            .build])
    }
    
    func test_givenRequestFactory_whenCreateFeedGetRequestIsCalled_withAscendingOrdering_thenValuesOnURLRequestAreCorrectlySet() throws {
        urlRequestBuilder.urlRequestToReturn = URLRequest(url: URL(string: "https://williamboles.com")!)
        
        _ = try sut.createFeedGetRequest(order: .ascending)
        
        XCTAssertEqual(urlRequestBuilder.events, [
            .path("/v2/feed"),
            .method(.GET),
            .queryItems([URLQueryItem(name: "order", value: FeedRequestFactory.FeedOrder.ascending.rawValue)]),
            .build])
    }
    
    func test_givenRequestFactory_whenCreateFeedGetRequestIsCalled_withDescendingOrdering_thenValuesOnURLRequestAreCorrectlySet() throws {
        urlRequestBuilder.urlRequestToReturn = URLRequest(url: URL(string: "https://williamboles.com")!)
        
        _ = try sut.createFeedGetRequest(order: .descending)
        
        XCTAssertEqual(urlRequestBuilder.events, [
            .path("/v2/feed"),
            .method(.GET),
            .queryItems([URLQueryItem(name: "order", value: FeedRequestFactory.FeedOrder.descending.rawValue)]),
            .build])
    }
}
