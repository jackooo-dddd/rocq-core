import Uint63ShiftSpecs
import Init.Data.Nat.Log2
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.Uint63CountSpecs
open NativeBridge.Incremental.Uint63Operations
open NativeBridge.Incremental.Uint63ArithmeticSpecs
open NativeBridge.Incremental.Uint63ShiftSpecs
open NativeBridge.Incremental.BinaryArithmetic
open NativeBridge.Incremental.BinaryPower
-- Count implementations rechecked from WordOperations in this source closure.
theorem leadingZeros_formula (w n : Nat) (hn : n < 2^w) :
    Rocq2Lean.PrimInt63.leadingZeros w n = if n = 0 then w else w-1-Nat.log2 n := by
  induction w with
  | zero =>
    have hz : n = 0 := by simpa using hn
    simp [Rocq2Lean.PrimInt63.leadingZeros,hz]
  | succ w ih =>
    rw [Rocq2Lean.PrimInt63.leadingZeros]
    by_cases h : n < 2^w
    · rw [if_pos h,ih h]
      by_cases hz : n = 0
      · simp [hz]
      · have hl := (Nat.log2_lt hz).mpr h
        simp only [if_neg hz]
        omega
    · rw [if_neg h]
      have hz : n ≠ 0 := by
        have hp := Nat.two_pow_pos w
        omega
      have hl : Nat.log2 n = w := (Nat.log2_eq_iff hz).mpr ⟨by omega,hn⟩
      simp [hz,hl]

