import SSRFunOption
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.SSRFunData
open NativeBridge
open SSRFunNormalization
universe u v w z

def wrappedIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrfun.wrapped A) A where
  to := Rocq.Corelib.ssr.ssrfun.unwrap A
  of := Rocq.Corelib.ssr.ssrfun.wrap A
  of_to x := by cases x; rfl
  to_of _ := rfl
theorem wrap_agrees (A : Type u) (x : A) :
    (wrappedIso A).to (Rocq.Corelib.ssr.ssrfun.wrap A x) = id x := rfl
theorem unwrap_agrees (A : Type u) (x : Rocq.Corelib.ssr.ssrfun.wrapped A) :
    Rocq.Corelib.ssr.ssrfun.unwrap A x = id ((wrappedIso A).to x) := rfl
theorem simpl_delta_agrees (A : Sort u) (B : Sort v) (f : A → A → B) :
    (simplFunIso A B).to (Rocq.Corelib.ssr.ssrfun.SimplFunDelta A B f) = (fun x => f x x) := rfl

def sigmaTo {A : Sort u} {P : A → Sort v} :
    Rocq.Corelib.Init.Specif.sigT A P → PSigma P
  | .existT _ _ x p => ⟨x,p⟩
def sigmaOf {A : Sort u} {P : A → Sort v} (x : PSigma P) :
    Rocq.Corelib.Init.Specif.sigT A P := .existT A P x.fst x.snd
theorem sigma_of_to {A : Sort u} {P : A → Sort v} (x : Rocq.Corelib.Init.Specif.sigT A P) :
    sigmaOf (sigmaTo x) = x := by cases x; rfl
theorem sigma_to_of {A : Sort u} {P : A → Sort v} (x : PSigma P) :
    sigmaTo (sigmaOf x) = x := by cases x; rfl
def sigma2To {A : Sort u} {P : A → Sort v} {Q : A → Sort w} :
    Rocq.Corelib.Init.Specif.sigT2 A P Q → PSigma (fun a => PProd (P a) (Q a))
  | .existT2 _ _ _ x p q => ⟨x,⟨p,q⟩⟩
def sigma2Of {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : PSigma (fun a => PProd (P a) (Q a))) : Rocq.Corelib.Init.Specif.sigT2 A P Q :=
  .existT2 A P Q x.fst x.snd.fst x.snd.snd
theorem sigma2_of_to {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) : sigma2Of (sigma2To x) = x := by cases x; rfl
theorem sigma2_to_of {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : PSigma (fun a => PProd (P a) (Q a))) : sigma2To (sigma2Of x) = x := by
  cases x with | mk x p => cases p; rfl
def pairTo {A : Sort u} {B : Sort v} : Rocq.Corelib.Init.Datatypes.prod A B → PProd A B
  | .pair _ _ a b => ⟨a,b⟩
def pairOf {A : Sort u} {B : Sort v} (x : PProd A B) : Rocq.Corelib.Init.Datatypes.prod A B :=
  .pair A B x.fst x.snd
theorem pair_of_to {A : Sort u} {B : Sort v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
    pairOf (pairTo x) = x := by cases x; rfl
theorem pair_to_of {A : Sort u} {B : Sort v} (x : PProd A B) :
    pairTo (pairOf x) = x := by cases x; rfl

theorem tagged_constructor_agrees (A : Sort u) (a : A) (P : A → Sort v) (p : P a) :
    sigmaTo (Rocq.Corelib.ssr.ssrfun.Tagged A a P p) = PSigma.mk a p := rfl
theorem tagged2_constructor_agrees (A : Sort u) (a : A) (P : A → Sort v) (Q : A → Sort w)
    (p : P a) (q : Q a) :
    sigma2To (Rocq.Corelib.ssr.ssrfun.Tagged2 A a P Q p q) = PSigma.mk a (PProd.mk p q) := rfl
theorem tag_agrees (A : Sort u) (P : A → Sort v) (x : Rocq.Corelib.Init.Specif.sigT A P) :
    Rocq.Corelib.ssr.ssrfun.tag A P x = (sigmaTo x).fst := by cases x; rfl
theorem tagged_agrees (A : Sort u) (P : A → Sort v) (x : PSigma P) :
    Rocq.Corelib.ssr.ssrfun.tagged A P (sigmaOf x) = x.snd := rfl
theorem tag2_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w)
    (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    Rocq.Corelib.ssr.ssrfun.tag2 A P Q x = (sigma2To x).fst := by cases x; rfl
theorem tagged2_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w)
    (x : PSigma (fun a => PProd (P a) (Q a))) :
    Rocq.Corelib.ssr.ssrfun.tagged2 A P Q (sigma2Of x) = x.snd.fst := rfl
