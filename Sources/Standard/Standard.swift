import CStandard
import MLIR

extension Dialect {
  public static let std = Dialect(mlirGetDialectHandle__std__())
}
