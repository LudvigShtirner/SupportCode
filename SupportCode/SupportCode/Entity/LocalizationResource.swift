//
//  LocalizationResource.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 06.11.2021.
//

import Foundation

/// Протокол ресурса локализации
public protocol LocalizationResource: AnyObject {
    /// Перевести ключ на текущий язык
    /// - Parameter key: Ключ для поиска локализации
    static func localize(for key: String) -> String
    
    /// Название общего файла для локализации
    static var commonTableName: String { get }
}

/// Расширение для стандартной реализации
public extension LocalizationResource {
    /// Перевести ключ на текущий язык
    /// - Parameter key: Ключ для поиска локализации
    /// - Returns: Локализованная строка
    static func localize(for key: String) -> String {
        let bundle = Bundle(for: Self.self)
        let result = bundle.localizedString(forKey: key,
                                            value: "",
                                            table: String(describing: Self.self))
        if result != key || !result.isEmpty {
            return result
        }
        return Bundle.main.localizedString(forKey: key,
                                           value: "",
                                           table: commonTableName)
    }
}
