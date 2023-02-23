//
//  CGFloat+Math.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

// Apple
import CoreGraphics

/// Расширение для подсчетов с CGFloat
public extension CGFloat {
    /// Половина от числа
    var half: CGFloat { self / 2.0 }
    /// Перевести число из градусов в радианы
    /// - Returns: число в радианах
    func toRadians() -> CGFloat {
        self * CGFloat.pi / 180.0
    }
    /// Перевести число из радиан в градусы
    /// - Returns: число в градусах
    func toDegrees() -> CGFloat {
        self * 180.0 / CGFloat.pi
    }
}
