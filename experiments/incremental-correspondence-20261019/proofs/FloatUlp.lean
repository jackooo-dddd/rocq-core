import FloatUlpSupport
set_option autoImplicit false
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.FloatUlp
open NativeBridge FloatOperations PrimFloatRepresentation
def ulp (x : nativeFloat) : nativeFloat := unitInLastPlace x
theorem ulp_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.FloatOps.ulp x) = ulp (floatTo x) := by
  have h := congrArg Prod.snd (fraction_agrees x)
  cases he : Rocq.Corelib.Floats.FloatOps.Z.frexp x with
  | pair f e =>
    simp only [he,FloatOperations.fractionTo] at h
    unfold Rocq.Corelib.Floats.FloatOps.ulp
    rw [scale_agrees,one_agrees,SpecFloatRounding.exponent_agrees,precision_agrees,maximumExponent_agrees]
    simp only [he,Rocq.Corelib.Init.Datatypes.snd]
    change scale one (SpecFloatRounding.exponent precision maximumExponent (binaryIntTo e)) = _
    rw [h]
    rfl
end NativeBridge.Incremental.FloatUlp

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
  for name in ["NativeBridge.Incremental.FloatUlp.ulp"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
