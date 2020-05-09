import Foundation
import Combine

public class Request<Endpoint, Output>: RequestProtocol where Output: Decodable {
    public let httpMethod: String
    public let urlMask: String
    public let session: URLSession
    public let decoder: JSONDecoder
    
    required public init(httpMethod: String, urlMask: String, session: URLSession, decoder: JSONDecoder) {
        self.httpMethod = httpMethod
        self.urlMask = urlMask
        self.session = session
        self.decoder = decoder
    }
    
    public func process(_ urlString: String) -> AnyPublisher<Output, Error> {
        process(URL(string: urlString))
    }
    
    public func process(_ url: URL?) -> AnyPublisher<Output, Error> {
        guard let url = url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return process(URLRequest(url: url))
    }

    public func process(_ request: URLRequest) -> AnyPublisher<Output, Error> {
        var request = request
        request.httpMethod = httpMethod
        return dataTaskWorker(request)
    }
    
    func dataTaskWorker(_ request: URLRequest) -> AnyPublisher<Output, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap() { element in
                guard let httpResponse = element.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                guard (200...208).contains(httpResponse.statusCode) || httpResponse.statusCode == 226 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
        }
        .decode(type: Output.self, decoder: decoder)
        .eraseToAnyPublisher()
    }
}

