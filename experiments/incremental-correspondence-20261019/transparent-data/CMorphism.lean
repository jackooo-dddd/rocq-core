import DataCMorphism
set_option autoImplicit false
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.CMorphism
open Computational.CMorphism.NativeBridge
open Computational.CMorphism.NativeBridge.Incremental.CMorphismData
open Computational.CMorphism.Rocq.Corelib.Classes
universe u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15

def identitySubrelation (A : Type u0) (R : A → A → Type u1) (S : A → A → Type u2)
    (h : (x y : A) → R x y → S x y) := h
theorem flip1_agrees (A : Type u0) (R : A → A → Type u1) (S : A → A → Type u2)
    (h : (x y : A) → R x y → S x y) :
    CMorphisms.flip1.{u0,u1,u2,u3} A R S h = identitySubrelation A R S h := rfl
theorem flip2_agrees (A : Type u0) (R : A → A → Type u2) (S : A → A → Type u1)
    (h : (x y : A) → R x y → S x y) :
    CMorphisms.flip2.{u0,u1,u2,u3} A R S h = identitySubrelation A R S h := rfl

def identityPair (A : Type u0) (R : A → A → Type u3) (x y : A) : (R x y → R x y) × (R x y → R x y) :=
  ⟨id,id⟩
theorem flipAtom_agrees (A : Type u0) (R : A → A → Type u3) (x y : A) :
    (pairIso _ _).to (CMorphisms.flip_atom.{u0,u1,u2,u3,u4} A R x y) = identityPair A R x y := rfl

def forward (A B : Type u1) (p : (A → B) × (B → A)) := p.1
def backward (A B : Type u1) (p : (A → B) × (B → A)) := p.2
theorem forward_agrees (A B : Type u1) (p : (A → B) × (B → A)) :
    CMorphisms.iffT_arrow_subrelation.{u0,u1} A B ((pairIso _ _).of p) = forward A B p := rfl
theorem backward_agrees (A B : Type u1) (p : (A → B) × (B → A)) :
    CMorphisms.iffT_flip_arrow_subrelation.{u0,u1,u2,u3} A B ((pairIso _ _).of p) = backward A B p := rfl

def reflexiveAt (A : Type u0) (R : A → A → Type u1) (h : (x : A) → R x x) (x : A) := h x
theorem reflexiveProper_agrees (A : Type u0) (R : A → A → Type u1) (h : (x : A) → R x x) (x : A) :
    CMorphisms.reflexive_proper.{u0,u1} A R h x = reflexiveAt A R h x := rfl
theorem reflexiveProxy_agrees (A : Type u0) (R : A → A → Type u1) (h : (x : A) → R x x) (x : A) :
    CMorphisms.reflexive_proper_proxy.{u0,u1} A R h x = reflexiveAt A R h x := rfl

def reflexiveSubrelation (A : Type u0) (R : A → A → Type u1) := fun (x y : A) (a : R x y) => a
theorem reflexiveSubrelation_agrees (A : Type u0) (R : A → A → Type u1) :
    CMorphisms.subrelation_refl.{u0,u1} A R = reflexiveSubrelation A R := rfl

def forallSubrelation (A : Type u0) (P : A → Type u1)
    (R : (a : A) → P a → P a → Type u5) (S : (a : A) → P a → P a → Type u6)
    (h : (a : A) → (x y : P a) → R a x y → S a x y) :=
  fun (f g : (a : A) → P a) (p : (a : A) → R a (f a) (g a)) a => h a (f a) (g a) (p a)
theorem forallSubrelation_agrees (A : Type u0) (P : A → Type u1)
    (R : (a : A) → P a → P a → Type u5) (S : (a : A) → P a → P a → Type u6)
    (h : (a : A) → (x y : P a) → R a x y → S a x y) :
    CMorphisms.forall_subrelation.{u0,u1,u2,u3,u4,u5,u6} A P R S h = forallSubrelation A P R S h := rfl

