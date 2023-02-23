//
//  DateFormatter+Transforms.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 13.02.2022.
//

// Apple
import Foundation

public extension DateFormatter {
    // MARK: - Life Cycle
    static let shared = DateFormatter()
    
    /// Получить месяц строкой в именительном падеже
    func makeMonthString(from date: Date) -> String {
        dateFormat = "LLLL"
        return string(from: date)
    }
}
