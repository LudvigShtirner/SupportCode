//
//  RestrictedPropertyWrapperTests.swift
//  SupportCodeTests
//
//  Created by Филиппов Алексей on 16.05.2022.
//

import XCTest

@testable import SupportCode

class RestrictedPropertyWrapperTests: XCTestCase {
    // MARK: - Tests
    func testThatInitialValueInsideBounds() {
        // Given
        // When
        @Restricted(0 ... 100) var wrapper = 103
        @Restricted(20 ... 80) var example = 11
        // Then
        XCTAssertEqual(wrapper, 100)
        XCTAssertEqual(example, 20)
    }
    
    func testThatValueInsideBoundsAfterChange() {
        // Given
        @Restricted(20 ... 80) var example = 87
        // When
        example = 0
        // Then
        XCTAssertEqual(example, 20)
    }
    
    func testThatValueDoesNotChangeWhenInBounds() {
        // Given
        @Restricted(20 ... 80) var example = 87
        // When
        example = 35
        // Then
        XCTAssertEqual(example, 35)
    }
}
