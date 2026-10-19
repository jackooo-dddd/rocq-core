import SpecFloatSqrtSupport
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatSqrt
open NativeBridge SpecFloatRepresentation SpecFloatRounding SpecFloatNormalize SpecFloatArithmetic SpecFloatDivision
open BinaryInt BinaryArithmetic BinaryPower BinaryDivision BinarySqrtRem

def sqrtLocation (q r : Int) : Option Ordering :=
  if r=0 then none else some (if r≤q then .lt else .gt)
def sourceSqrtLocation (q r : RIntBinary) : Rocq.Corelib.Floats.SpecFloat.location :=
  Rocq.Corelib.Init.Datatypes.bool.rec .loc_Exact
    (.loc_Inexact (Rocq.Corelib.Init.Datatypes.bool.rec .Lt .Gt
      (Rocq.Corelib.BinNums.IntDef.Z.leb r q)))
    (Rocq.Corelib.BinNums.IntDef.Z.eqb r .Z0)

theorem sqrtLocation_agrees (q r : RIntBinary) :
    locationTo (sourceSqrtLocation q r) = sqrtLocation (binaryIntTo q) (binaryIntTo r) := by
  unfold sourceSqrtLocation
  rw [choose_map locationTo,eqb_agrees]
  change (if decide (binaryIntTo r=0) then none else
    some (comparisonTo (Rocq.Corelib.Init.Datatypes.bool.rec .Lt .Gt
      (Rocq.Corelib.BinNums.IntDef.Z.leb r q)))) = _
  rw [choose_map comparisonTo,z_leb_agrees]
  simp only [decide_eq_true_eq,comparisonTo,sqrtLocation]

def sqrtResult (m e : Int) : (Int × Int) × Option Ordering :=
  let r := zSqrtRemNative m
  ((r.1,e),sqrtLocation r.1 r.2)
def sourceSqrtResult (m e : RIntBinary) : SourceCore :=
  Rocq.Corelib.Init.Datatypes.prod.rec
    (fun q r => .pair _ _ (.pair _ _ q e) (sourceSqrtLocation q r))
    (Rocq.Corelib.BinNums.IntDef.Z.sqrtrem m)
theorem sqrtResult_agrees (m e : RIntBinary) :
    coreTo (sourceSqrtResult m e) = sqrtResult (binaryIntTo m) (binaryIntTo e) := by
  have h := z_sqrtrem_agrees m
  cases hd : Rocq.Corelib.BinNums.IntDef.Z.sqrtrem m with
  | pair q r =>
    have hq := congrArg Prod.fst h
    have hr := congrArg Prod.snd h
    simp only [hd] at hq hr
    simp only [sourceSqrtResult,hd,coreTo,sqrtLocation_agrees,sqrtResult,hq,hr]

def sqrtCore (prec emax m e : Int) : (Int × Int) × Option Ordering :=
  let e' := min (exponent prec emax ((integerDigits m+e+1)/2)) (e/2)
  sqrtResult (scaledInput m (e-2*e')) e'
theorem sqrtCore_agrees (prec emax m e : RIntBinary) :
    coreTo (Rocq.Corelib.Floats.SpecFloat.SFsqrt_core_binary prec emax m e) =
      sqrtCore (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m) (binaryIntTo e) := by
  change coreTo (sourceSqrtResult (sourceScaledInput m
    (Rocq.Corelib.BinNums.IntDef.Z.sub e
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH))
        (Rocq.Corelib.BinNums.IntDef.Z.min
          (Rocq.Corelib.Floats.SpecFloat.fexp prec emax
            (Rocq.Corelib.BinNums.IntDef.Z.div2
              (Rocq.Corelib.BinNums.IntDef.Z.add
                (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Floats.SpecFloat.Zdigits2 m) e)
                (.Zpos .xH))))
          (Rocq.Corelib.BinNums.IntDef.Z.div2 e))))) _) = _
  rw [sqrtResult_agrees,scaledInput_agrees]
  simp only [z_sub_agrees,z_mul_agrees,minimum_agrees,exponent_agrees,z_div2_agrees,
    z_add_agrees,integerDigits_agrees,zToOne,zToTwo]
  rfl

def squareRoot (prec emax : Int) : nativeSpec → nativeSpec
  | .zero s => .zero s
  | .infinity s => if s then .nan else .infinity s
  | .nan => .nan
  | .finite s m e =>
    if s then .nan else
      let r := sqrtCore prec emax m.val e
      roundAux prec emax false r.1.1 r.1.2 r.2

theorem squareRoot_agrees (prec emax : RIntBinary) (x : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFsqrt prec emax x) =
      squareRoot (binaryIntTo prec) (binaryIntTo emax) (specTo x) := by
  cases x with
  | S754_zero s => cases s <;> rfl
  | S754_infinity s => cases s <;> rfl
  | S754_nan => rfl
  | S754_finite s m e =>
    cases s with
    | true => rfl
    | false =>
      unfold Rocq.Corelib.Floats.SpecFloat.SFsqrt
      change specTo (Rocq.Corelib.Init.Datatypes.prod.rec
        (fun a l => Rocq.Corelib.Init.Datatypes.prod.rec
          (fun m e => Rocq.Corelib.Floats.SpecFloat.binary_round_aux prec emax .false m e l) a)
        (Rocq.Corelib.Floats.SpecFloat.SFsqrt_core_binary prec emax (.Zpos m) e)) = _
      rw [roundCore_agrees,sqrtCore_agrees]
      rfl

end NativeBridge.Incremental.SpecFloatSqrt

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
  for name in ["NativeBridge.Incremental.SpecFloatSqrt.sqrtCore", "NativeBridge.Incremental.SpecFloatSqrt.squareRoot"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
