// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealVungleAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealVungleAdapter",
            targets: ["AppodealVungleAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager", exact: "7.7.3"),
    ],
    targets: [
        .target(
            name: "AppodealVungleAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "VungleAdsSDK", package: "VungleAdsSDK-SwiftPackageManager"),
                .target(name: "AppodealVungleAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealVungleAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealVungleAdapter/7.7.3.0/AppodealVungleAdapter.xcframework.zip",
            checksum: "a93d74192e5a8fc7eb118b33e283e5b94cb560b3f54a4e5a7ef71b5db2c96bb8"
        ),

    ]
)
