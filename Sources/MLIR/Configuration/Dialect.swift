
import CMLIR

public extension MLIRConfiguration {
  typealias RegisteredDialect = MLIR.RegisteredDialect<Self>
  typealias RegisteredDialects = _RegisteredDialects<Self>
}

public struct RegisteredDialect<MLIR: MLIRConfiguration> {
  public var namespace: String {
    assert(isRegistered)
    return dialect.getNamespace().string
  }
  func register(with context: MLIR.Context) {
    dialect.register(context.borrowedValue())
  }
  fileprivate let dialect: Dialect
  private var isRegistered: Bool { !dialect.load(MLIR.ctx).isNull }
}

/**
 I'm not sure why, but Swift was getting confused between `RegisteredDialect<T>` and the typealias `RegisteredDialect` in `MLIRConfiguration` (Which is curious, because it handles `Context` fine). It is likely overkill, but I added this type so that the resolution works correctly but dialect authors can still write `extension RegisteredDialect`.
 */
public struct _RegisteredDialects<MLIR: MLIRConfiguration>: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: MLIR.RegisteredDialect...) {
    self.elements = elements
  }
  let elements: [MLIR.RegisteredDialect]
}

/**
 Libraries implementing or bridging dialects should create a private instance of this type which they use to create `RegisteredDialect`s through a `ProvidesFooDialect` refinement of the `MLIRConfiguration` protocol. An example of this can be seen in [the Standard dialect](../MLIRStandard/Standard.swift).
 */
public struct Dialect {
  /**
   In the future, we hope the C bindings will provide a type that encapsulates this data
   */
  public init(
    register: @escaping (MlirContext) -> Void,
    load: @escaping (MlirContext) -> MlirDialect,
    getNamespace: @escaping () -> MlirStringRef)
  {
    self.register = register
    self.load = load
    self.getNamespace = getNamespace
  }
  public func registeredDialect<MLIR: MLIRConfiguration>() -> RegisteredDialect<MLIR> {
    return RegisteredDialect(dialect: self)
  }
  fileprivate let getNamespace: () -> MlirStringRef
  fileprivate let register: (MlirContext) -> Void
  fileprivate let load: (MlirContext) -> MlirDialect
}

extension MlirDialect: Bridged {
  static let areEqual = mlirDialectEqual
  static let isNull = mlirDialectIsNull
}