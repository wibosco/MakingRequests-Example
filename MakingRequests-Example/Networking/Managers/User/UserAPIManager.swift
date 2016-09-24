//
//  UserAPIManager.swift
//  MakingRequests-Example
//
//  Created by William Boles on 18/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class UserAPIManager: NSObject {

    typealias CompletionClosure = (successful: Bool) -> Void
    
    // MARK: - Profile
    
    class func retrieveProfile(completion: CompletionClosure?) {
        let session = NSURLSession.sharedSession()
        let request = UserJSONURLRequest.retrieveProfileRequest()
        
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                //Parse response
        }
        
        task.resume()
    }
    
    class func updateProfile(username: String, emailAddress: String, firstname: String, lastname: String, dateOfBirth: NSDate, completion: CompletionClosure?) {
        let session = NSURLSession.sharedSession()
        let request = UserJSONURLRequest.updateProfileRequest(username, emailAddress: emailAddress, firstname: firstname, lastname: lastname, dateOfBirth: dateOfBirth)
        
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
    
    // MARK: - Password
    
    class func requestForgottenPasswordEmailToBeSent(emailAddress: String, completion: CompletionClosure?) {
        let session = NSURLSession.sharedSession()
        let request = UserJSONURLRequest.forgottenPasswordEmailToBeSentRequest(emailAddress)
        
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
    
    // MARK: - Block
    
    class func blockUser(userID: String, completion: CompletionClosure?) {
        let session = NSURLSession.sharedSession()
        let request = UserJSONURLRequest.blockUserRequest(userID)
        
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
    
    class func unblockUser(userID: String, completion: CompletionClosure?) {
        let session = NSURLSession.sharedSession()
        let request = UserJSONURLRequest.unblockUserRequest(userID)
        
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //Parse response
        }
        
        task.resume()
    }
}
