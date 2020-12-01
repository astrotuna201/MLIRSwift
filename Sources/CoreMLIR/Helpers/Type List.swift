
/**
 This file is autogenerated by
 ```
 $ pushd Utilities/BoilerplateGenerator
 $ swift run GenerateTypeList > ../../Sources/CoreMLIR/Helpers/Type\ List.swift
 $ popd
 ```
 */

/**
 `TypeList` provides a limited implementation of variadic generics for MLIR types. It enables the creation of a `Values` object which represents values of the types the represented by this `TypeList`. Under the hood, we just provide initializer for up to N types, similar to how the standard library does for Tuples.
 */
public struct TypeList<MLIR: MLIRConfiguration, Values, Members: MemberCollection, Builder>
where
  Members.Index == Int,
  Members.Element  == Value
{
  let types: [MLIR.`Type`]
  func values(from base: Members.Base, with Builder: Builder) -> Values {
    getValues(base, Builder)
  }
  private let getValues: (Members.Base, Builder) -> Values
}

extension TypeList where Builder == Void {
  func values(from base: Members.Base) -> Values {
    values(from: base, with: ())
  }
}

// MARK: - Trivial Initializers

public extension TypeList where Builder == Void, Values == Void {
  static var none: Self { Self() }
  init() {
    types = []
    getValues = { _, _ in () }
  }
}

public extension TypeList where Builder: _BuilderProtocol, Values == Builder {
  static var none: Self { Self() }
  init() {
    types = []
    getValues = { _, arg in arg }
  }
}

// MARK: - Dynamic Initializers

public extension TypeList where Builder == Void, Values == Members {
  init(_ types: [MLIR.`Type`])  {
    self.types = types
    self.getValues = { base, _ in base[keyPath: Members.keyPath] }
  }
}

public extension TypeList where Builder == _BuilderProtocol, Values == (Builder, Members) {
  init(_ types: [MLIR.`Type`])  {
    self.types = types
    self.getValues = { base, arg in (arg, base[keyPath: Members.keyPath]) }
  }
}

// MARK: - Variadic Initializers

