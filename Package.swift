// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-slack-client",
  platforms: [
    .macOS(.v13), .iOS(.v16), .watchOS(.v9), .tvOS(.v16), .visionOS(.v1)
  ],
  products: [
    .library(name: "SlackClient", targets: ["SlackClient"]),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor", from: "4.0.0"),
    .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.0"),
    .package(url: "https://github.com/apple/swift-testing", .branch("main")),
  ],
  targets: [
    .target(name: "SlackClient", dependencies: [
      .target(name: "BlockKitBuilder"),
      .target(name: "SlackPrimaryTypes"),
      .product(name: "Vapor", package: "vapor"),
      .product(name: "AnyCodable", package: "AnyCodable"),
    ]),
    .target(name: "BlockKitBuilder", dependencies: ["SlackPrimaryTypes"]),
    .target(name: "SlackPrimaryTypes"),
    
    .executableTarget(name: "SlackClientDemo", dependencies: [
      .target(name: "SlackClient"),
      .product(name: "Vapor", package: "vapor"),
    ]),
    .testTarget(name: "SlackClientTests", dependencies: [
      .target(name: "SlackClient"),
      .product(name: "Testing", package: "swift-testing"),
    ]),
  ]
)
