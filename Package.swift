// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeanCoffeeApp",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "LeanCoffeeApp",
            targets: ["LeanCoffeeApp"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LeanCoffeeApp",
            dependencies: []),
        .testTarget(
            name: "LeanCoffeeAppTests",
            dependencies: ["LeanCoffeeApp"]),
    ]
)
