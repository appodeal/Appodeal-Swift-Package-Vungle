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
        .package(url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager", exact: "7.7.4"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealVungleAdapter/7.7.4.1/7eef0486b1a0/AppodealVungleAdapter.xcframework.zip",
            checksum: "7eef0486b1a076d3afe9d72fb29daea3cdb13a86adc5a1e88d6f1f8d2a5eb509"
        ),

    ]
)
