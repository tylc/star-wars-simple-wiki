// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreData",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreData",
            targets: ["CoreDataStore"]
        ),
    ],
    dependencies: [
        .package(path: "../CoreModel"),
        .package(path: "../CoreDomain"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreDataStore",
            dependencies: [
                "CoreModel",
                "CoreDomain",
                .product(name: "Alamofire", package: "Alamofire")
            ]
        ),
        .testTarget(
            name: "CoreDataTests",
            dependencies: ["CoreDataStore"]
        ),
    ]
)
