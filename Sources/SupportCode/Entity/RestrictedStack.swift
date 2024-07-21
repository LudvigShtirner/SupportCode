//
//  RestrictedStack.swift
//  
//
//  Created by Алексей Филиппов on 16.01.2023.
//

// Apple
import Foundation
/**
 Restricted collection
 */
public struct RestrictedStack<T> {
    // MARK: - Data
    public private(set) var storage: [T] = []
    private var currentIndex: Int
    private let maxCount: Int
    
    // MARK: - Inits
    public init(initialState: T?,
                maxCount: Int) {
        if let initialState = initialState {
            self.currentIndex = 0
            self.storage = [initialState]
        } else {
            self.currentIndex = -1
            self.storage = []
        }
        self.maxCount = maxCount
    }
    
    public init(stored: [T],
                maxCount: Int) {
        self.currentIndex = stored.count - 1
        self.storage = stored
        self.maxCount = maxCount
    }
    
    // MARK: - Interface methods
    public var hasPreviousState: Bool {
        return storage.count > 1 && currentIndex != 0
    }
    
    public var hasNextState: Bool {
        return storage.count > 1 && currentIndex != storage.count - 1
    }
    
    public mutating func obtainPreviousState() -> T? {
        if !hasPreviousState {
            return nil
        }
        self.currentIndex -= 1
        return storage[currentIndex]
    }
    
    public mutating func obtainNextState() -> T? {
        if !hasNextState {
            return nil
        }
        self.currentIndex += 1
        return storage[currentIndex]
    }
    
    mutating public func addState(_ state: T) {
        clearRedoActions()
        removeFirstStateIfNeeded()
        storage.append(state)
        currentIndex += 1
    }
    
    mutating public func removeAllStates() {
        storage.removeAll()
        currentIndex = -1
    }
    
    // MARK: - Private methods
    /// Удалить все redo состояния
    private mutating func clearRedoActions() {
        if currentIndex == storage.count - 1 {
            return
        }
        storage = Array(storage[0 ... currentIndex])
    }
    
    /// Удалить первое сохраненное состояние, если хранилище полностью заполнено
    private mutating func removeFirstStateIfNeeded() {
        if storage.count < maxCount {
            return
        }
        storage.removeFirst()
        currentIndex -= 1
    }
}
