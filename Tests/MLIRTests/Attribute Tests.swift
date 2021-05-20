import CMLIR
import XCTest

@testable import MLIR

final class AttributeTests: XCTestCase {
  func testAttributes() throws {
    let context = MLIR.OwnedContext()

    func test(
      _ source: String,
      parsesAs attribute: ContextualAttribute,
      file: StaticString = #filePath, line: UInt = #line
    ) {
      do {
        let parsed = try context.parse(source, as: Attribute.self)
        XCTAssertEqual(parsed, attribute.in(context), file: file, line: line)
      } catch {
        XCTFail(file: file, line: line)
      }
    }

    test(#""foo""#, parsesAs: "foo")

    test(
      #"["foo", "bar"]"#,
      parsesAs: ["foo", "bar"])
    test(
      #"{foo = "bar"}"#,
      parsesAs: ["foo": "bar"])
  }
}
