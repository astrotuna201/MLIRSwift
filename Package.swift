// swift-tools-version:5.4
import PackageDescription

let package = Package(
  name: "MLIR",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "MLIR",
      targets: ["MLIR"]),
    .library(
      name: "MLIRDialects",
      targets: ["Dialects"]),
  ],
  targets: [
    .systemLibrary(
      name: "CMLIR",
      pkgConfig: "MLIR-for-Swift"),
    .target(
      name: "MLIR",
      dependencies: ["CMLIR"]),
    .testTarget(
      name: "MLIRTests",
      dependencies: ["MLIR"]),

    .systemLibrary(
      name: "CDialects",
      pkgConfig: "LLVM-for-Swift"),
    .target(
      name: "Dialects",
      dependencies: ["CDialects", "MLIR"]),
    .testTarget(
      name: "DialectTests",
      dependencies: ["Dialects"]),
  ]
)
