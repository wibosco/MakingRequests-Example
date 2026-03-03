//
//  TestInvalidCodable.swift
//  MakingRequests-ExampleTests
//
//  Created by William Boles on 04/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct TestInvalidCodable: Encodable {
    func encode(to encoder: Encoder) throws {
        throw NSError(domain: "TestError",
                      code: 1,
                      userInfo: [NSLocalizedDescriptionKey: "Intentional encoding failure"])
    }
}
