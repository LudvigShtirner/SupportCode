//
//  CGSize+Inits.swift
//
//
//  Created by Алексей Филиппов on 24.04.2024.
//

import Foundation

public extension CGSize {
    static func make(with side: CGFloat) -> CGSize {
        CGSize(width: side,
               height: side)
    }
    
    static var nan: CGSize {
        CGSize(width: CGFloat.nan,
               height: CGFloat.nan)
    }
}
