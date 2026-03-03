//
//  UserAPIManager.swift
//  MakingRequests-Example
//
//  Created by William Boles on 18/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class UserAPIManager: NSObject {

    typealias CompletionClosure = (_ successful: Bool) -> Void
    
    // MARK: - Profile
    
    class func retrieveProfile(completion: CompletionClosure?) {
        let session = URLSession.shared
        let request = UserJSONURLRequest.retrieveProfileRequest() as URLRequest
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                //Parse response
        }
        
        task.resume()
    }
    
    class func updateProfile(username: String, emailAddress: String, firstname: String, lastname: String, dateOfBirth: Date, completion: CompletionClosure?) {
        let session = URLSession.shared
        let request = UserJSONURLRequest.updateProfileRequest(username: username, emailAddress: emailAddress, firstname: firstname, lastname: lastname, dateOfBirth: dateOfBirth) as URLRequest
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
    
    // MARK: - Password
    
    class func requestForgottenPasswordEmailToBeSent(emailAddress: String, completion: CompletionClosure?) {
        let session = URLSession.shared
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest(emailAddress: emailAddress) as URLRequest
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
    
    // MARK: - Block
    
    class func blockUser(userID: String, completion: CompletionClosure?) {
        let session = URLSession.shared
        let request = UserJSONURLRequest.blockUserRequest(userID: userID) as URLRequest
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
    
    class func unblockUser(userID: String, completion: CompletionClosure?) {
        let session = URLSession.shared
        let request = UserJSONURLRequest.unblockUserRequest(userID: userID) as URLRequest
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
}
