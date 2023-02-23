//
//  Bundle+Locale.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

// Apple
import Foundation

public extension Bundle {
    var isRussian: Bool {
        guard let selectedLocalization = preferredLocalizations.first else {
            return false
        }
        return selectedLocalization == "ru"
    }
}
