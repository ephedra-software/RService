import Foundation

// MARK: - GET Wrapper

@propertyWrapper
public struct GET<Request, Endpoint, Output> where Request: RequestProtocol, Request.Output == Output, Request.Endpoint == Endpoint {
    public let httpMethod: String = "GET"
    public let urlMask: String
    public let session: URLSession
    public let decoder: JSONDecoder

    public var wrappedValue: Request {
        Request(httpMethod: httpMethod, urlMask: urlMask, session: session, decoder: decoder)
    }
    
    public init(_ urlMask: String, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.urlMask = urlMask
        self.session = session
        self.decoder = decoder
    }
    
    public init(_ baseUrl: String, _ urlMask: String, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.urlMask = baseUrl.dropLastSlash() + "/" + urlMask.dropFirstSlash()
        self.session = session
        self.decoder = decoder
    }
    
    public init(_ baseUrl: URL, _ urlMask: String, session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.urlMask = baseUrl.absoluteString.dropLastSlash() + "/" + urlMask.dropFirstSlash()
        self.session = session
        self.decoder = decoder
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
