//
//  DispatchQueueUtilsTests.swift
//  
//
//  Created by Алексей Филиппов on 05.08.2022.
//

// Apple
import XCTest

final class DispatchQueueUtilsTests: XCTestCase {
    // MARK: - Tests
    func testThatCallFromMainThreadRemainsOnIt() {
        // Given
        var flag = false
        // When
        DispatchQueue.callOnMainQueue {
            flag = true
        }
        // Then
        XCTAssertTrue(flag)
    }
    
    func testThatCallFromAnotherThreadSwitchesToMain() {
        // Given
        var flag = false
        let expectation = XCTestExpectation()
        // When
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.callOnMainQueue {
                flag = true
                expectation.fulfill()
            }
        }
        // Then
        XCTAssertFalse(flag)
        wait(for: [expectation], timeout: 0.1)
        XCTAssertTrue(flag)
    }
}
