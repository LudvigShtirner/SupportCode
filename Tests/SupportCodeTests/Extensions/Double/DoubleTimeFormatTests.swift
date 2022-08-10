//
//  DoubleTimeFormatTests.swift
//  SupportCodeTests
//
//  Created by Филиппов Алексей on 12.05.2022.
//

import XCTest

class DoubleTimeFormatTests: XCTestCase {
    // MARK: - Overrides
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Tests
    func testThatDurationConvertedToTimeFormatWithoutHours() {
        // Given
        let duration = 363.0
        // When
        let timeFormat = duration.timeFormat()
        // Then
        XCTAssertEqual(timeFormat, "06:03")
    }
    
    func testThatDurationConvertedToTimeFormatWithHours() {
        // Given
        let duration = 3963.0
        // When
        let timeFormat = duration.timeFormat()
        // Then
        XCTAssertEqual(timeFormat, "01:06:03")
    }
}
