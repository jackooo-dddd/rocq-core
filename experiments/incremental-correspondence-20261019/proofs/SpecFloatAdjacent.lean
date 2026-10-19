import SpecFloatExponent
import SpecFloatArithmetic
noncomputable section
namespace NativeBridge.Incremental.SpecFloatAdjacent
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.SpecFloatExponent NativeBridge.Incremental.SpecFloatArithmetic
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower
open NativeBridge.Incremental.SpecFloatMaskSupport

theorem fractionExponent (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    binaryIntTo (Rocq.Corelib.Init.Datatypes.snd _ _
      (Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x)) =
      (fraction (binaryIntTo prec) (binaryIntTo emax) (specTo x)).2 := by
  have h := congrArg Prod.snd (fraction_agrees prec emax x)
  cases hx : Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x with
  | pair a b => simpa [hx,specPairTo,prodTo,Rocq.Corelib.Init.Datatypes.snd] using h
theorem boundaryTest (m : RPositive) (prec : RIntBinary) :
    boolTo (Rocq.Corelib.BinNums.PosDef.Pos.eqb (.xO m)
      (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive Rocq.Corelib.Numbers.BinNums.positive.xO
        .xH (Rocq.Corelib.BinNums.IntDef.Z.to_pos prec))) =
    (2*positiveTo m == 2^(max 1 (binaryIntTo prec).toNat)) := by
  rw [positive_eqb_agrees,positiveTo_xO,
    positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,
    repeatDouble,positiveClamp_agrees,positiveTo_xH,Nat.mul_one]

def predecessorPositive (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  match x with
  | .finite _ m _ =>
    let step := if 2*m.val == 2^(max 1 prec.toNat) then
      scale prec emax (one prec emax) (exponent prec emax ((fraction prec emax x).2-1))
      else unitInLastPlace prec emax x
    subtraction prec emax x step
  | _ => x
theorem predecessorPositive_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFpred_pos prec emax x) =
      predecessorPositive (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s => rfl
  | S754_infinity s => rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFpred_pos
    rw [subtraction_agrees,choose_map specTo,boundaryTest]
    rw [scale_agrees,one_agrees,exponent_agrees,z_sub_agrees,fractionExponent,unitInLastPlace_agrees]
    rfl

def successor (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  match x with
  | .zero _ => scale prec emax (one prec emax) (minimumExponent prec emax)
  | .infinity s => if s then negate (maximum prec emax) else x
  | .nan => x
  | .finite s _ _ =>
    if s then negate (predecessorPositive prec emax (negate x))
    else addition prec emax x (unitInLastPlace prec emax x)
theorem successor_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFsucc prec emax x) =
      successor (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFsucc
    rw [scale_agrees,one_agrees,minimumExponent_agrees]
    rfl
  | S754_nan => rfl
  | S754_infinity s =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFsucc
    rw [choose_map specTo,negate_agrees,maximum_agrees]
    rfl
  | S754_finite s m e =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFsucc
    rw [choose_map specTo,negate_agrees,predecessorPositive_agrees,negate_agrees,
      addition_agrees,unitInLastPlace_agrees]
    rfl
def predecessor (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  negate (successor prec emax (negate x))
theorem predecessor_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFpred prec emax x) =
      predecessor (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  unfold Rocq.Corelib.Floats.SpecFloat.SFpred
  rw [negate_agrees,successor_agrees,negate_agrees]
  rfl
end NativeBridge.Incremental.SpecFloatAdjacent

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
  for name in ["NativeBridge.Incremental.SpecFloatAdjacent.predecessor", "NativeBridge.Incremental.SpecFloatAdjacent.predecessorPositive", "NativeBridge.Incremental.SpecFloatAdjacent.successor"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
