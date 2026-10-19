import Sint63QuotientSupport
import Init.Data.BitVec.Bitblast
set_option maxHeartbeats 300000
noncomputable section
namespace NativeBridge.Incremental.Sint63Specs
open NativeBridge.Incremental.Sint63UnsignedSupport
open NativeBridge.Incremental.Sint63Operations
open NativeBridge.Incremental.BinaryDivision
theorem ofSigned_agrees (w : Nat) (z : Int) :
    Rocq2Lean.PrimInt63.ofSigned w z = BitVec.ofInt w z := by
  cases z with
  | ofNat n => simp [Rocq2Lean.PrimInt63.ofSigned]
  | negSucc n =>
    change BitVec.ofNat w (2^w-(n+1)%2^w) = BitVec.ofInt w (-Int.ofNat (n+1))
    rw [BitVec.ofInt_neg]
    change BitVec.ofNat w (2^w-(n+1)%2^w) = -(BitVec.ofNat w (n+1))
    rfl


theorem primitiveDiv_agrees (x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs x y = x.sdiv y := by
  have h := ofSigned_agrees 63 (Int.tdiv x.toInt y.toInt)
  apply h.trans
  apply BitVec.eq_of_toInt_eq
  exact (BitVec.toInt_ofInt _).trans (BitVec.toInt_sdiv x y).symm
theorem primitiveMod_agrees (x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y = x.srem y := by
  have h := ofSigned_agrees 63 (Int.tmod x.toInt y.toInt)
  apply h.trans
  have h' := BitVec.toInt_srem x y
  have he := congrArg (BitVec.ofInt 63) h'
  simpa only [BitVec.ofInt_toInt] using he.symm
def signedDivisionSpec : Prop := ∀ x y : Word,
  (x.toInt ≠ -(2^62) ∨ y.toInt ≠ -1) → (x.sdiv y).toInt = x.toInt.tdiv y.toInt
def signedRemainderSpec : Prop := ∀ x y : Word, (x.srem y).toInt = x.toInt.tmod y.toInt
theorem signedDivisionSpec_native : signedDivisionSpec := by
  intro x y h
  apply BitVec.toInt_sdiv_of_ne_or_ne
  rcases h with h|h
  · left
    intro he
    subst x
    exact h rfl
  · right
    intro he
    subst y
    exact h rfl
theorem signedRemainderSpec_native : signedRemainderSpec := BitVec.toInt_srem
theorem zInjective {a b : Rocq.Corelib.Numbers.BinNums.Z} (h : binaryIntTo a = binaryIntTo b) : a = b :=
  (binaryInt_of_to a).symm.trans ((congrArg binaryIntOf h).trans (binaryInt_of_to b))
theorem minimum_integer : binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z
    Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int) = -(2^62 : Int) :=
  signedInteger_agrees _
theorem signedDivisionSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement := by
  change ∀ (x y : Word), _
  intro x y h
  have hn : x.toInt ≠ -(2^62) ∨ y.toInt ≠ -1 := by
    rcases h with hx|hy
    · left
      intro he
      have hh := (signedInteger_agrees x).trans (he.trans minimum_integer.symm)
      cases hx (eqOf (zInjective hh))
    · right
      intro he
      have hh : binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y) =
          binaryIntTo (.Zneg .xH) := (signedInteger_agrees y).trans he
      cases hy (eqOf (zInjective hh))
  apply eqOf
  apply zInjective
  have hl := signedInteger_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs x y)
  have hp := congrArg BitVec.toInt (primitiveDiv_agrees x y)
  have hr := (z_quot_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)).trans
    (map2 Int.tdiv (signedInteger_agrees x) (signedInteger_agrees y))
  exact hl.trans (hp.trans ((signedDivisionSpec_native x y hn).trans hr.symm))
