//
//  UserDefaultsPropertyWrapper.swift
//  SupportCode
//
//  Created by Филиппов Алексей on 12.05.2022.
//

import Foundation

/// Property wrapper for userDefaults. Store and obtain data
@propertyWrapper
public struct UDStored<T> {
    public var wrappedValue: T {
        get {
            storage.data(forKey: key) as? T ?? defaultValue
        }
        set {
            storage.set(newValue, forKey: key)
        }
    }
    
    private let key: String
    private let defaultValue: T
    private let storage: UserDefaults
    
    public init(key: String,
                defaultValue: T,
                storage: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}

/// Property wrapper for userDefaults. Store and obtain Codable data. Encoding and Decoding by JSON
@propertyWrapper
public struct UDCodableStored<T: JsonCodable> {
    public var wrappedValue: T {
        get {
            guard let data = storage.data(forKey: key) else { return defaultValue }
            guard let model = try? T.decode(from: data) else {
                fatalError("Decoding for \(T.self) is errored!")
            }
            return model
        }
        set {
            guard let data = try? newValue.encode() else {
                fatalError("Encoding for \(T.self) is errored!")
            }
            storage.set(data, forKey: key)
        }
    }
    
    private let key: String
    private let defaultValue: T
    private let storage: UserDefaults
    
    public init(key: String,
                defaultValue: T,
                storage: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}
