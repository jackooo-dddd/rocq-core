import Uint63Statements
set_option maxHeartbeats 100000
noncomputable section
namespace NativeBridge.Incremental.Uint63DefinitionSpecs
open NativeBridge.Incremental.Uint63Operations

abbrev RC := Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
theorem carryInjective {a b : RC} (h : carryTo a = carryTo b) : a = b := by
  cases a with
  | C0 x => cases b with
    | C0 y => exact congrArg (Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry.C0 _) (congrArg Prod.snd h)
    | C1 y => have hb : false = true := congrArg Prod.fst h; cases hb
  | C1 x => cases b with
    | C0 y => have hb : true = false := congrArg Prod.fst h; cases hb
    | C1 y => exact congrArg (Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry.C1 _) (congrArg Prod.snd h)

def primitiveAddCarry (x y : Word) : Bool × Word :=
  if x.toNat+y.toNat < 2^63 then (false,x+y) else (true,x+y)
def primitiveAddOneCarry (x y : Word) : Bool × Word :=
  if x.toNat+y.toNat+1 < 2^63 then (false,BitVec.ofNat 63 (x.toNat+y.toNat+1)) else (true,BitVec.ofNat 63 (x.toNat+y.toNat+1))
def primitiveSubCarry (x y : Word) : Bool × Word :=
  if y.toNat ≤ x.toNat then (false,x-y) else (true,x-y)
def primitiveSubOneCarry (x y : Word) : Bool × Word :=
  if y.toNat < x.toNat then (false,x-y-1) else (true,x-y-1)

theorem primitiveAdd_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc x y) = primitiveAddCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc Rocq2Lean.PrimInt63.addc primitiveAddCarry
  split <;> rfl
theorem primitiveAddOne_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc x y) = primitiveAddOneCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc Rocq2Lean.PrimInt63.addcarryc primitiveAddOneCarry
  split <;> rfl
theorem primitiveSub_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc x y) = primitiveSubCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc Rocq2Lean.PrimInt63.subc primitiveSubCarry
  split <;> rfl
theorem primitiveSubOne_agrees (x y : Word) :
    carryTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc x y) = primitiveSubOneCarry x y := by
  unfold Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc Rocq2Lean.PrimInt63.subcarryc primitiveSubOneCarry
  split <;> rfl

def addAgreement : Prop := ∀ x y, primitiveAddCarry x y = addWithCarry x y
def addOneAgreement : Prop := ∀ x y, primitiveAddOneCarry x y = addOneWithCarry x y
def subAgreement : Prop := ∀ x y, primitiveSubCarry x y = subWithBorrow x y
def subOneAgreement : Prop := ∀ x y, primitiveSubOneCarry x y = subOneWithBorrow x y
theorem addAgreement_native : addAgreement := by
  intro x y
  unfold primitiveAddCarry addWithCarry BitVec.uaddOverflow
  by_cases h : x.toNat+y.toNat < 2^63 <;> simp_all
theorem addOneAgreement_native : addOneAgreement := by
  intro x y
  have hv : BitVec.ofNat 63 (x.toNat+y.toNat+1) = x+y+1 := by
    apply BitVec.eq_of_toNat_eq
    simp [Nat.add_mod]
  unfold primitiveAddOneCarry addOneWithCarry
  by_cases h : x.toNat+y.toNat+1 < 2^63 <;> simp_all <;> omega
theorem subAgreement_native : subAgreement := by
  intro x y
  unfold primitiveSubCarry subWithBorrow BitVec.usubOverflow
  by_cases h : y.toNat ≤ x.toNat <;> simp_all
theorem subOneAgreement_native : subOneAgreement := by
  intro x y
  unfold primitiveSubOneCarry subOneWithBorrow
  by_cases h : y.toNat < x.toNat <;> simp_all

theorem addAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply carryInjective
  exact (primitiveAdd_agrees x y).trans ((addAgreement_native x y).trans (addc_agrees x y).symm)
theorem addAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement ↔ addAgreement :=
  ⟨fun _ => addAgreement_native, fun _ => addAgreement_proof⟩

theorem addOneAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply carryInjective
  exact (primitiveAddOne_agrees x y).trans ((addOneAgreement_native x y).trans (addcarryc_agrees x y).symm)
