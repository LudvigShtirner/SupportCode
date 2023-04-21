//
//  WeakBox.swift
//  
//
//  Created by Алексей Филиппов on 15.03.2023.
//

// Apple
import Foundation

public final class WeakBox<T: AnyObject> {
    // MARK: - Data
    public weak var unbox: T?
    
    // MARK: - Inits
    public init(_ value: T) {
        unbox = value
    }
}