theorem signedRemainderSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  have hl := signedInteger_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y)
  have hp := congrArg BitVec.toInt (primitiveMod_agrees x y)
  have hr := (z_rem_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)).trans
    (map2 Int.tmod (signedInteger_agrees x) (signedInteger_agrees y))
  exact hl.trans (hp.trans ((signedRemainderSpec_native x y).trans hr.symm))
theorem signedDivisionSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement ↔ signedDivisionSpec :=
  ⟨fun _ => signedDivisionSpec_native,fun _ => signedDivisionSpec_proof⟩
theorem signedRemainderSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement ↔ signedRemainderSpec :=
  ⟨fun _ => signedRemainderSpec_native,fun _ => signedRemainderSpec_proof⟩
open NativeBridge.Incremental.BinaryPower
def arithmeticShift (x p : Word) : Word := if p.toInt < 0 then 0 else x.sshiftRight p.toNat
theorem clampShift (x : Word) (n : Nat) : x.sshiftRight (min n 63) = x.sshiftRight n := by
  by_cases hn : n ≤ 63
  · rw [Nat.min_eq_left hn]
  · have hn' : 63 ≤ n := by omega
    rw [Nat.min_eq_right hn']
    apply BitVec.eq_of_getLsbD_eq
    intro i hi
    simp [BitVec.getLsbD_sshiftRight,show ¬63+i<63 by omega,show ¬n+i<63 by omega]
theorem primitiveShift_agrees (x p : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x p = arithmeticShift x p := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr Rocq2Lean.PrimInt63.asr arithmeticShift
  split
  · rfl
  · exact (ofSigned_agrees 63 _).trans (clampShift x p.toNat)
def arithmeticShiftSpec : Prop := ∀ x p : Word,
  (arithmeticShift x p).toInt = x.toInt.fdiv (zPowNative 2 p.toInt)
theorem arithmeticShiftSpec_native : arithmeticShiftSpec := by
  intro x p
  by_cases hp : p.toInt < 0
  · simp [arithmeticShift,zPowNative,hp]
  · have hm : p.msb = false := by
      cases h : p.msb with
      | false => rfl
      | true => exact (hp (BitVec.toInt_neg_of_msb_true h)).elim
    have hpn := BitVec.toNat_toInt_of_msb p hm
    simp only [arithmeticShift,BitVec.toInt_sshiftRight,zPowNative,if_neg hp,hpn]
    rw [Int.shiftRight_eq_div_pow,Int.fdiv_eq_ediv_of_nonneg _ (Int.pow_nonneg (by decide : 0 ≤ (2 : Int)))]
    simp
theorem arithmeticShiftSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement := by
  change ∀ (x p : Word), _
  intro x p
  apply eqOf
  apply zInjective
  have hl := signedInteger_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x p)
  have hs := congrArg BitVec.toInt (primitiveShift_agrees x p)
  have hp := (z_pow_agrees (.Zpos (.xO .xH))
    (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z p)).trans
    (map2 zPowNative (show binaryIntTo (.Zpos (.xO .xH)) = (2 : Int) from rfl) (signedInteger_agrees p))
  have hr := (z_div_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
    (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zpos (.xO .xH))
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z p))).trans
    (map2 Int.fdiv (signedInteger_agrees x) hp)
  exact hl.trans (hs.trans ((arithmeticShiftSpec_native x p).trans hr.symm))
theorem arithmeticShiftSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement ↔ arithmeticShiftSpec :=
  ⟨fun _ => arithmeticShiftSpec_native,fun _ => arithmeticShiftSpec_proof⟩

end NativeBridge.Incremental.Sint63Specs

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
  for name in ["BitVec.sdiv", "BitVec.srem", "NativeBridge.Incremental.Sint63Specs.arithmeticShift", "NativeBridge.Incremental.Sint63Specs.arithmeticShiftSpec", "NativeBridge.Incremental.Sint63Specs.signedDivisionSpec", "NativeBridge.Incremental.Sint63Specs.signedRemainderSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
