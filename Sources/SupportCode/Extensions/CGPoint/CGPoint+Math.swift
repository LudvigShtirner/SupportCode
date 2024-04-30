//
//  CGPoint+Math.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

import Foundation

public extension CGPoint {
    func isAlmostEqual(to other: CGPoint) -> Bool {
        x.isAlmostEqual(to: other.x) 
        && y.isAlmostEqual(to: other.y)
    }

    func isAlmostEqual(to other: CGPoint, error: CGFloat) -> Bool {
        x.isAlmostEqual(to: other.x, error: error) 
        && y.isAlmostEqual(to: other.y, error: error)
    }
}
