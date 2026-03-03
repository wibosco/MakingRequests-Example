//
//  EnvironmentConfiguration.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

enum Environment {
    case development
    case staging
    case production
    
    static var current: Environment {
        #if RELEASE
        return .production
        #elseif STAGING
        return .staging
        #else
        return .development
        #endif
    }
}
