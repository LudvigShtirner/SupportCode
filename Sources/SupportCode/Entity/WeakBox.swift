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

public struct WeakArray<Element: AnyObject> {
    private var items: [WeakBox<Element>] = []

    public init(_ elements: [Element]) {
        items = elements.map { WeakBox($0) }
    }
}

extension WeakArray: Collection {
    public var startIndex: Int { return items.startIndex }
    public var endIndex: Int { return items.endIndex }

    public subscript(_ index: Int) -> Element? {
        return items[index].unbox
    }

    public func index(after idx: Int) -> Int {
        return items.index(after: idx)
    }
}
