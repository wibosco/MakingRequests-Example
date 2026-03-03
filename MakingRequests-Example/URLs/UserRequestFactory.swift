//
//  UserRequestFactory.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

final class UserRequestFactory {
    private let urlBuilderFactory: URLBuildingFactory
    
    // MARK: - Init
    
    init(urlBuilderFactory: URLBuildingFactory = URLBuilderFactory()) {
        self.urlBuilderFactory = urlBuilderFactory
    }
    
    func createUserGETRequest() throws -> URLRequest {
        let urlBuilder = urlBuilderFactory.createBuilder()
        
        return try urlBuilder
            .path("/v3/user")
            .method(.GET)
            .build()
    }
    
    func createUserPOSTRequest(body: Encodable) throws -> URLRequest {
        let urlBuilder = urlBuilderFactory.createBuilder()
        
        return try urlBuilder
            .path("/v3/user")
            .method(.POST)
            .body(body)
            .build()
    }
}
