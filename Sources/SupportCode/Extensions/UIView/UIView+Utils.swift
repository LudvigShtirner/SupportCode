//
//  UIView+Utils.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 20.03.2021.
//

import UIKit

public extension UIView {
    /// Is device dark mode is on
    var isDarkMode: Bool {
        return traitCollection.userInterfaceStyle == .dark
    }
    
    /// Is Right-To-Left orientation enabled by Arabic or another RTL language
    var isRightToLeft: Bool {
        effectiveUserInterfaceLayoutDirection == .rightToLeft
    }
}
