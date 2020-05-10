//
//  HTTPRequests.swift
//  RService
//
//  Created by Erik Basargin on 10/05/2020.
//  Copyright © 2020 Ephedra Software. All rights reserved.
//

import Foundation
import Combine

public extension HTTP {
    
    typealias JustRequest<Output: Decodable> = Request<Never, Output>
    
}

public extension HTTP.JustRequest {
    func callAsFunction() -> Response {
        process(urlMask)
    }
}
