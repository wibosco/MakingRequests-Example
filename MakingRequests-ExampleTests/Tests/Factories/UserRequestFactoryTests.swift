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
        
        let urlBuilderFactory = StubURLBuildingFactory()
        urlBuilderFactory.urlBuilderToReturn = URLRequestBuilder(configuration: StubConfiguration())
        sut = UserRequestFactory(urlBuilderFactory: urlBuilderFactory)
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
        XCTAssertNil(request.httpBody)
    }
    
    func test_givenRequestFactory_whenCreateUserPOSTRequestIsCalled_thenURLRequestIsCorrectlyBuilt() throws {
        let body = TestValidCodable()
        
        let request = try sut.createUserPOSTRequest(body: body)
        
        XCTAssertEqual(request.url?.path, "/v3/user")
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertEqual(request.httpBody, try JSONEncoder().encode(body))
    }
}
