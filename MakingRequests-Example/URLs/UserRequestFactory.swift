//
//  UserRequestFactory.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

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
    
    func createUserPOSTRequest<T: Encodable>(body: T) throws -> URLRequest {
        return try urlRequestBuilderFactory.createBuilder()
            .path("/v3/user")
            .method(.POST)
            .body(body)
            .build()
    }
}
