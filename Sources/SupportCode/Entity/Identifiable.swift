//
//  Identifiable.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

// Apple
import Foundation

/// Протокол переиспользуемого объекта
public protocol Identifiable {
    /// Идентификатор переиспользования объекта
    static var identifier: String { get }
}

public extension Identifiable {
    static var identifier: String {
        String(describing: self)
    }
}
