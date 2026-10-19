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
theorem subtype_constructor_native {A : Sort u} {P : A → Prop} (x : A) (p : P x) :
    subtypeTo (.exist A P x p) = ⟨x,p⟩ := rfl
theorem subtype2_constructor_native {A : Sort u} {P Q : A → Prop} (x : A) (p : P x) (q : Q x) :
    subtype2To (.exist2 A P Q x p q) = ⟨x,⟨p,q⟩⟩ := rfl
theorem subtype2_of_equality {A : Sort u} {P Q : A → Prop} (x y : {x : A // P x ∧ Q x}) :
    (subtype2Of x = subtype2Of y) ↔ x = y := by
  constructor
  · intro h; have hh := congrArg subtype2To h
    simpa only [subtype2_native_roundtrip] using hh
  · intro h; cases h; rfl
theorem psigma_eta_projection_native {A : Sort u} {P : A → Sort v} (x : PSigma P) :
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) (psigmaOf x) = x.fst := by cases x; rfl
theorem psigma_eta_value_native {A : Sort u} {P : A → Sort v} (x : PSigma P) :
    Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) (psigmaOf x) = x.snd := by cases x; rfl
theorem psigma2_eta_drop_native {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : PSigma (fun x => PProd (P x) (Q x))) :
    Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) (psigma2Of x) =
      psigmaOf ⟨x.fst,x.snd.fst⟩ := by cases x with | mk x pq => cases pq; rfl

theorem sumbool_forall_native {P Q : Prop} (F : Rocq.Corelib.Init.Specif.sumbool P Q → Prop) :
    (∀ x, F x) ↔ (∀ x : PSum P Q, F (sumboolOf x)) := by
  constructor
  · intro h x; exact h _
  · intro h x
    have hx := h (sumboolTo x)
    have he : sumboolOf (sumboolTo x) = x := (sumboolIso P Q).of_to x
    rw [he] at hx
    exact hx
theorem sumbool_family_forall {P Q : Prop} {B : Sort z} (F : (Rocq.Corelib.Init.Specif.sumbool P Q → B) → Prop) :
    (∀ f, F f) ↔ (∀ f : PSum P Q → B, F (fun x => f (sumboolTo x))) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf := h (fun x => f (sumboolOf x))
    have he : (fun x => f (sumboolOf (sumboolTo x))) = f := funext (fun x => congrArg f ((sumboolIso P Q).of_to x))
    rw [he] at hf
    exact hf
theorem quality_sigT_native (A : Prop) (P : A → Prop) :
    Rocq.Corelib.Init.Specif.sigT.qualityProp A P ↔ ∃ x, P x := by
  constructor
  · intro h; cases h with | existT x hx => exact ⟨x,hx⟩
  · rintro ⟨x,hx⟩; exact .existT A P x hx
theorem quality_sigT2_native (A : Prop) (P Q : A → Prop) :
    Rocq.Corelib.Init.Specif.sigT2.qualityProp A P Q ↔ ∃ x, P x ∧ Q x := by
  constructor
  · intro h; cases h with | existT2 x hp hq => exact ⟨x,hp,hq⟩
  · rintro ⟨x,hp,hq⟩; exact .existT2 A P Q x hp hq

def sumorSortTo {A : Sort u} {P : Prop} :
    Rocq.Corelib.Init.Specif.sumor A P → PSum A P :=
  Rocq.Corelib.Init.Specif.sumor.rec PSum.inl PSum.inr
def sumorSortOf {A : Sort u} {P : Prop} : PSum A P → Rocq.Corelib.Init.Specif.sumor A P
  | .inl a => .inleft A P a
  | .inr p => .inright A P p
def sumorSortIso (A : Sort u) (P : Prop) : Iso (Rocq.Corelib.Init.Specif.sumor A P) (PSum A P) where
  to := sumorSortTo
  of := sumorSortOf
  of_to x := by cases x <;> rfl
  to_of x := by cases x <;> rfl
theorem sumor_forall_native {A : Sort u} {P : Prop} (F : Rocq.Corelib.Init.Specif.sumor A P → Prop) :
    (∀ x, F x) ↔ (∀ x : PSum A P, F (sumorSortOf x)) := by
  constructor
  · intro h x; exact h _
  · intro h x
    have hx := h (sumorSortTo x)
    have he : sumorSortOf (sumorSortTo x) = x := (sumorSortIso A P).of_to x
    rw [he] at hx
    exact hx
theorem sumor_family_forall {A : Sort u} {P : Prop} {B : Sort z} (F : (Rocq.Corelib.Init.Specif.sumor A P → B) → Prop) :
    (∀ f, F f) ↔ (∀ f : PSum A P → B, F (fun x => f (sumorSortTo x))) := by
  constructor
  · intro h f; exact h _
  · intro h f
    have hf := h (fun x => f (sumorSortOf x))
    have he : (fun x => f (sumorSortOf (sumorSortTo x))) = f := funext (fun x => congrArg f ((sumorSortIso A P).of_to x))
    rw [he] at hf
    exact hf
theorem sumbool_left_native {P Q : Prop} (p : P) : sumboolTo (.left P Q p) = PSum.inl p := rfl
theorem sumbool_right_native {P Q : Prop} (q : Q) : sumboolTo (.right P Q q) = PSum.inr q := rfl
theorem sumor_left_native {A : Sort u} {P : Prop} (a : A) : sumorSortTo (.inleft A P a) = PSum.inl a := rfl
theorem sumor_right_native {A : Sort u} {P : Prop} (p : P) : sumorSortTo (.inright A P p) = PSum.inr p := rfl
theorem sumor_forward_roundtrip {A : Sort u} {P : Prop} (x : PSum A P) :
    sumorSortTo (sumorSortOf x) = x := (sumorSortIso A P).to_of x

theorem eq_proof_exists_native {A : Sort u} {x y : A} (F : ME A x y → Prop) :
    (∃ h, F h) ↔ (∃ h : x = y, F (eqOf h)) := by
  constructor
  · rintro ⟨h,hh⟩; exact ⟨eqTo h, by simpa only [eqOf_to] using hh⟩
  · rintro ⟨h,hh⟩; exact ⟨eqOf h,hh⟩
theorem eq_proof_forall_native {A : Sort u} {x y : A} (F : ME A x y → Prop) :
    (∀ h, F h) ↔ (∀ h : x = y, F (eqOf h)) := by
  constructor
  · intro h e; exact h _
  · intro h e; simpa only [eqOf_to] using h (eqTo e)

theorem pprod_forall_native {A : Sort u} {B : Sort v}
    (F : Rocq.Corelib.Init.Datatypes.prod A B → Prop) :
    (∀ x, F x) ↔ (∀ x : PProd A B, F (pprodOf x)) := by
  constructor
  · intro h x; exact h _
  · intro h x
    have hx := h (pprodTo x)
    have he : pprodOf (pprodTo x) = x := (pprodIso A B).of_to x
    rw [he] at hx; exact hx
theorem pprod_equality_native {A : Sort u} {B : Sort v}
    (x y : Rocq.Corelib.Init.Datatypes.prod A B) :
    (x = y) ↔ pprodTo x = pprodTo y := ((pprodIso A B).eq_iff x y).symm
theorem pprod_forward_roundtrip {A : Sort u} {B : Sort v} (x : PProd A B) :
    pprodTo (pprodOf x) = x := (pprodIso A B).to_of x

end NativeBridge.Incremental
