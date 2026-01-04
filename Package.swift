// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "CryptoCore",
    platforms: [
      .macOS(.v10_15),
      .iOS(.v13),
    ],
    products: [
      .library(name: "CryptoCore", type: .static, targets: ["CryptoCore"]),
    ],
    targets: [
        // 👀 C helpers
        .target(name: "keccaktiny"),
        .target(name: "secp256k1", cSettings: [
          .define("ENABLE_MODULE_ECDH"),
          .define("ENABLE_MODULE_RECOVERY"),
        ]),

        // 🎯 Target -- Base58
        .target(name: "Base58"),

        // 🎯 Target -- CryptoCore
        .target(name: "CryptoCore", dependencies: [
            "keccaktiny", 
            "secp256k1",
            "Base58",
        ]),

        // Test -- CryptoCore
        .testTarget(name: "CryptoCoreTests", dependencies: [
            "CryptoCore"
        ]),
    ]
)

