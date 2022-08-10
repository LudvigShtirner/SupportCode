//
//  UILabel+ActualFont.swift
//  SupportCode
//
//  Created by Филиппов Алексей on 13.05.2022.
//

import UIKit

public extension UILabel {
    /// Obtain label font after shrinking
    /// - Warning: text must set before asking actual font
    func calcActualFont() -> UIFont {
        guard let txt = text else {
            assertionFailure("Text must been nonEmpty to calculate actual font of UILabel")
            return font
        }
        let attributedString = NSAttributedString(string: txt,
                                                  attributes: [
                                                    .font: font as Any
                                                ])
        let drawingContext = NSStringDrawingContext()
        drawingContext.minimumScaleFactor = minimumScaleFactor
        attributedString.boundingRect(with: bounds.size,
                                      options: [.usesLineFragmentOrigin, .usesFontLeading],
                                      context: drawingContext)
        
        let fontSize = font.pointSize * drawingContext.actualScaleFactor
        let flooredFontSize: CGFloat = floor(fontSize)
        return font.withSize(flooredFontSize)
    }
}
