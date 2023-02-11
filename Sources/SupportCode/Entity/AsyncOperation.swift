//
//  AsyncOperation.swift
//  
//
//  Created by Алексей Филиппов on 17.01.2023.
//

// Apple
import Foundation

/**
 Basic async operation
 
 > Important:
 Detach new thread while executed.
 
 > Warning:
 You must call completeOperation at end
 
 - RU:
 
 Базовая асинхронная операция
 > Important:
 Создает новый поток при вызове
 
 > Warning:
 Обязательно вызвать completeOperation по завершению операции
 
 --------------------------------Code--------------------------------
 ```
 final class SomeOperation: AsyncOperation {
    override func main() {
        // Do something
    }
 }
 ```
*/
class AsyncOperation: Operation {
    // MARK: - Info
    /// Internal execute state of operation. Used for manual management of operation
    private var _executing: Bool = false {
        willSet { willChangeValue(forKey: "isExecuting") }
        didSet { didChangeValue(forKey: "isExecuting") }
    }
    /// Internal finish state of operation. Used for manual management of operation
    private var _finished: Bool = false {
        willSet { willChangeValue(forKey: "isFinished") }
        didSet { didChangeValue(forKey: "isFinished") }
    }
    
    // MARK: - Overrides
    override var isExecuting: Bool { _executing }
    override var isFinished: Bool { _finished }
    override var isAsynchronous: Bool { true }
    
    override func start() {
        if isCancelled {
            _finished = true
            return
        }
        _executing = true
        Thread.detachNewThreadSelector(#selector(main),
                                       toTarget: self,
                                       with: nil)
    }
    
    // MARK: - Interface methods
    func completeOperation() {
        _executing = false
        _finished = true
    }
}
