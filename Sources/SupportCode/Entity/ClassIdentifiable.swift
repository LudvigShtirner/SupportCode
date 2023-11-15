//
//  ClassIdentifiable.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

// Apple
import Foundation

/**
 Protocol  of reusable class
 */
public protocol ClassIdentifiable {
    /// Идентификатор переиспользования объекта
    static var classIdentifier: String { get }
}

public extension ClassIdentifiable {
    static var classIdentifier: String {
        String(describing: self)
    }
}
