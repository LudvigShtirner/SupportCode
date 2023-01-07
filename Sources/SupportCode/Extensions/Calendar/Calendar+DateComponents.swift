//
//  File.swift
//  
//
//  Created by Алексей Филиппов on 01.01.2023.
//

import Foundation

/// Расширение для быстрого доступа к юнитам календаря
public extension Calendar {
    /// Получить год из даты
    /// - Parameter date: Указанная дата
    /// - Returns: Год из указанной даты. Если передать nil, то вернет текущий год
    func getYear(from date: Date? = nil) -> Int {
        getComponent(.year, from: date)
    }
    
    /// Получить месяц из даты
    /// - Parameter date: Указанная дата
    /// - Returns: Месяц из указанной даты. Если передать nil, то вернет текущий месяц
    func getMonth(from date: Date? = nil) -> Int {
        getComponent(.month, from: date)
    }
    
    /// Получить неделю в году из даты
    /// - Parameter date: Указанная дата
    /// - Returns: Неделя в году из указанной даты. Если передать nil, то вернет текущую неделю в году
    func getWeekOfYear(from date: Date? = nil) -> Int {
        getComponent(.weekOfYear, from: date)
    }
    
    /// Получить день в году из даты
    /// - Parameter date: Указанная дата
    /// - Returns: День в году из указанной даты. Если передать nil, то вернет текущий день в году
    func getDayOfYear(from date: Date? = nil) -> Int {
        let d = date ?? Date()
        return ordinality(of: .day, in: .year, for: d) ?? .min
    }
    
    /// Получить компонент из даты
    /// - Parameters:
    ///   - dateComponent: Компонент даты для поиска
    ///   - date: Дата для поиска
    /// - Returns: Компонент из даты
    private func getComponent(_ dateComponent: Calendar.Component, from date: Date?) -> Int {
        let d = date ?? Date()
        return component(dateComponent, from: d)
    }
}
