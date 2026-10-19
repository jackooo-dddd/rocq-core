import PrimFloatArithmetic
import Init.Data.Nat.Sqrt.Lemmas
set_option autoImplicit false
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.PrimFloatSqrt
open NativeBridge PrimFloatRepresentation PrimFloatArithmetic

theorem sqrtDigits_bounds (fuel n : Nat) (hn : n < 4^fuel) :
    let r := Rocq2Lean.PrimFloat.sqrtDigits fuel n
    r*r ≤ n ∧ n < (r+1)*(r+1) := by
  induction fuel generalizing n with
  | zero =>
    simp only [Nat.pow_zero] at hn
    have hz : n=0 := by omega
    subst n
    decide
  | succ k ih =>
    have hn' : n/4 < 4^k := by rw [Nat.pow_succ] at hn; omega
    have hi := ih (n/4) hn'
    let r := Rocq2Lean.PrimFloat.sqrtDigits k (n/4)
    change r*r ≤ n/4 ∧ n/4 < (r+1)*(r+1) at hi
    have hs : (2*r)*(2*r) = 4*(r*r) := by
      change (2*r)*(2*r) = (2*2)*(r*r)
      ac_rfl
    have hs' : (2*r+2)*(2*r+2) = 4*((r+1)*(r+1)) := by
      rw [show 2*r+2=2*(r+1) by omega]
      change (2*(r+1))*(2*(r+1)) = (2*2)*((r+1)*(r+1))
      ac_rfl
    have hl : (2*r)*(2*r) ≤ n := by rw [hs]; omega
    have hu : n < (2*r+2)*(2*r+2) := by rw [hs']; omega
    change (if (2*r+1)^2≤n then 2*r+1 else 2*r) *
      (if (2*r+1)^2≤n then 2*r+1 else 2*r) ≤ n ∧
      n < ((if (2*r+1)^2≤n then 2*r+1 else 2*r)+1) *
        ((if (2*r+1)^2≤n then 2*r+1 else 2*r)+1)
    split
    · rename_i h
      simpa only [Nat.pow_two] using And.intro h hu
    · rename_i h
      constructor
      · exact hl
      · simpa only [Nat.pow_two] using Nat.lt_of_not_ge h

theorem integerSqrt_agrees (n : Nat) :
    Rocq2Lean.PrimFloat.integerSqrt n = Nat.sqrt n := by
  have hpow : n < 4^(Nat.log2 n/2+1) := by
    have h := Nat.lt_log2_self (n:=n)
    have hle : Nat.log2 n+1 ≤ 2*(Nat.log2 n/2+1) := by omega
    have hp := Nat.pow_le_pow_right (by decide : 0<2) hle
    have ht : n < 2^(2*(Nat.log2 n/2+1)) := Nat.lt_of_lt_of_le h hp
    simpa only [Nat.pow_mul] using ht
  have h := sqrtDigits_bounds (Nat.log2 n/2+1) n hpow
  change Rocq2Lean.PrimFloat.integerSqrt n * Rocq2Lean.PrimFloat.integerSqrt n ≤ n ∧
    n < (Rocq2Lean.PrimFloat.integerSqrt n+1)*(Rocq2Lean.PrimFloat.integerSqrt n+1) at h
  have hsl := Nat.sqrt_le n
  have hsu := Nat.lt_succ_sqrt n
  change n < (Nat.sqrt n+1)*(Nat.sqrt n+1) at hsu
  apply Nat.le_antisymm
  · by_cases hn : Rocq2Lean.PrimFloat.integerSqrt n ≤ Nat.sqrt n
    · exact hn
    have hh : Nat.sqrt n+1 ≤ Rocq2Lean.PrimFloat.integerSqrt n := by omega
    have hm := Nat.mul_le_mul hh hh
    omega
  · by_cases hn : Nat.sqrt n ≤ Rocq2Lean.PrimFloat.integerSqrt n
    · exact hn
    have hh : Rocq2Lean.PrimFloat.integerSqrt n+1 ≤ Nat.sqrt n := by omega
    have hm := Nat.mul_le_mul hh hh
    omega

def squareRoot (x : nativeFloat) : nativeFloat :=
  match x with
  | none => none
  | some (.inr s) => if s then none else x
  | some (.inl (s,_,_)) =>
    if isZero x then x else if s then none else
      let k := (Nat.log2 (mantissa x) : Int)+exponent x
      let q := max (-1074) (k/2-52)
      let shift := exponent x-2*q
      let n := if shift<0 then mantissa x else mantissa x*2^shift.toNat
      let d := if shift<0 then 2^(-shift).toNat else 1
      let m := Nat.sqrt (n/d)
      let mid := d*(2*m+1)^2
      let m := if 4*n>mid || (4*n==mid && m%2==1) then m+1 else m
      pack false m q
theorem squareRoot_agrees (x : Rocq.Corelib.Floats.PrimFloat.float) :
    floatTo (Rocq.Corelib.Floats.PrimFloat.sqrt x) = squareRoot (floatTo x) := by
  cases x with
  | nan => rfl
  | infinity s => cases s <;> rfl
  | finite s e f =>
    unfold Rocq.Corelib.Floats.PrimFloat.sqrt Rocq2Lean.PrimFloat.sqrt
    simp only [floatTo_finite,squareRoot]
    apply floatTo_if_congr
    · rfl
    · apply floatTo_if_congr
      · rfl
      · rw [pack_agrees]
        simp only [integerSqrt_agrees]
        rfl

end NativeBridge.Incremental.PrimFloatSqrt

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
  for name in ["NativeBridge.Incremental.PrimFloatSqrt.squareRoot"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
