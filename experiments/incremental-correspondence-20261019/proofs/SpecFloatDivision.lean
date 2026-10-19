import SpecFloatDivisionSupport
import SpecFloatArithmetic
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.SpecFloatDivision
open NativeBridge SpecFloatRepresentation SpecFloatRounding SpecFloatNormalize SpecFloatArithmetic
open BinaryInt BinaryArithmetic BinaryPower BinaryDivision

def scaledInput (m s : Int) : Int := if s < 0 then 0 else 2^s.toNat*m
def sourceScaledInput (m s : RIntBinary) : RIntBinary :=
  Rocq.Corelib.Numbers.BinNums.Z.rec m (fun _ => Rocq.Corelib.BinNums.IntDef.Z.shiftl m s)
    (fun _ => .Z0) s

theorem repeat_mul_start (x a : Int) (n : Nat) :
    repeatNative (x * ·) n a = x ^ n * a := by
  induction n with
  | zero => simp only [repeat_zero,Int.pow_zero,Int.one_mul]
  | succ n ih =>
    simp only [repeat_succ,ih,Int.pow_succ]
    rw [← Int.mul_assoc,Int.mul_comm x (x^n)]
theorem scaledInput_agrees (m s : RIntBinary) :
    binaryIntTo (sourceScaledInput m s) = scaledInput (binaryIntTo m) (binaryIntTo s) := by
  cases s with
  | Z0 => simp [sourceScaledInput,scaledInput,binaryIntTo]
  | Zpos p =>
    change binaryIntTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RIntBinary
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH))) m p) =
      scaledInput (binaryIntTo m) (positiveTo p)
    rw [positive_iter_transport binaryIntTo _ ((2:Int)*·) (z_mul_agrees (.Zpos (.xO .xH))),repeat_mul_start]
    simp only [scaledInput,if_neg (show ¬(positiveTo p : Int)<0 by omega),Int.toNat_natCast]
  | Zneg p =>
    change 0 = scaledInput (binaryIntTo m) (-(positiveTo p : Int))
    have hp := positiveTo_pos p
    simp only [scaledInput,if_pos (show -(positiveTo p : Int)<0 by omega)]

abbrev SourceCore := Rocq.Corelib.Init.Datatypes.prod ZPair Rocq.Corelib.Floats.SpecFloat.location
def coreTo (x : SourceCore) : (Int × Int) × Option Ordering :=
  match x with | .pair _ _ (.pair _ _ m e) l => ((binaryIntTo m,binaryIntTo e),locationTo l)
def divisionResult (m b e : Int) : (Int × Int) × Option Ordering :=
  ((m.fdiv b,e),newLocation b (m.fmod b))
def sourceDivisionResult (m b e : RIntBinary) : SourceCore :=
  Rocq.Corelib.Init.Datatypes.prod.rec
    (fun q r => .pair _ _ (.pair _ _ q e) (Rocq.Corelib.Floats.SpecFloat.new_location b r))
    (Rocq.Corelib.BinNums.IntDef.Z.div_eucl m b)
theorem divisionResult_agrees (m b e : RIntBinary) :
    coreTo (sourceDivisionResult m b e) = divisionResult (binaryIntTo m) (binaryIntTo b) (binaryIntTo e) := by
  have h := z_div_eucl_agrees m b
  cases hd : Rocq.Corelib.BinNums.IntDef.Z.div_eucl m b with
  | pair q r =>
    simp only [hd,zPairTo,floorPairNative,Prod.mk.injEq] at h
    simp only [sourceDivisionResult,hd,coreTo,newLocation_agrees,divisionResult,h.1,h.2]

def divisionCore (prec emax m1 e1 m2 e2 : Int) : (Int × Int) × Option Ordering :=
  let e := min (exponent prec emax ((integerDigits m1+e1)-(integerDigits m2+e2))) (e1-e2)
  divisionResult (scaledInput m1 ((e1-e2)-e)) m2 e

theorem divisionCore_agrees (prec emax m1 e1 m2 e2 : RIntBinary) :
    coreTo (Rocq.Corelib.Floats.SpecFloat.SFdiv_core_binary prec emax m1 e1 m2 e2) =
      divisionCore (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m1) (binaryIntTo e1)
        (binaryIntTo m2) (binaryIntTo e2) := by
  change coreTo (sourceDivisionResult (sourceScaledInput m1
    (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.BinNums.IntDef.Z.sub e1 e2)
      (Rocq.Corelib.BinNums.IntDef.Z.min
        (Rocq.Corelib.Floats.SpecFloat.fexp prec emax
          (Rocq.Corelib.BinNums.IntDef.Z.sub
            (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Floats.SpecFloat.Zdigits2 m1) e1)
            (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Floats.SpecFloat.Zdigits2 m2) e2)))
        (Rocq.Corelib.BinNums.IntDef.Z.sub e1 e2)))) m2 _) = _
  rw [divisionResult_agrees,scaledInput_agrees]
  simp only [z_sub_agrees,z_add_agrees,minimum_agrees,exponent_agrees,integerDigits_agrees]
  rfl

def division (prec emax : Int) : nativeSpec → nativeSpec → nativeSpec
  | .nan, _ => .nan
  | _, .nan => .nan
  | .zero _, .zero _ => .nan
  | .infinity _, .infinity _ => .nan
  | .zero s, .infinity t => .zero (Bool.xor s t)
  | .zero s, .finite t _ _ => .zero (Bool.xor s t)
  | .infinity s, .zero t => .infinity (Bool.xor s t)
  | .infinity s, .finite t _ _ => .infinity (Bool.xor s t)
  | .finite s _ _, .zero t => .infinity (Bool.xor s t)
  | .finite s _ _, .infinity t => .zero (Bool.xor s t)
  | .finite s m e, .finite t n f =>
    let r := divisionCore prec emax m.val e n.val f
    roundAux prec emax (Bool.xor s t) r.1.1 r.1.2 r.2

theorem roundCore_agrees (prec emax : RIntBinary) (s : RBool) (x : SourceCore) :
    specTo (Rocq.Corelib.Init.Datatypes.prod.rec
      (fun a l => Rocq.Corelib.Init.Datatypes.prod.rec
        (fun m e => Rocq.Corelib.Floats.SpecFloat.binary_round_aux prec emax s m e l) a) x) =
      roundAux (binaryIntTo prec) (binaryIntTo emax) (boolTo s) (coreTo x).1.1 (coreTo x).1.2 (coreTo x).2 := by
  cases x with
  | pair a l => cases a; exact roundAux_agrees _ _ _ _ _ _
theorem division_agrees (prec emax : RIntBinary) (x y : Rocq.Corelib.Floats.SpecFloat.spec_float) :
    specTo (Rocq.Corelib.Floats.SpecFloat.SFdiv prec emax x y) =
      division (binaryIntTo prec) (binaryIntTo emax) (specTo x) (specTo y) := by
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
      unfold Rocq.Corelib.Floats.SpecFloat.SFdiv
      rw [roundCore_agrees,divisionCore_agrees]
      cases s <;> cases t <;> rfl

end NativeBridge.Incremental.SpecFloatDivision

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
  for name in ["NativeBridge.Incremental.SpecFloatDivision.division", "NativeBridge.Incremental.SpecFloatDivision.divisionCore"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
