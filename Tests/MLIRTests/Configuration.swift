
import MLIR

enum Test:
    MLIRConfiguration,
    ProvidesStandardDialect
{
    static let context = Context(dialects: [.standard])
}

extension Type where MLIR: ProvidesStandardDialect {
    static var memref_x32: Type { try! Type(parsing: "memref<?xf32>") }
    static var index: Type { try! Type(parsing: "index") }
}

enum MemRef<MLIR: ProvidesStandardDialect>: TypeClass {
    static var type: Type<MLIR> { .memref_x32 }
}
