import SSRProperties
noncomputable section
namespace NativeBridge.Incremental.SSRFunNormalization
open NativeBridge
universe u v w
theorem quality_prod (P Q : Prop) :
    Rocq.Corelib.Init.Datatypes.prod.qualityProp P Q ↔ P ∧ Q := by
  constructor
  · intro h; cases h with | pair p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .pair P Q p q

theorem bijective_agrees (A : Type u) (B : Type v) (f : B → A) :
    Rocq.Corelib.ssr.ssrfun.bijective A B f ↔
      ∃ g : A → B, (∀ x, g (f x) = x) ∧ (∀ y, f (g y) = y) := by
  constructor
  · intro h
    cases h with
    | Bijective g h₁ h₂ => exact ⟨g,fun x => eqTo (h₁ x),fun y => eqTo (h₂ y)⟩
  · rintro ⟨g,h₁,h₂⟩
    exact .Bijective A B f g (fun x => eqOf (h₁ x)) (fun y => eqOf (h₂ y))

def bijectiveIso (A : Type u) (B : Type v) (f : B → A) :
    Iso (Rocq.Corelib.ssr.ssrfun.bijective A B f)
      (∃ g : A → B, (∀ x, g (f x) = x) ∧ (∀ y, f (g y) = y)) where
  to := (bijective_agrees A B f).mp
  of := (bijective_agrees A B f).mpr
  of_to _ := rfl
  to_of _ := rfl
@[simp] theorem false_agrees : Rocq.Corelib.Init.Logic.False ↔ False := by
  constructor <;> intro h <;> cases h

@[simp] theorem and_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.and P Q ↔ (P ∧ Q) := by
  constructor
  · intro h; cases h with | conj p q => exact ⟨p,q⟩
  · rintro ⟨p,q⟩; exact .conj P Q p q

@[simp] theorem not_agrees (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬ P := by
  change (P → Rocq.Corelib.Init.Logic.False) ↔ (P → False)
  simp only [false_agrees]

@[simp] theorem iff_agrees (P Q : Prop) : Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q) := by
  change Rocq.Corelib.Init.Logic.and (P → Q) (Q → P) ↔ (P ↔ Q)
  rw [and_agrees]
  exact ⟨fun h => ⟨h.1,h.2⟩, fun h => ⟨h.mp,h.mpr⟩⟩


theorem comp_function (A : Sort u) (B : Sort v) (C : Sort w) :
    Rocq.Corelib.ssr.ssrfun.comp A B C = (fun (f : B → A) (g : C → B) x => f (g x)) := rfl

def sigTo {A : Sort u} {P : A → Prop} : Rocq.Corelib.Init.Specif.sig A P → Subtype P
  | .exist _ _ a h => ⟨a,h⟩
def sigOf {A : Sort u} {P : A → Prop} (x : Subtype P) : Rocq.Corelib.Init.Specif.sig A P :=
  .exist A P x.val x.property
theorem sig_of_to {A : Sort u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) :
    sigOf (sigTo x) = x := by cases x; rfl
theorem sig_forall {A : Sort u} {P : A → Prop} (F : Rocq.Corelib.Init.Specif.sig A P → Prop) :
    (∀ x, F x) ↔ ∀ x : Subtype P, F (sigOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [sig_of_to] using h (sigTo x)
theorem sig_projection {A : Sort u} {P : A → Prop} (x : Subtype P) :
    Rocq.Corelib.Init.Specif.proj1_sig A P (sigOf x) = x.val := rfl

def sig2To {A : Sort u} {P Q : A → Prop} :
    Rocq.Corelib.Init.Specif.sig2 A P Q → {a // P a ∧ Q a}
  | .exist2 _ _ _ a hp hq => ⟨a,hp,hq⟩
def sig2Of {A : Sort u} {P Q : A → Prop} (x : {a // P a ∧ Q a}) :
    Rocq.Corelib.Init.Specif.sig2 A P Q := .exist2 A P Q x.val x.property.1 x.property.2
theorem sig2_of_to {A : Sort u} {P Q : A → Prop} (x : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    sig2Of (sig2To x) = x := by cases x; rfl
theorem sig2_forall {A : Sort u} {P Q : A → Prop} (F : Rocq.Corelib.Init.Specif.sig2 A P Q → Prop) :
    (∀ x, F x) ↔ ∀ x : {a // P a ∧ Q a}, F (sig2Of x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [sig2_of_to] using h (sig2To x)
theorem sig2_projection {A : Sort u} {P Q : A → Prop} (x : {a // P a ∧ Q a}) :
    Rocq.Corelib.ssr.ssrfun.s2val A P Q (sig2Of x) = x.val := rfl

def unitTo : Rocq.Corelib.Init.Datatypes.unit → Unit := fun _ => ()
def unitOf : Unit → Rocq.Corelib.Init.Datatypes.unit := fun _ => .tt
theorem unit_forall (F : Rocq.Corelib.Init.Datatypes.unit → Prop) :
    (∀ x, F x) ↔ ∀ x : Unit, F (unitOf x) := by
  constructor
  · intro h x; exact h _
  · intro h x; cases x; exact h ()
theorem unit_equality (x y : Rocq.Corelib.Init.Datatypes.unit) :
    (x = y) ↔ unitTo x = unitTo y := by cases x; cases y; constructor <;> intro _ <;> rfl
theorem unit_to_of (x : Unit) : unitTo (unitOf x) = x := by cases x; rfl
theorem unit_to_tt : unitTo Rocq.Corelib.Init.Datatypes.unit.tt = () := rfl

def sumTo {A : Sort u} {B : Sort v} : Rocq.Corelib.Init.Datatypes.sum A B → PSum A B
  | .inl _ _ a => .inl a
  | .inr _ _ b => .inr b
def sumOf {A : Sort u} {B : Sort v} : PSum A B → Rocq.Corelib.Init.Datatypes.sum A B
  | .inl a => .inl A B a
  | .inr b => .inr A B b
theorem sum_of_to {A : Sort u} {B : Sort v} (x : Rocq.Corelib.Init.Datatypes.sum A B) :
    sumOf (sumTo x) = x := by cases x <;> rfl
theorem sum_equality {A : Sort u} {B : Sort v} (x y : Rocq.Corelib.Init.Datatypes.sum A B) :
    (x = y) ↔ sumTo x = sumTo y := by
  constructor
  · exact congrArg sumTo
  · intro h; simpa only [sum_of_to] using congrArg sumOf h
theorem sum_left {A : Sort u} {B : Sort v} (a : A) :
    sumTo (Rocq.Corelib.Init.Datatypes.sum.inl A B a) = PSum.inl a := rfl
theorem sum_right {A : Sort u} {B : Sort v} (b : B) :
    sumTo (Rocq.Corelib.Init.Datatypes.sum.inr A B b) = PSum.inr b := rfl

end NativeBridge.Incremental.SSRFunNormalization
