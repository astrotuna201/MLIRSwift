
# Builds a docker image which can be used to test this project on Linux
# Example use:
# $ docker build -t mlir-swift Tools/Docker
# $ docker run --rm -ti -v $(pwd):/project -w /project mlir-swift

# This project is also setup to work with VSCode remote containers: https://code.visualstudio.com/docs/remote/containers
# Simply open this project in VSCode with the "Remote Containers" extension installed, and it should provide you the option of reopening the project inside a container.

# You can also build an image with a different swift toolchain toolchain like so:
# $ docker build -t mlir-swift Tools/Docker --build-arg image=swiftlang/swift:nightly-focal

ARG image=swift:5.4-focal
FROM $image

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    git \
    libncurses5-dev \
    ninja-build \
    python3

# We want Linux build artifacts to be able to coexist with macOS, but we would like them to share an LLVM checkout
ENV WORKSPACE_ROOT="/workspaces/MLIRSwift"
ENV DEPENDENCIES_ROOT="$WORKSPACE_ROOT/.dependencies/linux"
ENV LLVM_REPO_PATH="$WORKSPACE_ROOT/.dependencies/llvm-repo"
ENV PKG_CONFIG_PATH="$DEPENDENCIES_ROOT/installed"

# Add tools to path
ENV PATH="$WORKSPACE_ROOT/Tools:${PATH}"
