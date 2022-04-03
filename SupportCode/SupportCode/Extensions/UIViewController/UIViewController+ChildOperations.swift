//
//  UIViewController+ChildOperations.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 05.01.2021.
//

import UIKit

extension UIViewController {
    /// Связать контроллер как дочерний
    /// - Parameters:
    ///   - viewController: дочернее отображение
    ///   - container: контейнер для дочернего объекта
    public func embedViewController(_ viewController: UIViewController,
                                    into container: UIView) {
        loadViewIfNeeded()
        
        addChild(viewController)
        container.addSubview(viewController.view)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        viewController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        viewController.didMove(toParent: self)
    }
}
