// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "BoilerplateGenerator",
  products: [
    .executable(name: "GenerateBlockInitializers", targets: ["GenerateBlockInitializers"]),
  ],
  targets: [
    .target(name: "Utilities"),
    .target(name: "GenerateBlockInitializers", dependencies: ["Utilities"]),
  ]
)
