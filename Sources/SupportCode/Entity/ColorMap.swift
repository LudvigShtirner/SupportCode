//
//  ColorMap.swift
//  
//
//  Created by Алексей Филиппов on 04.08.2022.
//

// Apple
import UIKit

/// Словарь цветов отображения для разных стилей
public struct ColorMap {
    // MARK: - Data
    /// Цвет в светлой теме
    public let lightColor: UIColor
    /// Цвет в темной теме
    public let darkColor: UIColor
    
    // MARK: - Life cycle
    public init(lightColor: UIColor,
                darkColor: UIColor) {
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
    
    public init(color: UIColor) {
        self.lightColor = color
        self.darkColor = color
    }
    
    // MARK: - Interface methods
    /// Получить цвет
    /// - Parameter view: отображение для которого определяется цвет
    /// - Returns: цвет, подходящий цветовой схемею
    public func color(for view: UIView) -> UIColor {
        switch view.traitCollection.userInterfaceStyle {
        case .light, .unspecified: return lightColor
        case .dark: return darkColor
        @unknown default: fatalError("Not supported \(view.traitCollection.userInterfaceStyle)")
        }
    }
}