theorem head0_agrees (x : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x = BitVec.clz x := by
  change BitVec.ofNat 63 (Rocq2Lean.PrimInt63.leadingZeros 63 x.toNat) = x.clz
  rw [leadingZeros_formula 63 x.toNat x.isLt]
  by_cases hx : x = 0
  · subst x
    have h : (0 : Word).clz = 63 := BitVec.clz_eq_iff_eq_zero.mpr rfl
    simp
  · have hz : x.toNat ≠ 0 := by
      intro hn
      apply hx
      apply BitVec.eq_of_toNat_eq
      exact hn
    have hk : x.clz.toNat < 63 := BitVec.clz_lt_iff_ne_zero.mpr hx
    have hl := BitVec.two_pow_sub_clz_le_toNat_of_ne_zero (x := x) (by decide) hx
    have hu := BitVec.toNat_lt_two_pow_sub_clz (x := x)
    have he : 63-x.clz.toNat = (62-x.clz.toNat)+1 := by omega
    rw [he] at hu
    have hh : Nat.log2 x.toNat = 62-x.clz.toNat := (Nat.log2_eq_iff hz).mpr ⟨hl,hu⟩
    have hn : 63-1-Nat.log2 x.toNat = x.clz.toNat := by omega
    rw [if_neg hz,hn]
    simp

theorem trailingZeros_zero (w : Nat) : Rocq2Lean.PrimInt63.trailingZeros w 0 = w := by
  induction w with
  | zero => rfl
  | succ w ih => simpa [Rocq2Lean.PrimInt63.trailingZeros] using congrArg Nat.succ ih

theorem trailingZeros_first (k w n : Nat) (hk : k < w)
    (lo : ∀ i, i < k → Nat.testBit n i = false) (hi : Nat.testBit n k = true) :
    Rocq2Lean.PrimInt63.trailingZeros w n = k := by
  induction k generalizing w n with
  | zero =>
    cases w with
    | zero => omega
    | succ w =>
      have hm : n%2 = 1 := Nat.mod_two_eq_one_iff_testBit_zero.mpr hi
      simp [Rocq2Lean.PrimInt63.trailingZeros,hm]
  | succ k ih =>
    cases w with
    | zero => omega
    | succ w =>
      have hm : n%2 = 0 := Nat.mod_two_eq_zero_iff_testBit_zero.mpr (lo 0 (by omega))
      have hlo : ∀ i, i < k → Nat.testBit (n/2) i = false := by
        intro i h
        rw [Nat.testBit_div_two]
        exact lo (i+1) (by omega)
      have hhi : Nat.testBit (n/2) k = true := by
        rw [Nat.testBit_div_two]; exact hi
      have hrec := ih w (n/2) (by omega) hlo hhi
      simpa [Rocq2Lean.PrimInt63.trailingZeros,hm] using congrArg Nat.succ hrec

theorem tail0_agrees (x : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 x = BitVec.ctz x := by
  change BitVec.ofNat 63 (Rocq2Lean.PrimInt63.trailingZeros 63 x.toNat) = x.ctz
  by_cases hx : x = 0
  · subst x
    rw [show (0 : Word).toNat = 0 by rfl,trailingZeros_zero]
    have h : (0 : Word).ctz = 63 := by
      change BitVec.clz ((0 : Word).reverse) = 63
      apply BitVec.clz_eq_iff_eq_zero.mpr
      simp
    exact h.symm
  · have hk : x.ctz.toNat < 63 := BitVec.ctz_lt_iff_ne_zero.mpr hx
    have hlo : ∀ i, i < x.ctz.toNat → Nat.testBit x.toNat i = false := by
      intro i hi
      exact BitVec.getLsbD_false_of_lt_ctz hi
    have hhi : Nat.testBit x.toNat x.ctz.toNat = true :=
      BitVec.getLsbD_true_ctz_of_ne_zero hx
    rw [trailingZeros_first _ _ _ hk hlo hhi]
    simp


def leadingZeroSpec : Prop := ∀ x : Word, 0 < x.toNat →
  2^62 ≤ 2^x.clz.toNat*x.toNat ∧ 2^x.clz.toNat*x.toNat < 2^63
theorem leadingZeroSpec_native : leadingZeroSpec := by
  intro x hx
  have hne : x ≠ 0 := by intro h; subst x; simp at hx
  have hk : x.clz.toNat < 63 := BitVec.clz_lt_iff_ne_zero.mpr hne
  have hl := BitVec.two_pow_sub_clz_le_toNat_of_ne_zero (x := x) (by decide) hne
  have hu := BitVec.toNat_lt_two_pow_sub_clz (x := x)
  have hlo := Nat.mul_le_mul_left (2^x.clz.toNat) hl
  have hup := Nat.mul_lt_mul_of_pos_left hu (Nat.two_pow_pos x.clz.toNat)
  rw [← Nat.pow_add] at hlo hup
  have e1 : x.clz.toNat+(63-1-x.clz.toNat) = 62 := by omega
  have e2 : x.clz.toNat+(63-x.clz.toNat) = 63 := by omega
  simpa only [e1,e2] using And.intro hlo hup

def trailingZeroSpec : Prop := ∀ x : Word, 0 < x.toNat →
  ∃ y : Nat, x.toNat = (2*y+1)*2^x.ctz.toNat
theorem trailingZeroSpec_native : trailingZeroSpec := by
  intro x hx
  have hne : x ≠ 0 := by intro h; subst x; simp at hx
  let k := x.ctz.toNat
  have hm : x.toNat % 2^k = 0 := by
    apply Nat.eq_of_testBit_eq
    intro i
    rw [Nat.testBit_mod_two_pow]
    by_cases hi : i < k
    · have hbit := BitVec.getLsbD_false_of_lt_ctz (x:=x) hi
      simpa [BitVec.getLsbD,hi] using hbit
    · simp [hi]
  have hh : x.toNat / 2^k % 2 = 1 := by
    have hbit := BitVec.getLsbD_true_ctz_of_ne_zero hne
    change Nat.testBit x.toNat k = true at hbit
    simpa [Nat.testBit_eq_decide_div_mod_eq] using hbit
  refine ⟨x.toNat / 2^k / 2, ?_⟩
  have he := Nat.mod_add_div x.toNat (2^k)
  have hq := Nat.mod_add_div (x.toNat/2^k) 2
  rw [hm] at he
  rw [hh] at hq
  have heq : x.toNat/2^k = 2*(x.toNat/2^k/2)+1 := by omega
  rw [heq] at he
  simpa [Nat.mul_comm] using he.symm

theorem sourcePositive (x : Word)
    (h : Rocq.Corelib.BinNums.IntDef.Z.lt .Z0
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)) : 0 < x.toNat := by
  have hh := (NativeBridge.Incremental.BinaryInt.z_lt_agrees _ _).mp h
  change 0 < binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) at hh
  rw [unsignedSource x] at hh
  exact Int.ofNat_lt.mp hh

