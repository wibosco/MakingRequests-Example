//
//  UserRequestFactory.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
}

struct UserRequestFactory {
    private let urlRequestBuilderFactory: URLRequestBuildingFactory
    
    // MARK: - Init
    
    init(urlBuilderFactory: URLRequestBuildingFactory = URLRequestBuilderFactory()) {
        self.urlRequestBuilderFactory = urlBuilderFactory
    }
    
    // MARK: - Requests
    
    func createUserGETRequest() throws -> URLRequest {
        return try urlRequestBuilderFactory.createBuilder()
            .path("/v3/user")
            .method(.GET)
            .build()
    }
    
    func createUserPOSTRequest(user: User) throws -> URLRequest {
        let body = try JSONEncoder().encode(user)
        
        return try urlRequestBuilderFactory.createBuilder()
            .path("/v3/user")
            .method(.POST)
            .body(body)
            .build()
    }
    
    func createUserFeedGETRequest(userID: String, ascending: Bool) throws -> URLRequest {
        let queryItems = [URLQueryItem(name: "order", value: ascending ? "ascending" : "descending")]
        
        return try urlRequestBuilderFactory.createBuilder()
            .path("/v3/user/\(userID)/feed")
            .method(.GET)
            .queryItems(queryItems)
            .build()
    }
}
