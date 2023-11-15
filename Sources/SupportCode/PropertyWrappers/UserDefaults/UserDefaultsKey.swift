//
//  UserDefaultsKey.swift
//  
//
//  Created by Алексей Филиппов on 30.08.2023.
//

// Apple
import Foundation

public struct UserDefaultsKey: ExpressibleByStringLiteral {
    // MARK: - Data
    let stringValue: String
    
    // MARK: - Inits
    public init(stringLiteral value: String) {
        self = UserDefaultsKey(value)
    }
    
    init(_ stringValue: String) {
        self.stringValue = stringValue
    }
}
