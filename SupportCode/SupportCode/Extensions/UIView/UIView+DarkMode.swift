//
//  UIView+DarkMode.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 20.03.2021.
//

import UIKit

public extension UIView {
    /// Флаг темной темы
    var isDarkMode: Bool {
        return traitCollection.userInterfaceStyle == .dark
    }
}
