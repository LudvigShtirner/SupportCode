//
//  Reusable.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

/// Протокол переиспользуемого объекта
public protocol Reusable: AnyObject {
    static var identifier: String { get }
}

public extension Reusable {
    /// Идентификатор переиспользования объекта
    static var identifier: String {
        String(describing: self)
    }
}
