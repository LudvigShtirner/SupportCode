// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let supportCode = "SupportCode"
private let supportCodeTests = "SupportCodeTests"

let package = Package(
    name: supportCode,
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: supportCode,
                 targets: [supportCode]),
    ],
    dependencies: [],
    targets: [
        .target(name: supportCode,
                dependencies: []),
        .testTarget(name: supportCodeTests,
                    dependencies: [
                        .byName(name: supportCode)
                    ],
                    resources: [.process("Resources")]),
    ]
)
