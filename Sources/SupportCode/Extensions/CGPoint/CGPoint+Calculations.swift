//
//  CGPoint+Calculations.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

// Apple
import CoreGraphics

/// Расширение для подсчетов с CGPoint
public extension CGPoint {
    /// найти расстояние до точки
    /// - Parameter point: точка, до которой ищется расстояние
    /// - Returns: расстояние между точками
    func distance(to point: CGPoint) -> CGFloat {
        let diffX = point.x - self.x
        let diffY = point.y - self.y
        return (pow(diffX, 2) + pow(diffY, 2)).squareRoot()
    }
}
