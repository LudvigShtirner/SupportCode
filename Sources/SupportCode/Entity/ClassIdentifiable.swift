//
//  ClassIdentifiable.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

// Apple
import Foundation

public protocol ClassIdentifiable {
    static var className: String { get }
}

public extension ClassIdentifiable {
    static var className: String {
        String(describing: self)
    }
}

extension NSObject: ClassIdentifiable { }
