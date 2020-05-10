//
//  HTTPServiceProtocol.swift
//  RService
//
//  Created by Erik Basargin on 10/05/2020.
//  Copyright © 2020 Ephedra Software. All rights reserved.
//

import Foundation

public protocol HTTPServiceProtocol {
    // MARK: - Wrappers
    
    typealias GET = HTTP.GET
    typealias POST = HTTP.POST
    typealias PUT = HTTP.PUT
    typealias PATCH = HTTP.PATCH
    typealias DELETE = HTTP.DELETE
    
    // MARK: - Requests
    
    typealias Request = HTTP.Request
    typealias JustRequest = HTTP.JustRequest
}
