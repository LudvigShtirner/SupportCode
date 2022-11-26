//
//  IdentifiableTests.swift
//  
//
//  Created by Алексей Филиппов on 11.11.2022.
//

import XCTest

@testable import SupportCode

final class IdentifiableTests: XCTestCase {
    // MARK: - Tests
    func testThatIdentifiableReturnsClassName() {
        // Given
        // When
        let identifier = MockClass.identifier
        // Then
        XCTAssertEqual(identifier, "MockClass")
    }
}

fileprivate final class MockClass: Identifiable {
    
}
