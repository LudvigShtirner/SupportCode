//
//  CGFloatUIGridTests.swift
//  SupportCodeTests
//
//  Created by Алексей Филиппов on 04.09.2021.
//

// Apple
import XCTest

final class CGFloatUIGridTests: XCTestCase {
    // MARK: - Overrides
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Tests
    func testThatConvertTo2xCorrectlyWhenNoAfterDotPart() {
        // Given
        let sourceValue: CGFloat = 6.0
        let screenScale: CGFloat = 2.0
        // When
        let finalValue = sourceValue.convertToScreenGrid(scale: screenScale)
        // Then
        XCTAssertEqual(finalValue, 6.0)
    }
    
    func testThatConvertTo2xCorrectlyWhenHasAfterDotPartToBigger() {
        // Given
        let sourceValue: CGFloat = 4.8
        let screenScale: CGFloat = 2.0
        // When
        let finalValue = sourceValue.convertToScreenGrid(scale: screenScale)
        // Then
        XCTAssertEqual(finalValue, 5.0)
    }
    
    func testThatConvertTo2xCorrectlyWhenHasAfterDotPartToLess() {
        // Given
        let sourceValue: CGFloat = 4.6
        let screenScale: CGFloat = 2.0
        // When
        let finalValue = sourceValue.convertToScreenGrid(scale: screenScale)
        // Then
        XCTAssertEqual(finalValue, 4.5)
    }
}
