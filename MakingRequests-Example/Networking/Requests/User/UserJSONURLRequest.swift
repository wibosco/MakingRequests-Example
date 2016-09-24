//
//  UserJSONURLRequest.swift
//  MakingRequests-Example
//
//  Created by William Boles on 18/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class UserJSONURLRequest: JSONURLRequest {
    
    // MARK: - Profile
    
    class func retrieveProfileRequest() -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.HTTPMethod = HTTPRequestMethod.GET.rawValue
        request.endpoint = "users/me/profile"
        
        return request
    }
    
    class func updateProfileRequest(username: String, emailAddress: String, firstname: String, lastname: String, dateOfBirth: NSDate) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.HTTPMethod = HTTPRequestMethod.PUT.rawValue
        request.endpoint = "users/me/profile"
        request.parameters = ["username": username,
                              "email_address": emailAddress,
                              "first_name": firstname,
                              "last_name": lastname,
                              "date_of_birth": requestDateFormatter.stringFromDate(dateOfBirth)]
        
        return request
    }
    
    // MARK: - Password
    
    class func forgottenPasswordEmailToBeSentRequest(emailAddress: String) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.HTTPMethod = HTTPRequestMethod.POST.rawValue
        request.endpoint = "users/me/password/forgot"
        request.parameters = ["email_address" : emailAddress]
        
        return request
    }
    
    // MARK: - Block
    
    class func blockUserRequest(userID: String) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.HTTPMethod = HTTPRequestMethod.POST.rawValue
        request.endpoint = "users/\(userID)/block"
        
        return request
    }
    
    class func unblockUserRequest(userID: String) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.HTTPMethod = HTTPRequestMethod.DELETE.rawValue
        request.endpoint = "users/\(userID)/block"
        
        return request
    }
}
