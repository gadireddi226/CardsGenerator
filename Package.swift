// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CardsGenerator",
    platforms: [
            .iOS("14.0"),
            .macOS("11.0")
        ],
    products: [
        .library(
            name: "CardsGenerator",
            targets: ["CardsGenerator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-docc-plugin", branch: "main"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CardsGenerator",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms")]),
        .testTarget(
            name: "CardsGeneratorTests",
            dependencies: [
                "CardsGenerator",
                          ]),
    ]
)
