import Interface_Classes_Equivalence
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

def NativePER {A : Type u} (R : A → A → Prop) : Prop :=
  (∀ x y, R x y → R y x) ∧ (∀ x y z, R x y → R y z → R x z)

theorem equivalence_native (A : Type u) (R : A → A → Prop) :
    Equivalence A R ↔ _root_.Equivalence R := by
  constructor
  · intro h
    cases h with | Build_Equivalence hr hs ht => exact ⟨hr, fun h => hs _ _ h, fun h1 h2 => ht _ _ _ h1 h2⟩
  · intro h
    exact .Build_Equivalence A R h.refl (fun _ _ => h.symm) (fun _ _ _ => h.trans)

theorem per_native (A : Type u) (R : A → A → Prop) :
    PER A R ↔ NativePER R := by
  constructor
  · intro h
    cases h with | Build_PER hs ht => exact ⟨hs, ht⟩
  · intro h
    exact .Build_PER A R h.1 h.2

def equivalenceIso (A : Type u) (R : A → A → Prop) :
    Iso (Equivalence A R) (_root_.Equivalence R) := Iso.propositions (equivalence_native A R)

def perIso (A : Type u) (R : A → A → Prop) :
    Iso (PER A R) (NativePER R) := Iso.propositions (per_native A R)

end NativeBridge.Incremental.RC

namespace NativeBridge.Incremental.EquivalenceBridge
open NativeBridge
universe u v
theorem equiv_native (A : Type u) (R : A → A → Prop) (h : Equivalence R) :
    Rocq.Corelib.Classes.Equivalence.equiv A R ((RC.equivalenceIso A R).of h) = R := rfl
theorem pequiv_native (A : Type u) (R : A → A → Prop) (h : RC.NativePER R) :
    Rocq.Corelib.Classes.Equivalence.pequiv A R ((RC.perIso A R).of h) = R := rfl
def respectingIso (A B : Type u) (R : A → A → Prop) (S : B → B → Prop)
    (ha : Equivalence R) (hb : Equivalence S) :
    Iso (Rocq.Corelib.Classes.Equivalence.respecting A R ((RC.equivalenceIso A R).of ha)
      B S ((RC.equivalenceIso B S).of hb))
      {f : A → B // ∀ x y, R x y → S (f x) (f y)} := sigIso _ _

theorem pointwise_function_native (A : Type u) (B : Type v) :
    Rocq.Corelib.Classes.Morphisms.pointwise_relation A B =
      (fun (R : B → B → Prop) (f g : A → B) => ∀ x, R (f x) (g x)) := rfl
theorem equivalence_fields_native {A : Sort u} (R : A → A → Prop) :
    Equivalence R ↔ ((∀ x, R x x) ∧ (∀ x y, R x y → R y x) ∧
      (∀ x y z, R x y → R y z → R x z)) :=
  ⟨fun h => ⟨h.refl,(fun _ _ => h.symm),(fun _ _ _ => h.trans)⟩,
    fun h => ⟨h.1,(fun hxy => h.2.1 _ _ hxy),(fun hxy hyz => h.2.2 _ _ _ hxy hyz)⟩⟩
theorem sig_forall_native {A : Type u} {P : A → Prop}
    (Q : Rocq.Corelib.Init.Specif.sig A P → Prop) :
    (∀ s, Q s) ↔ ∀ s : Subtype P, Q (sigOf s) := by
  constructor
  · intro h s; exact h (sigOf s)
  · intro h s
    have hs := h (sigTo s)
    simpa only [sig_of_to] using hs
theorem proj_sigOf_native {A : Type u} {P : A → Prop} (s : Subtype P) :
    Rocq.Corelib.Init.Specif.proj1_sig A P (sigOf s) = s.val := by
  cases s
  rfl

-- Native bundle can be consumed without any mechanically defined field.
theorem native_respecting_closed_under_composition
    {A B C : Type u} (R : A → A → Prop) (S : B → B → Prop) (T : C → C → Prop)
    (f : {f : A → B // ∀ x y, R x y → S (f x) (f y)})
    (g : {g : B → C // ∀ x y, S x y → T (g x) (g y)}) :
    ∀ x y, R x y → T ((g.val ∘ f.val) x) ((g.val ∘ f.val) y) :=
  fun x y h => g.property _ _ (f.property x y h)

end NativeBridge.Incremental.EquivalenceBridge
