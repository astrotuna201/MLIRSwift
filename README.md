# MLIR Bindings for Swift

This project intends to make MLIR APIs accessible from Swift via the MLIR C Bindings.

## Usage

The best reference for how to use this package is currently the tests ([Module Tests](Tests/DialectTests/Module%20Tests.swift) is probably the most interesting).

If you are looking for an example of using MLIRSwift to bind MLIR dialects, check out [Edith](https://github.com/circt/Edith) which uses MLIRSwift to bind dialects from [CIRCT](https://github.com/llvm/circt).

## MLIR

### Installation

MLIR is build using the LLVM build infrastructure which uses `cmake`. This is incompatible with Swift Package Manager, so for now developers will need to install MLIR separately in order for this project to work. Once the MLIR C API settles and Swift Package Manager get better support for binary targets on Linux, we will likely make this dependency available as a precompiled binary. 

In the meantime, you can manually install MLIR using the `Tools/build-dependencies` script. This script requires recent versions of `cmake` and `ninja` to be present on your macine. These can be installed on macOS using Homebrew (`brew install cmake ninja`) or on Ubuntu via `apt-get` (`apt-get install cmake ninja-build`). Linux systems might also require the `libncurses5-dev` and `python3` packages.

### Troubleshooting

#### Insufficient permissions to create pkg-config file

One error you may run into is not having sufficient permissions to create `LLVM-for-Swift.pc` in `/usr/local/lib/pkgconfig`. This can be solved by making sure that folder exists and granting the correct user read/write permissions to that folder (an aggressive way to accomplish this is `sudo chmod -R 777 /usr/local/lib/pkgconfig`, which grants all users very open permissions to that folder). The reason this is necessary is that the only cross-platform way to include a precompiled binary in a Swift project is to have that binary installed on the system and accessible via a pkg-config (`.pc`) file. `Tools/build-dependencies` works by creating this file for you, and pointing it to the version of CIRCT it built.
Unfortunately, Xcode seems to only check certain well known locations for `.pc` files, the main one being `/usr/local/lib/pkgconfig`. If we are using SwiftPM from the command line (via a command like `swift test`) we can modify this behavior using `PKG_CONFIG_PATH` (the Linux CI uses this approach).

#### Stale caches when updating pkg-config file

Sometimes, if you change the contents of the pkg-config file (creating it for the first time, or switching between install directories) Xcode will not pick up this change, even after quitting and re-opening. The solution to this is to delete Xcode's "DerivedData" directory, which can be located by going to "Preferences" > "Locations" (an arrow by the path will open that location in Finder). An advanced approach is to store DerivedData "Relative" to the project (I use ".xcode/DerivedData" as the path). This way, it is easier to delete from the command line.

### Updating

We do not include MLIR (llvm) as a submodule, because this would cause Swift Pacakge Manager to pull in all of LLVM in any project depending on MLIRSwift. Instead, we store the hash we care about in `Tools/llvm-commit` file, update this file to a new commit to update MLIR. Note that this file _must_ be a hash and not a branch like `main`, since the contents of this file is used to cache the LLVM build on GitHub Actions. 

### Using an external MLIR checkout

You can point use your own local version of MLIR in a number of ways, the most flexible is simply to install a custom "LLVM-for-Swift.pc" file that points to your locally built version (consult `Tools/build-dependencies` for an example). A simpler option may be to run `Tools/build-dependencies` with the environment variable `LLVM_REPO` set to `"local"`, and `LLVM_REPO_PATH` set to the path to the repo you want to use. There are a number of other knobs you can turn in `Tools/build-dependencies` to customize this approach.


