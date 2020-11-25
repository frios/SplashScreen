import XCTest
@testable import SplashScreen

final class SplashScreenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SplashScreen().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
