//
//  AnimationEnum.swift
//
//
//  Created by Алексей Филиппов on 26.11.2023.
//

import Foundation

public enum AnimationEnum<T> {
    case no(value: T)
    case has(value: T, duration: TimeInterval)
    
    public var value: T {
        switch self {
        case .no(let value), .has(let value, _):
            return value
        }
    }
}
