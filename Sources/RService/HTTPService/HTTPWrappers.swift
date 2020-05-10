//
//  HTTPWrappers.swift
//  RService
//
//  Created by Erik Basargin on 10/05/2020.
//  Copyright © 2020 Ephedra Software. All rights reserved.
//

import Foundation

public extension HTTP {
    
    // MARK: - GET Wrapper
    
    @propertyWrapper
    final class GET<Request, Endpoint, Output>: MethodWrapping<Request, Endpoint, Output> where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
        public var wrappedValue: Request { request }
    }
    
    // MARK: - POST Wrapper
    
    @propertyWrapper
    final class POST<Request, Endpoint, Output>: MethodWrapping<Request, Endpoint, Output> where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
        public var wrappedValue: Request { request }
    }
    
    // MARK: - PUT Wrapper
    
    @propertyWrapper
    final class PUT<Request, Endpoint, Output>: MethodWrapping<Request, Endpoint, Output> where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
        public var wrappedValue: Request { request }
    }
    
    // MARK: - PATCH Wrapper
    
    @propertyWrapper
    final class PATCH<Request, Endpoint, Output>: MethodWrapping<Request, Endpoint, Output> where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
        public var wrappedValue: Request { request }
    }
    
    // MARK: - DELETE Wrapper
    
    @propertyWrapper
    final class DELETE<Request, Endpoint, Output>: MethodWrapping<Request, Endpoint, Output> where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
        public var wrappedValue: Request { request }
    }
    
}
