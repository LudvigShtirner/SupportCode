//
//  CGSize+Equal.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

import Foundation

public extension CGSize {
    func isAlmostEqual(to other: CGSize) -> Bool {
        width.isAlmostEqual(to: other.width)
        && height.isAlmostEqual(to: other.height)
    }
    
    func isAlmostEqual(to other: CGSize,
                       error: CGFloat) -> Bool {
        width.isAlmostEqual(to: other.width, error: error)
        && height.isAlmostEqual(to: other.height, error: error)
    }
}
