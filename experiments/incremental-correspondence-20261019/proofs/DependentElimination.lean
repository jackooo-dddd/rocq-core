import Specif

noncomputable section
namespace NativeBridge.Incremental
open NativeBridge
universe u v w z

def subtypeTo {A : Sort u} {P : A → Prop} :
    Rocq.Corelib.Init.Specif.sig A P → Subtype P :=
  Rocq.Corelib.Init.Specif.sig.rec (fun x h => ⟨x, h⟩)
def subtypeOf {A : Sort u} {P : A → Prop} (s : Subtype P) :
    Rocq.Corelib.Init.Specif.sig A P := .exist A P s.val s.property
def subtypeIso (A : Sort u) (P : A → Prop) :
    Iso (Rocq.Corelib.Init.Specif.sig A P) (Subtype P) where
  to := subtypeTo
  of := subtypeOf
  of_to s := by cases s <;> rfl
  to_of s := by cases s <;> rfl

def subtype2To {A : Sort u} {P Q : A → Prop} :
    Rocq.Corelib.Init.Specif.sig2 A P Q → {x : A // P x ∧ Q x} :=
  Rocq.Corelib.Init.Specif.sig2.rec (fun x hp hq => ⟨x, hp, hq⟩)
def subtype2Of {A : Sort u} {P Q : A → Prop} (s : {x : A // P x ∧ Q x}) :
    Rocq.Corelib.Init.Specif.sig2 A P Q := .exist2 A P Q s.val s.property.1 s.property.2
def subtype2Iso (A : Sort u) (P Q : A → Prop) :
    Iso (Rocq.Corelib.Init.Specif.sig2 A P Q) {x : A // P x ∧ Q x} where
  to := subtype2To
  of := subtype2Of
  of_to s := by cases s <;> rfl
  to_of s := by cases s <;> rfl

def psigmaTo {A : Sort u} {P : A → Sort v} :
    Rocq.Corelib.Init.Specif.sigT A P → PSigma P :=
  Rocq.Corelib.Init.Specif.sigT.rec (fun x p => ⟨x, p⟩)
def psigmaOf {A : Sort u} {P : A → Sort v} (s : PSigma P) :
    Rocq.Corelib.Init.Specif.sigT A P := .existT A P s.1 s.2
def psigmaIso (A : Sort u) (P : A → Sort v) :
    Iso (Rocq.Corelib.Init.Specif.sigT A P) (PSigma P) where
  to := psigmaTo
  of := psigmaOf
  of_to s := by cases s <;> rfl
  to_of s := by cases s <;> rfl

def psigma2To {A : Sort u} {P : A → Sort v} {Q : A → Sort w} :
    Rocq.Corelib.Init.Specif.sigT2 A P Q → PSigma (fun x => PProd (P x) (Q x)) :=
  Rocq.Corelib.Init.Specif.sigT2.rec (fun x p q => ⟨x, p, q⟩)
def psigma2Of {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (s : PSigma (fun x => PProd (P x) (Q x))) :
    Rocq.Corelib.Init.Specif.sigT2 A P Q := .existT2 A P Q s.1 s.2.1 s.2.2
def psigma2Iso (A : Sort u) (P : A → Sort v) (Q : A → Sort w) :
    Iso (Rocq.Corelib.Init.Specif.sigT2 A P Q) (PSigma (fun x => PProd (P x) (Q x))) where
  to := psigma2To
  of := psigma2Of
  of_to s := by cases s <;> rfl
  to_of s := by cases s with | mk x pq => cases pq; rfl

def pprodTo {A : Sort u} {B : Sort v} :
    Rocq.Corelib.Init.Datatypes.prod A B → PProd A B :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun a b => ⟨a, b⟩)
def pprodOf {A : Sort u} {B : Sort v} (s : PProd A B) :
    Rocq.Corelib.Init.Datatypes.prod A B := .pair A B s.1 s.2
def pprodIso (A : Sort u) (B : Sort v) :
    Iso (Rocq.Corelib.Init.Datatypes.prod A B) (PProd A B) where
  to := pprodTo
  of := pprodOf
  of_to s := by cases s <;> rfl
  to_of s := by cases s <;> rfl

theorem prod_of_sigT_agrees {A : Sort u} {B : Sort v}
    (s : Rocq.Corelib.Init.Specif.sigT A (fun _ => B)) :
    pprodTo (Rocq.Corelib.Init.Specif.prod_of_sigT A B s) =
      ⟨(psigmaTo s).1, (psigmaTo s).2⟩ := by cases s <;> rfl

theorem sigT_of_prod_agrees {A : Sort u} {B : Sort v}
    (s : Rocq.Corelib.Init.Datatypes.prod A B) :
    psigmaTo (Rocq.Corelib.Init.Specif.sigT_of_prod A B s) =
      ⟨(pprodTo s).1, (pprodTo s).2⟩ := by cases s <;> rfl

theorem sigT_of_sigT2_agrees {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    psigmaTo (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A P Q s) =
      ⟨(psigma2To s).1, (psigma2To s).2.1⟩ := by cases s <;> rfl

theorem projT3_agrees {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    HEq (Rocq.Corelib.Init.Specif.projT3 A P Q s) (psigma2To s).2.2 := by cases s <;> rfl

theorem sig_rect_agrees {A : Sort u} (P : A → Prop)
    (C : Subtype P → Sort z) (f : (x : A) → (h : P x) → C ⟨x, h⟩)
    (s : Rocq.Corelib.Init.Specif.sig A P) :
    Rocq.Corelib.Init.Specif.sig_rect A P (fun s => C (subtypeTo s)) f s =
      Subtype.rec f (subtypeTo s) := by cases s <;> rfl

theorem sig_rec_agrees {A : Sort u} (P : A → Prop)
    (C : Subtype P → Type) (f : (x : A) → (h : P x) → C ⟨x, h⟩)
    (s : Rocq.Corelib.Init.Specif.sig A P) :
    Rocq.Corelib.Init.Specif.sig_rec A P (fun s => C (subtypeTo s)) f s =
      Subtype.rec f (subtypeTo s) := by cases s <;> rfl

theorem sig2_rect_agrees {A : Sort u} (P Q : A → Prop)
    (C : {x : A // P x ∧ Q x} → Sort z)
    (f : (x : A) → (hp : P x) → (hq : Q x) → C ⟨x, hp, hq⟩)
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    Rocq.Corelib.Init.Specif.sig2_rect A P Q (fun s => C (subtype2To s)) f s =
      Subtype.rec (fun x h => f x h.1 h.2) (subtype2To s) := by cases s <;> rfl

theorem sig2_rec_agrees {A : Sort u} (P Q : A → Prop)
    (C : {x : A // P x ∧ Q x} → Type)
    (f : (x : A) → (hp : P x) → (hq : Q x) → C ⟨x, hp, hq⟩)
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    Rocq.Corelib.Init.Specif.sig2_rec A P Q (fun s => C (subtype2To s)) f s =
      Subtype.rec (fun x h => f x h.1 h.2) (subtype2To s) := by cases s <;> rfl

theorem sigT_rect_agrees {A : Sort u} (P : A → Sort v)
    (C : PSigma P → Sort z) (f : (x : A) → (p : P x) → C ⟨x, p⟩)
    (s : Rocq.Corelib.Init.Specif.sigT A P) :
    Rocq.Corelib.Init.Specif.sigT_rect A P (fun s => C (psigmaTo s)) f s =
      PSigma.rec f (psigmaTo s) := by cases s <;> rfl

theorem sigT_rec_agrees {A : Sort u} (P : A → Sort v)
    (C : PSigma P → Type) (f : (x : A) → (p : P x) → C ⟨x, p⟩)
    (s : Rocq.Corelib.Init.Specif.sigT A P) :
    Rocq.Corelib.Init.Specif.sigT_rec A P (fun s => C (psigmaTo s)) f s =
      PSigma.rec f (psigmaTo s) := by cases s <;> rfl

theorem sigT2_rect_agrees {A : Sort u} (P : A → Sort v) (Q : A → Sort w)
    (C : PSigma (fun x => PProd (P x) (Q x)) → Sort z)
    (f : (x : A) → (p : P x) → (q : Q x) → C ⟨x, p, q⟩)
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    Rocq.Corelib.Init.Specif.sigT2_rect A P Q (fun s => C (psigma2To s)) f s =
      (match psigma2To s with | ⟨x, ⟨p, q⟩⟩ => f x p q) := by cases s <;> rfl

theorem sigT2_rec_agrees {A : Sort u} (P : A → Sort v) (Q : A → Sort w)
    (C : PSigma (fun x => PProd (P x) (Q x)) → Type)
    (f : (x : A) → (p : P x) → (q : Q x) → C ⟨x, p, q⟩)
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    Rocq.Corelib.Init.Specif.sigT2_rec A P Q (fun s => C (psigma2To s)) f s =
      (match psigma2To s with | ⟨x, ⟨p, q⟩⟩ => f x p q) := by cases s <;> rfl


/-- Closed witnesses for extracted projection obligations. No obligation is assumed. -/
theorem sigT_of_sig_obligation :
    Rocq.Corelib.Init.Specif.sigT_of_sig__rocq2lean_obligation_1.statement.{u} := by
  intro A P s
  cases s
  assumption

theorem sig_of_sigT_obligation :
    Rocq.Corelib.Init.Specif.sig_of_sigT__rocq2lean_obligation_1.statement.{u} := by
  intro A P s
  cases s
  assumption

theorem sig_of_sig2_obligation :
    Rocq.Corelib.Init.Specif.sig_of_sig2__rocq2lean_obligation_1.statement.{u} := by
  intro A P Q s
  cases s
  assumption

theorem sigT2_of_sig2_obligation_1 :
    @RocqPending.Corelib.Init.Specif.sigT2_of_sig2__rocq2lean_obligation_1.statement.{u}
      sig_of_sig2_obligation := by
  intro A P Q s
  cases s
  assumption

theorem sigT2_of_sig2_obligation_2 :
    @RocqPending.Corelib.Init.Specif.sigT2_of_sig2__rocq2lean_obligation_2.statement.{u}
      sig_of_sig2_obligation := by
  intro A P Q s
  cases s
  assumption

def sigTOfSigClosed (A : Sort u) (P : A → Prop) (s : Rocq.Corelib.Init.Specif.sig A P) :=
  @RocqPending.Corelib.Init.Specif.sigT_of_sig sigT_of_sig_obligation A P s
def sigOfSigTClosed (A : Sort u) (P : A → Prop) (s : Rocq.Corelib.Init.Specif.sigT A P) :=
  @RocqPending.Corelib.Init.Specif.sig_of_sigT sig_of_sigT_obligation A P s
def sigOfSig2Closed (A : Sort u) (P Q : A → Prop) (s : Rocq.Corelib.Init.Specif.sig2 A P Q) :=
  @RocqPending.Corelib.Init.Specif.sig_of_sig2 sig_of_sig2_obligation A P Q s
def sigT2OfSig2Closed (A : Sort u) (P Q : A → Prop) (s : Rocq.Corelib.Init.Specif.sig2 A P Q) :=
  @RocqPending.Corelib.Init.Specif.sigT2_of_sig2 sig_of_sig2_obligation
    sigT2_of_sig2_obligation_1 sigT2_of_sig2_obligation_2 A P Q s

theorem sigT_of_sig_closed_agrees {A : Sort u} (P : A → Prop)
    (s : Rocq.Corelib.Init.Specif.sig A P) :
    psigmaTo (@RocqPending.Corelib.Init.Specif.sigT_of_sig sigT_of_sig_obligation A P s) =
      ⟨(subtypeTo s).val, (subtypeTo s).property⟩ := by cases s <;> rfl

theorem sig_of_sigT_closed_agrees {A : Sort u} (P : A → Prop)
    (s : Rocq.Corelib.Init.Specif.sigT A P) :
    subtypeTo (@RocqPending.Corelib.Init.Specif.sig_of_sigT sig_of_sigT_obligation A P s) =
      ⟨(psigmaTo s).1, (psigmaTo s).2⟩ := by cases s <;> rfl

theorem sig_of_sig2_closed_agrees {A : Sort u} (P Q : A → Prop)
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    subtypeTo (@RocqPending.Corelib.Init.Specif.sig_of_sig2 sig_of_sig2_obligation A P Q s) =
      ⟨(subtype2To s).val, (subtype2To s).property.1⟩ := by cases s <;> rfl

theorem sigT2_of_sig2_closed_agrees {A : Sort u} (P Q : A → Prop)
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    psigma2To (@RocqPending.Corelib.Init.Specif.sigT2_of_sig2 sig_of_sig2_obligation
      sigT2_of_sig2_obligation_1 sigT2_of_sig2_obligation_2 A P Q s) =
      ⟨(subtype2To s).val, (subtype2To s).property.1, (subtype2To s).property.2⟩ := by
  cases s <;> rfl

end NativeBridge.Incremental
