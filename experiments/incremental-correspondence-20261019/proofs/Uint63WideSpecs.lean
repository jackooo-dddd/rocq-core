import Uint63ShiftSpecs
set_option maxHeartbeats 20000
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.Uint63WideSpecs
open NativeBridge.Incremental.Uint63Operations
open NativeBridge.Incremental.Uint63ArithmeticSpecs
open NativeBridge.Incremental.BinaryArithmetic
open NativeBridge.Incremental.BinaryPower
def highProduct (x y : Word) : Word := BitVec.ofNat 63 (x.toNat*y.toNat/2^63)
def lowProduct (x y : Word) : Word := BitVec.ofNat 63 (x.toNat*y.toNat)
def wideProductSpec : Prop := ∀ x y : Word,
  x.toNat*y.toNat = (highProduct x y).toNat*2^63+(lowProduct x y).toNat
theorem highProduct_value (x y : Word) : (highProduct x y).toNat = x.toNat*y.toNat/2^63 := by
  have h := BitVec.toNat_mul_toNat_lt (x:=x) (y:=y)
  have hq : x.toNat*y.toNat/2^63 < 2^63 := by
    rw [Nat.div_lt_iff_lt_mul (by decide : 0 < 2^63)]
    simpa [Nat.pow_add] using h
  exact Nat.mod_eq_of_lt hq
theorem wideProductSpec_native : wideProductSpec := by
  intro x y
  rw [highProduct_value]
  simpa [lowProduct,Nat.mul_comm] using (Nat.div_add_mod (x.toNat*y.toNat) (2^63)).symm
theorem wideProductSpec_integer (x y : Word) :
    Int.ofNat x.toNat*Int.ofNat y.toNat =
      Int.ofNat (highProduct x y).toNat*(2^63:Int)+Int.ofNat (lowProduct x y).toNat := by
  have h := congrArg Int.ofNat (wideProductSpec_native x y)
  simpa using h
theorem wideProductSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  change binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)) =
    binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.add
      (Rocq.Corelib.BinNums.IntDef.Z.mul
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (highProduct x y))
        Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (lowProduct x y)))
  have hl := (z_mul_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)).trans
    (intCongr2 Int.mul (unsignedSource x) (unsignedSource y))
  have hh := (z_mul_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (highProduct x y))
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB).trans
    (intCongr2 Int.mul (unsignedSource (highProduct x y)) sourceBase)
  have hr := (z_add_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.mul
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (highProduct x y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (lowProduct x y))).trans
    (intCongr2 Int.add hh (unsignedSource (lowProduct x y)))
  exact hl.trans ((wideProductSpec_integer x y).trans hr.symm)
theorem wideProductSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement ↔ wideProductSpec :=
  ⟨fun _ => wideProductSpec_native,fun _ => wideProductSpec_proof⟩
abbrev doubleDividend (hi lo : Word) : Nat := hi.toNat*2^63+lo.toNat
abbrev doubleQuotient (hi lo b : Word) : Word := BitVec.ofNat 63 (doubleDividend hi lo / b.toNat)
abbrev doubleRemainder (hi lo b : Word) : Word := BitVec.ofNat 63 (doubleDividend hi lo % b.toNat)
def doubleDivisionSpec : Prop := ∀ hi lo b : Word, hi.toNat < b.toNat →
  (doubleDividend hi lo / b.toNat) % 2^63 = doubleDividend hi lo / b.toNat ∧
  (doubleDividend hi lo % b.toNat) % 2^63 = doubleDividend hi lo % b.toNat
theorem doubleDivisionBound (B hi lo b : Nat)
    (h : hi < b) (hlo : lo < B) (hbB : b < B) :
    ((hi*B+lo)/b)%B = (hi*B+lo)/b ∧ ((hi*B+lo)%b)%B = (hi*B+lo)%b := by
  have hb : 0 < b := Nat.lt_of_le_of_lt (Nat.zero_le hi) h
  have h1 := Nat.add_lt_add_left hlo (hi*B)
  have h2 := Nat.mul_le_mul_right B (Nat.succ_le_of_lt h)
  rw [← Nat.succ_mul] at h1
  have hn : hi*B+lo < B*b := by
    simpa only [Nat.mul_comm] using Nat.lt_of_lt_of_le h1 h2
  have hq : (hi*B+lo)/b < B := (Nat.div_lt_iff_lt_mul hb).mpr hn
  have hr : (hi*B+lo)%b < B := Nat.lt_trans (Nat.mod_lt _ hb) hbB
  exact ⟨Nat.mod_eq_of_lt hq,Nat.mod_eq_of_lt hr⟩
theorem doubleDivisionSpec_native : doubleDivisionSpec := by
  intro hi lo b h
  exact doubleDivisionBound (2^63) hi.toNat lo.toNat b.toNat h lo.isLt b.isLt


