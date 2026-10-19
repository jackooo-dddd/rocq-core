import Interface_Classes_Morphisms
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.RC
open NativeBridge
open Rocq.Corelib.Classes.RelationClasses
universe u v w

theorem sourceFalse : Rocq.Corelib.Init.Logic.False ↔ False :=
  ⟨(fun h => by cases h), (fun h => False.elim h)⟩
theorem sourceAnd (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ P ∧ Q := by
  constructor
  · intro h
    cases h with | conj hp hq => exact ⟨hp,hq⟩
  · intro h
    exact .conj P Q h.1 h.2
theorem sourceOr (P Q : Prop) : Rocq.Corelib.Init.Logic.or P Q ↔ P ∨ Q := by
  constructor
  · intro h
    cases h with
    | or_introl hp => exact .inl hp
    | or_intror hq => exact .inr hq
  · intro h
    cases h with
    | inl hp => exact .or_introl P Q hp
    | inr hq => exact .or_intror P Q hq
theorem sourceIff (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ _
  exact (sourceAnd _ _).trans ⟨fun h => ⟨h.1,h.2⟩,fun h => ⟨h.mp,h.mpr⟩⟩

theorem reflexive_native (A : Type u) (R : A → A → Prop) :
    Reflexive A R ↔ ∀ x, R x x := Iff.rfl
theorem symmetric_native (A : Type u) (R : A → A → Prop) :
    Symmetric A R ↔ ∀ x y, R x y → R y x := Iff.rfl
theorem transitive_native (A : Type u) (R : A → A → Prop) :
    Transitive A R ↔ ∀ x y z, R x y → R y z → R x z := Iff.rfl
theorem complement_native (A : Type u) (R : A → A → Prop) (x y : A) :
    complement A R x y ↔ ¬ R x y := by
  unfold complement
  simp only [sourceFalse]
theorem irreflexive_native (A : Type u) (R : A → A → Prop) :
    Irreflexive A R ↔ ∀ x, ¬ R x x := by
  unfold Irreflexive Reflexive
  simp only [complement_native]
theorem subrelation_native (A : Type u) (R S : A → A → Prop) :
    subrelation A R S ↔ Subrelation R S := Iff.rfl
theorem conjunction_native (A : Type u) (R S : A → A → Prop) (x y : A) :
    relation_conjunction A R S x y ↔ R x y ∧ S x y :=
  sourceAnd _ _
theorem disjunction_native (A : Type u) (R S : A → A → Prop) (x y : A) :
    relation_disjunction A R S x y ↔ R x y ∨ S x y :=
  sourceOr _ _
theorem relation_equivalence_native (A : Type u) (R S : A → A → Prop) :
    relation_equivalence A R S ↔ ∀ x y, R x y ↔ S x y := by
  change (∀ x y, Rocq.Corelib.Init.Logic.iff (R x y) (S x y)) ↔ _
  simp only [sourceIff]

def NativePreorder {A : Type u} (R : A → A → Prop) : Prop :=
  (∀ x, R x x) ∧ (∀ x y z, R x y → R y z → R x z)
def NativePER {A : Type u} (R : A → A → Prop) : Prop :=
  (∀ x y, R x y → R y x) ∧ (∀ x y z, R x y → R y z → R x z)
def NativeStrictOrder {A : Type u} (R : A → A → Prop) : Prop :=
  (∀ x, ¬ R x x) ∧ (∀ x y z, R x y → R y z → R x z)

theorem equivalence_native (A : Type u) (R : A → A → Prop) :
    Equivalence A R ↔ _root_.Equivalence R := by
  constructor
  · intro h
    cases h with | Build_Equivalence hr hs ht => exact ⟨hr, fun h => hs _ _ h, fun h1 h2 => ht _ _ _ h1 h2⟩
  · intro h
    exact .Build_Equivalence A R h.refl (fun _ _ => h.symm) (fun _ _ _ => h.trans)
theorem preorder_native (A : Type u) (R : A → A → Prop) :
    PreOrder A R ↔ NativePreorder R := by
  constructor
  · intro h
    cases h with | Build_PreOrder hr ht => exact ⟨hr, ht⟩
  · intro h
    exact .Build_PreOrder A R h.1 h.2
theorem per_native (A : Type u) (R : A → A → Prop) :
    PER A R ↔ NativePER R := by
  constructor
  · intro h
    cases h with | Build_PER hs ht => exact ⟨hs, ht⟩
  · intro h
    exact .Build_PER A R h.1 h.2
theorem strictOrder_native (A : Type u) (R : A → A → Prop) :
    StrictOrder A R ↔ NativeStrictOrder R := by
  constructor
  · intro h
    cases h with | Build_StrictOrder hi ht => exact ⟨(irreflexive_native A R).mp hi, ht⟩
  · intro h
    exact .Build_StrictOrder A R ((irreflexive_native A R).mpr h.1) h.2

def equivalenceIso (A : Type u) (R : A → A → Prop) :
    Iso (Equivalence A R) (_root_.Equivalence R) := Iso.propositions (equivalence_native A R)
def preorderIso (A : Type u) (R : A → A → Prop) :
    Iso (PreOrder A R) (NativePreorder R) := Iso.propositions (preorder_native A R)
def perIso (A : Type u) (R : A → A → Prop) :
    Iso (PER A R) (NativePER R) := Iso.propositions (per_native A R)
def strictOrderIso (A : Type u) (R : A → A → Prop) :
    Iso (StrictOrder A R) (NativeStrictOrder R) := Iso.propositions (strictOrder_native A R)
def rewriteRelationIso (A : Type u) (R : A → A → Prop) :
    Iso (RewriteRelation A R) True where
  to _ := True.intro
  of _ := .Build_RewriteRelation A R
  of_to _ := rfl
  to_of _ := rfl
theorem rewriteRelation_native (A : Type u) (R : A → A → Prop) :
    RewriteRelation A R ↔ True := ⟨(rewriteRelationIso A R).to,(rewriteRelationIso A R).of⟩

theorem partialOrder_native (A : Type u) (E R : A → A → Prop)
    (h : _root_.Equivalence E) (p : NativePreorder R) :
    PartialOrder A E ((equivalenceIso A E).of h) R ((preorderIso A R).of p) ↔
      ∀ x y, E x y ↔ R x y ∧ R y x := by
  unfold PartialOrder
  rw [relation_equivalence_native]
  simp only [conjunction_native, Rocq.Corelib.Program.Basics.flip]

def binaryOperationIso (A : Type u) : Iso (binary_operation A) (A → A → A) := identityIso _
def binaryRelationIso (A : Type u) : Iso (binary_relation A) (A → A → Prop) where
  to f x y := (f x y).down
  of f x y := ⟨f x y⟩
  of_to f := rfl
  to_of f := rfl


theorem eq_relation_native (A : Sort u) :
    Rocq.Corelib.Init.Logic.eq A = (fun x y : A => x = y) := by
  funext x y
  exact propext (eq_correspondence x y)
theorem iff_relation_native :
    Rocq.Corelib.Init.Logic.iff = (fun P Q : Prop => P ↔ Q) := by
  funext P Q
  exact propext (sourceIff P Q)
theorem complement_function_native (A : Type u) :
    complement A = (fun (R : A → A → Prop) x y => ¬ R x y) := by
  funext R x y
  exact propext (complement_native A R x y)
theorem subrelation_function_native (A : Type u) :
    subrelation A = (fun R S : A → A → Prop => Subrelation R S) := rfl
theorem relation_equivalence_function_native (A : Type u) :
    relation_equivalence A = (fun R S : A → A → Prop => ∀ x y, R x y ↔ S x y) := by
  funext R S
  exact propext (relation_equivalence_native A R S)
theorem conjunction_function_native (A : Type u) :
    relation_conjunction A = (fun (R S : A → A → Prop) x y => R x y ∧ S x y) := by
  funext R S x y
  exact propext (conjunction_native A R S x y)
theorem disjunction_function_native (A : Type u) :
    relation_disjunction A = (fun (R S : A → A → Prop) x y => R x y ∨ S x y) := by
  funext R S x y
  exact propext (disjunction_native A R S x y)

theorem flip_function_native (A : Sort u) (B : Sort v) (C : Sort w) :
    Rocq.Corelib.Program.Basics.flip A B C = (fun (f : A → B → C) b a => f a b) := rfl

end NativeBridge.Incremental.RC

namespace NativeBridge.Incremental.Morphisms
open NativeBridge
open Rocq.Corelib.Classes.Morphisms
universe u v w z

theorem proper_native (A : Type u) (R : A → A → Prop) (f : A) :
    Proper A R f ↔ R f f := Iff.rfl
theorem properProxy_native (A : Type u) (R : A → A → Prop) (f : A) :
    ProperProxy A R f ↔ R f f := Iff.rfl
theorem reflexiveProxy_native (A : Type u) (R : A → A → Prop) :
    ReflexiveProxy A R ↔ ∀ x, R x x := Iff.rfl
theorem respectful_native (A B : Type u) (R : A → A → Prop) (S : B → B → Prop)
    (f g : A → B) :
    respectful A B R S f g ↔ ∀ x y, R x y → S (f x) (g y) := Iff.rfl
theorem respectful_hetero_native (A : Sort u) (B : Sort v)
    (C : A → Sort w) (D : B → Sort z) (R : A → B → Prop)
    (S : (x : A) → (y : B) → C x → D y → Prop)
    (f : (x : A) → C x) (g : (y : B) → D y) :
    respectful_hetero A B C D R S f g ↔ ∀ x y, R x y → S x y (f x) (g y) := Iff.rfl
theorem pointwise_relation_native (A : Type u) (B : Type v)
    (R : B → B → Prop) (f g : A → B) :
    pointwise_relation A B R f g ↔ ∀ x, R (f x) (g x) := Iff.rfl
theorem forall_relation_native (A : Type u) (P : A → Type u)
    (R : (a : A) → P a → P a → Prop) (f g : (a : A) → P a) :
    forall_relation A P R f g ↔ ∀ x, R x (f x) (g x) := Iff.rfl
theorem normalizes_native (A : Type u) (R S : A → A → Prop) :
    Normalizes A R S ↔ ∀ x y, R x y ↔ S x y :=
  RC.relation_equivalence_native A R S
def forallDefIso (A : Type u) (P : A → Type u) :
    Iso (forall_def A P) ((a : A) → P a) := identityIso _

def paramsIso (A : Sort u) (f : A) (n : Rocq.Corelib.Init.Datatypes.nat) :
    Iso (Params A f n) True where
  to _ := True.intro
  of _ := .Build_Params A f n
  of_to _ := rfl
  to_of _ := rfl
theorem params_native (A : Sort u) (f : A) (n : Rocq.Corelib.Init.Datatypes.nat) :
    Params A f n ↔ True := ⟨(paramsIso A f n).to,(paramsIso A f n).of⟩

def PartialApplicationIso : Iso PartialApplication True where
  to _ := True.intro
  of _ := .Build_PartialApplication
  of_to _ := rfl
  to_of _ := rfl
theorem PartialApplication_native : PartialApplication ↔ True :=
  ⟨PartialApplicationIso.to,PartialApplicationIso.of⟩

def apply_subrelationIso : Iso apply_subrelation True where
  to _ := True.intro
  of _ := .do_subrelation
  of_to _ := rfl
  to_of _ := rfl
theorem apply_subrelation_native : apply_subrelation ↔ True :=
  ⟨apply_subrelationIso.to,apply_subrelationIso.of⟩

def normalization_doneIso : Iso normalization_done True where
  to _ := True.intro
  of _ := .did_normalization
  of_to _ := rfl
  to_of _ := rfl
theorem normalization_done_native : normalization_done ↔ True :=
  ⟨normalization_doneIso.to,normalization_doneIso.of⟩

-- Existing native relational reasoning supplies a mechanically stated Proper instance.
theorem proper_across_iso {A : Type u} {B : Type v}
    (i : Iso A B) (R : B → B → Prop) (f : A → A) (g : B → B)
    (hf : ∀ x, i.to (f x) = g (i.to x))
    (hg : ∀ x y, R x y → R (g x) (g y)) :
    Proper (A → A) (respectful A A
      (fun x y => R (i.to x) (i.to y))
      (fun x y => R (i.to x) (i.to y))) f := by
  intro x y h
  change R (i.to (f x)) (i.to (f y))
  rw [hf x,hf y]
  exact hg _ _ h


theorem compose_function_native (A : Sort u) (B : Sort v) (C : Sort w) :
    Rocq.Corelib.Program.Basics.compose A B C =
      (fun (g : B → C) (f : A → B) x => g (f x)) := rfl
theorem impl_function_native :
    Rocq.Corelib.Program.Basics.impl = (fun P Q : Prop => P → Q) := rfl
theorem pointwise_function_native (A : Type u) (B : Type v) :
    pointwise_relation A B =
      (fun (R : B → B → Prop) (f g : A → B) => ∀ x, R (f x) (g x)) := rfl
theorem source_unit_forall_native (P : Prop) :
    (∀ _ : Rocq.Corelib.Init.Datatypes.unit, P) ↔ P :=
  ⟨fun h => h .tt, fun h _ => h⟩

end NativeBridge.Incremental.Morphisms
