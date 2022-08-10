//
//  ToggledTests.swift
//  
//
//  Created by Алексей Филиппов on 05.08.2022.
//

import XCTest

@testable import SupportCode

class ToggledTests: XCTestCase {
    // MARK: - Tests
    func testThatToggledCreatedCorrectly() {
        // Given
        // When
        @Toggled(50) var result = 10
        // Then
        XCTAssertEqual(result, 10)
    }
    
    func testThatToggledChangeValue() {
        // Given
        @Toggled(50) var result = 10
        // When
        _result.toggle()
        // Then
        XCTAssertEqual(result, 50)
    }
}
