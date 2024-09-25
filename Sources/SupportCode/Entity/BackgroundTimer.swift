//
//  BackgroundTimer.swift
//
//
//  Created by Алексей Филиппов on 18.08.2024.
//

// Apple
import Foundation

public class BackgroundTimer {
    private enum State {
        case suspended
        case resumed
    }
    
    private lazy var timer: DispatchSourceTimer = {
        let timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: .now() + self.timeInterval,
                       repeating: self.timeInterval)
        timer.setEventHandler(handler: { [weak self] in
            self?.eventHandler()
        })
        return timer
    }()
    
    private var state = State.suspended
    private let timeInterval: TimeInterval
    private let eventHandler: VoidBlock
    
    public init(timeInterval: TimeInterval,
                eventHandler: @escaping VoidBlock) {
        self.timeInterval = timeInterval
        self.eventHandler = eventHandler
    }
    
    deinit {
        timer.setEventHandler {}
        timer.cancel()
        resume()
    }
    
    public func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.resume()
    }
    
    public func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
    }
}
