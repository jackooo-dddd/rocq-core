import SpecFloatRounding
noncomputable section
namespace NativeBridge.Incremental.SpecFloatShift
open NativeBridge.Incremental.SpecFloatRepresentation NativeBridge.Incremental.SpecFloatRounding
open NativeBridge.Incremental.BinaryArithmetic NativeBridge.Incremental.BinaryPower
universe u v

def iterate {A : Sort u} (f : A → A) (n : Nat) (x : A) : A := repeatNative f n x
theorem repeat_commute {A : Sort u} (f : A → A) (n : Nat) (x : A) :
    repeatNative f n (f x) = f (repeatNative f n x) := by
  induction n with
  | zero => rfl
  | succ n ih => exact congrArg f ih
theorem iterTransport {A : Sort u} {B : Sort v} (g : A → B) (f : A → A) (f' : B → B)
    (h : ∀ x, g (f x) = f' (g x)) (p : RPositive) (x : A) :
    g (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p x) = iterate f' (positiveTo p) (g x) := by
  induction p generalizing x with
  | xH => exact h x
  | xO p ih =>
    change g (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p
      (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p x)) = _
    rw [ih,ih]
    change repeatNative f' (positiveTo p) (repeatNative f' (positiveTo p) (g x)) =
      repeatNative f' (2*positiveTo p) (g x)
    rw [show 2*positiveTo p = positiveTo p+positiveTo p by omega,repeat_add]
  | xI p ih =>
    change g (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p
      (Rocq.Corelib.Floats.SpecFloat.iter_pos A f p (f x))) = _
    rw [ih,ih,h]
    change repeatNative f' (positiveTo p) (repeatNative f' (positiveTo p) (f' (g x))) =
      repeatNative f' (2*positiveTo p+1) (g x)
    rw [repeat_commute,repeat_commute,repeat_succ,
      show 2*positiveTo p = positiveTo p+positiveTo p by omega,repeat_add]
theorem iterate_agrees {A : Sort u} (f : A → A) (p : RPositive) (x : A) :
    Rocq.Corelib.Floats.SpecFloat.iter_pos A f p x = iterate f (positiveTo p) x :=
  iterTransport id f f (fun _ => rfl) p x

def shiftOne (s : nativeShift) : nativeShift :=
  (s.1.tdiv 2, decide (s.1.natAbs%2=1), s.2.1 || s.2.2)
theorem natAbsPositive (n : Nat) : (Int.ofNat n).natAbs = n := rfl
theorem half_positive (n : Nat) (c : Nat) (hc : c < 2) :
    (Int.ofNat (2*n+c)).tdiv 2 = Int.ofNat n := by
  change Int.ofNat ((2*n+c)/2) = Int.ofNat n
  congr 1
  omega
theorem shiftOne_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) :
    shiftTo (Rocq.Corelib.Floats.SpecFloat.shr_1 s) = shiftOne (shiftTo s) := by
  cases s with
  | Build_shr_record m r s =>
    cases m with
    | Z0 =>
      cases r <;> cases s <;> rfl
    | Zpos p =>
      cases p with
      | xH => cases r <;> cases s <;> rfl
      | xI p =>
        change (Int.ofNat (positiveTo p),true,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((Int.ofNat (2*positiveTo p+1)).tdiv 2,decide ((2*positiveTo p+1)%2=1),boolTo r || boolTo s)
        rw [half_positive _ 1 (by decide),orb_agrees]
        simp
      | xO p =>
        change (Int.ofNat (positiveTo p),false,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((Int.ofNat (2*positiveTo p)).tdiv 2,decide ((2*positiveTo p)%2=1),boolTo r || boolTo s)
        have hh := half_positive (positiveTo p) 0 (by decide)
        simp only [Nat.add_zero] at hh
        rw [hh,orb_agrees]
        simp
    | Zneg p =>
      cases p with
      | xH => cases r <;> cases s <;> rfl
      | xI p =>
        change (-Int.ofNat (positiveTo p),true,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((-Int.ofNat (2*positiveTo p+1)).tdiv 2,decide ((-Int.ofNat (2*positiveTo p+1)).natAbs%2=1),boolTo r || boolTo s)
        rw [Int.neg_tdiv,half_positive _ 1 (by decide),orb_agrees]
        simp only [Int.natAbs_neg,natAbsPositive]
        simp
      | xO p =>
        change (-Int.ofNat (positiveTo p),false,boolTo (Rocq.Corelib.Init.Datatypes.orb r s)) =
          ((-Int.ofNat (2*positiveTo p)).tdiv 2,decide ((-Int.ofNat (2*positiveTo p)).natAbs%2=1),boolTo r || boolTo s)
        have hh := half_positive (positiveTo p) 0 (by decide)
        simp only [Nat.add_zero] at hh
        rw [Int.neg_tdiv,hh,orb_agrees]
        simp only [Int.natAbs_neg,natAbsPositive]
        simp

def shiftMany (s : nativeShift) (e n : Int) : nativeShift × Int :=
  if n>0 then (iterate shiftOne n.toNat s,e+n) else (s,e)
def shiftPairTo (p : Rocq.Corelib.Init.Datatypes.prod Rocq.Corelib.Floats.SpecFloat.shr_record RIntBinary) :
    nativeShift × Int :=
  let q := prodTo p
  (shiftTo q.1,binaryIntTo q.2)
theorem shiftMany_agrees (s : Rocq.Corelib.Floats.SpecFloat.shr_record) (e n : RIntBinary) :
    shiftPairTo (Rocq.Corelib.Floats.SpecFloat.shr s e n) =
      shiftMany (shiftTo s) (binaryIntTo e) (binaryIntTo n) := by
  cases n with
  | Z0 => simp [Rocq.Corelib.Floats.SpecFloat.shr,shiftMany,shiftPairTo,prodTo,binaryIntTo]
  | Zneg p =>
    have hp := positiveTo_pos p
    simp [Rocq.Corelib.Floats.SpecFloat.shr,shiftMany,shiftPairTo,prodTo,binaryIntTo]
    omega
  | Zpos p =>
    have hp := positiveTo_pos p
    change (shiftTo (Rocq.Corelib.Floats.SpecFloat.iter_pos _ Rocq.Corelib.Floats.SpecFloat.shr_1 p s),
      binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.add e (.Zpos p))) = _
    rw [iterTransport shiftTo _ shiftOne shiftOne_agrees,z_add_agrees]
    simp [shiftMany,binaryIntTo,Nat.ne_of_gt hp]

def shiftToExponent (prec emax m e : Int) (l : Option Ordering) : nativeShift × Int :=
  shiftMany (toShift m l) e (exponent prec emax (integerDigits m+e)-e)
theorem shiftToExponent_agrees (prec emax m e : RIntBinary) (l : Rocq.Corelib.Floats.SpecFloat.location) :
    shiftPairTo (Rocq.Corelib.Floats.SpecFloat.shr_fexp prec emax m e l) =
      shiftToExponent (binaryIntTo prec) (binaryIntTo emax) (binaryIntTo m) (binaryIntTo e) (locationTo l) := by
  unfold Rocq.Corelib.Floats.SpecFloat.shr_fexp
  rw [shiftMany_agrees,toShift_agrees,z_sub_agrees,exponent_agrees,z_add_agrees,integerDigits_agrees]
  rfl
def alignment (m : Nat) (e target : Int) : Nat × Int :=
  if target < e then (2^(e-target).toNat*m,target) else (m,e)
def alignmentTo (p : Rocq.Corelib.Init.Datatypes.prod RPositive RIntBinary) : Nat × Int :=
  let q := prodTo p
  (positiveTo q.1,binaryIntTo q.2)
theorem repeatDouble (n m : Nat) : repeatNative (fun x => 2*x) n m = 2^n*m := by
  induction n with
  | zero => simp [repeat_zero]
  | succ n ih =>
    rw [repeat_succ,ih,Nat.pow_succ]
    simp only [Nat.mul_comm,Nat.mul_left_comm]
theorem alignment_agrees (m : RPositive) (e target : RIntBinary) :
    alignmentTo (Rocq.Corelib.Floats.SpecFloat.shl_align m e target) =
      alignment (positiveTo m) (binaryIntTo e) (binaryIntTo target) := by
  have hd := z_sub_agrees target e
  unfold Rocq.Corelib.Floats.SpecFloat.shl_align
  generalize heq : Rocq.Corelib.BinNums.IntDef.Z.sub target e = delta at *
  cases delta with
  | Z0 =>
    change (0 : Int) = binaryIntTo target-binaryIntTo e at hd
    have hn : ¬binaryIntTo target < binaryIntTo e := by omega
    simp [alignmentTo,prodTo,alignment,hn]
  | Zpos p =>
    change (positiveTo p : Int) = binaryIntTo target-binaryIntTo e at hd
    have hn : ¬binaryIntTo target < binaryIntTo e := by omega
    simp [alignmentTo,prodTo,alignment,hn]
  | Zneg p =>
    change -(positiveTo p : Int) = binaryIntTo target-binaryIntTo e at hd
    have hp := positiveTo_pos p
    have hn : binaryIntTo target < binaryIntTo e := by omega
    have hnN : (binaryIntTo e-binaryIntTo target).toNat = positiveTo p := by omega
    change (positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.iter RPositive
      Rocq.Corelib.Numbers.BinNums.positive.xO m p),binaryIntTo target) = _
    rw [positive_iter_transport positiveTo _ (fun x => 2*x) positiveTo_xO,repeatDouble]
    simp [alignment,hn,hnN]

end NativeBridge.Incremental.SpecFloatShift

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
  for name in ["NativeBridge.Incremental.SpecFloatShift.alignment", "NativeBridge.Incremental.SpecFloatShift.iterate", "NativeBridge.Incremental.SpecFloatShift.shiftMany", "NativeBridge.Incremental.SpecFloatShift.shiftOne", "NativeBridge.Incremental.SpecFloatShift.shiftToExponent"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
