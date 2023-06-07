// swift-tools-version: 5.8
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
    ],
    dependencies: [
        .package(url: "https://github.com/ActuallyTaylor/tree-sitter-spm", branch: "master"),
        .package(url: "https://github.com/ActuallyTaylor/tree-sitter-jelly", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Open-Jellycore",
            dependencies: [
                .product(name: "TreeSitter", package: "tree-sitter-spm"),
                .product(name: "TreeSitterJelly", package: "tree-sitter-jelly")
            ]
        ),
        .testTarget(
            name: "Open-JellycoreTests",
            dependencies: ["Open-Jellycore"]
        ),
    ]
)
