//
//  URLRequestBuilder.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

enum HTTPMethod: String, Equatable {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}

protocol URLRequestBuilding {
    func path(_ path: String) -> Self
    func method(_ method: HTTPMethod) -> Self
    func body(_ body: Encodable) -> Self
    func queryItems(_ queryItems: [URLQueryItem]) -> Self
    func header(key: String, value: String) -> Self
    func headers(_ headers: [String: String]) -> Self
    func cachePolicy(_ cachePolicy: URLRequest.CachePolicy) -> Self
    func timeoutInterval(_ timeoutInterval: TimeInterval) -> Self
    func build() throws -> URLRequest
}

final class URLRequestBuilder: URLRequestBuilding {
    private var components: URLComponents
    private var method: HTTPMethod = .GET
    private var headers: [String: String]
    private var body: Encodable?
    private var cachePolicy: URLRequest.CachePolicy
    private var timeoutInterval: TimeInterval
    
    // MARK: - Init
    
    init(configuration: EnvironmentConfiguration) {
        self.components = configuration.urlComponents
        self.headers = configuration.headers
        self.cachePolicy = configuration.cachePolicy
        self.timeoutInterval = configuration.timeoutInterval
    }
    
    // MARK: - Parts
    
    func path(_ path: String) -> Self {
        components.path = path
        
        return self
    }
    
    func method(_ method: HTTPMethod) -> Self {
        self.method = method
        
        return self
    }
    
    func body(_ body: Encodable) -> Self {
        self.body = body
        
        return self
    }
    
    func queryItems(_ queryItems: [URLQueryItem]) -> Self {
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        return self
    }
    
    func header(key: String, value: String) -> Self {
        headers[key] = value
        return self
    }
    
    func headers(_ headers: [String: String]) -> Self {
        self.headers.merge(headers) { _, new in new }
        
        return self
    }

    func cachePolicy(_ cachePolicy: URLRequest.CachePolicy) -> Self {
        self.cachePolicy = cachePolicy
        
        return self
    }
    
    func timeoutInterval(_ timeoutInterval: TimeInterval) -> Self {
        self.timeoutInterval = timeoutInterval
        
        return self
    }
    
    // MARK: - Build
    
    func build() throws -> URLRequest {
        guard let url = components.url else {
            throw URLBuildingError.urlInvalid
        }
        
        var request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        
        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw URLBuildingError.bodyEncodingFailed(error)
            }
        }
        
        return request
    }
}