public extension TypeList {
  // 1 arbitrary types
  init(
    _ t0: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value)
  {
    types = [t0]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0])
    }
  }
  
  // 1 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value)
  {
    types = [t0]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0])
    }
  }
  
  // 1 specific types
  init<T0: TypeClass>(
    _ t0: T0.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    Values == (TypedValue<T0>)
  {
    types = [t0.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]))
    }
  }
  
  // 1 specific types, with a builder
  init<T0: TypeClass>(
    _ t0: T0.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>)
  {
    types = [t0.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]))
    }
  }
  
  // 2 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value)
  {
    types = [t0, t1]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1])
    }
  }
  
  // 2 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value)
  {
    types = [t0, t1]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1])
    }
  }
  
  // 2 specific types
  init<T0: TypeClass, T1: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>)
  {
    types = [t0.type, t1.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]))
    }
  }
  
  // 2 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>)
  {
    types = [t0.type, t1.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]))
    }
  }
  
  // 3 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value)
  {
    types = [t0, t1, t2]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2])
    }
  }
  
  // 3 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value)
  {
    types = [t0, t1, t2]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2])
    }
  }
  
  // 3 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>)
  {
    types = [t0.type, t1.type, t2.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]))
    }
  }
  
  // 3 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>)
  {
    types = [t0.type, t1.type, t2.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]))
    }
  }
  
  // 4 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3])
    }
  }
  
  // 4 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3])
    }
  }
  
  // 4 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>)
  {
    types = [t0.type, t1.type, t2.type, t3.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]))
    }
  }
  
  // 4 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>)
  {
    types = [t0.type, t1.type, t2.type, t3.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]))
    }
  }
  
  // 5 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3], values[4])
    }
  }
  
  // 5 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3], values[4])
    }
  }
  
  // 5 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]))
    }
  }
  
  // 5 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]))
    }
  }
  
  // 6 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3], values[4], values[5])
    }
  }
  
  // 6 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3], values[4], values[5])
    }
  }
  
  // 6 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]))
    }
  }
  
  // 6 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]))
    }
  }
  
  // 7 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3], values[4], values[5], values[6])
    }
  }
  
  // 7 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3], values[4], values[5], values[6])
    }
  }
  
  // 7 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]))
    }
  }
  
  // 7 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]))
    }
  }
  
  // 8 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>,
    _ t7: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6, t7]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7])
    }
  }
  
  // 8 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>,
    _ t7: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6, t7]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7])
    }
  }
  
  // 8 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass, T7: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type,
    _ t7: T7.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    T7.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>,TypedValue<T7>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type, t7.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]), TypedValue(value: values[7]))
    }
  }
  
  // 8 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass, T7: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type,
    _ t7: T7.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    T7.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>,TypedValue<T7>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type, t7.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]), TypedValue(value: values[7]))
    }
  }
  
  // 9 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>,
    _ t7: Type<MLIR>,
    _ t8: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6, t7, t8]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8])
    }
  }
  
  // 9 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>,
    _ t7: Type<MLIR>,
    _ t8: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6, t7, t8]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8])
    }
  }
  
  // 9 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass, T7: TypeClass, T8: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type,
    _ t7: T7.Type,
    _ t8: T8.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    T7.MLIR == MLIR,
    T8.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>,TypedValue<T7>,TypedValue<T8>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type, t7.type, t8.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]), TypedValue(value: values[7]), TypedValue(value: values[8]))
    }
  }
  
  // 9 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass, T7: TypeClass, T8: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type,
    _ t7: T7.Type,
    _ t8: T8.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    T7.MLIR == MLIR,
    T8.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>,TypedValue<T7>,TypedValue<T8>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type, t7.type, t8.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]), TypedValue(value: values[7]), TypedValue(value: values[8]))
    }
  }
  
  // 10 arbitrary types
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>,
    _ t7: Type<MLIR>,
    _ t8: Type<MLIR>,
    _ t9: Type<MLIR>)
  where
    Builder == Void,
    Values == (Value, Value, Value, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6, t7, t8, t9]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9])
    }
  }
  
  // 10 arbitrary types, with a builder
  init(
    _ t0: Type<MLIR>,
    _ t1: Type<MLIR>,
    _ t2: Type<MLIR>,
    _ t3: Type<MLIR>,
    _ t4: Type<MLIR>,
    _ t5: Type<MLIR>,
    _ t6: Type<MLIR>,
    _ t7: Type<MLIR>,
    _ t8: Type<MLIR>,
    _ t9: Type<MLIR>)
  where
    Builder: _BuilderProtocol,
    Values == (Builder, Value, Value, Value, Value, Value, Value, Value, Value, Value, Value)
  {
    types = [t0, t1, t2, t3, t4, t5, t6, t7, t8, t9]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9])
    }
  }
  
  // 10 specific types
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass, T7: TypeClass, T8: TypeClass, T9: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type,
    _ t7: T7.Type,
    _ t8: T8.Type,
    _ t9: T9.Type)
  where
    Builder == Void,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    T7.MLIR == MLIR,
    T8.MLIR == MLIR,
    T9.MLIR == MLIR,
    Values == (TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>,TypedValue<T7>,TypedValue<T8>,TypedValue<T9>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type, t7.type, t8.type, t9.type]
    getValues = { base, _ in
      let values = base[keyPath: Members.keyPath]
      return (TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]), TypedValue(value: values[7]), TypedValue(value: values[8]), TypedValue(value: values[9]))
    }
  }
  
  // 10 specific types, with a builder
  init<T0: TypeClass, T1: TypeClass, T2: TypeClass, T3: TypeClass, T4: TypeClass, T5: TypeClass, T6: TypeClass, T7: TypeClass, T8: TypeClass, T9: TypeClass>(
    _ t0: T0.Type,
    _ t1: T1.Type,
    _ t2: T2.Type,
    _ t3: T3.Type,
    _ t4: T4.Type,
    _ t5: T5.Type,
    _ t6: T6.Type,
    _ t7: T7.Type,
    _ t8: T8.Type,
    _ t9: T9.Type)
  where
    Builder: _BuilderProtocol,
    T0.MLIR == MLIR,
    T1.MLIR == MLIR,
    T2.MLIR == MLIR,
    T3.MLIR == MLIR,
    T4.MLIR == MLIR,
    T5.MLIR == MLIR,
    T6.MLIR == MLIR,
    T7.MLIR == MLIR,
    T8.MLIR == MLIR,
    T9.MLIR == MLIR,
    Values == (Builder, TypedValue<T0>,TypedValue<T1>,TypedValue<T2>,TypedValue<T3>,TypedValue<T4>,TypedValue<T5>,TypedValue<T6>,TypedValue<T7>,TypedValue<T8>,TypedValue<T9>)
  {
    types = [t0.type, t1.type, t2.type, t3.type, t4.type, t5.type, t6.type, t7.type, t8.type, t9.type]
    getValues = { base, Builder in
      let values = base[keyPath: Members.keyPath]
      return (Builder, TypedValue(value: values[0]), TypedValue(value: values[1]), TypedValue(value: values[2]), TypedValue(value: values[3]), TypedValue(value: values[4]), TypedValue(value: values[5]), TypedValue(value: values[6]), TypedValue(value: values[7]), TypedValue(value: values[8]), TypedValue(value: values[9]))
    }
  }
  
}
