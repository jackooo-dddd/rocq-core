import Interface_Setoids_Setoid
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.RC
open NativeBridge
open Rocq.Corelib.Classes.RelationClasses
universe u
theorem reflexive_native (A : Type u) (R : A → A → Prop) :
    Reflexive A R ↔ ∀ x, R x x := Iff.rfl

theorem symmetric_native (A : Type u) (R : A → A → Prop) :
    Symmetric A R ↔ ∀ x y, R x y → R y x := Iff.rfl

theorem transitive_native (A : Type u) (R : A → A → Prop) :
    Transitive A R ↔ ∀ x y z, R x y → R y z → R x z := Iff.rfl

theorem equivalence_native (A : Type u) (R : A → A → Prop) :
    Equivalence A R ↔ _root_.Equivalence R := by
  constructor
  · intro h
    cases h with | Build_Equivalence hr hs ht => exact ⟨hr, fun h => hs _ _ h, fun h1 h2 => ht _ _ _ h1 h2⟩
  · intro h
    exact .Build_Equivalence A R h.refl (fun _ _ => h.symm) (fun _ _ _ => h.trans)

def equivalenceIso (A : Type u) (R : A → A → Prop) :
    Iso (Equivalence A R) (_root_.Equivalence R) := Iso.propositions (equivalence_native A R)

theorem eq_relation_native (A : Sort u) :
    Rocq.Corelib.Init.Logic.eq A = (fun x y : A => x = y) := by
  funext x y
  exact propext (eq_correspondence x y)

end NativeBridge.Incremental.RC

namespace NativeBridge.Incremental.SetoidBridge
open NativeBridge
universe u
def setoidTheoryIso (A : Type u) (R : A → A → Prop) :
    Iso (Rocq.Corelib.Setoids.Setoid.Setoid_Theory A R) (Equivalence R) :=
  RC.equivalenceIso A R
theorem setoidTheory_native (A : Type u) (R : A → A → Prop) :
    Rocq.Corelib.Setoids.Setoid.Setoid_Theory A R ↔ Equivalence R :=
  RC.equivalence_native A R
def buildTheoryNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop),
    (∀ x, R x x) → (∀ x y, R x y → R y x) →
    (∀ x y z, R x y → R y z → R x z) → Equivalence R
def seqReflNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), Equivalence R → ∀ x, R x x
def seqSymmNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), Equivalence R → ∀ x y, R x y → R y x
def seqTransNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), Equivalence R → ∀ x y z, R x y → R y z → R x z
def genStNative : Prop :=
  ∀ A : Type, Equivalence (fun x y : A => x = y)

theorem Build_Setoid_Theory_native :
    Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement.{u} ↔ buildTheoryNative.{u} := by
  unfold Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement buildTheoryNative
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    setoidTheory_native, RC.equivalence_native, RC.reflexive_native,
    RC.symmetric_native, RC.transitive_native, RC.eq_relation_native]
theorem Build_Setoid_Theory_closed : Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement.{u} :=
  Build_Setoid_Theory_native.mpr (fun _ _ hr hs ht => ⟨hr,fun h => hs _ _ h,fun h1 h2 => ht _ _ _ h1 h2⟩)

theorem Seq_refl_native :
    Rocq.Corelib.Setoids.Setoid.Seq_refl.statement.{u} ↔ seqReflNative.{u} := by
  unfold Rocq.Corelib.Setoids.Setoid.Seq_refl.statement seqReflNative
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    setoidTheory_native, RC.equivalence_native, RC.reflexive_native,
    RC.symmetric_native, RC.transitive_native, RC.eq_relation_native]
theorem Seq_refl_closed : Rocq.Corelib.Setoids.Setoid.Seq_refl.statement.{u} :=
  Seq_refl_native.mpr (fun _ _ h => h.refl)

theorem Seq_sym_native :
    Rocq.Corelib.Setoids.Setoid.Seq_sym.statement.{u} ↔ seqSymmNative.{u} := by
  unfold Rocq.Corelib.Setoids.Setoid.Seq_sym.statement seqSymmNative
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    setoidTheory_native, RC.equivalence_native, RC.reflexive_native,
    RC.symmetric_native, RC.transitive_native, RC.eq_relation_native]
theorem Seq_sym_closed : Rocq.Corelib.Setoids.Setoid.Seq_sym.statement.{u} :=
  Seq_sym_native.mpr (fun _ _ h _ _ => h.symm)

theorem Seq_trans_native :
    Rocq.Corelib.Setoids.Setoid.Seq_trans.statement.{u} ↔ seqTransNative.{u} := by
  unfold Rocq.Corelib.Setoids.Setoid.Seq_trans.statement seqTransNative
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    setoidTheory_native, RC.equivalence_native, RC.reflexive_native,
    RC.symmetric_native, RC.transitive_native, RC.eq_relation_native]
theorem Seq_trans_closed : Rocq.Corelib.Setoids.Setoid.Seq_trans.statement.{u} :=
  Seq_trans_native.mpr (fun _ _ h _ _ _ => h.trans)

theorem gen_st_native :
    Rocq.Corelib.Setoids.Setoid.gen_st.statement ↔ genStNative := by
  unfold Rocq.Corelib.Setoids.Setoid.gen_st.statement genStNative
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    setoidTheory_native, RC.equivalence_native, RC.reflexive_native,
    RC.symmetric_native, RC.transitive_native, RC.eq_relation_native]
theorem gen_st_closed : Rocq.Corelib.Setoids.Setoid.gen_st.statement :=
  gen_st_native.mpr (fun _ => ⟨fun _ => rfl,fun h => h.symm,fun h1 h2 => h1.trans h2⟩)

end NativeBridge.Incremental.SetoidBridge

open Lean Meta in
private partial def dependentNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      if let some body := (← getConstInfo n).value? then
        found := found ++ (← dependentNativeRefs body seen)
  return found

open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["SetoidBridge.buildTheoryNative", "SetoidBridge.seqReflNative", "SetoidBridge.seqSymmNative", "SetoidBridge.seqTransNative", "SetoidBridge.genStNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
