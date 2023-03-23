//
//  RestrictedStackTests.swift
//  
//
//  Created by Алексей Филиппов on 23.02.2023.
//

// Apple
import XCTest
// SPM
import SupportCode

final class RestrictedStackTests: XCTestCase {
    // MARK: - Tests
    func testThatRestrictedStackCreatedNonEmpty() {
        // Given
        let example = Example()
        // When
        let restrictedStack = RestrictedStack(initialState: example, maxCount: 5)
        // Then
        XCTAssertTrue(restrictedStack.storage.count == 1)
        XCTAssertFalse(restrictedStack.hasPreviousState)
        XCTAssertFalse(restrictedStack.hasNextState)
    }
    
    func testThatRestrictedStackCreatedEmpty() {
        // Given
        // When
        let restrictedStack = RestrictedStack<Example>(initialState: nil, maxCount: 5)
        // Then
        XCTAssertTrue(restrictedStack.storage.count == 0)
        XCTAssertFalse(restrictedStack.hasPreviousState)
        XCTAssertFalse(restrictedStack.hasNextState)
    }
    
    func testThatRestrictedStackCreatedWithArrayCorrectly() {
        // Given
        let array = [Example(), Example(), Example()]
        // When
        let restrictedStack = RestrictedStack(stored: array, maxCount: 5)
        // Then
        XCTAssertTrue(restrictedStack.storage.count == array.count)
        XCTAssertTrue(restrictedStack.hasPreviousState)
        XCTAssertFalse(restrictedStack.hasNextState)
    }
    
    func testThatRestrictedStackDoesNotObtainPreviousState() {
        // Given
        var restrictedStack = RestrictedStack<Example>(initialState: nil, maxCount: 5)
        // When
        let previousState = restrictedStack.obtainPreviousState()
        // Then
        XCTAssertNil(previousState)
    }
    
    func testThatRestrictedStackObtainPreviousState() {
        // Given
        let ex = Example()
        let array = [Example(), Example(), ex, Example()]
        var restrictedStack = RestrictedStack(stored: array, maxCount: 5)
        // When
        let previousState = restrictedStack.obtainPreviousState()
        // Then
        XCTAssertNotNil(previousState)
        XCTAssertEqual(ex.identifier, previousState?.identifier)
    }
    
    func testThatRestrictedStackObtainNextState() {
        // Given
        let ex = Example()
        let array = [Example(), Example(), Example(), ex]
        var restrictedStack = RestrictedStack(stored: array, maxCount: 5)
        _ = restrictedStack.obtainPreviousState()
        // When
        let nextState = restrictedStack.obtainNextState()
        // Then
        XCTAssertNotNil(nextState)
        XCTAssertEqual(ex.identifier, nextState?.identifier)
    }
    
    // MARK: - Subtypes
    struct Example {
        let identifier = UUID().uuidString
        
    }
}
