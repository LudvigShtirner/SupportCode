//
//  CGFloatUIGridTests.swift
//  SupportCodeTests
//
//  Created by Филиппов Алексей on 11.05.2022.
//

import XCTest

class CGFloatUIGridTests: XCTestCase {
    // MARK: - Tests
    func testThatValueCut() {
        // Given
        let value = CGFloat(5.2)
        // When
        let result = value.toPixelGrid(scale: 2.0)
        // Then
        XCTAssertEqual(result, 5.0)
    }
    
    func testThatValueExpanded() {
        // Given
        let value = CGFloat(5.2)
        // When
        let result = value.toPixelGrid(scale: 3.0)
        // Then
        XCTAssertEqual(result, 16.0 / 3.0)
    }
    
    func testThatValueWasNotChanged() {
        // Given
        let value = CGFloat(5.2)
        // When
        let result = value.toPixelGrid(scale: 5.0)
        // Then
        XCTAssertEqual(result, 5.2)
    }
}
