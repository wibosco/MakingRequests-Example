//
//  UserRequestFactoryTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

class UserRequestFactoryTests: XCTestCase {
    var urlRequestBuilder: StubURLRequestBuilding!
    var urlBuilderFactory: StubURLBuildingFactory!
    var sut: UserRequestFactory!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        urlRequestBuilder = StubURLRequestBuilding()
        urlBuilderFactory = StubURLBuildingFactory()
        urlBuilderFactory.urlBuilderToReturn = urlRequestBuilder
        
        sut = UserRequestFactory(urlBuilderFactory: urlBuilderFactory)
    }
    
    override func tearDown() {
        urlRequestBuilder = nil
        urlBuilderFactory = nil
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenRequestFactory_whenCreateUserGETRequestIsCalled_thenValuesOnURLRequestAreCorrectlySet() throws {
        let requestToReturn = URLRequest(url: URL(string: "https://williamboles.com")!)
        urlRequestBuilder.urlRequestToReturn = requestToReturn
        
        let request = try sut.createUserGETRequest()
        
        XCTAssertEqual(request, requestToReturn)
        
        XCTAssertEqual(urlRequestBuilder.events.count, 3)
        
        guard case let .path(path) = urlRequestBuilder.events[0] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[0])")
            return
        }
        XCTAssertEqual(path, "/v3/user")
        
        guard case let .method(method) = urlRequestBuilder.events[1] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[1])")
            return
        }
        XCTAssertEqual(method, .GET)
        
        guard case .build = urlRequestBuilder.events[2] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[2])")
            return
        }
    }
    
    func test_givenRequestFactory_whenCreateUserPOSTRequestIsCalled_thenValuesOnURLRequestAreCorrectlySet() throws {
        let requestToReturn = URLRequest(url: URL(string: "https://williamboles.com")!)
        urlRequestBuilder.urlRequestToReturn = requestToReturn
        
        let body = TestValidCodable()
        
        let request = try sut.createUserPOSTRequest(body: body)
        
        XCTAssertEqual(request, requestToReturn)
        
        XCTAssertEqual(urlRequestBuilder.events.count, 4)
        
        guard case let .path(path) = urlRequestBuilder.events[0] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[0])")
            return
        }
        XCTAssertEqual(path, "/v3/user")
        
        guard case let .method(method) = urlRequestBuilder.events[1] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[1])")
            return
        }
        XCTAssertEqual(method, .POST)
        
        guard case let .body(bodyPassedIn) = urlRequestBuilder.events[2] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[2])")
            return
        }
        XCTAssertEqual(bodyPassedIn as? TestValidCodable, body)
        
        guard case .build = urlRequestBuilder.events[3] else {
            XCTFail("Unexpected event: \(urlRequestBuilder.events[3])")
            return
        }
    }
}
