//
//  UITableView+Registration.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

import UIKit

/// Расширение с регистрацией и получением ячеек
public extension UITableView {
    /// Зарегистрировать ячейку
    /// - Parameter : тип ячейки
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    /// Зарегистрировать заголовочное или конечное отображение
    /// - Parameter :  тип переиспользуемого отображения
    func registerView<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    /// Получить ячейку из пула
    /// - Parameter kind: тип ячейки
    /// - Returns: Ячейка из пула созданных ячеек или новая ячейка, если пул пуст
    func dequeueCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    /// Получить ячейку из пула
    /// - Parameters:
    ///   - kind: Тип ячейки
    ///   - indexPath: Индекс ячейки
    /// - Returns: Ячейка из пула созданных ячеек или новая ячейка, если пул пуст
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    /// Получить отображение из пула
    /// - Returns: Отображение из пула или новое отображение, если пул пуст
    func dequeueView<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue reusableView with identifier: \(T.identifier)")
        }
        return view
    }
}

extension UITableViewCell: Reusable {
    
}

extension UITableViewHeaderFooterView: Reusable {
    
}
