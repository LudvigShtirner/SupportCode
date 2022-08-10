//
//  DispatchQueue+Utils.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 13.02.2022.
//

// Apple
import Foundation

public extension DispatchQueue {
    /// Вызывает блок на главном потоке
    ///
    /// Если функция вызвана из главного потока, то блок запустится синхронно, если вызвана из другого потока - блок запустится асинхронно на главном потоке
    /// - Parameter closure: блок операций
    static func callOnMainQueue(_ closure: @escaping VoidBlock) {
        if Thread.isMainThread {
            closure()
            return
        }
        DispatchQueue.main.async {
            closure()
        }
    }
}
