//
//  HTTPMethodWrappingProtocol.swift
//  RService
//
//  Created by Erik Basargin on 10/05/2020.
//  Copyright © 2020 Ephedra Software. All rights reserved.
//

import Foundation

public protocol HTTPMethodWrappingProtocol {
    init(_ urlMask: String, session: URLSession, decoder: JSONDecoder)
    init(_ baseUrl: String, _ urlMask: String, session: URLSession, decoder: JSONDecoder)
    init(_ baseUrl: URL, _ urlMask: String, session: URLSession, decoder: JSONDecoder)
}
