//
//  ClassIdentifiable.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

// Apple
import Foundation

public protocol ClassIdentifiable {
    static var classIdentifier: String { get }
}

public extension ClassIdentifiable {
    static var classIdentifier: String {
        String(describing: self)
    }
}
