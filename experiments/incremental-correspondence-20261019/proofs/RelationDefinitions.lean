import Interface_Relations_Relation_Definitions
noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u
namespace RD
open Rocq.Corelib.Relations.Relation_Definitions

def relationIso (A : Type u) : Iso (relation A) (A → A → Prop) := identityIso _

theorem reflexive_native (A : Type u) (R : A → A → Prop) :
    reflexive A R ↔ ∀ x, R x x := Iff.rfl
theorem symmetric_native (A : Type u) (R : A → A → Prop) :
    symmetric A R ↔ ∀ x y, R x y → R y x := Iff.rfl
theorem transitive_native (A : Type u) (R : A → A → Prop) :
    transitive A R ↔ ∀ x y z, R x y → R y z → R x z := Iff.rfl
theorem antisymmetric_native (A : Type u) (R : A → A → Prop) :
    antisymmetric A R ↔ ∀ x y, R x y → R y x → x = y := by
  unfold antisymmetric
  simp only [eq_correspondence]
theorem inclusion_native (A : Type u) (R S : A → A → Prop) :
    inclusion A R S ↔ Subrelation R S := Iff.rfl
theorem same_relation_native (A : Type u) (R S : A → A → Prop) :
    same_relation A R S ↔ ∀ x y, R x y ↔ S x y := by
  constructor
  · intro h
    cases h with | conj h1 h2 => exact fun x y => ⟨h1 x y, h2 x y⟩
  · intro h
    exact .conj _ _ (fun x y => (h x y).mp) (fun x y => (h x y).mpr)
theorem commut_native (A : Type u) (R S : A → A → Prop) :
    commut A R S ↔ ∀ x y, R y x → ∀ z, S z y → ∃ t, S t x ∧ R z t := by
  constructor
  · intro h x y hr z hs
    cases h x y hr z hs with
    | ex_intro2 t ht1 ht2 => exact ⟨t, ht1, ht2⟩
  · intro h x y hr z hs
    obtain ⟨t, ht1, ht2⟩ := h x y hr z hs
    exact .ex_intro2 A _ _ t ht1 ht2

def NativePreorder {A : Type u} (R : A → A → Prop) : Prop :=
  (∀ x, R x x) ∧ (∀ x y z, R x y → R y z → R x z)
def NativeOrder {A : Type u} (R : A → A → Prop) : Prop :=
  NativePreorder R ∧ (∀ x y, R x y → R y x → x = y)
def NativePER {A : Type u} (R : A → A → Prop) : Prop :=
  (∀ x y, R x y → R y x) ∧ (∀ x y z, R x y → R y z → R x z)

theorem equivalence_native (A : Type u) (R : A → A → Prop) :
    equivalence A R ↔ Equivalence R := by
  constructor
  · intro h
    cases h with | Build_equivalence hr ht hs => exact ⟨hr, fun h => hs _ _ h, fun h1 h2 => ht _ _ _ h1 h2⟩
  · intro h
    exact .Build_equivalence A R h.refl (fun _ _ _ => h.trans) (fun _ _ => h.symm)
theorem preorder_native (A : Type u) (R : A → A → Prop) :
    preorder A R ↔ NativePreorder R := by
  constructor
  · intro h
    cases h with | Build_preorder hr ht => exact ⟨hr, ht⟩
  · intro h
    exact .Build_preorder A R h.1 h.2
theorem order_native (A : Type u) (R : A → A → Prop) :
    order A R ↔ NativeOrder R := by
  constructor
  · intro h
    cases h with
    | Build_order hr ht ha => exact ⟨⟨hr, ht⟩, (antisymmetric_native A R).mp ha⟩
  · intro h
    exact .Build_order A R h.1.1 h.1.2 ((antisymmetric_native A R).mpr h.2)
theorem per_native (A : Type u) (R : A → A → Prop) :
    PER A R ↔ NativePER R := by
  constructor
  · intro h
    cases h with | Build_PER hs ht => exact ⟨hs, ht⟩
  · intro h
    exact .Build_PER A R h.1 h.2

def equivalenceIso (A : Type u) (R : A → A → Prop) :
    Iso (equivalence A R) (Equivalence R) := Iso.propositions (equivalence_native A R)
def preorderIso (A : Type u) (R : A → A → Prop) :
    Iso (preorder A R) (NativePreorder R) := Iso.propositions (preorder_native A R)
def orderIso (A : Type u) (R : A → A → Prop) :
    Iso (order A R) (NativeOrder R) := Iso.propositions (order_native A R)
def perIso (A : Type u) (R : A → A → Prop) :
    Iso (PER A R) (NativePER R) := Iso.propositions (per_native A R)

