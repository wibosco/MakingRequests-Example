//
//  UserJSONURLRequestTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 23/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class UserJSONURLRequestTests: XCTestCase {
    
    // MARK: - Tests
    
    // MARK: retrieveProfileRequest
    
    func test_retrieveProfileRequest_HTTPMethod() {
        let request = UserJSONURLRequest.retrieveProfileRequest()
        
        XCTAssertEqual(request.HTTPMethod, HTTPRequestMethod.GET.rawValue)
    }
    
    func test_retrieveProfileRequest_endPoint() {
        let request = UserJSONURLRequest.retrieveProfileRequest()
        
        XCTAssertEqual(request.endPoint, "users/me/profile")
    }
    
    // MARK: updateProfileRequest
    
    func test_updateProfileRequest_HTTPMethod() {
        let username = "toby190"
        let emailAddress = "toby@test.com"
        let firstName = "toby"
        let lastName = "tester"
        let dateOfBirth = NSDate()
        
        let request = UserJSONURLRequest.updateProfileRequest(username, emailAddress: emailAddress, firstname: firstName, lastname: lastName, dateOfBirth: dateOfBirth)
        
        XCTAssertEqual(request.HTTPMethod, HTTPRequestMethod.PUT.rawValue)
    }
    
    func test_updateProfileRequest_endPoint() {
        let username = "toby190"
        let emailAddress = "toby@test.com"
        let firstName = "toby"
        let lastName = "tester"
        let dateOfBirth = NSDate()
        
        let request = UserJSONURLRequest.updateProfileRequest(username, emailAddress: emailAddress, firstname: firstName, lastname: lastName, dateOfBirth: dateOfBirth)
        
        XCTAssertEqual(request.endPoint, "users/me/profile")
    }
    
    func test_updateProfileRequest_parameters() {
        let username = "toby190"
        let emailAddress = "toby@test.com"
        let firstName = "toby"
        let lastName = "tester"
        let dateOfBirth = NSDate()
        
        let request = UserJSONURLRequest.updateProfileRequest(username, emailAddress: emailAddress, firstname: firstName, lastname: lastName, dateOfBirth: dateOfBirth)
        
        
        let expectedParameters: [String: AnyObject] = ["username": username,
                                                       "email_address": emailAddress,
                                                       "first_name": firstName,
                                                       "last_name": lastName,
                                                       "date_of_birth": JSONURLRequest.requestDateFormatter.stringFromDate(dateOfBirth)]
        
        XCTAssertEqual(request.parameters!["username"] as? String, expectedParameters["username"] as? String)
        XCTAssertEqual(request.parameters!["email_address"] as? String, expectedParameters["email_address"] as? String)
        XCTAssertEqual(request.parameters!["first_name"] as? String, expectedParameters["first_name"] as? String)
        XCTAssertEqual(request.parameters!["last_name"] as? String, expectedParameters["last_name"] as? String)
        XCTAssertEqual(request.parameters!["date_of_birth"] as? String, expectedParameters["date_of_birth"] as? String)
    }
    
    // MARK: forgottenPasswordEmailToBeSentRequest
    
    func test_forgottenPasswordEmailToBeSentRequest_HTTPMethod() {
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest("example@test.com")
        
        XCTAssertEqual(request.HTTPMethod, HTTPRequestMethod.POST.rawValue)
    }
    
    func test_forgottenPasswordEmailToBeSentRequest_endPoint() {
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest("example@test.com")
        
        XCTAssertEqual(request.endPoint, "users/me/password/forgot")
    }
    
    func test_forgottenPasswordEmailToBeSentRequest_parameters() {
        let emailAddress = "example@test.com"
        
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest(emailAddress)
        
        XCTAssertEqual(request.parameters!["email_address"] as? String, emailAddress)
    }
    
    // MARK: blockUserRequest
    
    func test_blockUserRequest_HTTPMethod() {
        let request = UserJSONURLRequest.blockUserRequest("345")
        
        XCTAssertEqual(request.HTTPMethod, HTTPRequestMethod.POST.rawValue)
    }
    
    func test_blockUserRequest_endPoint() {
        let userID = "345"
        
        let request = UserJSONURLRequest.blockUserRequest(userID)
        
        XCTAssertEqual(request.endPoint, "users/\(userID)/block")
    }
    
    // MARK: unblockUserRequest
    
    func test_unblockUserRequest_HTTPMethod() {
        let request = UserJSONURLRequest.unblockUserRequest("3845")
        
        XCTAssertEqual(request.HTTPMethod, HTTPRequestMethod.DELETE.rawValue)
    }
    
    func test_unblockUserRequest_endPoint() {
        let userID = "3845"
        
        let request = UserJSONURLRequest.unblockUserRequest(userID)
        
        XCTAssertEqual(request.endPoint, "users/\(userID)/block")
    }
    
}
