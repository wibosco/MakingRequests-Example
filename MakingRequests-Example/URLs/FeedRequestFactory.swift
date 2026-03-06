//
//  FeedRequestFactory.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct FeedRequestFactory {
    enum FeedOrder: String, Equatable {
        case ascending
        case descending
    }
    
    private let urlRequestBuilderFactory: URLRequestBuildingFactory
    
    // MARK: - Init
    
    init(urlRequestBuilderFactory: URLRequestBuildingFactory = URLRequestBuilderFactory()) {
        self.urlRequestBuilderFactory = urlRequestBuilderFactory
    }
    
    // MARK: - Requests
    
    func createFeedGetRequest(order: FeedOrder = .ascending) throws -> URLRequest {
        let queryItems = [
            URLQueryItem(name: "order", value: order.rawValue)
        ]
        
        return try urlRequestBuilderFactory.createBuilder()
            .path("/v2/feed")
            .method(.GET)
            .queryItems(queryItems)
            .build()
    }
}
