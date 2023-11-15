//
//  AsyncOperationTests.swift
//  
//
//  Created by Алексей Филиппов on 24.02.2023.
//

// SPM
import SupportCode
// Apple
import XCTest

final class AsyncOperationTests: XCTestCase {
    // MARK: - Data
    private let operationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = .userInteractive
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    private var cancelExpectation: XCTestExpectation?
    
    // MARK: - Tests
    func testThatAsyncOperationReleased() {
        // Given
        let expectation = XCTestExpectation()
        let operation = ExampleAsyncOperation {
            expectation.fulfill()
        }
        // When
        operationQueue.addOperation(operation)
        // Then
        XCTAssertTrue(operation.isAsynchronous)
        wait(for: [expectation], timeout: 1.5)
    }
    
    func testThatAsyncOperationCancelled() {
        // Given
        cancelExpectation = XCTestExpectation()
        let operation = ExampleAsyncOperation(completion: {
            
        })
        operation.addObserver(self, forKeyPath: "isFinished", context: nil)
        // When
        operation.cancel()
        operationQueue.addOperation(operation)
        // Then
        XCTAssertTrue(operation.isAsynchronous)
        wait(for: [cancelExpectation!], timeout: 0.2)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let operation = object as? ExampleAsyncOperation else {
            return
        }
        if operation.isFinished && operation.isCancelled {
            cancelExpectation?.fulfill()
        }
    }
    
    // MARK: - Subtypes
    final class ExampleAsyncOperation: AsyncOperation {
        // MARK: - Data
        private let progressTimer = ProgressTimer(updateStep: 0.05, finishTime: 1)
        private let completion: VoidBlock
        
        // MARK: - Inits
        init(completion: @escaping VoidBlock) {
            self.completion = completion
        }
        
        // MARK: - AsyncOperation
        override func main() {
            progressTimer.configureAndStart { [weak self] progress in
                if progress >= 1.0 {
                    self?.completion()
                    self?.completeOperation()
                }
            }
        }
    }
}