theorem addOneAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement ↔ addOneAgreement :=
  ⟨fun _ => addOneAgreement_native, fun _ => addOneAgreement_proof⟩

theorem subAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply carryInjective
  exact (primitiveSub_agrees x y).trans ((subAgreement_native x y).trans (subc_agrees x y).symm)
theorem subAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement ↔ subAgreement :=
  ⟨fun _ => subAgreement_native, fun _ => subAgreement_proof⟩

theorem subOneAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply carryInjective
  exact (primitiveSubOne_agrees x y).trans ((subOneAgreement_native x y).trans (subcarryc_agrees x y).symm)
theorem subOneAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement ↔ subOneAgreement :=
  ⟨fun _ => subOneAgreement_native, fun _ => subOneAgreement_proof⟩


theorem comparisonInjective {a b : Rocq.Corelib.Init.Datatypes.comparison}
    (h : comparisonTo a = comparisonTo b) : a = b := by
  cases a <;> cases b <;> cases h <;> rfl
def compareAgreement : Prop := ∀ x y : Word,
  (if x.toNat < y.toNat then Ordering.lt else if y.toNat < x.toNat then Ordering.gt else Ordering.eq) =
    compareWords x y
theorem compareAgreement_native : compareAgreement := by
  intro x y
  unfold compareWords
  by_cases h : x.toNat < y.toNat
  · simp [h,compare,compareOfLessAndEq]
  · by_cases e : x.toNat = y.toNat
    · simp [e,compare,compareOfLessAndEq]
    · have h' : y.toNat < x.toNat := by omega
      simp [h,e,h',compare,compareOfLessAndEq]
theorem compareAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  apply eqOf
  apply comparisonInjective
  exact (int63_compare_agrees x y).trans ((compareAgreement_native x y).trans (compare_agrees x y).symm)
def divPairAgreement : Prop := ∀ x y : Word, (x/y,x%y) = divisionPair x y
theorem divPairAgreement_native : divPairAgreement := fun _ _ => rfl
theorem divPairAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement := by
  intro x y
  apply eqOf
  rfl

-- Rechecked from WordOperations in this source dependency closure.
theorem primitiveFunnel_agrees (p x y : Word) :
    Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv p x y = funnelShift p x y := by
  have h1 := int63_lor_agrees
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x p)
    (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr y ((63 : Word)-p))
  have h2 := congrArg (fun a : Word => BitVec.or a (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr y ((63 : Word)-p)))
    (int63_lsl_agrees x p)
  have h3 := congrArg (fun b : Word => (x <<< p.toNat) ||| b)
    (int63_lsr_agrees y ((63 : Word)-p))
  exact h1.trans (h2.trans h3)
def funnelAgreement : Prop := ∀ p x y : Word,
  (x <<< p.toNat) ||| (y >>> ((63 : Word)-p).toNat) = funnelShift p x y
theorem funnelAgreement_native : funnelAgreement := fun _ _ _ => rfl
theorem funnelAgreement_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement := by
  change ∀ (p x y : Word), _
  intro p x y
  apply eqOf
  exact (primitiveFunnel_agrees p x y).trans (funnel_agrees p x y).symm

theorem compareAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement ↔ compareAgreement :=
  ⟨fun _ => compareAgreement_native, fun _ => compareAgreement_proof⟩

theorem divPairAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement ↔ divPairAgreement :=
  ⟨fun _ => divPairAgreement_native, fun _ => divPairAgreement_proof⟩

theorem funnelAgreement_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement ↔ funnelAgreement :=
  ⟨fun _ => funnelAgreement_native, fun _ => funnelAgreement_proof⟩

end NativeBridge.Incremental.Uint63DefinitionSpecs

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
  for name in ["NativeBridge.Incremental.Uint63DefinitionSpecs.addAgreement", "NativeBridge.Incremental.Uint63DefinitionSpecs.addOneAgreement", "NativeBridge.Incremental.Uint63DefinitionSpecs.compareAgreement", "NativeBridge.Incremental.Uint63DefinitionSpecs.divPairAgreement", "NativeBridge.Incremental.Uint63DefinitionSpecs.funnelAgreement", "NativeBridge.Incremental.Uint63DefinitionSpecs.subAgreement", "NativeBridge.Incremental.Uint63DefinitionSpecs.subOneAgreement"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
