import Uint63ArithmeticSpecs
set_option maxHeartbeats 300000
noncomputable section
namespace NativeBridge.Incremental.Uint63ShiftSpecs
open NativeBridge.Incremental.Uint63Operations
open NativeBridge.Incremental.Uint63Conversions
open NativeBridge.Incremental.Uint63ArithmeticSpecs
open NativeBridge.Incremental.BinaryDivision
open NativeBridge.Incremental.BinaryPower

def leftShiftSpec : Prop := ∀ x p : Word,
  Int.ofNat (x <<< p.toNat).toNat = (Int.ofNat x.toNat * 2^p.toNat).fmod (2^63)
def rightShiftSpec : Prop := ∀ x p : Word,
  Int.ofNat (x >>> p.toNat).toNat = (Int.ofNat x.toNat).fdiv (2^p.toNat)
theorem leftShiftSpec_native : leftShiftSpec := by
  intro x p
  rw [Int.fmod_eq_emod_of_nonneg _ (by decide)]
  simp [Nat.shiftLeft_eq]
theorem rightShiftSpec_native : rightShiftSpec := by
  intro x p
  rw [Int.fdiv_eq_ediv_of_nonneg _ (Int.pow_nonneg (by decide : 0 ≤ (2 : Int)))]
  simp [Nat.shiftRight_eq_div_pow]
theorem sourcePow (p : Word) :
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.pow
      (.Zpos (.xO .xH)) (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p)) = (2 : Int)^p.toNat := by
  have h1 := z_pow_agrees (.Zpos (.xO .xH))
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p)
  have h2 := congrArg (zPowNative 2) (unsignedSource p)
  have h3 : zPowNative 2 (Int.ofNat p.toNat) = (2 : Int)^p.toNat := by
    simp only [zPowNative,Int.ofNat_eq_natCast,Int.toNat_natCast]
    exact if_neg (Int.not_lt.mpr (Int.natCast_nonneg _))
  exact h1.trans (h2.trans h3)

theorem leftShiftSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement := by
  change ∀ (x p : Word), _
  intro x p
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x p)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_lsl_agrees x p)
  have hm := (z_mul_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zpos (.xO .xH))
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p))).trans
    (intCongr2 Int.mul (unsignedSource x) (sourcePow p))
  have hr := (z_modulo_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zpos (.xO .xH))
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p)))
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB).trans
    (intCongr2 Int.fmod hm sourceBase)
  exact hl.trans (hl'.trans ((leftShiftSpec_native x p).trans hr.symm))
theorem rightShiftSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement := by
  change ∀ (x p : Word), _
  intro x p
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_lsr_agrees x p)
  have hr := (z_div_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zpos (.xO .xH))
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p))).trans
    (intCongr2 Int.fdiv (unsignedSource x) (sourcePow p))
  exact hl.trans (hl'.trans ((rightShiftSpec_native x p).trans hr.symm))
theorem leftShiftSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement ↔ leftShiftSpec :=
  ⟨fun _ => leftShiftSpec_native,fun _ => leftShiftSpec_proof⟩
theorem rightShiftSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement ↔ rightShiftSpec :=
  ⟨fun _ => rightShiftSpec_native,fun _ => rightShiftSpec_proof⟩
end NativeBridge.Incremental.Uint63ShiftSpecs

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
  for name in ["NativeBridge.Incremental.Uint63ShiftSpecs.leftShiftSpec", "NativeBridge.Incremental.Uint63ShiftSpecs.rightShiftSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
