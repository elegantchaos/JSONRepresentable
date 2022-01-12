// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 12/01/2022.
//  All code (c) 2022 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
import XCTestExtensions

@testable import JSONRepresentable

final class JSONRepresentableTests: XCTestCase {
    func testJSONTypes() {
        let array: JSONArray = [1]
        let dictionary: JSONDictionary = ["foo": "bar"]

        let tests: [Any] = ["test", 123, 123.456, true, array, dictionary]
        for item in tests {
            XCTAssertTrue(item is JSONType)
        }
    }
    
    func testDates() {
        let converted = Date().asJSONType
        XCTAssertTrue(converted is String)
    }
}