theorem leadingZeroSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement := by
  change ∀ (x : Word), _
  intro x h
  have hx := sourcePositive x h
  have hn := leadingZeroSpec_native x hx
  have hln := Int.ofNat_le.mpr hn.1
  have hun := Int.ofNat_lt.mpr hn.2
  have hp := (sourcePow (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x)).trans
    (congrArg (fun w : Word => (2 : Int)^w.toNat) (head0_agrees x))
  have hm := (z_mul_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zpos (.xO .xH))
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
        (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x)))
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)).trans
    (intCongr2 Int.mul hp (unsignedSource x))
  have hb : binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.div
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB (.Zpos (.xO .xH))) = (2^62 : Int) := by
    have hh := (NativeBridge.Incremental.BinaryDivision.z_div_agrees
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB (.Zpos (.xO .xH))).trans
      (intCongr2 Int.fdiv sourceBase (show binaryIntTo (.Zpos (.xO .xH)) = (2 : Int) from rfl))
    exact hh
  apply Rocq.Corelib.Init.Logic.and.conj
  · apply (NativeBridge.Incremental.BinaryInt.z_le_agrees _ _).mpr
    rw [hb,hm]
    simpa using hln
  · apply (NativeBridge.Incremental.BinaryInt.z_lt_agrees _ _).mpr
    rw [hm,sourceBase]
    simpa using hun

theorem trailingZeroSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement := by
  change ∀ (x : Word), _
  intro x h
  obtain ⟨y,hy⟩ := trailingZeroSpec_native x (sourcePositive x h)
  let yz := binaryIntOf (Int.ofNat y)
  apply Rocq.Corelib.Init.Logic.ex.ex_intro _ _ yz
  apply Rocq.Corelib.Init.Logic.and.conj
  · apply (NativeBridge.Incremental.BinaryInt.z_le_agrees _ _).mpr
    change 0 ≤ binaryIntTo (binaryIntOf (Int.ofNat y))
    rw [binaryInt_to_of]
    exact Int.natCast_nonneg _
  · apply eqOf
    apply zInjective
    have h2 := (z_mul_agrees (.Zpos (.xO .xH)) yz).trans
      (intCongr2 Int.mul (show binaryIntTo (.Zpos (.xO .xH)) = (2 : Int) from rfl) (binaryInt_to_of _))
    have h1 := (z_add_agrees
      (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) yz) (.Zpos .xH)).trans
      (intCongr2 Int.add h2 (show binaryIntTo (.Zpos .xH) = (1 : Int) from rfl))
    have hp := (sourcePow (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 x)).trans
      (congrArg (fun w : Word => (2 : Int)^w.toNat) (tail0_agrees x))
    have hm := (z_mul_agrees
      (Rocq.Corelib.BinNums.IntDef.Z.add
        (Rocq.Corelib.BinNums.IntDef.Z.mul (.Zpos (.xO .xH)) yz) (.Zpos .xH))
      (Rocq.Corelib.BinNums.IntDef.Z.pow (.Zpos (.xO .xH))
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 x)))).trans
      (intCongr2 Int.mul h1 hp)
    have hi : Int.ofNat x.toNat = (2*Int.ofNat y+1)*2^x.ctz.toNat := by
      simpa using congrArg Int.ofNat hy
    exact (unsignedSource x).trans (hi.trans hm.symm)
theorem leadingZeroSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement ↔ leadingZeroSpec :=
  ⟨fun _ => leadingZeroSpec_native,fun _ => leadingZeroSpec_proof⟩
theorem trailingZeroSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement ↔ trailingZeroSpec :=
  ⟨fun _ => trailingZeroSpec_native,fun _ => trailingZeroSpec_proof⟩

end NativeBridge.Incremental.Uint63CountSpecs

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
  for name in ["NativeBridge.Incremental.Uint63CountSpecs.leadingZeroSpec", "NativeBridge.Incremental.Uint63CountSpecs.trailingZeroSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
