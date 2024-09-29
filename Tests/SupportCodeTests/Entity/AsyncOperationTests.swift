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
import Combine

final class AsyncOperationTests: XCTestCase {
    // MARK: - Data
    private let operationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = QualityOfService.userInteractive
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
        let operation = ExampleAsyncOperation(completion: nil)
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
        let operation = object as! ExampleAsyncOperation
        if operation.isFinished && operation.isCancelled {
            cancelExpectation?.fulfill()
        }
    }
    
    // MARK: - Subtypes
    final class ExampleAsyncOperation: AsyncOperation {
        // MARK: - Data
        private let progressTimer = ProgressTimer()
        private let completion: VoidBlock?
        private var cancellables = Set<AnyCancellable>()
        
        // MARK: - Inits
        init(completion: VoidBlock?) {
            self.completion = completion
        }
        
        // MARK: - AsyncOperation
        override func main() {
            progressTimer.start(updateStep: 0.05,
                                finishTime: 1) { [weak self] notifier in
                notifier.sink { progress in
                    if progress.isAlmostEqual(to: 1, error: 0.001) {
                        self?.completion?()
                        self?.completeOperation()
                    }
                }
                .store(in: &self!.cancellables)
            }
        }
    }
}
