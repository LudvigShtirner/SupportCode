//
//  Date+Transforms.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 16.04.2021.
//

// Apple
import Foundation

/// Расширение для работы с модификацией даты
public extension Date {
    /// Создать дату с первой секундой дня
    func createWithFirstSecondsOfDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    /// Создать дату с последней секундой дня
    func createWithLastSecondsOfDay(calendar: Calendar = .current) -> Date? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        let startOfDay = createWithFirstSecondsOfDay()
        return calendar.date(byAdding: components, to: startOfDay)
    }
    
    /// Создать дату первого дня месяца
    func createWithFirstDayOfMonth(calendar: Calendar = .current) -> Date? {
        let components = calendar.dateComponents([Calendar.Component.year, Calendar.Component.month], from: self)
        return calendar.date(from: components)
    }
    
    /// Создать дату последнего дня месяца
    func createWithLastDayOfMonth(calendar: Calendar = .current) -> Date? {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return createWithFirstDayOfMonth().flatMap {
            calendar.date(byAdding: components,
                          to: $0)
        }
    }
    
    func monthIndex(calendar: Calendar = .current) -> Int {
        calendar.component(.month, from: self)
    }
}
