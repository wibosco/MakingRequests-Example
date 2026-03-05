//
//  URLRequestBuilderTests.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest
import Foundation

@testable import MakingRequests_Example

class URLRequestBuilderTests: XCTestCase {
    // MARK: - Tests
    
    func test_givenAValidConfiguration_andNoFurtherChangesAreMade_whenRequestIsBuilt_thenDefaultsAreUsed() throws {
        let configuration = StubConfiguration(urlComponents: URLComponents(string: "http://williamboles.com/making-a-request-with-a-side-of-testing/")!,
                                              headers: ["header_A": "value_A", "header_B": "value_B"],
                                              cachePolicy: .reloadIgnoringCacheData,
                                              timeoutInterval: 150)
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut.build()
        
        XCTAssertEqual(request.url?.absoluteString, "http://williamboles.com/making-a-request-with-a-side-of-testing/")
        XCTAssertEqual(request.allHTTPHeaderFields, ["header_A": "value_A", "header_B": "value_B"])
        XCTAssertEqual(request.cachePolicy, .reloadIgnoringCacheData)
        XCTAssertEqual(request.timeoutInterval, 150)
    }
    
    func test_givenAValidConfiguration_andPathIsChanged_whenRequestIsBuilt_thenPathIsChanged() throws {
        let configuration = StubConfiguration(urlComponents: URLComponents(string: "http://williamboles.com/making-a-request-with-a-side-of-testing/")!)
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .path("/v4/test_path/")
            .build()
        
        XCTAssertEqual(request.url?.absoluteString, "http://williamboles.com/v4/test_path/")
    }
    
    func test_givenAValidConfiguration_andNewHeaderIsAdded_whenRequestIsBuilt_thenNewHeaderIsPresent() throws {
        let configuration = StubConfiguration(headers: ["header_A": "value_A", "header_B": "value_B"])
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .header(key: "header_C", value: "value_C")
            .build()
        
        XCTAssertEqual(request.allHTTPHeaderFields, ["header_A": "value_A", "header_B": "value_B", "header_C": "value_C"])
    }
    
    func test_givenAValidConfiguration_andExistingHeaderIsAdded_whenRequestIsBuilt_thenExistingHeaderIsOverriddenWithNewValue() throws {
        let configuration = StubConfiguration(headers: ["header_A": "value_A", "header_B": "value_B"])
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .header(key: "header_A", value: "value_C")
            .build()
        
        XCTAssertEqual(request.allHTTPHeaderFields, ["header_A": "value_C", "header_B": "value_B"])
    }
    
    func test_givenAValidConfiguration_andMultipleNewHeadersAreAdded_whenRequestIsBuilt_thenNewHeadersArePresent() throws {
        let configuration = StubConfiguration(headers: ["header_A": "value_A", "header_B": "value_B"])
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .headers(["header_C": "value_C", "header_D": "value_D"])
            .build()
        
        XCTAssertEqual(request.allHTTPHeaderFields, ["header_A": "value_A", "header_B": "value_B", "header_C": "value_C", "header_D": "value_D"])
    }
    
    func test_givenAValidConfiguration_andNewHeadersContainsExistingHeader_whenRequestIsBuilt_thenExistingHeaderIsOverriddenWithNewValue() throws {
        let configuration = StubConfiguration(headers: ["header_A": "value_A", "header_B": "value_B"])
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .headers(["header_A": "value_A", "header_B": "value_C"])
            .build()
        
        XCTAssertEqual(request.allHTTPHeaderFields, ["header_A": "value_A", "header_B": "value_C"])
    }
    
    func test_givenAValidConfiguration_andCachePolicyIsUpdated_whenRequestIsBuilt_thenNewCachePolicyIsUsed() throws {
        let configuration = StubConfiguration(cachePolicy: .reloadIgnoringCacheData)
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .cachePolicy(.reloadIgnoringLocalAndRemoteCacheData)
            .build()
        
        XCTAssertEqual(request.cachePolicy, .reloadIgnoringLocalAndRemoteCacheData)
    }
    
    func test_givenAValidConfiguration_andTimeoutIntervalIsUpdated_whenRequestIsBuilt_thenNewTimeoutIntervalIsUsed() throws {
        let configuration = StubConfiguration(timeoutInterval: 150)
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .timeoutInterval(2000)
            .build()
        
        XCTAssertEqual(request.timeoutInterval, 2000)
    }
    
    func test_givenAValidConfiguration_andQueryItemsAreAdded_whenRequestIsBuilt_thenQueryItemsAreUsed() throws {
        let configuration = StubConfiguration()
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .queryItems([URLQueryItem(name: "item_A", value: "value_A"), URLQueryItem(name: "item_B", value: "value_B")])
            .build()
        
        XCTAssertEqual(request.url?.absoluteString, "http://williamboles.com/making-a-request-with-a-side-of-testing/?item_A=value_A&item_B=value_B")
    }
    
    func test_givenAValidConfiguration_andBodyIsAdded_whenRequestIsBuilt_thenBodyIsUsed() throws {
        let configuration = StubConfiguration()
        let sut = URLRequestBuilder(configuration: configuration)
        
        let request = try sut
            .body(TestValidCodable())
            .build()
        
        XCTAssertEqual(request.httpBody, try JSONEncoder().encode(TestValidCodable()))
    }
    
    func test_givenAnInvalidPath_whenRequestIsBuilt_thenAnErrorIsThrown() throws {
        let configuration = StubConfiguration()
        let sut = URLRequestBuilder(configuration: configuration)

        XCTAssertThrowsError(try sut
            .path("@_invalidPath_@")
            .build())
        { error in
            guard case .urlInvalid = error as? URLRequestBuildingError else {
                XCTFail("Expected urlInvalid, got \(error)")
                return
            }
        }
    }
    
    func test_givenAnInvalidBody_whenRequestIsBuilt_thenAnErrorIsThrown() throws {
        let configuration = StubConfiguration()
        let sut = URLRequestBuilder(configuration: configuration)

        XCTAssertThrowsError(try sut
            .body(TestInvalidCodable())
            .build())
        { error in
            guard case .bodyEncodingFailed = error as? URLRequestBuildingError else {
                XCTFail("Expected bodyEncodingFailed, got \(error)")
                return
            }
        }
    }
}
