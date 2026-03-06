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
    var sut: UserRequestFactory!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        let urlRequestBuilderFactory = StubURLRequestBuildingFactory()
        urlRequestBuilderFactory.urlBuilderToReturn = URLRequestBuilder(configuration: StubConfiguration())
        sut = UserRequestFactory(urlRequestBuilderFactory: urlRequestBuilderFactory)
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenRequestFactory_whenCreateUserGETRequestIsCalled_thenURLRequestIsCorrectlyBuilt() throws {
        let request = try sut.createUserGETRequest()
        
        XCTAssertEqual(request.url?.path, "/v3/user")
        XCTAssertEqual(request.httpMethod, "GET")
    }
    
    func test_givenRequestFactory_whenCreateUserPOSTRequestIsCalled_thenURLRequestIsCorrectlyBuilt() throws {
        let user = User(name: "test_name")
        
        let request = try sut.createUserPOSTRequest(user: user)
        
        XCTAssertEqual(request.url?.path, "/v3/user")
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertEqual(request.httpBody, try JSONEncoder().encode(user))
    }
    
    func test_givenRequestFactory_whenCreateUserFeedGetRequestIsCalled_withAscendingTrue_thenURLRequestIsCorrectlyBuilt() throws {
        let request = try sut.createUserFeedGETRequest(userID: "123", ascending: true)
        
        XCTAssertEqual(request.url?.path, "/v3/user/123/feed")
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertTrue(request.url?.query?.contains("order=ascending") ?? false)
    }
    
    func test_givenRequestFactory_whenCreateUserFeedGetRequestIsCalled_withAscendingFalse_thenURLRequestIsCorrectlyBuilt() throws {
        let request = try sut.createUserFeedGETRequest(userID: "456", ascending: false)
        
        XCTAssertEqual(request.url?.path, "/v3/user/456/feed")
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertTrue(request.url?.query?.contains("order=descending") ?? false)
    }
}
