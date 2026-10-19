import FloatOperations
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.Float64Operations
open NativeBridge SpecFloatRepresentation FloatOperations
def addition (x y : nativeSpec) : nativeSpec := SpecFloatArithmetic.addition precision maximumExponent x y
theorem addition_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64add x y) = addition (specTo x) (specTo y) :=
  SpecFloatArithmetic.addition_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x y
def subtraction (x y : nativeSpec) : nativeSpec := SpecFloatArithmetic.subtraction precision maximumExponent x y
theorem subtraction_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64sub x y) = subtraction (specTo x) (specTo y) :=
  SpecFloatArithmetic.subtraction_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x y
def multiplication (x y : nativeSpec) : nativeSpec := SpecFloatArithmetic.multiplication precision maximumExponent x y
theorem multiplication_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64mul x y) = multiplication (specTo x) (specTo y) :=
  SpecFloatArithmetic.multiplication_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x y
def division (x y : nativeSpec) : nativeSpec := SpecFloatDivision.division precision maximumExponent x y
theorem division_agrees (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64div x y) = division (specTo x) (specTo y) :=
  SpecFloatDivision.division_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x y
def squareRoot (x : nativeSpec) : nativeSpec := SpecFloatSqrt.squareRoot precision maximumExponent x
theorem squareRoot_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64sqrt x) = squareRoot (specTo x) :=
  SpecFloatSqrt.squareRoot_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x
def successor (x : nativeSpec) : nativeSpec := SpecFloatAdjacent.successor precision maximumExponent x
theorem successor_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64succ x) = successor (specTo x) :=
  SpecFloatAdjacent.successor_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x
def predecessor (x : nativeSpec) : nativeSpec := SpecFloatAdjacent.predecessor precision maximumExponent x
theorem predecessor_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.FloatAxioms.SF64pred x) = predecessor (specTo x) :=
  SpecFloatAdjacent.predecessor_agrees Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x

def classification (x : nativeSpec) : Fin 9 := SpecFloatNormalize.classify precision x
theorem classification_agrees (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    floatClassTo (Rocq.Corelib.Floats.FloatAxioms.SF64classify x) = classification (specTo x) :=
  SpecFloatNormalize.classify_agrees Rocq.Corelib.Floats.FloatOps.prec x
def flatten (x : Option Ordering) : Option Ordering := x
theorem flatten_agrees (x : Rocq.Corelib.Init.Datatypes.option RComparison) :
    PrimFloatRepresentation.comparisonTo (Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt x) =
      flatten (SpecFloatComparison.comparisonResultTo x) := by
  cases x with
  | None => rfl
  | Some c => cases c <;> rfl
end NativeBridge.Incremental.Float64Operations

open Lean Meta Elab Command
private partial def indexedNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      let ci ← getConstInfo n
      let body? := match ci with
        | .defnInfo v => some v.value
        | .thmInfo v => some v.value
        | .opaqueInfo v => some v.value
        | _ => none
      if let some body := body? then
        found := found ++ (← indexedNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.Float64Operations.addition", "NativeBridge.Incremental.Float64Operations.classification", "NativeBridge.Incremental.Float64Operations.division", "NativeBridge.Incremental.Float64Operations.flatten", "NativeBridge.Incremental.Float64Operations.multiplication", "NativeBridge.Incremental.Float64Operations.predecessor", "NativeBridge.Incremental.Float64Operations.squareRoot", "NativeBridge.Incremental.Float64Operations.subtraction", "NativeBridge.Incremental.Float64Operations.successor"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
