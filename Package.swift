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
        .package(url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager", exact: "7.8.0"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealVungleAdapter/7.8.0.0/cf24b3e519cf/AppodealVungleAdapter.xcframework.zip",
            checksum: "cf24b3e519cfcd9e8721715cef3c65d1603fa593441d5a162ad17311d0753b11"
        ),

    ]
)
