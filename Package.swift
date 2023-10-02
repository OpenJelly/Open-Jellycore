// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Open-Jellycore",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Open-Jellycore",
            targets: ["Open-Jellycore"]),
        .executable(name: "jelly", targets: ["jelly"])
    ],
    dependencies: [
        .package(url: "https://github.com/tree-sitter/tree-sitter", branch: "master"),
        .package(url: "https://github.com/ActuallyTaylor/tree-sitter-jelly", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Open-Jellycore",
            dependencies: [
                .product(name: "TreeSitter", package: "tree-sitter"),
                .product(name: "TreeSitterJelly", package: "tree-sitter-jelly")
            ]
        ),
        .executableTarget(name: "jelly", dependencies: [
            "Open-Jellycore",
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
        .testTarget(
            name: "Open-JellycoreTests",
            dependencies: ["Open-Jellycore"]
        ),
    ]
)
