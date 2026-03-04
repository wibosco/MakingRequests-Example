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
        
        XCTAssertEqual(urlRequestBuilder.events, [
            .path("/v3/user"),
            .method(.GET),
            .build])
    }
    
    func test_givenRequestFactory_whenCreateUserPOSTRequestIsCalled_thenValuesOnURLRequestAreCorrectlySet() throws {
        let requestToReturn = URLRequest(url: URL(string: "https://williamboles.com")!)
        urlRequestBuilder.urlRequestToReturn = requestToReturn
        
        let body = TestValidCodable()
        
        let request = try sut.createUserPOSTRequest(body: body)
        
        XCTAssertEqual(request, requestToReturn)
        
        XCTAssertEqual(urlRequestBuilder.events, [
            .path("/v3/user"),
            .method(.POST),
            .body(try JSONEncoder().encode(body)),
            .build])
    }
}
