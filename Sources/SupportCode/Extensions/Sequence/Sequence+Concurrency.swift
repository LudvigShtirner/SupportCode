//
//  Sequence+Concurrency.swift
//
//
//  Created by Алексей Филиппов on 15.04.2024.
//

import Foundation

public extension Sequence {
    func concurrentMap<T>(withPriority priority: TaskPriority? = nil,
                          _ transform: @escaping (Element) async -> T) async -> [T] {
        let tasks = map { element in
            Task(priority: priority) {
                await transform(element)
            }
        }
        return await tasks.asyncMap { task in
            await task.value
        }
    }
    
    func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var values = [T]()
        for element in self {
            try await values.append(transform(element))
        }
        return values
    }
}
