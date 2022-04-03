//
//  CGFloatUIGrid.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 21.03.2021.
//

import UIKit

public extension CGFloat {
    /// Перевести значение для пиксельной сетки экрана
    /// - Returns: округленное значение соответствующее сетке экрана
    func convertToScreenGrid(scale: CGFloat = UIScreen.main.scale) -> CGFloat {
        let pixels = self * scale
        let rounded = pixels.rounded()
        return rounded / scale
    }
}
