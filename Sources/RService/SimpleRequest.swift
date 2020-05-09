import Foundation
import Combine

public typealias SimpleRequest<Output: Decodable> = Request<Never, Output>
