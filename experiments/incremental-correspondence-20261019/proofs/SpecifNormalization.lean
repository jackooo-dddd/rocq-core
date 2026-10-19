import DependentStatements
noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u v w z

theorem subtype_back_roundtrip {A : Sort u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P) : subtypeOf (subtypeTo x) = x := (subtypeIso A P).of_to x
theorem subtype_forward_roundtrip {A : Sort u} {P : A → Prop} (x : Subtype P) : subtypeTo (subtypeOf x) = x := (subtypeIso A P).to_of x
theorem subtype_forall_native {A : Sort u} {P : A → Prop} (F : Rocq.Corelib.Init.Specif.sig A P → Prop) :
    (∀ x, F x) ↔ (∀ x : Subtype P, F (subtypeOf x)) := by
  constructor
  · intro h x; exact h _
  · intro h x
    have hx := h (subtypeTo x)
    rw [subtype_back_roundtrip x] at hx
    exact hx
theorem subtype_exists_native {A : Sort u} {P : A → Prop} (F : Rocq.Corelib.Init.Specif.sig A P → Prop) :
    (∃ x, F x) ↔ (∃ x : Subtype P, F (subtypeOf x)) := by
  constructor
  · rintro ⟨x,hx⟩; exact ⟨subtypeTo x, by simpa only [subtype_back_roundtrip x] using hx⟩
  · rintro ⟨x,hx⟩; exact ⟨subtypeOf x,hx⟩
theorem subtype_of_equality {A : Sort u} {P : A → Prop} (x y : Subtype P) :
    (subtypeOf x = subtypeOf y) ↔ x = y := by
  constructor
  · intro h; have hh := congrArg subtypeTo h
    simpa only [subtype_forward_roundtrip] using hh
  · intro h; cases h; rfl
theorem psigma_back_roundtrip {A : Sort u} {P : A → Sort v} (x : Rocq.Corelib.Init.Specif.sigT A P) : psigmaOf (psigmaTo x) = x := (psigmaIso A P).of_to x
theorem psigma_forward_roundtrip {A : Sort u} {P : A → Sort v} (x : PSigma P) : psigmaTo (psigmaOf x) = x := (psigmaIso A P).to_of x
theorem psigma_forall_native {A : Sort u} {P : A → Sort v} (F : Rocq.Corelib.Init.Specif.sigT A P → Prop) :
    (∀ x, F x) ↔ (∀ x : PSigma P, F (psigmaOf x)) := by
  constructor
  · intro h x; exact h _
  · intro h x
    have hx := h (psigmaTo x)
    rw [psigma_back_roundtrip x] at hx
    exact hx
theorem psigma_exists_native {A : Sort u} {P : A → Sort v} (F : Rocq.Corelib.Init.Specif.sigT A P → Prop) :
    (∃ x, F x) ↔ (∃ x : PSigma P, F (psigmaOf x)) := by
  constructor
  · rintro ⟨x,hx⟩; exact ⟨psigmaTo x, by simpa only [psigma_back_roundtrip x] using hx⟩
  · rintro ⟨x,hx⟩; exact ⟨psigmaOf x,hx⟩
theorem psigma_of_equality {A : Sort u} {P : A → Sort v} (x y : PSigma P) :
    (psigmaOf x = psigmaOf y) ↔ x = y := by
  constructor
  · intro h; have hh := congrArg psigmaTo h
    simpa only [psigma_forward_roundtrip] using hh
  · intro h; cases h; rfl
