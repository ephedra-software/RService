import Foundation
import Combine

public protocol RequestProtocol {
    associatedtype Endpoint
    associatedtype Output: Decodable
    
    var httpMethod: String { get }
    var urlMask: String { get }
    var session: URLSession { get }
    var decoder: JSONDecoder { get }
    
    init(httpMethod: String, urlMask: String, session: URLSession, decoder: JSONDecoder)
    
    func process(_ request: URLRequest) -> AnyPublisher<Output, Error>
}
