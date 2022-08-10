//
//  StringUtilsTests.swift
//  SupportCodeTests
//
//  Created by Филиппов Алексей on 16.05.2022.
//

import XCTest

class StringUtilsTests: XCTestCase {
    // MARK: - Data
    let string = "Metallica - The Unforgiven II.mp3"
    
    // MARK: - Tests
    func testThatSubscriptReturnCorrectCharacter() {
        // Given
        // When
        let character = string[10]
        // Then
        XCTAssertEqual(character, "-")
    }
    
    func testThatSubscriptDoesNotReturnCharacterWhenOutOfBounds() {
        // Given
        // When
        let character = string[33]
        // Then
        XCTAssertNil(character)
    }
    
    func testThatSubscriptReturnsSubstring() {
        // Given
        // When
        let substring = string[10 ..< 30]
        // Then
        XCTAssertEqual(substring, "- The Unforgiven II.")
    }
    
    func testThatSubscriptHandleRangeUpperValueMoreThanLength() {
        // Given
        // When
        let substring = string[10 ..< 40]
        // Then
        XCTAssertEqual(substring, "- The Unforgiven II.mp3")
    }
}
