//
//  UserRequestFactory.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct UserRequestFactory {
    private let urlBuilderFactory: URLRequestBuildingFactory
    
    // MARK: - Init
    
    init(urlBuilderFactory: URLRequestBuildingFactory = URLRequestBuilderFactory()) {
        self.urlBuilderFactory = urlBuilderFactory
    }
    
    // MARK: - Requests
    
    func createUserGETRequest() throws -> URLRequest {
        return try urlBuilderFactory.createBuilder()
            .path("/v3/user")
            .method(.GET)
            .build()
    }
    
    func createUserPOSTRequest(body: some Encodable) throws -> URLRequest {
        return try urlBuilderFactory.createBuilder()
            .path("/v3/user")
            .method(.POST)
            .body(body)
            .build()
    }
}
