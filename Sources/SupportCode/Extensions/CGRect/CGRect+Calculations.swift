//
//  CGRect+Calculations.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import CoreGraphics

public extension CGRect {
    /// Минимальная сторона прямоугольника
    var minSide: CGFloat {
        size.minSide
    }
    
    var diagonal: CGFloat {
        topLeftPoint.distance(to: bottomRightPoint)
    }
    
    var topLeftPoint: CGPoint {
        origin
    }
    
    var topRightPoint: CGPoint {
        CGPoint(x: origin.x + size.width,
                y: origin.y)
    }
    
    var bottomLeftPoint: CGPoint {
        CGPoint(x: origin.x,
                y: origin.y + size.height)
    }
    
    var bottomRightPoint: CGPoint {
        CGPoint(x: origin.x + size.width,
                y: origin.y + size.height)
    }
    
    var topCenter: CGPoint {
        CGPoint(x: origin.x + size.width.half,
                y: origin.y)
    }
    
    var leftCenter: CGPoint {
        CGPoint(x: origin.x,
                y: origin.y + size.height.half)
    }
    
    var bottomCenter: CGPoint {
        CGPoint(x: origin.x + size.width.half,
                y: origin.y + size.height)
    }
    
    var rightCenter: CGPoint {
        CGPoint(x: origin.x + size.width,
                y: origin.y + size.height.half)
    }
}
