// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VaporCommon",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "VaporCommon",
            targets: ["VaporCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
    ],
    targets: [
        .target(name: "VaporCommon", dependencies: [
            .product(name: "Leaf", package: "leaf"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "VaporCommonTests", dependencies: ["VaporCommon"]),
    ]
)
