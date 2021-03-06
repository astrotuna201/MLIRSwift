import XCTest

@testable import MLIR

final class TypeTests: XCTestCase {
  func testInteger() {
    let context = MLIR.OwnedContext()

    func test(
      _ source: String,
      parsesAs type: ContextualType,
      file: StaticString = #filePath, line: UInt = #line
    ) {
      do {
        let parsed = try context.parse(source, as: Type.self)
        XCTAssertEqual(parsed, type.in(context), file: file, line: line)
      } catch {
        XCTFail(file: file, line: line)
      }
    }

    test("i1", parsesAs: IntegerType.integer(bitWidth: 1))
    test("si1", parsesAs: IntegerType.integer(.signed, bitWidth: 1))
    test("ui1", parsesAs: IntegerType.integer(.unsigned, bitWidth: 1))
    test(
      "memref<?xf32>",
      parsesAs: MemoryReferenceType.memoryReference(
        to: Float32Type.float32, withDimensions: [.dynamic],
        inMemorySpace: .integer(0, bitWidth: 64)))
  }
}
