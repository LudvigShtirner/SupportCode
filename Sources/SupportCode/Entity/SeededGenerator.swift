//
//  SeededGenerator.swift
//  
//
//  Created by Алексей Филиппов on 16.01.2023.
//

// Apple
import class GameplayKit.GKMersenneTwisterRandomSource

typealias SeededGenerator = GKMersenneTwisterRandomSource

//open class SeededGenerator {
//    // MARK: - Dependencies
//    private let generator: GKMersenneTwisterRandomSource
//
//    // MARK: - Life cycle
//    public init(seed: UInt64) {
//        generator = GKMersenneTwisterRandomSource(seed: seed)
//    }
//
//    // MARK: - Interface methods
//    func setSeed(seed: UInt64) {
//        generator.seed = seed
//    }
//
//    func nextInt(upperBound: Int? = nil) -> Int {
//        if let upperBound = upperBound {
//            return generator.nextInt(upperBound: upperBound)
//        }
//        return generator.nextInt()
//    }
//}
