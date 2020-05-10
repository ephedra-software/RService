// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RService",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "RService", targets: ["RService"]),
    ],
    targets: [
        .target(name: "RService", dependencies: []),
        .testTarget(name: "RServiceTests", dependencies: ["RService"]),
    ]
)
