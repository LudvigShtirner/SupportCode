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
    func createWithLastSecondsOfDay() -> Date {
        var components = DateComponents()
        components.day = 1
        components.nanosecond = -1
        let startOfDay = createWithFirstSecondsOfDay()
        guard let modified = Calendar.current.date(byAdding: components, to: startOfDay) else {
            assertionFailure("Cannot create date by adding components when calculating last seconds of date")
            return .init(timeIntervalSince1970: .zero)
        }
        return modified
    }
    
    /// Создать дату первого дня месяца
    func createWithFirstDayOfMonth() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)
        guard let startOfMonth = calendar.date(from: components) else {
            assertionFailure("Cannot create date from month and year component")
            return .init(timeIntervalSince1970: .zero)
        }
        return startOfMonth
    }
    
    /// Создать дату последнего дня месяца
    func createWithLastDayOfMonth() -> Date {
        var components = DateComponents()
        components.month = 1
        components.nanosecond = -1
        guard let modified = Calendar(identifier: .gregorian).date(byAdding: components, to: createWithFirstDayOfMonth()) else {
            assertionFailure("Cannot create date by adding components when calculating last day of date")
            return .init(timeIntervalSince1970: .zero)
        }
        return modified
    }
}
