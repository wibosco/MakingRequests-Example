//
//  StubURLBuildingFactory.swift
//  MakingRequests-ExampleTests
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

@testable import MakingRequests_Example

final class StubURLRequestBuildingFactory: URLRequestBuildingFactory {
    enum Event: Equatable {
        case createBuilder(Environment)
    }
    
    private(set) var events = [Event]()
    
    var urlBuilderToReturn: URLRequestBuilder!
    
    func createBuilder(for environment: Environment) -> URLRequestBuilder {
        events.append(.createBuilder(environment))
        
        return urlBuilderToReturn
    }
}
