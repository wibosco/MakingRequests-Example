//
//  UserJSONURLRequestTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 23/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import MakingRequests_Example

class UserJSONURLRequestTests: XCTestCase {
    
    // MARK: - Tests
    
    // MARK: retrieveProfileRequest
    
    func test_retrieveProfileRequest_httpMethod() {
        let request = UserJSONURLRequest.retrieveProfileRequest()
        
        XCTAssertEqual(request.httpMethod, HTTPRequestMethod.GET.rawValue)
    }
    
    func test_retrieveProfileRequest_endpoint() {
        let request = UserJSONURLRequest.retrieveProfileRequest()
        
        XCTAssertEqual(request.endpoint, "users/me/profile")
    }
    
    // MARK: updateProfileRequest
    
    func test_updateProfileRequest_httpMethod() {
        let username = "toby190"
        let emailAddress = "toby@test.com"
        let firstName = "toby"
        let lastName = "tester"
        let dateOfBirth = Date()
        
        let request = UserJSONURLRequest.updateProfileRequest(username: username,
                                                              emailAddress: emailAddress,
                                                              firstname: firstName,
                                                              lastname: lastName,
                                                              dateOfBirth: dateOfBirth)
        
        XCTAssertEqual(request.httpMethod, HTTPRequestMethod.PUT.rawValue)
    }
    
    func test_updateProfileRequest_endpoint() {
        let username = "toby190"
        let emailAddress = "toby@test.com"
        let firstName = "toby"
        let lastName = "tester"
        let dateOfBirth = Date()
        
        let request = UserJSONURLRequest.updateProfileRequest(username: username,
                                                              emailAddress: emailAddress,
                                                              firstname: firstName,
                                                              lastname: lastName,
                                                              dateOfBirth: dateOfBirth)
        
        XCTAssertEqual(request.endpoint, "users/me/profile")
    }
    
    func test_updateProfileRequest_parameters() {
        let username = "toby190"
        let emailAddress = "toby@test.com"
        let firstName = "toby"
        let lastName = "tester"
        let dateOfBirth = Date()
        
        let request = UserJSONURLRequest.updateProfileRequest(username: username,
                                                              emailAddress: emailAddress,
                                                              firstname: firstName,
                                                              lastname: lastName,
                                                              dateOfBirth: dateOfBirth)
        
        
        let expectedParameters: [String: Any] = ["username": username,
                                                 "email_address": emailAddress,
                                                 "first_name": firstName,
                                                 "last_name": lastName,
                                                 "date_of_birth": JSONURLRequest.requestDateFormatter.string(from: dateOfBirth)]
        
        XCTAssertEqual(request.parameters!["username"] as? String, expectedParameters["username"] as? String)
        XCTAssertEqual(request.parameters!["email_address"] as? String, expectedParameters["email_address"] as? String)
        XCTAssertEqual(request.parameters!["first_name"] as? String, expectedParameters["first_name"] as? String)
        XCTAssertEqual(request.parameters!["last_name"] as? String, expectedParameters["last_name"] as? String)
        XCTAssertEqual(request.parameters!["date_of_birth"] as? String, expectedParameters["date_of_birth"] as? String)
    }
    
    // MARK: forgottenPasswordEmailToBeSentRequest
    
    func test_forgottenPasswordEmailToBeSentRequest_httpMethod() {
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest(emailAddress: "example@test.com")
        
        XCTAssertEqual(request.httpMethod, HTTPRequestMethod.POST.rawValue)
    }
    
    func test_forgottenPasswordEmailToBeSentRequest_endpoint() {
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest(emailAddress: "example@test.com")
        
        XCTAssertEqual(request.endpoint, "users/me/password/forgot")
    }
    
    func test_forgottenPasswordEmailToBeSentRequest_parameters() {
        let emailAddress = "example@test.com"
        
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest(emailAddress: emailAddress)
        
        XCTAssertEqual(request.parameters!["email_address"] as? String, emailAddress)
    }
    
    // MARK: blockUserRequest
    
    func test_blockUserRequest_httpMethod() {
        let request = UserJSONURLRequest.blockUserRequest(userID: "345")
        
        XCTAssertEqual(request.httpMethod, HTTPRequestMethod.POST.rawValue)
    }
    
    func test_blockUserRequest_endpoint() {
        let userID = "345"
        
        let request = UserJSONURLRequest.blockUserRequest(userID: userID)
        
        XCTAssertEqual(request.endpoint, "users/\(userID)/block")
    }
    
    // MARK: unblockUserRequest
    
    func test_unblockUserRequest_httpMethod() {
        let request = UserJSONURLRequest.unblockUserRequest(userID: "3845")
        
        XCTAssertEqual(request.httpMethod, HTTPRequestMethod.DELETE.rawValue)
    }
    
    func test_unblockUserRequest_endpoint() {
        let userID = "3845"
        
        let request = UserJSONURLRequest.unblockUserRequest(userID: userID)
        
        XCTAssertEqual(request.endpoint, "users/\(userID)/block")
    }
}
