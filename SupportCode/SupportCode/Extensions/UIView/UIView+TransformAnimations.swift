//
//  UIView+TransformAnimations.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 01.04.2021.
//

import UIKit

public extension UIView {
    /// Применить аффинное преобразование с анимацией
    /// - Parameters:
    ///   - transform: аффинное преобразование
    ///   - duration: длительность анимации
    func animate(transform: CGAffineTransform,
                 duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.transform = transform
        }
    }
}
