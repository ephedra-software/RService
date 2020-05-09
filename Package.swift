// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RService",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(name: "RService", targets: ["RService"]),
    ],
    targets: [
        .target(name: "RService", dependencies: []),
        .testTarget(name: "RServiceTests", dependencies: ["RService"]),
    ]
)
