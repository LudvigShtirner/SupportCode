//
//  BinaryFloatingPoint+Equal.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

import Foundation

public extension BinaryFloatingPoint {
    func isAlmostEqual(to other: Self) -> Bool {
        abs(self - other) < .ulpOfOne
    }

    func isAlmostEqual(to other: Self, error: Self) -> Bool {
        abs(self - other) <= error
    }
    
    @inlinable
    var nearestLower: Self {
        self - .ulpOfOne
    }
}
