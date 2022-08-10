//
//  UITableView+Registration.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 07.01.2021.
//

import UIKit

public extension UITableView {
    /// Register cell for UITableView pool
    ///
    /// Example of usage:
    /// ```
    /// tableView.registerCell(ExampleTableViewCell.self)
    /// ```
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    /// Register Header or Footer view for UITableView pool
    ///
    /// Example of usage:
    /// ```
    /// table.registerView(ExampleHeaderView.self)
    /// ```
    func registerView<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    /// Dequeue cell from pool or create a new one
    ///
    /// Example of usage:
    /// ```
    /// let cell: ExampleTableViewCell = tableView.dequeueCell(for: indexPath)
    /// cell.configure(model: someModel)
    /// return cell
    /// ```
    /// - Warning: Application will be crashed if cell isn't registered
    /// - Returns: instance of expected Cell class
    func dequeueCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not cast dequeued cell with identifier: \(T.identifier) to type: \(T.self)")
        }
        return cell
    }
    
    /// Dequeue cell from pool or create a new one
    ///
    /// Example of usage:
    /// ```
    /// let cell: ExampleTableViewCell = tableView.dequeueCell(for: indexPath)
    /// cell.configure(model: someModel)
    /// return cell
    /// ```
    /// - Warning: Application will be crashed if cell isn't registered
    /// - Returns: instance of expected Cell class
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    /// Dequeue Header or Footer view from pool or create a new one
    ///
    /// Example of usage:
    /// ```
    /// let view: ExampleHeaderView = collectionView.dequeueView(forSupplementaryViewOfKind: .header, indexPath: IndexPath)
    /// view.configure(model: someModel)
    /// return view
    /// ```
    /// - Warning: Application will be crashed if view isn't registered
    /// - Returns: instance of expected SupplementaryView class
    func dequeueView<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue reusableView with identifier: \(T.identifier)")
        }
        return view
    }
}

extension UITableViewCell: Identifiable {
    
}

extension UITableViewHeaderFooterView: Identifiable {
    
}
