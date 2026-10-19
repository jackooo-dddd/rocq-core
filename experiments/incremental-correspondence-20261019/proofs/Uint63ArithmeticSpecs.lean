import Uint63ArithmeticSupport
set_option maxHeartbeats 300000
noncomputable section
namespace NativeBridge.Incremental.Uint63ArithmeticSpecs
open NativeBridge.Incremental.Uint63Operations
open NativeBridge.Incremental.Uint63Conversions
open NativeBridge.Incremental.BinaryArithmetic
open NativeBridge.Incremental.BinaryDivision

theorem intCongr2 (f : Int → Int → Int) {a a' b b' : Int}
    (ha : a = a') (hb : b = b') : f a b = f a' b' := by cases ha; cases hb; rfl

theorem binaryToZ (z : Rocq.Corelib.Numbers.BinNums.Z) : binaryIntTo z = zTo z := by cases z <;> rfl
theorem unsignedSource (x : Word) :
    binaryIntTo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = Int.ofNat x.toNat :=
  (binaryToZ _).trans (toZ_agrees x)
theorem sourceBase : binaryIntTo Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB = (2^63 : Int) := rfl
theorem zInjective {a b : Rocq.Corelib.Numbers.BinNums.Z} (h : binaryIntTo a = binaryIntTo b) : a = b :=
  (binaryInt_of_to a).symm.trans ((congrArg binaryIntOf h).trans (binaryInt_of_to b))

def addSpec : Prop := ∀ x y : Word,
  Int.ofNat (x+y).toNat = (Int.ofNat x.toNat + Int.ofNat y.toNat).fmod (2^63)
def subSpec : Prop := ∀ x y : Word,
  Int.ofNat (x-y).toNat = (Int.ofNat x.toNat - Int.ofNat y.toNat).fmod (2^63)
def mulSpec : Prop := ∀ x y : Word,
  Int.ofNat (x*y).toNat = (Int.ofNat x.toNat * Int.ofNat y.toNat).fmod (2^63)
def divSpec : Prop := ∀ x y : Word,
  Int.ofNat (x/y).toNat = (Int.ofNat x.toNat).fdiv (Int.ofNat y.toNat)
def modSpec : Prop := ∀ x y : Word,
  Int.ofNat (x%y).toNat = (Int.ofNat x.toNat).fmod (Int.ofNat y.toNat)

theorem addSpec_native : addSpec := by
  intro x y
  rw [Int.fmod_eq_emod_of_nonneg _ (by decide)]
  simp
theorem mulSpec_native : mulSpec := by
  intro x y
  rw [Int.fmod_eq_emod_of_nonneg _ (by decide)]
  simp
theorem divSpec_native : divSpec := by
  intro x y
  simp only [Int.ofNat_eq_natCast]
  rw [Int.fdiv_eq_ediv_of_nonneg _ (Int.natCast_nonneg _)]
  simp [BitVec.toNat_udiv]
theorem modSpec_native : modSpec := by
  intro x y
  simp only [Int.ofNat_eq_natCast]
  rw [Int.fmod_eq_emod_of_nonneg _ (Int.natCast_nonneg _)]
  simp
theorem subSpec_native : subSpec := by
  intro x y
  rw [Int.fmod_eq_emod_of_nonneg _ (by decide)]
  have hy : y.toNat ≤ 2^63 := Nat.le_of_lt y.isLt
  simp only [BitVec.toNat_sub, Int.ofNat_eq_natCast, Int.natCast_emod, Int.natCast_add,
    Int.ofNat_sub hy]
  omega

theorem addSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_add_agrees x y)
  have ha := (z_add_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)).trans
    (intCongr2 Int.add (unsignedSource x) (unsignedSource y))
  have hr := (z_modulo_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB).trans
    (intCongr2 Int.fmod ha sourceBase)
  exact hl.trans (hl'.trans ((addSpec_native x y).trans hr.symm))
theorem subSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_sub_agrees x y)
  have ha := (z_sub_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)).trans
    (intCongr2 Int.sub (unsignedSource x) (unsignedSource y))
  have hr := (z_modulo_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB).trans
    (intCongr2 Int.fmod ha sourceBase)
  exact hl.trans (hl'.trans ((subSpec_native x y).trans hr.symm))
theorem mulSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_mul_agrees x y)
  have ha := (BinaryPower.z_mul_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)).trans
    (intCongr2 Int.mul (unsignedSource x) (unsignedSource y))
  have hr := (z_modulo_agrees
    (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB).trans
    (intCongr2 Int.fmod ha sourceBase)
  exact hl.trans (hl'.trans ((mulSpec_native x y).trans hr.symm))
theorem divSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_div_agrees x y)
  have hr := (z_div_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)).trans
    (intCongr2 Int.fdiv (unsignedSource x) (unsignedSource y))
  exact hl.trans (hl'.trans ((divSpec_native x y).trans hr.symm))
theorem modSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply zInjective
  have hl := unsignedSource (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y)
  have hl' := congrArg (fun w : Word => Int.ofNat w.toNat) (int63_mod_agrees x y)
  have hr := (z_modulo_agrees (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
    (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)).trans
    (intCongr2 Int.fmod (unsignedSource x) (unsignedSource y))
  exact hl.trans (hl'.trans ((modSpec_native x y).trans hr.symm))

theorem addSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement ↔ addSpec :=
  ⟨fun _ => addSpec_native, fun _ => addSpec_proof⟩

theorem subSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement ↔ subSpec :=
  ⟨fun _ => subSpec_native, fun _ => subSpec_proof⟩

theorem mulSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement ↔ mulSpec :=
  ⟨fun _ => mulSpec_native, fun _ => mulSpec_proof⟩

theorem divSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement ↔ divSpec :=
  ⟨fun _ => divSpec_native, fun _ => divSpec_proof⟩

theorem modSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement ↔ modSpec :=
  ⟨fun _ => modSpec_native, fun _ => modSpec_proof⟩

end NativeBridge.Incremental.Uint63ArithmeticSpecs

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
  for name in ["NativeBridge.Incremental.Uint63ArithmeticSpecs.addSpec", "NativeBridge.Incremental.Uint63ArithmeticSpecs.divSpec", "NativeBridge.Incremental.Uint63ArithmeticSpecs.modSpec", "NativeBridge.Incremental.Uint63ArithmeticSpecs.mulSpec", "NativeBridge.Incremental.Uint63ArithmeticSpecs.subSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