def pointwiseSubrelation (A : Type u0) (B : Type u5) (R : B → B → Type u4) (S : B → B → Type u6)
    (h : (x y : B) → R x y → S x y) :=
  fun (f g : A → B) (p : (a : A) → R (f a) (g a)) a => h (f a) (g a) (p a)
theorem pointwiseSubrelation_agrees (A : Type u0) (B : Type u5)
    (R : B → B → Type u4) (S : B → B → Type u6) (h : (x y : B) → R x y → S x y) :
    CMorphisms.pointwise_subrelation.{u0,u1,u2,u3,u4,u5,u6} A B R S h = pointwiseSubrelation A B R S h := rfl

def normalizesProper (A : Type u0) (R S : A → A → Type u3) (h : relationPairNative A R S)
    (x : A) (p : S x x) := (h x x).2 p
theorem normalizesProper_agrees (A : Type u0) (R S : A → A → Type u3) (h : relationPairNative A R S)
    (x : A) (p : S x x) :
    CMorphisms.proper_normalizes_proper.{u0,u1,u2,u3} A R S ((relationPairIso A R S).of h) x p =
      normalizesProper A R S h x p := rfl

def symmetricFlip (A : Type u4) (R : A → A → Type u5) (sy : (x y : A) → R x y → R y x)
    (B : Type u2) (S : B → B → Type u3) (f : A → B) (h : respectfulNative A B R S f f) :=
  fun (x y : A) (a : R x y) => h y x (sy x y a)
theorem symmetricFlip_agrees (A : Type u4) (R : A → A → Type u5) (sy : (x y : A) → R x y → R y x)
    (B : Type u2) (S : B → B → Type u3) (f : A → B) (h : respectfulNative A B R S f f) :
    CMorphisms.proper_sym_flip.{u0,u1,u2,u3,u4,u5,u6} A R sy B S f h = symmetricFlip A R sy B S f h := rfl

def symmetricFlip2 (A : Type u6) (R : A → A → Type u7) (sy : (x y : A) → R x y → R y x)
    (B : Type u8) (S : B → B → Type u9) (sy2 : (x y : B) → S x y → S y x)
    (C : Type u2) (T : C → C → Type u5) (f : A → B → C)
    (h : (x y : A) → R x y → (a b : B) → S a b → T (f x a) (f y b)) :=
  fun (x y : A) (r : R x y) (a b : B) (s : S a b) => h y x (sy x y r) b a (sy2 a b s)
theorem symmetricFlip2_agrees (A : Type u6) (R : A → A → Type u7) (sy : (x y : A) → R x y → R y x)
    (B : Type u8) (S : B → B → Type u9) (sy2 : (x y : B) → S x y → S y x)
    (C : Type u2) (T : C → C → Type u5) (f : A → B → C)
    (h : (x y : A) → R x y → (a b : B) → S a b → T (f x a) (f y b)) :
    CMorphisms.proper_sym_flip_2.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10} A R sy B S sy2 C T f h =
      symmetricFlip2 A R sy B S sy2 C T f h := rfl

def properProxy (A : Type u0) (R : A → A → Type u1) (x : A) (h : R x x) := h
theorem properProxy_agrees (A : Type u0) (R : A → A → Type u1) (x : A) (h : R x x) :
    CMorphisms.proper_proper_proxy.{u0,u1} A x R h = properProxy A R x h := rfl

theorem subrelationIdentity_agrees (A : Type u0) (R : A → A → Type u2) (S : A → A → Type u3)
    (h : (x y : A) → R x y → S x y) :
    CMorphisms.subrelation_id_proper.{u0,u1,u2,u3} A R S h = identitySubrelation A R S h := rfl

def partialApplication (A : Type u0) (B : Type u1) (R : A → A → Type u4) (S : B → B → Type u5)
    (f : A → B) (h : respectfulNative A B R S f f) (x : A) (r : R x x) := h x x r
