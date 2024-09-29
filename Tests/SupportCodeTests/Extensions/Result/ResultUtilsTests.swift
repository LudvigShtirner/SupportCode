//
//  ResultUtilsTests.swift
//
//
//  Created by Алексей Филиппов on 29.09.2024.
//

// SPM
import SupportCode
// Apple
import XCTest

final class ResultUtilsTests: XCTestCase {
    func test_result_providerValue() {
        // Given
        let value = Result<Int, Error>.success(5)
        let value2: Result<Void, Error> = .success
        var flag = false
        // When
        let result = value.value
        if case .success = value2 {
            flag = true
        }
        // Then
        XCTAssertEqual(result, 5)
        XCTAssertTrue(flag)
    }
}