abbrev sourceDividend (hi lo : Word) : RIntBinary :=
  Rocq.Corelib.BinNums.IntDef.Z.add
    (Rocq.Corelib.BinNums.IntDef.Z.mul
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z hi)
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z lo)
theorem sourceDividend_agrees (hi lo : Word) : binaryIntTo (sourceDividend hi lo) = Int.ofNat (doubleDividend hi lo) := by
  have hh := (z_mul_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z hi)
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB).trans
    (intCongr2 Int.mul (unsignedSource hi) sourceBase)
  have hr := (z_add_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.mul
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z hi)
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z lo)).trans
    (intCongr2 Int.add hh (unsignedSource lo))
  have hv : (Int.ofNat hi.toNat).mul (2^63) + Int.ofNat lo.toNat = Int.ofNat (doubleDividend hi lo) := by
    simp [doubleDividend]
  unfold sourceDividend
  exact hr.trans hv

theorem doubleDivisionSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement := by
  change ∀ (hi lo b : Word), _
  intro hi lo b
  generalize hqr : Rocq.Corelib.BinNums.IntDef.Z.div_eucl (Rocq.Corelib.BinNums.IntDef.Z.add
    (Rocq.Corelib.BinNums.IntDef.Z.mul
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z hi)
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z lo))
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z b) = qr
  cases qr with
  | pair q r =>
    have hpair := NativeBridge.Incremental.BinaryDivision.z_div_eucl_agrees (sourceDividend hi lo)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z b)
    dsimp only [sourceDividend] at hpair
    have hpair' := (congrArg NativeBridge.Incremental.BinaryDivision.zPairTo hqr).symm.trans hpair
    have hq := congrArg Prod.fst hpair'
    have hr := congrArg Prod.snd hpair'
    dsimp only [NativeBridge.Incremental.BinaryDivision.zPairTo,
      NativeBridge.Incremental.BinaryDivision.floorPairNative] at hq hr
    have hq' := hq.trans (intCongr2 Int.fdiv (sourceDividend_agrees hi lo) (unsignedSource b))
    have hr' := hr.trans (intCongr2 Int.fmod (sourceDividend_agrees hi lo) (unsignedSource b))
    unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 Rocq2Lean.PrimInt63.div21
    split
    · rename_i h
      intro _
      have hv := doubleDivisionSpec_native hi lo b h
      apply Rocq.Corelib.Init.Logic.and.conj
      · apply eqOf
        apply zInjective
        have hl₀ := unsignedSource (BitVec.ofNat 63 ((hi.toNat*2^63+lo.toNat) / b.toNat))
        have hl₁ := congrArg Int.ofNat (BitVec.toNat_ofNat ((hi.toNat*2^63+lo.toNat) / b.toNat) 63)
        have hl := hl₀.trans (hl₁.trans (congrArg Int.ofNat hv.1))
        have he : Int.ofNat (doubleDividend hi lo / b.toNat) =
            (Int.ofNat (doubleDividend hi lo)).fdiv (Int.ofNat b.toNat) := by
          simp only [Int.ofNat_eq_natCast]
          rw [Int.fdiv_eq_ediv_of_nonneg _ (Int.natCast_nonneg _)]
          simp
        exact hl.trans (he.trans hq'.symm)
      · apply eqOf
        apply zInjective
        have hl₀ := unsignedSource (BitVec.ofNat 63 ((hi.toNat*2^63+lo.toNat) % b.toNat))
        have hl₁ := congrArg Int.ofNat (BitVec.toNat_ofNat ((hi.toNat*2^63+lo.toNat) % b.toNat) 63)
        have hl := hl₀.trans (hl₁.trans (congrArg Int.ofNat hv.2))
        have he : Int.ofNat (doubleDividend hi lo % b.toNat) =
            (Int.ofNat (doubleDividend hi lo)).fmod (Int.ofNat b.toNat) := by
          simp only [Int.ofNat_eq_natCast]
          rw [Int.fmod_eq_emod_of_nonneg _ (Int.natCast_nonneg _)]
          simp
        exact hl.trans (he.trans hr'.symm)
    · rename_i h
      intro hh
      exact (h ((NativeBridge.Incremental.Uint63OrderSpecs.ltUnsigned hi b).mp hh)).elim
theorem provedIff {P Q : Prop} (hp : P) (hq : Q) : P ↔ Q :=
  ⟨fun _ => hq,fun _ => hp⟩
theorem doubleDivisionSpec_correspondence :
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement ↔ doubleDivisionSpec :=
  @provedIff Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement
    doubleDivisionSpec (@doubleDivisionSpec_proof) (@doubleDivisionSpec_native)

end NativeBridge.Incremental.Uint63WideSpecs

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
  for name in ["NativeBridge.Incremental.Uint63WideSpecs.doubleDivisionSpec", "NativeBridge.Incremental.Uint63WideSpecs.wideProductSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
