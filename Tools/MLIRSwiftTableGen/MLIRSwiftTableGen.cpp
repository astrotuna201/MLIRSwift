#include "mlir/TableGen/GenInfo.h"
#include "mlir/TableGen/GenNameParser.h"
#include "mlir/TableGen/Operator.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/Signals.h"
#include "llvm/TableGen/Error.h"
#include "llvm/TableGen/Main.h"
#include "llvm/TableGen/Record.h"
#include "llvm/TableGen/TableGenBackend.h"

using namespace llvm;
using namespace mlir;
using namespace mlir::tblgen;

/**
 This currently does not do anything overly interesting. It is meant to be a placeholder demonstrating how we could utilize MLIR TableGen if we chose to do so. 
 */
static bool MlirSwiftTableGenMain(raw_ostream &os, RecordKeeper &records) { 
  json::Array operations;
  for (const llvm::Record *rec : records.getAllDerivedDefinitions("Op")) {
    Operator op(rec);
    json::Object obj;

    obj["dialectName"] = op.getDialect().getName();
    obj["operationName"] = op.getOperationName();
    obj["numOperands"] = op.getNumOperands();
    obj["summary"] = op.getSummary();
    operations.push_back(std::move(obj));
  }

  json::Array types;
  for (const llvm::Record *rec : records.getAllDerivedDefinitions("Type")) {
    Type type(rec);
    json::Object obj;

    obj["description"] = type.getDescription();
    obj["cppClassName"] = type.getCPPClassName();
    obj["summary"] = type.getSummary();
    types.push_back(std::move(obj));
  }


  json::Object root;
  root["operations"] = std::move(operations);
  root["types"] = std::move(types);
  os << formatv("{0:2}", json::Value(std::move(root))) << "\n";
  return false;
}

int main(int argc, char **argv) {
  printf("Hello, World!\n");
  llvm::InitLLVM y(argc, argv);
  cl::ParseCommandLineOptions(argc, argv);
  return TableGenMain(argv[0], &MlirSwiftTableGenMain);
}