theorem tagged2_second_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w)
    (x : PSigma (fun a => PProd (P a) (Q a))) :
    Rocq.Corelib.ssr.ssrfun.tagged2' A P Q (sigma2Of x) = x.snd.snd := rfl
def sigmaPairTo {A : Sort u} {P : A → Sort v} {Q : A → Sort w}
    (x : Rocq.Corelib.Init.Specif.sigT A (fun a => Rocq.Corelib.Init.Datatypes.prod (P a) (Q a))) :
    PSigma (fun a => PProd (P a) (Q a)) := ⟨(sigmaTo x).fst,pairTo (sigmaTo x).snd⟩
theorem tag_of_tag2_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w)
    (x : Rocq.Corelib.Init.Specif.sigT2 A P Q) :
    sigmaPairTo (Rocq.Corelib.ssr.ssrfun.tag_of_tag2 A P Q x) = id (sigma2To x) := by cases x; rfl

theorem all_pair_agrees (I : Sort u) (T : I → Sort v) (U : I → Sort w)
    (f : (i : I) → Rocq.Corelib.Init.Datatypes.prod (T i) (U i)) :
    pairTo (Rocq.Corelib.ssr.ssrfun.all_pair I T U f) =
      PProd.mk (fun i => (pairTo (f i)).fst) (fun i => (pairTo (f i)).snd) := by
  change PProd.mk _ _ = PProd.mk _ _
  congr 1 <;> funext i <;> cases f i <;> rfl
theorem s2val_agrees (A : Sort u) (P Q : A → Prop) (x : Rocq.Corelib.Init.Specif.sig2 A P Q) :
    Rocq.Corelib.ssr.ssrfun.s2val A P Q x = (SSRFunNormalization.sig2To x).val := by cases x; rfl
def emptyTo (x : Rocq.Corelib.Init.Datatypes.Empty_set) : Empty := by cases x
theorem of_void_agrees (A : Sort u) (x : Rocq.Corelib.Init.Datatypes.Empty_set) :
    Rocq.Corelib.ssr.ssrfun.of_void A x = Empty.elim (emptyTo x) := by cases x
theorem phant_id_agrees (A : Sort u) (B : Sort v) (a : A) (b : B) :
    Rocq.Corelib.ssr.ssrfun.phant_id A B a b ↔ (True → True) := by
  constructor
  · intro _ _; trivial
  · intro _ _; exact .Phantom B b

theorem pcancel_agrees (A : Sort u) (B : Sort v) (f : B → A)
    (g : A → Option (PLift B)) :
    Rocq.Corelib.ssr.ssrfun.pcancel A B f (fun x => SSRFunOption.of (g x)) ↔
      ∀ x, g (f x) = some (PLift.up x) := by
  unfold Rocq.Corelib.ssr.ssrfun.pcancel
  simp only [eq_correspondence, SSRFunOption.equality, SSRFunOption.to_of, SSRFunOption.to_some]
theorem ocancel_agrees (A : Sort u) (B : Sort v) (g : B → Option (PLift A)) (h : A → B) :
    Rocq.Corelib.ssr.ssrfun.ocancel A B (fun x => SSRFunOption.of (g x)) h ↔
      ∀ x, (g x).elim x (fun a => h a.down) = x := by
  unfold Rocq.Corelib.ssr.ssrfun.ocancel
  simp only [eq_correspondence, SSRFunOption.apply_agrees, SSRFunOption.to_of]
theorem pcomp_agrees (A : Sort u) (B : Sort v) (C : Sort w)
    (f : B → Option (PLift A)) (g : C → Option (PLift B)) (x : C) :
    SSRFunOption.to (Rocq.Corelib.ssr.ssrfun.pcomp A B C
      (fun b => SSRFunOption.of (f b)) (fun c => SSRFunOption.of (g c)) x) =
        (g x).bind (fun b => f b.down) := by
  unfold Rocq.Corelib.ssr.ssrfun.pcomp
  simp only [SSRFunOption.bind_agrees, SSRFunOption.to_of]
end NativeBridge.Incremental.SSRFunData
