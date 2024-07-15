//
//  CGSize+Inits.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

// Apple
import UIKit

public extension CGSize {
    static func make(with side: CGFloat) -> CGSize {
        CGSize(width: side,
               height: side)
    }
    
    static var nan: CGSize {
        CGSize(width: CGFloat.nan,
               height: CGFloat.nan)
    }
    
    func toPixelGrid(scale: CGFloat = UIScreen.main.scale) -> CGSize {
        CGSize(width: width.toPixelGrid(scale: scale),
               height: height.toPixelGrid(scale: scale))
    }
}
