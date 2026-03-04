//
//  StubURLRequestBuilding.swift
//  MakingRequests-ExampleTests
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

@testable import MakingRequests_Example

final class StubURLRequestBuilding: URLRequestBuilding {
    enum Event: Equatable {
        case path(String)
        case method(HTTPMethod)
        case body(Data)
        case queryItems([URLQueryItem])
        case header(String, String)
        case headers([String: String])
        case cachePolicy(URLRequest.CachePolicy)
        case timeoutInterval(TimeInterval)
        case build
    }
    
    private(set) var events = [Event]()
    
    var urlRequestToReturn: URLRequest!
    
    func path(_ path: String) -> Self {
        events.append(.path(path))
        
        return self
    }
    
    func method(_ method: MakingRequests_Example.HTTPMethod) -> Self {
        events.append(.method(method))
        
        return self
    }
    
    func body<T: Encodable>(_ body: T) -> Self {
        let data = try! JSONEncoder().encode(body)
        events.append(.body(data))
            
        return self
    }
    
    func queryItems(_ queryItems: [URLQueryItem]) -> Self {
        events.append(.queryItems(queryItems))
        
        return self
    }
    
    func header(key: String, value: String) -> Self {
        events.append(.header(key, value))
        
        return self
    }
    
    func headers(_ headers: [String: String]) -> Self {
        events.append(.headers(headers))
        
        return self
    }
    
    func cachePolicy(_ cachePolicy: URLRequest.CachePolicy) -> Self {
        events.append(.cachePolicy(cachePolicy))
        
        return self
    }
    
    func timeoutInterval(_ timeoutInterval: TimeInterval) -> Self {
        events.append(.timeoutInterval(timeoutInterval))
        
        return self
    }
    
    func build() throws -> URLRequest {
        events.append(.build)
        
        return urlRequestToReturn
    }
}
