# This project is meant to compile as part of the LLVM build using LLVM_EXTERNAL_PROJECTS
# See `build-dependencies` for more details

add_definitions(${LLVM_DEFINITIONS})
set(MLIR_MAIN_SRC_DIR ${LLVM_MAIN_SRC_DIR}/../mlir/include ) # --src-root
set(MLIR_INCLUDE_DIR ${LLVM_MAIN_SRC_DIR}/../mlir/include ) # --includedir
set(MLIR_TABLEGEN_OUTPUT_DIR ${CMAKE_BINARY_DIR}/tools/mlir/include)
include_directories(${MLIR_INCLUDE_DIR})
include_directories(${MLIR_TABLEGEN_OUTPUT_DIR})

# Sources
set(LLVM_LINK_COMPONENTS
  Demangle
  Support
  TableGen)
file(GLOB sources *.cpp)
add_tablegen(mlirswift-tblgen MLIR ${sources})
target_link_libraries(mlirswift-tblgen
  PRIVATE
  MLIRSupportIndentedOstream
  MLIRTableGen)
mlir_check_all_link_libraries(mlirswift-tblgen)
