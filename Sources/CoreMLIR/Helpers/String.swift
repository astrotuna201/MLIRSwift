
import CCoreMLIR

/**
 This file contains convenience functions for mapping between `MlirStringRef` and Swift strings.
 */

extension MlirStringRef {
  var buffer: UnsafeBufferPointer<Int8> {
    UnsafeBufferPointer(start: data, count: length)
  }
  var string: String {
    buffer.withMemoryRebound(to: UInt8.self) {
      String(bytes: $0, encoding: .utf8)!
    }
  }
}

extension String {
  func withUnsafeMlirStringRef<T>(_ body: (MlirStringRef) throws -> T) rethrows -> T {
    var string = self
    return try string.withUTF8 {
      try $0.withMemoryRebound(to: Int8.self) {
        try body(mlirStringRefCreate($0.baseAddress, $0.count))
      }
    }
  }
  
}

extension StaticString {
  func withUnsafeMlirStringRef<T>(_ body: (MlirStringRef) -> T) -> T {
    return withUTF8Buffer {
      $0.withMemoryRebound(to: Int8.self) {
        body(mlirStringRefCreate($0.baseAddress, $0.count))
      }
    }
  }
}

extension Array where Element == String {
  /**
   In Swift, there is no easy way use closure-scoped APIs like `withUTF8` on an array of values. This method bridges the gap for `MlirStringRef`.
   */
  func withUnsafeMlirStringRefs<T>(_ body: ([MlirStringRef]) throws -> T) rethrows -> T {
    switch count {
    case 0:
      return try body([])
    case 1:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try body([s0])
      }
    case 2:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try body([s0, s1])
        }
      }
    case 3:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try body([s0, s1, s2])
          }
        }
      }
    default:
      var buffers: [UnsafeMutableBufferPointer<Int8>] = []
      for string in self {
        var mutableString = string
        mutableString.withUTF8 { originalBuffer in
          let buffer = UnsafeMutableBufferPointer<Int8>
            .allocate(capacity: originalBuffer.count)
          originalBuffer.copyBytes(to: buffer)
          buffers.append(buffer)
        }
      }
      defer {
        buffers.forEach { $0.deallocate() }
      }
      return try body(buffers.map { mlirStringRefCreate($0.baseAddress, $0.count) })
    }
  }
}