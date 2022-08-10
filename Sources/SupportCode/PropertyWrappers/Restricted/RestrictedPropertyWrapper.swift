//
//  RestrictedPropertyWrapper.swift
//  SupportCode
//
//  Created by Филиппов Алексей on 16.05.2022.
//

import Foundation

@propertyWrapper
public struct Restricted<Value: Comparable> {
    // MARK: - Data
    public var range: ClosedRange<Value>
    private var value: Value
    
    // MARK: - Life Cycle
    public init(wrappedValue value: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = value
        wrappedValue = value
    }
    
    // MARK: - PropertyWrapper
    public var wrappedValue: Value {
        get {
            return value
        }
        set {
            value = max(min(newValue, range.upperBound), range.lowerBound)
        }
    }
}
