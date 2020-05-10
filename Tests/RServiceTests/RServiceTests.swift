import XCTest
import Combine
@testable import RService

final class RServiceTests: XCTestCase, HTTPServiceProtocol {
    let testUrlString = "https://postman-echo.com/time/valid?timestamp=2016-10-10"
    
    fileprivate struct PostmanEchoTimeStampCheckResponse: Decodable {
        let valid: Bool
    }
    fileprivate struct TestService {
        @GET("https://postman-echo.com/time/valid?timestamp=2016-10-10")
        var request: JustRequest<PostmanEchoTimeStampCheckResponse>
    }
    
    fileprivate var testService: TestService!
    
    override func setUp() {
        self.testService = TestService()
    }
    
    func testExample() {
        // setup
        let expectation = XCTestExpectation(description: "Download from \(testService.request.httpMethod) \(testService.request.urlMask)")
        let publisher = testService.request()
            // validates
            .sink(receiveCompletion: { completion in
                print(".sink() received the completion", String(describing: completion))
                switch completion {
                case .finished:
                    expectation.fulfill()
                case let .failure(error):
                    guard let urlError = error as? URLError else {
                        XCTFail("Unable to parse response an URLError")
                        return
                    }
                    XCTFail(".sink() httpError received \(urlError.code.rawValue)")
                }
            }) { data in
                XCTAssertNotNil(data)
                print(".sink() data received \(data)")
            }
        
        XCTAssertNotNil(publisher)
        wait(for: [expectation], timeout: 5.0)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
