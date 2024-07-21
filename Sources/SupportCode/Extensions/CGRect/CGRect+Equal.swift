//
//  CGRect+Equal.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

// Apple
import Foundation

public extension CGRect {
    func isAlmostEqual(to other: CGRect) -> Bool {
        size.isAlmostEqual(to: other.size) 
        && origin.isAlmostEqual(to: other.origin)
    }
    
    func isAlmostEqual(to other: CGRect,
                       error: CGFloat) -> Bool {
        size.isAlmostEqual(to: other.size,
                           error: error)
        && origin.isAlmostEqual(to: other.origin,
                                error: error)
    }
}
