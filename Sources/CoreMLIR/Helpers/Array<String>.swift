/**
 This file is autogenerated by
 ```
 $ pushd Utilities/BoilerplateGenerator
 $ swift run GenerateArrayStringsHelper > "../../Sources/CoreMLIR/Helpers/Array<String>.swift"
 $ popd
 ```
 */

import CCoreMLIR

extension Array where Element == String {
  /**
   In Swift, there is no easy way use closure-scoped APIs like `withUTF8` on an array of values. This method bridges the gap for `MlirStringRef`, providing a fast path for up to 10 strings and a fallback path for larger arrays.
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
    case 4:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try body([s0, s1, s2, s3])
            }
          }
        }
      }
    case 5:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try self[4].withUnsafeMlirStringRef { s4 in
                try body([s0, s1, s2, s3, s4])
              }
            }
          }
        }
      }
    case 6:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try self[4].withUnsafeMlirStringRef { s4 in
                try self[5].withUnsafeMlirStringRef { s5 in
                  try body([s0, s1, s2, s3, s4, s5])
                }
              }
            }
          }
        }
      }
    case 7:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try self[4].withUnsafeMlirStringRef { s4 in
                try self[5].withUnsafeMlirStringRef { s5 in
                  try self[6].withUnsafeMlirStringRef { s6 in
                    try body([s0, s1, s2, s3, s4, s5, s6])
                  }
                }
              }
            }
          }
        }
      }
    case 8:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try self[4].withUnsafeMlirStringRef { s4 in
                try self[5].withUnsafeMlirStringRef { s5 in
                  try self[6].withUnsafeMlirStringRef { s6 in
                    try self[7].withUnsafeMlirStringRef { s7 in
                      try body([s0, s1, s2, s3, s4, s5, s6, s7])
                    }
                  }
                }
              }
            }
          }
        }
      }
    case 9:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try self[4].withUnsafeMlirStringRef { s4 in
                try self[5].withUnsafeMlirStringRef { s5 in
                  try self[6].withUnsafeMlirStringRef { s6 in
                    try self[7].withUnsafeMlirStringRef { s7 in
                      try self[8].withUnsafeMlirStringRef { s8 in
                        try body([s0, s1, s2, s3, s4, s5, s6, s7, s8])
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    case 10:
      return try self[0].withUnsafeMlirStringRef { s0 in
        try self[1].withUnsafeMlirStringRef { s1 in
          try self[2].withUnsafeMlirStringRef { s2 in
            try self[3].withUnsafeMlirStringRef { s3 in
              try self[4].withUnsafeMlirStringRef { s4 in
                try self[5].withUnsafeMlirStringRef { s5 in
                  try self[6].withUnsafeMlirStringRef { s6 in
                    try self[7].withUnsafeMlirStringRef { s7 in
                      try self[8].withUnsafeMlirStringRef { s8 in
                        try self[9].withUnsafeMlirStringRef { s9 in
                          try body([s0, s1, s2, s3, s4, s5, s6, s7, s8, s9])
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    default:
      /// Slow path
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
