//
//  RequestProtocol.swift
//  RService
//
//  Created by Erik Basargin on 10/05/2020.
//  Copyright © 2020 Ephedra Software. All rights reserved.
//

import Foundation
import Combine

public protocol RequestProtocol {
    associatedtype Endpoint
    associatedtype Output
    
    var httpMethod: String { get }
    var urlMask: String { get }
    var session: URLSession { get }
    var decoder: JSONDecoder { get }
    
    init(httpMethod: String, urlMask: String, session: URLSession, decoder: JSONDecoder)
}
