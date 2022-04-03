//
//  UIView+CornerRadius.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 20.03.2021.
//

import UIKit

public extension UIView {
    /// Добавить скругление на перечисленные углы
    /// - Parameters:
    ///   - radius: Радиус скругления
    ///   - corners: углы отображения
    func addRadius(_ radius: CGFloat,
                   to corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /// Быстрый доступ к скруглению всех сторон отображения
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
