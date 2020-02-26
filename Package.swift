// swift-tools-version:4.0
//
//  Created by Richard Hodgkins on 07/06/2016.
//  Copyright (c) 2016 Richard Hodgkins. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "HTTPStatusCodes",
    products: [
        .library(name: "HTTPStatusCodes", targets: ["HTTPStatusCodes"])
    ],
    targets: [
        .target(
            name: "HTTPStatusCodes",
            path: "Sources"
        ),
        .testTarget(
            name: "HTTPStatusCodesTests",
            dependencies: ["HTTPStatusCodes"],
            path: "Tests/HTTPStatusCodesTests",
            sources: [
                "HTTPStatusCodesTests.swift",
                "RegressionTests.swift"
            ]
        )
    ]
)
