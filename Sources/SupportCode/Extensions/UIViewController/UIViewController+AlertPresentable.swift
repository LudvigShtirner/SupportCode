//
//  UIViewController+AlertPresentable.swift
//  SupportCode
//
//  Created by Филиппов Алексей on 13.05.2022.
//

import UIKit

public extension UIViewController {
    func showAlert(style: UIAlertController.Style,
                   model: AlertData) {
        let alertController = UIAlertController(title: model.title,
                                                message: model.message,
                                                preferredStyle: style)
        let cancelAction = UIAlertAction(title: model.cancelAction.buttonTitle,
                                         style: model.cancelAction.buttonStyle) { _ in
            model.cancelAction.buttonAction()
        }
        alertController.addAction(cancelAction)
        for action in model.actions {
            let alertAction = UIAlertAction(title: action.buttonTitle,
                                            style: action.buttonStyle) { _ in
                action.buttonAction()
            }
            alertController.addAction(alertAction)
        }
        present(alertController, animated: true, completion: nil)
    }
}

public struct AlertData {
    // MARK: - Data
    let title: String
    let message: String
    let cancelAction: AlertAction
    let actions: [AlertAction]
    
    // MARK: - Life cycle
    public init(title: String,
                message: String,
                cancelAction: AlertData.AlertAction,
                actions: [AlertData.AlertAction]) {
        self.title = title
        self.message = message
        self.cancelAction = cancelAction
        self.actions = actions
    }
    
    // MARK: - Subtypes
    public struct AlertAction {
        // MARK: - Data
        let buttonTitle: String
        let buttonStyle: UIAlertAction.Style
        let buttonAction: () -> Void
        
        // MARK: - Life cycle
        public init(buttonTitle: String,
                    buttonStyle: UIAlertAction.Style,
                    buttonAction: @escaping VoidBlock) {
            self.buttonTitle = buttonTitle
            self.buttonStyle = buttonStyle
            self.buttonAction = buttonAction
        }
    }
}
