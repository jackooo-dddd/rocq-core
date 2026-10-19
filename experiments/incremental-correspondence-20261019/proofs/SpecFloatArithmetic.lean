import SpecFloatNormalize
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatArithmetic
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.SpecFloatShift NativeBridge.Incremental.SpecFloatNormalize
open NativeBridge.Incremental.BinaryInt NativeBridge.Incremental.BinaryArithmetic

theorem minimum_agrees (x y : RIntBinary) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.min x y) = min (binaryIntTo x) (binaryIntTo y) := by
  have h := z_compare_agrees x y
  unfold Rocq.Corelib.BinNums.IntDef.Z.min
  cases hc : Rocq.Corelib.BinNums.IntDef.Z.compare x y <;>
    simp only [hc,comparisonTo] at h ⊢
  all_goals
    have hh := h.symm
    simp only [Int.compare_eq_eq,Int.compare_eq_lt,Int.compare_eq_gt] at hh
    omega
theorem alignmentMantissa (m : RPositive) (e target : RIntBinary) :
    positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary
      (Rocq.Corelib.Floats.SpecFloat.shl_align m e target)) =
      (alignment (positiveTo m) (binaryIntTo e) (binaryIntTo target)).1 := by
  have h := congrArg Prod.fst (alignment_agrees m e target)
  cases he : Rocq.Corelib.Floats.SpecFloat.shl_align m e target with
  | pair p z => simpa [alignmentTo,prodTo,he,Rocq.Corelib.Init.Datatypes.fst] using h

def addition (prec emax : Int) : nativeSpec → nativeSpec → nativeSpec
  | .nan, _ => .nan
  | _, .nan => .nan
  | .zero s, .zero t => .zero (s && t)
  | .infinity s, .infinity t => if s=t then .infinity s else .nan
  | .infinity s, _ => .infinity s
  | _, .infinity t => .infinity t
  | .zero _, y => y
  | x, .zero _ => x
  | .finite s m e, .finite t n f =>
    let lo := min e f
    normalize prec emax
      (conditionalNegate s ((alignment m.val e lo).1 : Int) +
       conditionalNegate t ((alignment n.val f lo).1 : Int)) lo false
def subtraction (prec emax : Int) (x y : nativeSpec) : nativeSpec :=
  addition prec emax x (negate y)
def multiplication (prec emax : Int) : nativeSpec → nativeSpec → nativeSpec
  | .nan, _ => .nan
  | _, .nan => .nan
  | .zero _, .infinity _ => .nan
  | .infinity _, .zero _ => .nan
  | .zero s, .zero t => .zero (Bool.xor s t)
  | .zero s, .finite t _ _ => .zero (Bool.xor s t)
  | .finite s _ _, .zero t => .zero (Bool.xor s t)
  | .infinity s, .infinity t => .infinity (Bool.xor s t)
  | .infinity s, .finite t _ _ => .infinity (Bool.xor s t)
  | .finite s _ _, .infinity t => .infinity (Bool.xor s t)
  | .finite s m e, .finite t n f =>
    roundAux prec emax (Bool.xor s t) ((m.val*n.val : Nat) : Int) (e+f) none

theorem addition_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFadd prec emax x y) =
      addition (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFadd
      rw [normalize_agrees,z_add_agrees,conditionalNegate_agrees,conditionalNegate_agrees]
      change normalize _ _ (conditionalNegate (boolTo s) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align m e (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int) + conditionalNegate (boolTo t) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align n f (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int)) _ _ = _
      rw [alignmentMantissa,alignmentMantissa,minimum_agrees]
      rfl

theorem subtraction_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFsub prec emax x y) =
      subtraction (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFsub
      rw [normalize_agrees,z_sub_agrees,conditionalNegate_agrees,conditionalNegate_agrees]
      change normalize _ _ (conditionalNegate (boolTo s) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align m e (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int) - conditionalNegate (boolTo t) ((positiveTo (Rocq.Corelib.Init.Datatypes.fst RPositive RIntBinary (Rocq.Corelib.Floats.SpecFloat.shl_align n f (Rocq.Corelib.BinNums.IntDef.Z.min e f)))) : Int)) _ _ = _
      rw [alignmentMantissa,alignmentMantissa,minimum_agrees]
      cases s <;> cases t <;>
        simp [subtraction,addition,negate,specTo,conditionalNegate,boolTo,Int.sub_eq_add_neg] <;> rfl

theorem multiplication_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFmul prec emax x y) =
      multiplication (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
  cases x with
  | S754_zero s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_infinity s =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      cases s <;> cases t <;> rfl
  | S754_nan =>
    cases y with
    | S754_zero t =>
      cases t <;> rfl
    | S754_infinity t =>
      cases t <;> rfl
    | S754_nan =>
      rfl
    | S754_finite t n f =>
      cases t <;> rfl
  | S754_finite s m e =>
    cases y with
    | S754_zero t =>
      cases s <;> cases t <;> rfl
    | S754_infinity t =>
      cases s <;> cases t <;> rfl
    | S754_nan =>
      cases s <;> rfl
    | S754_finite t n f =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFmul
      rw [roundAux_agrees,z_add_agrees,xorb_agrees]
      change roundAux _ _ _ ((positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul m n) : Nat) : Int) _ _ = _
      rw [positive_mul_agrees]
      rfl

end NativeBridge.Incremental.SpecFloatArithmetic

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
  for name in ["NativeBridge.Incremental.SpecFloatArithmetic.addition", "NativeBridge.Incremental.SpecFloatArithmetic.multiplication", "NativeBridge.Incremental.SpecFloatArithmetic.subtraction"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
