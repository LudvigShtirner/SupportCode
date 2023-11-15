//
//  ProgressTimer.swift
//
//
//  Created by Филиппов Алексей on 25.01.2023.
//

// Apple
import Foundation

public final class ProgressTimer: NSObject {
    // MARK: - Data
    private var timer: Timer?
    private let updateStep: TimeInterval
    private let finishTime: TimeInterval
    
    private var spentTime: TimeInterval = .zero
    private var shouldKeepRunning = false
    
    private var progressBlock: DoubleBlock?
    
    // MARK: - Inits
    public init(updateStep: TimeInterval,
                finishTime: TimeInterval) {
        self.updateStep = updateStep
        self.finishTime = finishTime
    }
    
    deinit {
        stop()
    }
    
    // MARK: - Interface methods
    public var isActive: Bool { timer != nil }
    
    public func configureAndStart(progressBlock: @escaping DoubleBlock) {
        self.progressBlock = progressBlock
        start()
    }
    
    public func invalidate() {
        stop()
        spentTime = .zero
        progressBlock = nil
    }
    
    // MARK: - Private methods
    private func start() {
        spentTime = .zero
        timer = Timer.scheduledTimer(timeInterval: updateStep,
                                     target: self,
                                     selector: #selector(updateSpentTime),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
        if Thread.isMainThread {
            return
        }
        shouldKeepRunning = true
        while shouldKeepRunning {
            RunLoop.current.run(until: Date().advanced(by: updateStep * 2))
        }
    }
    
    private func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Actions
    @objc private func updateSpentTime() {
        spentTime += updateStep
        var progress = spentTime / finishTime
        if progress >= 1.0 {
            shouldKeepRunning = false
            stop()
            progress = 1.0
        }
        progressBlock?(progress)
    }
}
