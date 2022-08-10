//
//  CALayer+FadeAnimation.swift
//
//
//  Created by Филиппов Алексей on 04.08.2022.
//

// Apple
import QuartzCore

// Constants
private let animationKeyPath = "opacity"
private let identifier = "animation"

public extension CALayer {
    /// Добавить слой с анимацией появления из прозрачности
    /// - Parameters:
    ///   - sublayer: добавляемый слой
    ///   - duration: длительность анимации
    ///   - completion: блок операций после завершения анимации
    func addSublayerWithFade(_ sublayer: CALayer,
                             duration: TimeInterval,
                             completion: VoidBlock? = nil) {
        sublayer.opacity = 0.0
        self.insertSublayer(sublayer, at: 0)
        CATransaction.begin()
        let fadeIn = CABasicAnimation(keyPath: animationKeyPath)
        fadeIn.fromValue = 0.0
        fadeIn.toValue = 1.0
        fadeIn.duration = duration
        fadeIn.setValue(identifier, forKey: "fadeIn")
        fadeIn.isRemovedOnCompletion = false
        fadeIn.fillMode = CAMediaTimingFillMode.forwards
        CATransaction.setCompletionBlock {
            completion?()
        }
        sublayer.add(fadeIn, forKey: nil)
        CATransaction.commit()
    }
    
    /// Удалить слой с анимацией исчезновения
    /// - Parameters:
    ///   - duration: длительность анимации
    ///   - completion: блок операций после завершения анимации
    func removeWithFade(duration: TimeInterval,
                        completion: VoidBlock? = nil) {
        self.opacity = 1.0
        CATransaction.begin()
        let fadeOut = CABasicAnimation(keyPath: animationKeyPath)
        fadeOut.fromValue = 1.0
        fadeOut.toValue = 0.0
        fadeOut.duration = duration
        fadeOut.setValue(identifier, forKey: "fadeOut")
        fadeOut.isRemovedOnCompletion = false
        fadeOut.fillMode = CAMediaTimingFillMode.forwards
        CATransaction.setCompletionBlock {
            self.removeFromSuperlayer()
            completion?()
        }
        self.add(fadeOut, forKey: nil)
        CATransaction.commit()
    }
}
