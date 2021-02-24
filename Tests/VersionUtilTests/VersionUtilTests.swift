import XCTest
@testable import VersionUtil

final class VersionUtilTests: XCTestCase {

    func testUInt32Version() {
        let f = VersionUtil.uint32Formatter
        XCTAssertEqual(0xff131415, f.uint32Version("255.19.20.21"))
        XCTAssertEqual("255.19.20.21", f.stringVersion(0xff131415))
    }

    static var allTests = [
        ("testExample", testUInt32Version),
    ]
}
