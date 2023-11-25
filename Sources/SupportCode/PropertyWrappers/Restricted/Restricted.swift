//
//  Restricted.swift
//
//
//  Created by Алексей Филиппов on 24.11.2023.
//

// Apple
import Foundation

@propertyWrapper
public struct Restricted<Value: Comparable> {
    // MARK: - Data
    private let range: ClosedRange<Value>
    private var storedValue: Value
    
    // MARK: - Inits
    public init(wrappedValue value: Value, range: ClosedRange<Value>) {
        self.range = range
        self.storedValue = value
        wrappedValue = value
    }
    
    // MARK: - PropertyWrapper
    public var wrappedValue: Value {
        get { storedValue }
        set { storedValue = newValue.inRange(min: range.upperBound, max: range.upperBound) }
    }
}
