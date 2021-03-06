import CMLIR

/**
 A representation of an MLIR type that is independent of a context
 */
public protocol ContextualType: ContextualAttribute {
  func `in`(_ context: Context) -> Type
}

/**
 Swift representation of an `MlirType`

 - note: The type-name `Type` is awkward because it conflicts with Swift's built-in `Type` type which represent the metatype of a given type. This can be disambiguated with backtics, which we think is preferrable to calling this type something else (like `MLIRType`).
 */
public struct Type: ContextualType, MlirRepresentable {

  public init(_ mlir: MlirType) {
    self.init(mlir: mlir)
  }
  public let mlir: MlirType

  /**
   Type implements `ContextualType`, but requires that `context`be the context owning this type.
   */
  public func `in`(_ context: Context) -> Type {
    precondition(context == self.context)
    return self
  }

  /**
   The context which owns this type
   */
  public var context: UnownedContext {
    UnownedContext(mlirTypeGetContext(mlir))
  }

  /// Suppress synthesized initializer
  private init() { fatalError() }
}

// MARK: - Attributes

extension ContextualType {
  /**
   Types can be used as attributes
   */
  public func `in`(_ context: Context) -> Attribute {
    Attribute(mlirTypeAttrGet(self.in(context).mlir))
  }
}

// MARK: - Equality

extension Type: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    mlirTypeEqual(lhs.mlir, rhs.mlir)
  }
}

/**
 Types can be equated with contextual types

 - note: This operation is defined on optionals so we get optional comparisons as well
 */
public func == (lhs: ContextualType?, rhs: Type?) -> Bool {
  switch (lhs, rhs) {
  case (.none, .none): return true
  case (.some, .none), (.none, .some): return false
  case let (lhs?, rhs?):
    return lhs.in(rhs.context) == rhs
  }
}

public func == (lhs: Type?, rhs: ContextualType?) -> Bool {
  rhs == lhs
}
