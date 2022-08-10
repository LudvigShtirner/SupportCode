//
//  LocalizationResource.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Apple
import Foundation

/// Протокол ресурса локализации
///
/// Предоставляет общую реализацию для локализации
/// - Warning: Должен быть отнаследован от класса, так как ищется текущий Bundle для автоматического подтягивания strings файла
public protocol LocalizationResource: AnyObject {
    /// Перевести ключ на текущий язык
    ///
    /// Если не найден перевод для ключа в текущем ".strings" файле , то поиск будет продолжен в общем ".strings" файле
    /// - Important: Стандартная реализация получена расширением протокола. Не переопределяйте метод, если не ожидается иное поведение
    /// - Parameter key: Ключ для поиска локализации
    /// - Returns: Переведенное значение или ключ, если пара не была найдена
    static func localize(for key: String) -> String
    
    /// Bundle и название файла с общим словарем переводов
    ///
    /// Имя файла и Bundle указываются для поиска необходимого файла
    /// - Important: Стандартная реализация получена расширением протокола. Имя файла идентично названию класса, реализующего протокол
    static var specificTable: (bundle: Bundle, tableName: String) { get }
    
    /// Bundle and name of .strings file with common localization
    ///
    /// The file name with common localization keys, like "Ok", "Cancel", etc
    /// - Important: Example of usage.
    /// Create extension file in your project
    /// ```
    /// extension LocalizationResource {
    ///     var commonTable: (bundle: Bundle, tableName: String) {
    ///         return (Bundle.main, "Localizable")
    ///     }
    /// }
    /// ```
    /// where **"Localizable"** is your common localization file name
    static var commonTable: (bundle: Bundle, tableName: String) { get }
}

public extension LocalizationResource {
    static func localize(for key: String) -> String {
        let result = specificTable.bundle.localizedString(forKey: key,
                                                          value: nil,
                                                          table: specificTable.tableName)
        if result != key {
            return result
        }
        return commonTable.bundle.localizedString(forKey: key,
                                                  value: nil,
                                                  table: commonTable.tableName)
    }
    
    static var specificTable: (bundle: Bundle, tableName: String) {
        (Bundle(for: Self.self), String(describing: Self.self))
    }
}
