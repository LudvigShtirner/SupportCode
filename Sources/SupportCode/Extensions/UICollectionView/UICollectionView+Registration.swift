//
//  UICollectionView+Registration.swift
//  Metal Camera
//
//  Created by Филиппов Алексей on 19.03.2021.
//  Copyright © 2021 Defekt. All rights reserved.
//

import UIKit

public extension UICollectionView {
    /// Register cell for UICollectionView pool
    ///
    /// Example of usage:
    /// ```
    /// collectionView.registerCell(ExampleCollectionViewCell.self)
    /// ```
    func registerCell<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    /// Register supplementary view for UICollectionView pool
    ///
    /// Example of usage:
    /// ```
    /// collectionView.registerView(ExampleHeaderView.self, forSupplementaryViewOfKind: .header)
    /// ```
    func registerView<T: UICollectionReusableView>(_: T.Type,
                                                   forSupplementaryViewOfKind kind: SupplementaryViewKind) {
        register(T.self,
                 forSupplementaryViewOfKind: kind.identifier,
                 withReuseIdentifier: T.identifier)
    }
    
    /// Dequeue cell from pool or create a new one
    /// - Warning: Application will be crashed if cell isn't registered
    ///
    /// Example of usage:
    /// ```
    /// let cell: ExampleCollectionViewCell = collectionView.dequeueCell(for: indexPath)
    /// cell.configure(model: someModel)
    /// return cell
    /// ```
    /// - Returns: instance of expected Cell class
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    /// Dequeue supplementary view from pool or create a new one
    ///
    /// Example of usage:
    /// ```
    /// let view: ExampleHeaderView = collectionView.dequeueView(forSupplementaryViewOfKind: .header, indexPath: IndexPath)
    /// view.configure(model: someModel)
    /// return view
    /// ```
    /// - Returns: instance of expected SupplementaryView class
    func dequeueView<T>(forSupplementaryViewOfKind kind: SupplementaryViewKind,
                        indexPath: IndexPath) -> T where T: Identifiable {
        let view = dequeueReusableSupplementaryView(ofKind: kind.identifier,
                                                    withReuseIdentifier: T.identifier,
                                                    for: indexPath)
        guard let result = view as? T else {
            fatalError("Could not dequeue SupplementaryView with identifier: \(T.identifier)")
        }
        return result
    }
}

extension UICollectionReusableView: Identifiable {
    
}

/// Enumeration of UICollectionView supplementary view kinds.
///
/// That is proxy object to use UIKit constants for supplementary view kinds
public enum SupplementaryViewKind {
    case header
    case footer
    
    internal var identifier: String {
        switch self {
        case .header: return UICollectionView.elementKindSectionHeader
        case .footer: return UICollectionView.elementKindSectionFooter
        }
    }
}
