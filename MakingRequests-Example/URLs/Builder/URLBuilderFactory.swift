//
//  URLBuilderFactory.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

protocol URLBuildingFactory {
    func createBuilder(for environment: Environment) -> URLRequestBuilder
}

extension URLBuildingFactory {
    func createBuilder() -> URLRequestBuilder {
        createBuilder(for: .current)
    }
}

struct URLBuilderFactory: URLBuildingFactory {
    func createBuilder(for environment: Environment = .current) -> URLRequestBuilder {
        switch environment {
        case .development:
            return URLRequestBuilder(configuration: DevelopmentEnvironmentConfiguration())
        case .staging:
            return URLRequestBuilder(configuration: StagingEnvironmentConfiguration())
        case .production:
            return URLRequestBuilder(configuration: ProductionEnvironmentConfiguration())
        }
    }
}
