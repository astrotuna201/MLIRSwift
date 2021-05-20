import CMLIR

// MARK: - String

extension String: ContextualAttribute {
  public func `in`(_ context: Context) -> Attribute {
    Attribute(
      withUnsafeMlirStringRef {
        mlirStringAttrGet(context.mlir, $0)
      })
  }
}

// MARK: - Integer

public struct IntegerAttribute: ContextualAttribute {
  public let type: IntegerType
  public let value: Int
  public func `in`(_ context: Context) -> Attribute {
    Attribute(mlirIntegerAttrGet(type.in(context).mlir, Int64(value)))
  }
}
extension ContextualAttribute where Self == IntegerAttribute {
  public static func integer(
    _ value: Int,
    of type: IntegerType
  ) -> Self {
    IntegerAttribute(type: type, value: value)
  }

  /**
   Convenience constructor for integer attributes
   */
  public static func integer(
    _ value: Int,
    _ signedness: IntegerType.Signedness? = nil, bitWidth: Int
  ) -> Self {
    IntegerAttribute(type: .integer(signedness, bitWidth: bitWidth), value: value)
  }
}

// MARK: - Array

extension Array: ContextualAttribute where Element: ContextualAttribute {
  public func `in`(_ context: Context) -> Attribute {
    map { $0.in(context) }
      .withUnsafeMlirRepresentation { elements in
        Attribute(mlirArrayAttrGet(context.mlir, elements.count, elements.baseAddress))
      }
  }
}

// MARK: - Dictionary

extension Dictionary: ContextualAttribute where Key == String, Value: ContextualAttribute {
  public func `in`(_ context: Context) -> Attribute {
    map { pair in
      ContextualNamedAttribute(
        name: pair.key,
        attribute: pair.value
      )
      .in(context)
    }
    .withUnsafeMlirRepresentation { elements in
      Attribute(mlirDictionaryAttrGet(context.mlir, elements.count, elements.baseAddress))
    }
  }
}

public struct DictionaryAttribute: ContextualAttribute {
  public let elements: [ContextualNamedAttributeProtocol]
  public func `in`(_ context: Context) -> Attribute {
    elements
      .map { $0.in(context) }
      .withUnsafeMlirRepresentation { elements in
        Attribute(mlirDictionaryAttrGet(context.mlir, elements.count, elements.baseAddress))
      }
  }
}
public extension ContextualAttribute where Self == DictionaryAttribute {
  static func dictionary(_ elements: [ContextualNamedAttributeProtocol]) -> Self {
    DictionaryAttribute(elements: elements)
  }
  static func dictionary(_ elements: ContextualNamedAttributeProtocol...) -> Self {
    DictionaryAttribute(elements: elements)
  }
}

// MARK: - Flat Symbol Reference

public struct FlatSymbolReferenceAttribute: ContextualAttribute {
  public let name: String
  public func `in`(_ context: Context) -> Attribute {
    name.withUnsafeMlirStringRef {
      Attribute(mlirFlatSymbolRefAttrGet(context.mlir, $0))
    }
  }
}
public extension
  ContextualAttribute where Self == FlatSymbolReferenceAttribute
{
  static func flatSymbolReference(_ name: String) -> Self {
    FlatSymbolReferenceAttribute(name: name)
  }
}
