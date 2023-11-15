//
//  Atomic.swift
//  
//
//  Created by Алексей Филиппов on 18.06.2023.
//

// Apple
import Foundation

@propertyWrapper
public final class Atomic<Value> {
    // MARK: - Data
    private let queue = DispatchQueue(label: "com.supportCode.Atomic.\(UUID().uuidString)")
    private var value: Value
    
    // MARK: - Inits
    public init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    // MARK: - Interface methods
    public var projectedValue: Atomic<Value> { self }
    
    public var wrappedValue: Value {
        get { queue.sync { value } }
        set { fatalError("Use mutate instead") }
    }
    
    public func mutate(_ mutation: (inout Value) -> Void) {
        queue.sync { mutation(&value) }
    }
}
