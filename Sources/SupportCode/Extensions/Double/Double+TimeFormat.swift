//
//  Double+TimeFormat.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 13.02.2022.
//

// Apple
import Foundation

public extension Double {
    /// Привести число к временному типу "чч:мм:сс"
    /// - Returns: строка в формате "чч:мм:сс" или "мм:сс", если меньше часа
    func timeFormat() -> String {
        let s: Int = Int(self) % 60
        let m: Int = Int(self) / 60 % 60
        let h: Int = Int(self) / 3600
        
        return h > 0 ? String(format: "%02d:%02d:%02d", h, m, s) : String(format: "%02d:%02d", m, s)
    }
}
