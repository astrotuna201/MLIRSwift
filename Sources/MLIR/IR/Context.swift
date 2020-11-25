
import CMLIR

public struct Context: MlirStructWrapper {
    public init(dialects: [Dialect]) {
        c = mlirContextCreate()
        for dialect in dialects {
            dialect.register(c)
        }
    }
    public func destroy() { mlirContextDestroy(c) }
    init(c: MlirContext) {
        self.c = c
    }
    let c: MlirContext
}

