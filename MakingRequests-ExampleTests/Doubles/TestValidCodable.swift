//
//  TestEncodable.swift
//  MakingRequests-ExampleTests
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct TestValidCodable: Codable, Equatable {
    let a: String
    
    init(a: String = "test_a") {
        self.a = a
    }
}
