//
//  CGFloat+UIGrid.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 21.03.2021.
//

// Apple
import UIKit

public extension CGFloat {
    /// Привести значение для пиксельной сетки экрана
    ///
    /// Используйте данный метод для избежания смешивания цветов в пикселях экрана
    /// - Parameter scale: количество пикселей на 1 поинт. Стандартное значение - *UIScreen.main.scale*
    /// - Returns: округленное значение, соответствующее сетке экрана
    func toPixelGrid(scale: CGFloat = UIScreen.main.scale) -> CGFloat {
        let pixels = self * scale
        let rounded = pixels.rounded()
        return rounded / scale
    }
    
    static var pixelSize: CGFloat { 1.0 / UIScreen.main.scale }
}
