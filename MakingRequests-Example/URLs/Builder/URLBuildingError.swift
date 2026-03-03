//
//  URLBuildingError.swift
//  MakingRequests-Example
//
//  Created by William Boles on 03/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

enum URLBuildingError: Error {
    case urlInvalid
    case bodyEncodingFailed(Error)
}
