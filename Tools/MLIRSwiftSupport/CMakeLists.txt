# This project is meant to compile as part of the LLVM build using LLVM_EXTERNAL_PROJECTS
# See `build-dependencies` for more details

add_definitions(${LLVM_DEFINITIONS})
set(MLIR_MAIN_SRC_DIR ${LLVM_MAIN_SRC_DIR}/../mlir/include ) # --src-root
set(MLIR_INCLUDE_DIR ${LLVM_MAIN_SRC_DIR}/../mlir/include ) # --includedir
set(MLIR_TABLEGEN_OUTPUT_DIR ${CMAKE_BINARY_DIR}/tools/mlir/include)
include_directories(${MLIR_INCLUDE_DIR})
include_directories(${MLIR_TABLEGEN_OUTPUT_DIR})

# Sources
file(GLOB sources *.cpp)
add_llvm_library(MLIRSwiftSupport
    ${sources}
    LINK_LIBS PUBLIC
    MLIRIR
    MLIRCAPI)
    
# Headers
add_custom_target(MLIRSwiftSupport-headers)
install(
    FILES
    # Headers listed here will be installed
    MLIRSwiftSupport.h

    DESTINATION include/MLIRSwiftSupport
    COMPONENT MLIRSwiftSupport-headers)
add_llvm_install_targets(install-MLIRSwiftSupport-headers
    DEPENDS MLIRSwiftSupport-headers
    COMPONENT MLIRSwiftSupport-headers)