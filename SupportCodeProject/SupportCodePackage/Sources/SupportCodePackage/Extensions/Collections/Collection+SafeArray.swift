//
//  Collection+SafeArray.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 25.11.2021.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
