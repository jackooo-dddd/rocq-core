import SpecifOperations
noncomputable section
namespace NativeBridge.Incremental.SpecifChoice
open NativeBridge NativeBridge.Incremental
universe u
abbrev RB := Rocq.Corelib.Init.Datatypes.bool
def boolTo : RB → Bool
  | .true => true
  | .false => false
def nativeBoolChoice {S : Type} {P Q : S → Prop} (H : ∀ x, PSum (P x) (Q x)) :
    {f : S → Bool // ∀ x, (f x = true ∧ P x) ∨ (f x = false ∧ Q x)} :=
  ⟨(fun x => match H x with | .inl _ => true | .inr _ => false),
   fun x => by cases h : H x with
     | inl p => exact .inl ⟨by simp only [h],p⟩
     | inr q => exact .inr ⟨by simp only [h],q⟩⟩
def boolChoiceTo {S : Type} {P Q : S → Prop}
    (r : Rocq.Corelib.Init.Specif.sig (S → RB) (fun f =>
      ∀ x, Rocq.Corelib.Init.Logic.or
        (Rocq.Corelib.Init.Logic.and (ME RB (f x) .true) (P x))
        (Rocq.Corelib.Init.Logic.and (ME RB (f x) .false) (Q x)))) :
    {f : S → Bool // ∀ x, (f x = true ∧ P x) ∨ (f x = false ∧ Q x)} :=
  ⟨(fun x => boolTo ((subtypeTo r).val x)),fun x => by
    cases (subtypeTo r).property x with
    | or_introl h =>
      cases h with
      | conj he hp => exact .inl ⟨congrArg boolTo (eqTo he),hp⟩
    | or_intror h =>
      cases h with
      | conj he hq => exact .inr ⟨congrArg boolTo (eqTo he),hq⟩⟩
def boolChoiceClosed := closed_specif% RocqPending.Corelib.Init.Specif.bool_choice
theorem bool_choice_agrees (S : Type) (P Q : S → Prop)
    (H : ∀ x, Rocq.Corelib.Init.Specif.sumbool (P x) (Q x)) :
    boolChoiceTo ((closed_specif% RocqPending.Corelib.Init.Specif.bool_choice) S P Q H) =
      nativeBoolChoice (fun x => sumboolTo (H x)) := by
  apply Subtype.ext
  funext x
  change boolTo (Rocq.Corelib.Init.Specif.sumbool.rec (motive := fun _ => RB)
    (fun _ => .true) (fun _ => .false) (H x)) =
    (match sumboolTo (H x) with | .inl _ => true | .inr _ => false)
  cases H x <;> rfl

def nativeDependentChoice {X : Sort u} {R : X → X → Prop}
    (H : ∀ x, {y // R x y}) (x0 : X) :
    {f : Nat → X // f 0 = x0 ∧ ∀ n, R (f n) (f (n+1))} :=
  ⟨Nat.rec x0 (fun _ x => (H x).val),rfl,fun _ => (H _).property⟩
def dependentChoiceTo {X : Sort u} {R : X → X → Prop} {x0 : X}
    (r : Rocq.Corelib.Init.Specif.sig (MN → X) (fun f =>
      Rocq.Corelib.Init.Logic.and (ME X (f .O) x0) (∀ n, R (f n) (f (.S n))))) :
    {f : Nat → X // f 0 = x0 ∧ ∀ n, R (f n) (f (n+1))} :=
  ⟨fun n => (subtypeTo r).val (natOf n),by
    cases (subtypeTo r).property with
    | conj hz hs => exact ⟨eqTo hz,fun n => hs (natOf n)⟩⟩
def dependentChoiceClosed := closed_specif% RocqPending.Corelib.Init.Specif.dependent_choice
theorem dependent_choice_agrees (X : Sort u) (R : X → X → Prop)
    (H : ∀ x, Rocq.Corelib.Init.Specif.sig X (R x)) (x0 : X) :
    dependentChoiceTo ((closed_specif% RocqPending.Corelib.Init.Specif.dependent_choice) X R H x0) =
      nativeDependentChoice (fun x => subtypeTo (H x)) x0 := by
  apply Subtype.ext
  funext n
  change Rocq.Corelib.Init.Datatypes.nat.rec (motive := fun _ => X) x0
    (fun _ x => (subtypeTo (H x)).val) (natOf n) =
    Nat.rec (motive := fun _ => X) x0 (fun _ x => (subtypeTo (H x)).val) n
  simpa only [natTo_of] using
    nat_rec_agrees x0 (fun _ x => (subtypeTo (H x)).val) (natOf n)
end NativeBridge.Incremental.SpecifChoice