theorem partialApplication_agrees (A : Type u0) (B : Type u1) (R : A → A → Type u4) (S : B → B → Type u5)
    (f : A → B) (h : respectfulNative A B R S f f) (x : A) (r : R x x) :
    CMorphisms.Reflexive_partial_app_morphism.{u0,u1,u2,u3,u4,u5} A B R S f h x r =
      partialApplication A B R S f h x r := rfl

def composeProper (A : Type u0) (B : Type u1) (C : Type u2)
    (R : A → A → Type u14) (S : B → B → Type u13) (T : C → C → Type u15) :=
  fun (g g' : B → C) (hg : respectfulNative B C S T g g')
    (f f' : A → B) (hf : respectfulNative A B R S f f') (x y : A) (r : R x y) =>
      hg (f x) (f' y) (hf x y r)
theorem composeProper_agrees (A : Type u0) (B : Type u1) (C : Type u2)
    (R : A → A → Type u14) (S : B → B → Type u13) (T : C → C → Type u15) :
    CMorphisms.compose_proper.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15} A B C R S T =
      composeProper A B C R S T := rfl
theorem composeObligation_agrees (A : Type u0) (B : Type u1) (C : Type u2)
    (R : A → A → Type u14) (S : B → B → Type u13) (T : C → C → Type u15) :
    CMorphisms.compose_proper_obligation_1.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15} A B C R S T =
      composeProper A B C R S T := rfl

def flipProper (A : Type u0) (B : Type u1) (C : Type u2)
    (R : A → A → Type u12) (S : B → B → Type u9) (T : C → C → Type u13)
    (f : A → B → C) (h : (x y : A) → R x y → (a b : B) → S a b → T (f x a) (f y b)) :=
  fun (a b : B) (s : S a b) (x y : A) (r : R x y) => h x y r a b s
theorem flipProper_agrees (A : Type u0) (B : Type u1) (C : Type u2)
    (R : A → A → Type u12) (S : B → B → Type u9) (T : C → C → Type u13)
    (f : A → B → C) (h : (x y : A) → R x y → (a b : B) → S a b → T (f x a) (f y b)) :
    CMorphisms.flip_proper.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13} A B C R S T f h =
      flipProper A B C R S T f h := rfl
theorem flipObligation_agrees (A : Type u0) (B : Type u1) (C : Type u2)
    (R : A → A → Type u12) (S : B → B → Type u9) (T : C → C → Type u13)
    (f : A → B → C) (h : (x y : A) → R x y → (a b : B) → S a b → T (f x a) (f y b)) :
    CMorphisms.flip_proper_obligation_1.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13} A B C R S T f h =
      flipProper A B C R S T f h := rfl

def flipRespectful (A : Type u0) (B : Type u1) (R : A → A → Type u6) (S : B → B → Type u7)
    (f g : A → B) :
    (respectfulNative A B R S g f → respectfulNative A B (fun x y => R y x) (fun x y => S y x) f g) ×
    (respectfulNative A B (fun x y => R y x) (fun x y => S y x) f g → respectfulNative A B R S g f) :=
  ⟨fun h x y a => h y x a,fun h x y a => h y x a⟩
theorem flipRespectful_agrees (A : Type u0) (B : Type u1) (R : A → A → Type u6) (S : B → B → Type u7)
    (f g : A → B) :
    (pairIso _ _).to (CMorphisms.flip_respectful.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10} A B R S f g) =
      flipRespectful A B R S f g := rfl

def subrelationProper (A : Type u0) (R S : A → A → Type u2) (x : A)
    (h : R x x) (sub : (x y : A) → R x y → S x y) := sub x x h
theorem subrelationProper_agrees (A : Type u0) (R S : A → A → Type u2) (x : A)
    (h : R x x) (tag : Computational.CMorphism.Rocq.Corelib.Init.Datatypes.unit)
    (sub : (x y : A) → R x y → S x y) :
    CMorphisms.subrelation_proper.{u0,u1,u2} A R x h S tag sub = subrelationProper A R S x h sub := rfl

