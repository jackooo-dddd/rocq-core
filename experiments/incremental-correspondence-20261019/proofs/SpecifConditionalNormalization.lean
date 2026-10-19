import SpecifWitnesses
noncomputable section
namespace NativeBridge.Incremental.SpecifConditionalNormalization
open NativeBridge NativeBridge.Incremental
universe u v w z
theorem proof_equality (P : Prop) (x y : P) : (x = y) ↔ True := by
  constructor
  · intro _; trivial
  · intro _; rfl
theorem quality_sig_native (A : Prop) (P : A → Prop) :
    Rocq.Corelib.Init.Specif.sig.qualityProp A P ↔ ∃ x, P x := by
  constructor
  · intro h; cases h with | exist x hx => exact ⟨x,hx⟩
  · rintro ⟨x,hx⟩; exact .exist A P x hx
theorem quality_sig2_native (A : Prop) (P Q : A → Prop) :
    Rocq.Corelib.Init.Specif.sig2.qualityProp A P Q ↔ ∃ x, P x ∧ Q x := by
  constructor
  · intro h; cases h with | exist2 x hp hq => exact ⟨x,hp,hq⟩
  · rintro ⟨x,hp,hq⟩; exact .exist2 A P Q x hp hq
theorem sig_drop_native (H : Rocq.Corelib.Init.Specif.sig_of_sig2__rocq2lean_obligation_1.statement.{u})
    (A : Sort u) (P Q : A → Prop) (x : {a // P a ∧ Q a}) :
    @RocqPending.Corelib.Init.Specif.sig_of_sig2 H A P Q (subtype2Of x) =
      subtypeOf (P := P) ⟨x.val,x.property.1⟩ := by cases x; rfl

theorem subtype_equality {A : Sort u} {P : A → Prop} (x y : Rocq.Corelib.Init.Specif.sig A P) :
    (x = y) ↔ subtypeTo x = subtypeTo y := (subtypeIso A P |>.eq_iff x y).symm

theorem equality_family_forall {A : Sort u} {B : Sort v} (i : Iso A B) (x y : A)
    (F : (ME A x y → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (i.to x = i.to y) → Prop, F (fun h => R (congrArg i.to (eqTo h))) := by
  constructor
  · intro h R; exact h _
  · intro h R
    have hh := h (fun e => R (eqOf (i.injective e)))
    have hf : (fun e : ME A x y => R (eqOf (i.injective (congrArg i.to (eqTo e))))) = R := by
      funext e; rfl
    rw [hf] at hh
    exact hh

theorem sig_eq_family_forall (A : Sort u) (P : A → Prop) (x y : Rocq.Corelib.Init.Specif.sig A P)
    (F : (ME (Rocq.Corelib.Init.Specif.sig A P) x y → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (subtypeTo x = subtypeTo y) → Prop,
      F (fun h => R (congrArg subtypeTo (eqTo h))) :=
  equality_family_forall (subtypeIso A P) x y F

theorem sig2_eq_family_forall (A : Sort u) (P Q : A → Prop) (x y : Rocq.Corelib.Init.Specif.sig2 A P Q)
    (F : (ME (Rocq.Corelib.Init.Specif.sig2 A P Q) x y → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (subtype2To x = subtype2To y) → Prop,
      F (fun h => R (congrArg subtype2To (eqTo h))) :=
  equality_family_forall (subtype2Iso A P Q) x y F

theorem sigT_eq_family_forall (A : Sort u) (P : A → Sort v) (x y : Rocq.Corelib.Init.Specif.sigT A P)
    (F : (ME (Rocq.Corelib.Init.Specif.sigT A P) x y → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (psigmaTo x = psigmaTo y) → Prop,
      F (fun h => R (congrArg psigmaTo (eqTo h))) :=
  equality_family_forall (psigmaIso A P) x y F

theorem sigT2_eq_family_forall (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (x y : Rocq.Corelib.Init.Specif.sigT2 A P Q)
    (F : (ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) x y → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (psigma2To x = psigma2To y) → Prop,
      F (fun h => R (congrArg psigma2To (eqTo h))) :=
  equality_family_forall (psigma2Iso A P Q) x y F


theorem equality_family_native {A : Sort u} {B : Sort v} (i : Iso A B) (x y : B)
    (F : (ME A (i.of x) (i.of y) → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (x = y) → Prop, F (fun h => R (i.symm.injective (eqTo h))) := by
  constructor
  · intro h R; exact h _
  · intro h R
    have hh := h (fun e => R (eqOf (congrArg i.of e)))
    have hf : (fun e : ME A (i.of x) (i.of y) =>
        R (eqOf (congrArg i.of (i.symm.injective (eqTo e))))) = R := by
      funext e; rfl
    rw [hf] at hh
    exact hh

theorem sig_eq_family_native (A : Sort u) (P : A → Prop) (x y : Subtype P)
    (F : (ME (Rocq.Corelib.Init.Specif.sig A P) (subtypeOf x) (subtypeOf y) → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (x = y) → Prop,
      F (fun h => R ((subtypeIso A P).symm.injective (eqTo h))) :=
  equality_family_native (subtypeIso A P) x y F

theorem sig2_eq_family_native (A : Sort u) (P Q : A → Prop) (x y : {a // P a ∧ Q a})
    (F : (ME (Rocq.Corelib.Init.Specif.sig2 A P Q) (subtype2Of x) (subtype2Of y) → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (x = y) → Prop,
      F (fun h => R ((subtype2Iso A P Q).symm.injective (eqTo h))) :=
  equality_family_native (subtype2Iso A P Q) x y F

theorem sigT_eq_family_native (A : Sort u) (P : A → Sort v) (x y : PSigma P)
    (F : (ME (Rocq.Corelib.Init.Specif.sigT A P) (psigmaOf x) (psigmaOf y) → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (x = y) → Prop,
      F (fun h => R ((psigmaIso A P).symm.injective (eqTo h))) :=
  equality_family_native (psigmaIso A P) x y F

theorem sigT2_eq_family_native (A : Sort u) (P : A → Sort v) (Q : A → Sort w)
    (x y : PSigma (fun a => PProd (P a) (Q a)))
    (F : (ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) (psigma2Of x) (psigma2Of y) → Prop) → Prop) :
    (∀ R, F R) ↔ ∀ R : (x = y) → Prop,
      F (fun h => R ((psigma2Iso A P Q).symm.injective (eqTo h))) :=
  equality_family_native (psigma2Iso A P Q) x y F
theorem nativePSigmaEq {A : Sort u} {P : A → Sort v} (x y : PSigma P)
    (p : x.fst = y.fst) (q : Eq.ndrec (motive := P) x.snd p = y.snd) : x = y := by
  cases x; cases y; cases p; cases q; rfl
theorem nativePSigma2Eq {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x y : PSigma (fun a => PProd (P a) (Q a))) (p : x.fst = y.fst)
    (q : Eq.ndrec (motive := P) x.snd.fst p = y.snd.fst)
    (r : Eq.ndrec (motive := Q) x.snd.snd p = y.snd.snd) : x = y := by
  rcases x with ⟨a, p1, q1⟩
  rcases y with ⟨b, p2, q2⟩
  cases p; cases q; cases r; rfl


theorem nativeSubtypeExistsEq {A : Sort u} {P : A → Prop} (x y : Subtype P)
    {S : (x.val = y.val) → Prop} (h : ∃ e, S e) : x = y := by
  obtain ⟨e, _⟩ := h
  exact Subtype.ext e
theorem nativePSigmaExistsEq {A : Sort u} {P : A → Sort v} (x y : PSigma P)
    (h : ∃ e : x.fst = y.fst, Eq.ndrec (motive := P) x.snd e = y.snd) : x = y := by
  obtain ⟨e, h⟩ := h
  exact nativePSigmaEq x y e h
theorem nativePSigma2ExistsEq {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x y : PSigma (fun a => PProd (P a) (Q a)))
    (h : ∃ e : x.fst = y.fst,
      Eq.ndrec (motive := P) x.snd.fst e = y.snd.fst ∧
      Eq.ndrec (motive := Q) x.snd.snd e = y.snd.snd) : x = y := by
  obtain ⟨e, h, h'⟩ := h
  exact nativePSigma2Eq x y e h h'

theorem nativeTransportProperty (A : Sort u) (P : A → Sort v)
    (Q : (a : A) → P a → Prop) (x y : A) (h : x = y) (p : P x)
    (hp : Q x p) : Q y (Eq.rec (motive := fun a _ => P a) p h) := by
  cases h; exact hp
theorem sig_transport (A : Sort u) (P : A → Sort v) (Q : (a : A) → P a → Prop)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sig (P x) (Q x)) :
    subtypeTo (Eq.ndrec (motive := fun a => Rocq.Corelib.Init.Specif.sig (P a) (Q a)) s h) =
      Eq.ndrec (motive := fun a => Subtype (Q a)) (subtypeTo s) h := by
  cases h; rfl

theorem sig2_transport (A : Sort u) (P : A → Sort v) (Q R : (a : A) → P a → Prop)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sig2 (P x) (Q x) (R x)) :
    subtype2To (Eq.ndrec (motive := fun a => Rocq.Corelib.Init.Specif.sig2 (P a) (Q a) (R a)) s h) =
      Eq.ndrec (motive := fun a => {p : P a // Q a p ∧ R a p}) (subtype2To s) h := by
  cases h; rfl

theorem sigT_transport (A : Sort u) (P : A → Sort v) (Q : (a : A) → P a → Sort w)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sigT (P x) (Q x)) :
    psigmaTo (Eq.ndrec (motive := fun a => Rocq.Corelib.Init.Specif.sigT (P a) (Q a)) s h) =
      Eq.ndrec (motive := fun a => PSigma (Q a)) (psigmaTo s) h := by
  cases h; rfl

theorem sigT2_transport (A : Sort u) (P : A → Sort v) (Q : (a : A) → P a → Sort w) (R : (a : A) → P a → Sort z)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sigT2 (P x) (Q x) (R x)) :
    psigma2To (Eq.ndrec (motive := fun a => Rocq.Corelib.Init.Specif.sigT2 (P a) (Q a) (R a)) s h) =
      Eq.ndrec (motive := fun a => PSigma (fun p : P a => PProd (Q a p) (R a p))) (psigma2To s) h := by
  cases h; rfl

theorem nativeSubtypeEq {A : Sort u} {P : A → Prop} (x y : Subtype P)
    (p : x.val = y.val) : x = y := Subtype.ext p

theorem sig_transport_rec (A : Sort u) (P : A → Sort v) (Q : (a : A) → P a → Prop)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sig (P x) (Q x)) :
    subtypeTo (Eq.rec (motive := fun a _ => Rocq.Corelib.Init.Specif.sig (P a) (Q a)) s h) =
      Eq.rec (motive := fun a _ => Subtype (Q a)) (subtypeTo s) h := by
  cases h; rfl


theorem sig2_transport_rec (A : Sort u) (P : A → Sort v) (Q R : (a : A) → P a → Prop)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sig2 (P x) (Q x) (R x)) :
    subtype2To (Eq.rec (motive := fun a _ => Rocq.Corelib.Init.Specif.sig2 (P a) (Q a) (R a)) s h) =
      Eq.rec (motive := fun a _ => {p : P a // Q a p ∧ R a p}) (subtype2To s) h := by
  cases h; rfl


theorem sigT_transport_rec (A : Sort u) (P : A → Sort v) (Q : (a : A) → P a → Sort w)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sigT (P x) (Q x)) :
    psigmaTo (Eq.rec (motive := fun a _ => Rocq.Corelib.Init.Specif.sigT (P a) (Q a)) s h) =
      Eq.rec (motive := fun a _ => PSigma (Q a)) (psigmaTo s) h := by
  cases h; rfl


theorem sigT2_transport_rec (A : Sort u) (P : A → Sort v) (Q : (a : A) → P a → Sort w) (R : (a : A) → P a → Sort z)
    (x y : A) (h : x = y) (s : Rocq.Corelib.Init.Specif.sigT2 (P x) (Q x) (R x)) :
    psigma2To (Eq.rec (motive := fun a _ => Rocq.Corelib.Init.Specif.sigT2 (P a) (Q a) (R a)) s h) =
      Eq.rec (motive := fun a _ => PSigma (fun p : P a => PProd (Q a p) (R a p))) (psigma2To s) h := by
  cases h; rfl
end NativeBridge.Incremental.SpecifConditionalNormalization