theorem psigma2_back_roundtrip {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) : psigma2Of (psigma2To x) = x := (psigma2Iso A P Q).of_to x
theorem psigma2_forward_roundtrip {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (x : PSigma (fun x => PProd (P x) (Q x))) : psigma2To (psigma2Of x) = x := (psigma2Iso A P Q).to_of x
theorem psigma2_forall_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (F : Rocq.Corelib.Init.Specif.sigT2 A P Q → Prop) :
    (∀ x, F x) ↔ (∀ x : PSigma (fun x => PProd (P x) (Q x)), F (psigma2Of x)) := by
  constructor
  · intro h x; exact h _
  · intro h x
    have hx := h (psigma2To x)
    rw [psigma2_back_roundtrip x] at hx
    exact hx
theorem psigma2_exists_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (F : Rocq.Corelib.Init.Specif.sigT2 A P Q → Prop) :
    (∃ x, F x) ↔ (∃ x : PSigma (fun x => PProd (P x) (Q x)), F (psigma2Of x)) := by
  constructor
  · rintro ⟨x,hx⟩; exact ⟨psigma2To x, by simpa only [psigma2_back_roundtrip x] using hx⟩
  · rintro ⟨x,hx⟩; exact ⟨psigma2Of x,hx⟩
theorem psigma2_of_equality {A : Sort u} {P : A → Sort v} {Q : A → Sort w} (x y : PSigma (fun x => PProd (P x) (Q x))) :
    (psigma2Of x = psigma2Of y) ↔ x = y := by
  constructor
  · intro h; have hh := congrArg psigma2To h
    simpa only [psigma2_forward_roundtrip] using hh
  · intro h; cases h; rfl
theorem subtype_projection_native {A : Sort u} {P : A → Prop} (x : Subtype P) :
    Rocq.Corelib.Init.Specif.proj1_sig A P (subtypeOf x) = x.val := by cases x; rfl
theorem psigma_projection_native {A : Sort u} {P : A → Sort v} (x : PSigma P) :
    Rocq.Corelib.Init.Specif.projT1 A P (psigmaOf x) = x.fst := by cases x; rfl
theorem psigma_value_native {A : Sort u} {P : A → Sort v} (x : PSigma P) :
    Rocq.Corelib.Init.Specif.projT2 A P (psigmaOf x) = x.snd := by cases x; rfl

theorem specif_ex_native {A : Sort u} (P : A → Prop) :
    Rocq.Corelib.Init.Logic.ex A P ↔ ∃ x, P x := by
  constructor
  · intro h; cases h with | ex_intro x hx => exact ⟨x,hx⟩
  · rintro ⟨x,hx⟩; exact .ex_intro A P x hx
theorem specif_ex2_native {A : Sort u} (P Q : A → Prop) :
    Rocq.Corelib.Init.Logic.ex2 A P Q ↔ ∃ x, P x ∧ Q x := by
  constructor
  · intro h; cases h with | ex_intro2 x hp hq => exact ⟨x,hp,hq⟩
  · rintro ⟨x,hp,hq⟩; exact .ex_intro2 A P Q x hp hq
theorem specif_inhabited_native (A : Sort u) :
    Rocq.Corelib.Init.Logic.inhabited A ↔ Nonempty A := by
  constructor
  · intro h; cases h with | inhabits x => exact ⟨x⟩
  · rintro ⟨x⟩; exact .inhabits A x
theorem subtype_nonempty_native {A : Sort u} {P : A → Prop} :
    Nonempty (Rocq.Corelib.Init.Specif.sig A P) ↔ Nonempty (Subtype P) :=
  ⟨fun ⟨x⟩ => ⟨subtypeTo x⟩,fun ⟨x⟩ => ⟨subtypeOf x⟩⟩
theorem psigma_equality_native {A : Sort u} {P : A → Sort v}
    (x y : Rocq.Corelib.Init.Specif.sigT A P) :
    (x = y) ↔ psigmaTo x = psigmaTo y := ((psigmaIso A P).eq_iff x y).symm
theorem psigma2_equality_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x y : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    (x = y) ↔ psigma2To x = psigma2To y := ((psigma2Iso A P Q).eq_iff x y).symm
theorem psigma_constructor_native {A : Sort u} {P : A → Sort v} (x : A) (p : P x) :
    psigmaTo (.existT A P x p) = ⟨x,p⟩ := rfl
theorem psigma2_constructor_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : A) (p : P x) (q : Q x) :
    psigma2To (.existT2 A P Q x p q) = ⟨x,⟨p,q⟩⟩ := rfl
theorem psigma2_drop_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : PSigma (fun x => PProd (P x) (Q x))) :
    Rocq.Corelib.Init.Specif.sigT_of_sigT2 A P Q (psigma2Of x) = psigmaOf ⟨x.fst,x.snd.fst⟩ := by
  cases x with | mk x pq => cases pq; rfl
theorem psigma2_third_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : PSigma (fun x => PProd (P x) (Q x))) :
    Rocq.Corelib.Init.Specif.projT3 A P Q (psigma2Of x) = x.snd.snd := by
  cases x with | mk x pq => cases pq; rfl

theorem specif_eq_rect_native {A : Sort u} (x : A) (P : A → Sort v)
    (h : P x) (y : A) (e : ME A x y) :
    Rocq.Corelib.Init.Logic.eq_rect A x P h y e = Eq.ndrec h (eqTo e) := by
  cases e; rfl

theorem subtype_family_forall {A : Sort u} {P : A → Prop} {B : Sort z} (F : (Rocq.Corelib.Init.Specif.sig A P → B) → Prop) :
    (∀ f, F f) ↔ (∀ f : Subtype P → B, F (fun x => f (subtypeTo x))) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf := h (fun x => f (subtypeOf x))
    have he : (fun x => f (subtypeOf (subtypeTo x))) = f := funext (fun x => congrArg f ((subtypeIso A P).of_to x))
    rw [he] at hf
    exact hf
theorem subtype2_family_forall {A : Sort u} {P Q : A → Prop} {B : Sort z} (F : (Rocq.Corelib.Init.Specif.sig2 A P Q → B) → Prop) :
    (∀ f, F f) ↔ (∀ f : {x : A // P x ∧ Q x} → B, F (fun x => f (subtype2To x))) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf := h (fun x => f (subtype2Of x))
    have he : (fun x => f (subtype2Of (subtype2To x))) = f := funext (fun x => congrArg f ((subtype2Iso A P Q).of_to x))
    rw [he] at hf
    exact hf
theorem psigma_family_forall {A : Sort u} {P : A → Sort v} {B : Sort z} (F : (Rocq.Corelib.Init.Specif.sigT A P → B) → Prop) :
    (∀ f, F f) ↔ (∀ f : PSigma P → B, F (fun x => f (psigmaTo x))) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf := h (fun x => f (psigmaOf x))
    have he : (fun x => f (psigmaOf (psigmaTo x))) = f := funext (fun x => congrArg f ((psigmaIso A P).of_to x))
    rw [he] at hf
    exact hf
theorem psigma2_family_forall {A : Sort u} {P : A → Sort v} {Q : A → Sort w} {B : Sort z} (F : (Rocq.Corelib.Init.Specif.sigT2 A P Q → B) → Prop) :
    (∀ f, F f) ↔ (∀ f : PSigma (fun x => PProd (P x) (Q x)) → B, F (fun x => f (psigma2To x))) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf := h (fun x => f (psigma2Of x))
    have he : (fun x => f (psigma2Of (psigma2To x))) = f := funext (fun x => congrArg f ((psigma2Iso A P Q).of_to x))
    rw [he] at hf
    exact hf
end NativeBridge.Incremental
