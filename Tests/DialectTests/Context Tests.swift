import Dialects
import MLIR
import XCTest

final class ContextTests: XCTestCase {
  func testUnregisteredDialects() {
    /// Disallow unregistered dialects
    do {
      let context = OwnedContext()
      let location: Location = .unknown(in: context)
      let module = Module(location: location)
      let diagnostics = context.collectDiagnostics {
        module.body.operations.append(Operation(.std, "unregistered", location: location))
        XCTAssertFalse(module.operation.isValid)
      }
      XCTAssertFalse(diagnostics.isEmpty)
    }

    /// Allow unregistered dialects
    do {
      let context = OwnedContext(allowUnregisteredDialects: true)
      let location: Location = .unknown(in: context)
      let module = Module(location: location)
      let diagnostics = context.collectDiagnostics {
        module.body.operations.append(Operation(.std, "unregistered", location: location))
        XCTAssertTrue(module.operation.isValid)
      }
      XCTAssertTrue(diagnostics.isEmpty)
    }
  }
}
