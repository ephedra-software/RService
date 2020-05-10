//
//  HTTPMethodWrapping.swift
//  RService
//
//  Created by Erik Basargin on 10/05/2020.
//  Copyright © 2020 Ephedra Software. All rights reserved.
//

import Foundation

public extension HTTP {
    
    class MethodWrapping<Request, Endpoint, Output>: HTTPMethodWrappingProtocol where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
        @Lazy internal var request: Request!
        
        internal lazy var method: String = {
            let typeName = "\(type(of: self))"
            guard let objectName = typeName.split(separator: "<").first else {
                return typeName
            }
            return String(objectName)
        }()
        
        required public init(_ urlMask: String, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
            request = Request(httpMethod: method, urlMask: urlMask, session: session, decoder: decoder)
        }
        
        required public init(_ baseUrl: String, _ urlMask: String, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
            let urlString = baseUrl.dropLastSlash() + "/" + urlMask.dropFirstSlash()
            request = Request(httpMethod: method, urlMask: urlString, session: session, decoder: decoder)
        }
        
        required public init(_ baseUrl: URL, _ urlMask: String, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
            let urlString = baseUrl.absoluteString.dropLastSlash() + "/" + urlMask.dropFirstSlash()
            request = Request(httpMethod: method, urlMask: urlString, session: session, decoder: decoder)
        }
    }
    
}

// MARK: - Extensions

fileprivate extension String {
    func dropFirstSlash() -> Self {
        self.first == "/" ? String(self.dropFirst()) : self
    }
    func dropLastSlash() -> Self {
        self.last == "/" ? String(self.dropLast()) : self
    }
}
