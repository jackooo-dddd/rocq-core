import SpecFloatMaskSupport
noncomputable section
namespace NativeBridge.Incremental.SpecFloatExponent
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.SpecFloatMaskSupport
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower

theorem zPositive (p : RPositive) : binaryIntTo (.Zpos p) = (positiveTo p : Int) := rfl

def grow (m : {n : Nat // 0<n}) (k : Nat) : {n : Nat // 0<n} :=
  ⟨2^k*m.val,Nat.mul_pos (Nat.two_pow_pos k) m.property⟩
theorem grow_agrees (m : RPositive) (k : RIntBinary) :
    positiveIso.to (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
      Rocq.Corelib.Numbers.BinNums.positive.xO m (Rocq.Corelib.BinNums.IntDef.Z.to_pos k)) =
    grow (positiveIso.to m) (max 1 (binaryIntTo k).toNat) := by
  apply Subtype.ext
  change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
    Rocq.Corelib.Numbers.BinNums.positive.xO m (Rocq.Corelib.BinNums.IntDef.Z.to_pos k)) = _
  rw [positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,
    repeatDouble,positiveClamp_agrees]
  rfl

def maximum (prec emax : Int) : nativeSpec :=
  .finite false ⟨max 1 (2^(max 1 prec.toNat)-1),by omega⟩ (emax-prec)
theorem maximum_agrees (prec emax : RIntBinary) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFmax_float prec emax) = maximum (binaryIntTo prec) (binaryIntTo emax) := by
  have hm := subtractOne_agrees (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
    Rocq.Corelib.Numbers.BinNums.positive.xO .xH (Rocq.Corelib.BinNums.IntDef.Z.to_pos prec))
  rw [positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,
    repeatDouble,positiveClamp_agrees,positiveTo_xH,Nat.mul_one] at hm
  have hs : positiveIso.to (Rocq.Corelib.BinNums.PosDef.Pos.sub
    (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive Rocq.Corelib.Numbers.BinNums.positive.xO
      .xH (Rocq.Corelib.BinNums.IntDef.Z.to_pos prec)) .xH) =
      (⟨max 1 (2^(max 1 (binaryIntTo prec).toNat)-1),by omega⟩ : {n : Nat // 0<n}) :=
    Subtype.ext hm
  change SpecValue.finite false _ (binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub emax prec)) = _
  rw [hs,z_sub_agrees]
  rfl

def fraction (prec emax : Int) (x : nativeSpec) : nativeSpec × Int :=
  match x with
  | .finite s m e =>
    let digits : Int := positiveDigits m.val
    if prec≤digits then (.finite s m (-prec),e+prec)
    else
      let d := prec-digits
      (.finite s (grow m (max 1 d.toNat)) (-prec),e+prec-d)
  | _ => (x, -2*emax-prec)
def specPairTo (p : Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Floats.SpecFloat.spec_float RIntBinary) :
    nativeSpec × Int :=
  let q := prodTo p
  (specTo q.1,binaryIntTo q.2)
theorem fraction_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specPairTo (Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x) =
      fraction (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s =>
    change (specTo (.S754_zero s),binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zneg (.xO .xH)) emax) prec)) = _
    rw [z_sub_agrees,z_mul_agrees]
    rfl
  | S754_infinity s =>
    change (specTo (.S754_infinity s),binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zneg (.xO .xH)) emax) prec)) = _
    rw [z_sub_agrees,z_mul_agrees]
    rfl
  | S754_nan =>
    change (specTo .S754_nan,binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.sub
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zneg (.xO .xH)) emax) prec)) = _
    rw [z_sub_agrees,z_mul_agrees]
    rfl
  | S754_finite s m e =>
    unfold Rocq.Corelib.Floats.SpecFloat.SFfrexp
    rw [choose_map specPairTo,z_leb_agrees]
    simp only [specPairTo,prodTo,specTo]
    rw [grow_agrees,z_sub_agrees,z_add_agrees,z_opp_agrees,z_sub_agrees]
    change (if decide (binaryIntTo prec ≤ (positiveTo (Rocq.Corelib.Floats.SpecFloat.digits2_pos m) : Int)) then _ else _) = _
    simp only [z_sub_agrees,z_add_agrees,zPositive,positiveDigits_agrees,decide_eq_true_eq]
    rfl

def unitInLastPlace (prec emax : Int) (x : nativeSpec) : nativeSpec :=
  scale prec emax (one prec emax) (exponent prec emax (fraction prec emax x).2)
theorem unitInLastPlace_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFulp prec emax x) =
      unitInLastPlace (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  have hs := congrArg Prod.snd (fraction_agrees prec emax x)
  have he : binaryIntTo (Rocq.Corelib.Init.Datatypes.snd _ _
    (Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x)) =
      (fraction (binaryIntTo prec) (binaryIntTo emax) (specTo x)).2 := by
    cases h : Rocq.Corelib.Floats.SpecFloat.SFfrexp prec emax x with
    | pair a b => simpa [h,specPairTo,prodTo,Rocq.Corelib.Init.Datatypes.snd] using hs
  unfold Rocq.Corelib.Floats.SpecFloat.SFulp
  rw [scale_agrees,one_agrees,exponent_agrees,he]
  rfl
end NativeBridge.Incremental.SpecFloatExponent

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
  for name in ["NativeBridge.Incremental.SpecFloatExponent.fraction", "NativeBridge.Incremental.SpecFloatExponent.maximum", "NativeBridge.Incremental.SpecFloatExponent.unitInLastPlace"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
