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
        
        request.httpMethod = HTTPRequestMethod.GET.rawValue
        request.endpoint = "users/me/profile"
        
        return request
    }
    
    class func updateProfileRequest(username: String,
                                    emailAddress: String,
                                    firstname: String,
                                    lastname: String,
                                    dateOfBirth: Date) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.httpMethod = HTTPRequestMethod.PUT.rawValue
        request.endpoint = "users/me/profile"
        request.parameters = ["username": username as AnyObject,
                              "email_address": emailAddress as AnyObject,
                              "first_name": firstname as AnyObject,
                              "last_name": lastname as AnyObject,
                              "date_of_birth": requestDateFormatter.string(from: dateOfBirth) as AnyObject]
        
        return request
    }
    
    // MARK: - Password
    
    class func forgottenPasswordEmailToBeSentRequest(emailAddress: String) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.httpMethod = HTTPRequestMethod.POST.rawValue
        request.endpoint = "users/me/password/forgot"
        request.parameters = ["email_address" : emailAddress as AnyObject]
        
        return request
    }
    
    // MARK: - Block
    
    class func blockUserRequest(userID: String) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.httpMethod = HTTPRequestMethod.POST.rawValue
        request.endpoint = "users/\(userID)/block"
        
        return request
    }
    
    class func unblockUserRequest(userID: String) -> UserJSONURLRequest {
        let request = UserJSONURLRequest()
        
        request.httpMethod = HTTPRequestMethod.DELETE.rawValue
        request.endpoint = "users/\(userID)/block"
        
        return request
    }
}