theorem equiv_native (A : Type u) (R : A → A → Prop) :
    equiv A R ↔ Equivalence R := by
  constructor
  · intro h
    cases h with
    | conj hr hrest =>
      cases hrest with
      | conj ht hs => exact ⟨hr, fun h => hs _ _ h, fun h1 h2 => ht _ _ _ h1 h2⟩
  · intro h
    exact .conj _ _ h.refl (.conj _ _ (fun _ _ _ => h.trans) (fun _ _ => h.symm))


def equiv_reflNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), Equivalence R → ∀ x, R x x
theorem equiv_refl_native :
    Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement.{u} ↔ equiv_reflNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement equiv_reflNative
  simp only [relation, equivalence_native, reflexive_native]
theorem equiv_refl_closed : Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement.{u} :=
  equiv_refl_native.mpr (fun _ _ h => h.refl)

def equiv_symNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), Equivalence R → ∀ x y, R x y → R y x
theorem equiv_sym_native :
    Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement.{u} ↔ equiv_symNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement equiv_symNative
  simp only [relation, equivalence_native, symmetric_native]
theorem equiv_sym_closed : Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement.{u} :=
  equiv_sym_native.mpr (fun _ _ h => fun _ _ => h.symm)

def equiv_transNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), Equivalence R → ∀ x y z, R x y → R y z → R x z
theorem equiv_trans_native :
    Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement.{u} ↔ equiv_transNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement equiv_transNative
  simp only [relation, equivalence_native, transitive_native]
theorem equiv_trans_closed : Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement.{u} :=
  equiv_trans_native.mpr (fun _ _ h => fun _ _ _ => h.trans)

def ord_reflNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativeOrder R → ∀ x, R x x
theorem ord_refl_native :
    Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement.{u} ↔ ord_reflNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement ord_reflNative
  simp only [relation, order_native, reflexive_native]
theorem ord_refl_closed : Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement.{u} :=
  ord_refl_native.mpr (fun _ _ h => h.1.1)

def ord_transNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativeOrder R → ∀ x y z, R x y → R y z → R x z
theorem ord_trans_native :
    Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement.{u} ↔ ord_transNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement ord_transNative
  simp only [relation, order_native, transitive_native]
theorem ord_trans_closed : Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement.{u} :=
  ord_trans_native.mpr (fun _ _ h => h.1.2)

def ord_antisymNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativeOrder R → ∀ x y, R x y → R y x → x = y
theorem ord_antisym_native :
    Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement.{u} ↔ ord_antisymNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement ord_antisymNative
  simp only [relation, order_native, antisymmetric_native]
theorem ord_antisym_closed : Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement.{u} :=
  ord_antisym_native.mpr (fun _ _ h => h.2)

def per_symNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativePER R → ∀ x y, R x y → R y x
theorem per_sym_native :
    Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement.{u} ↔ per_symNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement per_symNative
  simp only [relation, per_native, symmetric_native]
theorem per_sym_closed : Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement.{u} :=
  per_sym_native.mpr (fun _ _ h => h.1)

def per_transNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativePER R → ∀ x y z, R x y → R y z → R x z
theorem per_trans_native :
    Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement.{u} ↔ per_transNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement per_transNative
  simp only [relation, per_native, transitive_native]
theorem per_trans_closed : Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement.{u} :=
  per_trans_native.mpr (fun _ _ h => h.2)

def preord_reflNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativePreorder R → ∀ x, R x x
theorem preord_refl_native :
    Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement.{u} ↔ preord_reflNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement preord_reflNative
  simp only [relation, preorder_native, reflexive_native]
theorem preord_refl_closed : Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement.{u} :=
  preord_refl_native.mpr (fun _ _ h => h.1)

def preord_transNative : Prop :=
  ∀ (A : Type u) (R : A → A → Prop), NativePreorder R → ∀ x y z, R x y → R y z → R x z
theorem preord_trans_native :
    Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement.{u} ↔ preord_transNative.{u} := by
  unfold Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement preord_transNative
  simp only [relation, preorder_native, transitive_native]
theorem preord_trans_closed : Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement.{u} :=
  preord_trans_native.mpr (fun _ _ h => h.2)

-- A source equivalence can be consumed by Lean's existing quotient API.
def sourceSetoid {A : Type u} (R : A → A → Prop) (h : equivalence A R) : Setoid A :=
  ⟨R, (equivalenceIso A R).to h⟩
theorem quotient_sound_from_source {A : Type u} (R : A → A → Prop)
    (h : equivalence A R) (x y : A) (hxy : R x y) :
    Quotient.mk (sourceSetoid R h) x = Quotient.mk (sourceSetoid R h) y :=
  Quotient.sound hxy
end RD
end NativeBridge.Incremental

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
  for name in ["RD.equiv_reflNative", "RD.equiv_symNative", "RD.equiv_transNative", "RD.ord_reflNative", "RD.ord_transNative", "RD.ord_antisymNative", "RD.per_symNative", "RD.per_transNative", "RD.preord_reflNative", "RD.preord_transNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