def subrelationRespectful (A : Type u0) (R' : A → A → Type u6) (R : A → A → Type u4)
    (lo : (x y : A) → R' x y → R x y) (B : Type u7)
    (S : B → B → Type u5) (S' : B → B → Type u8) (hi : (x y : B) → S x y → S' x y) :=
  fun (f g : A → B) (h : respectfulNative A B R S f g) (x y : A) (r : R' x y) =>
    hi (f x) (g y) (h x y (lo x y r))
theorem subrelationRespectful_agrees (A : Type u0) (R' : A → A → Type u6) (R : A → A → Type u4)
    (lo : (x y : A) → R' x y → R x y) (B : Type u7)
    (S : B → B → Type u5) (S' : B → B → Type u8) (hi : (x y : B) → S x y → S' x y) :
    CMorphisms.subrelation_respectful.{u0,u1,u2,u3,u4,u5,u6,u7,u8} A R' R lo B S S' hi =
      subrelationRespectful A R' R lo B S S' hi := rfl

def symmetricEquivalence (A : Type u0) (R : A → A → Type u3) (h : (x y : A) → R x y → R y x)
    (x y : A) : (R x y → R y x) × (R y x → R x y) := ⟨h x y,h y x⟩
theorem symmetricEquivalence_agrees (A : Type u0) (R : A → A → Type u3)
    (h : (x y : A) → R x y → R y x) (x y : A) :
    (pairIso _ _).to (CMorphisms.symmetric_equiv_flip.{u0,u1,u2,u3,u4} A R h x y) =
      symmetricEquivalence A R h x y := rfl

def symmetricArrow (A : Type u4) (R : A → A → Type u5) (sy : (x y : A) → R x y → R y x)
    (f : A → Type u3) (h : (x y : A) → R x y → f x → f y)
    (x y : A) (r : R x y) : (f x → f y) × (f y → f x) := ⟨h x y r,h y x (sy x y r)⟩
theorem symmetricArrow_agrees (A : Type u4) (R : A → A → Type u5)
    (sy : (x y : A) → R x y → R y x) (f : A → Type u3)
    (h : (x y : A) → R x y → f x → f y) (x y : A) (r : R x y) :
    (pairIso _ _).to (CMorphisms.proper_sym_arrow_iffT.{u0,u1,u2,u3,u4,u5} A R sy f h x y r) =
      symmetricArrow A R sy f h x y r := rfl

def symmetricArrow2 (A : Type u6) (R : A → A → Type u7) (sy : (x y : A) → R x y → R y x)
    (B : Type u8) (S : B → B → Type u9) (sy2 : (x y : B) → S x y → S y x)
    (f : A → B → Type u5) (h : (x y : A) → R x y → (a b : B) → S a b → f x a → f y b)
    (x y : A) (r : R x y) (a b : B) (s : S a b) : (f x a → f y b) × (f y b → f x a) :=
  ⟨h x y r a b s,h y x (sy x y r) b a (sy2 a b s)⟩
theorem symmetricArrow2_agrees (A : Type u6) (R : A → A → Type u7) (sy : (x y : A) → R x y → R y x)
    (B : Type u8) (S : B → B → Type u9) (sy2 : (x y : B) → S x y → S y x)
    (f : A → B → Type u5) (h : (x y : A) → R x y → (a b : B) → S a b → f x a → f y b)
    (x y : A) (r : R x y) (a b : B) (s : S a b) :
    (pairIso _ _).to (CMorphisms.proper_sym_arrow_iffT_2.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9}
      A R sy B S sy2 f h x y r a b s) = symmetricArrow2 A R sy B S sy2 f h x y r a b s := rfl

end NativeBridge.ComputationalCorrespondence.CMorphism
