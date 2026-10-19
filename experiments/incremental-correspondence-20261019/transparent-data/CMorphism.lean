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

theorem mechanicalEqTo {A : Type u0} {x y : A}
    (h : Computational.CMorphism.Rocq.Corelib.Init.Logic.eq A x y) : x = y :=
  Computational.CMorphism.Rocq.Corelib.Init.Logic.eq.rec (motive := fun y _ => x = y) rfl h
theorem mechanicalEqOf {A : Type u0} {x y : A} (h : x = y) :
    Computational.CMorphism.Rocq.Corelib.Init.Logic.eq A x y := by
  cases h
  exact .eq_refl A x
def mechanicalEqIso (A : Type u0) (x y : A) :
    Iso (Computational.CMorphism.Rocq.Corelib.Init.Logic.eq A x y) (x = y) :=
  Iso.mk mechanicalEqTo mechanicalEqOf (fun _ => rfl) (fun _ => rfl)

def transCo (A : Type u0) (R : A → A → Type u4)
    (tr : (x y z : A) → R x y → R y z → R x z) :=
  fun (x a b : A) (ab : R a b) (xa : R x a) => tr x a b xa ab
theorem transCo_agrees (A : Type u0) (R : A → A → Type u4)
    (tr : (x y z : A) → R x y → R y z → R x z) :
    CMorphisms.trans_co_impl_type_morphism.{u0,u1,u2,u3,u4} A R tr = transCo A R tr := rfl
theorem transCoObligation_agrees (A : Type u0) (R : A → A → Type u4)
    (tr : (x y z : A) → R x y → R y z → R x z) :
    CMorphisms.trans_co_impl_type_morphism_obligation_1.{u0,u1,u2,u3,u4} A R tr = transCo A R tr := rfl

def transContraCo (A : Type u0) (R : A → A → Type u4)
    (tr : (x y z : A) → R x y → R y z → R x z) :=
  fun (x y : A) (yx : R y x) (a b : A) (ab : R a b) (xa : R x a) => tr y x b yx (tr x a b xa ab)
theorem transContraCo_agrees (A : Type u0) (R : A → A → Type u4)
    (tr : (x y z : A) → R x y → R y z → R x z) :
    CMorphisms.trans_contra_co_type_morphism.{u0,u1,u2,u3,u4} A R tr = transContraCo A R tr := rfl
theorem transContraCoObligation_agrees (A : Type u0) (R : A → A → Type u4)
    (tr : (x y z : A) → R x y → R y z → R x z) :
    CMorphisms.trans_contra_co_type_morphism_obligation_1.{u0,u1,u2,u3,u4} A R tr = transContraCo A R tr := rfl

def transContraInverse (A : Type u0) (R : A → A → Type u6)
    (tr : (x y z : A) → R x y → R y z → R x z) :=
  fun (x a b : A) (ba : R b a) (xb : R x b) => tr x b a xb ba
theorem transContraInverse_agrees (A : Type u0) (R : A → A → Type u6)
    (tr : (x y z : A) → R x y → R y z → R x z) :
    CMorphisms.trans_contra_inv_impl_type_morphism.{u0,u1,u2,u3,u4,u5,u6} A R tr = transContraInverse A R tr := rfl
theorem transContraInverseObligation_agrees (A : Type u0) (R : A → A → Type u6)
    (tr : (x y z : A) → R x y → R y z → R x z) :
    CMorphisms.trans_contra_inv_impl_type_morphism_obligation_1.{u0,u1,u2,u3,u4,u5,u6} A R tr =
      transContraInverse A R tr := rfl

def transSymCoInverse (A : Type u0) (R : A → A → Type u6) (p : perNative A R) :=
  fun (x a b : A) (ab : R a b) (xb : R x b) => p.2 x b a xb (p.1 a b ab)
theorem transSymCoInverse_agrees (A : Type u0) (R : A → A → Type u6) (p : perNative A R) :
    CMorphisms.trans_sym_co_inv_impl_type_morphism.{u0,u1,u2,u3,u4,u5,u6} A R ((perIso A R).of p) =
      transSymCoInverse A R p := rfl
theorem transSymCoInverseObligation_agrees (A : Type u0) (R : A → A → Type u6) (p : perNative A R) :
    CMorphisms.trans_sym_co_inv_impl_type_morphism_obligation_1.{u0,u1,u2,u3,u4,u5,u6} A R ((perIso A R).of p) =
      transSymCoInverse A R p := rfl

def transSymContra (A : Type u0) (R : A → A → Type u4) (p : perNative A R) :=
  fun (x a b : A) (ba : R b a) (xa : R x a) => p.2 x a b xa (p.1 b a ba)
theorem transSymContra_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R) :
    CMorphisms.trans_sym_contra_arrow_morphism.{u0,u1,u2,u3,u4} A R ((perIso A R).of p) = transSymContra A R p := rfl
theorem transSymContraObligation_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R) :
    CMorphisms.trans_sym_contra_arrow_morphism_obligation_1.{u0,u1,u2,u3,u4} A R ((perIso A R).of p) =
      transSymContra A R p := rfl

def transEquality (A : Type u0) (R : A → A → Type u6)
    (tr : (x y z : A) → R x y → R y z → R x z) (x y : A) (xy : R x y)
    (z z' : A) (e : z = z') (yz' : R y z') := tr x y z xy (e.symm ▸ yz')
theorem transEquality_agrees (A : Type u0) (R : A → A → Type u6)
    (tr : (x y z : A) → R x y → R y z → R x z) (x y : A) (xy : R x y)
    (z z' : A) (e : z = z') (yz' : R y z') :
    CMorphisms.trans_co_eq_inv_arrow_morphism.{u0,u1,u2,u3,u4,u5,u6} A R tr x y xy z z' (mechanicalEqOf e) yz' =
      transEquality A R tr x y xy z z' e yz' := by cases e; rfl
theorem transEqualityObligation_agrees (A : Type u0) (R : A → A → Type u6)
    (tr : (x y z : A) → R x y → R y z → R x z) (x y : A) (xy : R x y)
    (z z' : A) (e : z = z') (yz' : R y z') :
    CMorphisms.trans_co_eq_inv_arrow_morphism_obligation_1.{u0,u1,u2,u3,u4,u5,u6}
      A R tr x y xy z z' (mechanicalEqOf e) yz' = transEquality A R tr x y xy z z' e yz' := by cases e; rfl

def perPartialApplication (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (x a b : A) (ab : R a b) : (R x a → R x b) × (R x b → R x a) :=
  ⟨fun xa => p.2 x a b xa ab,fun xb => p.2 x b a xb (p.1 a b ab)⟩
theorem perPartialApplication_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (x a b : A) (ab : R a b) :
    (pairIso _ _).to (CMorphisms.per_partial_app_type_morphism.{u0,u1,u2,u3,u4}
      A R ((perIso A R).of p) x a b ab) = perPartialApplication A R p x a b ab := rfl
theorem perPartialApplicationObligation_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (x a b : A) (ab : R a b) :
    (pairIso _ _).to (CMorphisms.per_partial_app_type_morphism_obligation_1.{u0,u1,u2,u3,u4}
      A R ((perIso A R).of p) x a b ab) = perPartialApplication A R p x a b ab := rfl

def perMorphism (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (x y : A) (xy : R x y) (a b : A) (ab : R a b) : (R x a → R y b) × (R y b → R x a) :=
  ⟨fun xa => p.2 y a b (p.2 y x a (p.1 x y xy) xa) ab,
   fun yb => p.2 x y a xy (p.2 y b a yb (p.1 a b ab))⟩
theorem perMorphism_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (x y : A) (xy : R x y) (a b : A) (ab : R a b) :
    (pairIso _ _).to (CMorphisms.PER_type_morphism.{u0,u1,u2,u3,u4}
      A R ((perIso A R).of p) x y xy a b ab) = perMorphism A R p x y xy a b ab := rfl
theorem perMorphismObligation_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (x y : A) (xy : R x y) (a b : A) (ab : R a b) :
    (pairIso _ _).to (CMorphisms.PER_type_morphism_obligation_1.{u0,u1,u2,u3,u4}
      A R ((perIso A R).of p) x y xy a b ab) = perMorphism A R p x y xy a b ab := rfl

def properMorphism (A : Type u6) (R S : A → A → Type u7) (h : relationPairNative A R S)
    (x y : A) (e : x = y) : (R x x → S y y) × (S y y → R x x) :=
  e ▸ h x x
theorem properMorphism_agrees (A : Type u6) (R S : A → A → Type u7) (h : relationPairNative A R S)
    (x y : A) (e : x = y) :
    (pairIso _ _).to (CMorphisms.proper_proper.{u0,u1,u2,u3,u4,u5,u6,u7,u8}
      A R S ((relationPairIso A R S).of h) x y (mechanicalEqOf e)) = properMorphism A R S h x y e := by
  cases e
  rfl

def respectfulTransitive (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (B : Type u1) (S : B → B → Type u5) (q : perNative B S)
    (f g h : A → B) (fg : respectfulNative A B R S f g) (gh : respectfulNative A B R S g h) :=
  fun (x y : A) (r : R x y) => q.2 (f x) (g x) (h y) (fg x x (p.2 x y x r (p.1 x y r))) (gh x y r)
theorem respectfulTransitive_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (B : Type u1) (S : B → B → Type u5) (q : perNative B S)
    (f g h : A → B) (fg : respectfulNative A B R S f g) (gh : respectfulNative A B R S g h) :
    CMorphisms.respectful_per_obligation_2.{u0,u1,u2,u3,u4,u5}
      A R ((perIso A R).of p) B S ((perIso B S).of q) f g h fg gh =
        respectfulTransitive A R p B S q f g h fg gh := rfl

def liftIso (A : Sort u0) : Iso (PULift.{u1} A) A :=
  Iso.mk PULift.down PULift.up (fun _ => rfl) (fun _ => rfl)
def functionIso {A : Sort u0} {A' : Sort u1} {B : Sort u2} {B' : Sort u3}
    (a : Iso A A') (b : Iso B B') : Iso (A → B) (A' → B') :=
  Iso.mk (fun f x => b.to (f (a.of x))) (fun f x => b.of (f (a.to x)))
    (by intro f; funext x; simp only [a.of_to,b.of_to])
    (by intro f; funext x; simp only [a.to_of,b.to_of])
def convertedPairIso {A : Type u0} {A' : Type u1} {B : Type u2} {B' : Type u3}
    (a : Iso A A') (b : Iso B B') :
    Iso (Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod A B) (A' × B') :=
  Iso.mk
    (fun p => let q := (pairIso _ _).to p; ⟨a.to q.1,b.to q.2⟩)
    (fun p => (pairIso _ _).of ⟨a.of p.1,b.of p.2⟩)
    (by
      intro p
      cases p with
      | pair x y =>
        change Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod.pair A B
          (a.of (a.to x)) (b.of (b.to y)) = _
        rw [a.of_to,b.of_to])
    (by
      intro p
      change (a.to (a.of p.1), b.to (b.of p.2)) = p
      rw [a.to_of,b.to_of])

def respectfulMorphism (A : Type u0) (B : Type u1)
    (R R' : A → A → Type u8) (hr : relationPairNative A R R')
    (S S' : B → B → Type u13) (hs : relationPairNative B S S') (f g : A → B) :
    (respectfulNative A B R S f g → respectfulNative A B R' S' f g) ×
    (respectfulNative A B R' S' f g → respectfulNative A B R S f g) :=
  ⟨fun h x y r => (hs (f x) (g y)).1 (h x y ((hr x y).2 r)),
   fun h x y r => (hs (f x) (g y)).2 (h x y ((hr x y).1 r))⟩
theorem respectfulMorphism_agrees (A : Type u0) (B : Type u1)
    (R R' : A → A → Type u8) (hr : relationPairNative A R R')
    (S S' : B → B → Type u13) (hs : relationPairNative B S S') (f g : A → B) :
    (convertedPairIso (functionIso (liftIso _) (liftIso _)) (functionIso (liftIso _) (liftIso _))).to
      (CMorphisms.respectful_morphism.{u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15}
        A B R R' ((relationPairIso A R R').of hr) S S' ((relationPairIso B S S').of hs) f g) =
          respectfulMorphism A B R R' hr S S' hs f g := rfl

abbrev liftedFunctions (A : Type u0) (B : Type u1) :=
  PULift.{max (max u0 u1) u2 + 1} (A → B)
abbrev liftedRespectful (A : Type u0) (B : Type u1)
    (R : A → A → Type u4) (S : B → B → Type u5)
    (f g : liftedFunctions.{u0,u1,u2} A B) :=
  PULift.{max (max (max u0 u3) u4) u5 + 1} (respectfulNative A B R S f.down g.down)
def respectfulPerIso (A : Type u0) (B : Type u1)
    (R : A → A → Type u4) (S : B → B → Type u5) :
    Iso (CRelationClasses.PER (liftedFunctions.{u0,u1,u2} A B) (liftedRespectful.{u0,u1,u2,u3,u4,u5} A B R S))
      (perNative (A → B) (respectfulNative A B R S)) :=
  Iso.mk
    (fun h =>
      let p := (perIso _ _).to h
      ⟨fun f g r => (p.1 ⟨f⟩ ⟨g⟩ ⟨r⟩).down,
       fun f g h r s => (p.2 ⟨f⟩ ⟨g⟩ ⟨h⟩ ⟨r⟩ ⟨s⟩).down⟩)
    (fun p => .Build_PER _ _
      (fun f g r => ⟨p.1 f.down g.down r.down⟩)
      (fun f g h r s => ⟨p.2 f.down g.down h.down r.down s.down⟩))
    (by intro h; cases h; rfl) (by intro p; rfl)
def respectfulPer (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (B : Type u1) (S : B → B → Type u5) (q : perNative B S) :
    perNative (A → B) (respectfulNative A B R S) :=
  ⟨respectfulSymmetryNative A B R S p q,respectfulTransitive A R p B S q⟩
theorem respectfulPer_agrees (A : Type u0) (R : A → A → Type u4) (p : perNative A R)
    (B : Type u1) (S : B → B → Type u5) (q : perNative B S) :
    (respectfulPerIso.{u0,u1,u2,u3,u4,u5} A B R S).to
      (CMorphisms.respectful_per.{u0,u1,u2,u3,u4,u5} A R ((perIso A R).of p) B S ((perIso B S).of q)) =
        respectfulPer A R p B S q := rfl

abbrev preorderNative (A : Type u0) (R : A → A → Type u1) :=
  ((x : A) → R x x) × ((x y z : A) → R x y → R y z → R x z)
abbrev equivalenceNative (A : Type u0) (R : A → A → Type u1) :=
  ((x : A) → R x x) × ((x y : A) → R x y → R y x) × ((x y z : A) → R x y → R y z → R x z)
def preorderIso (A : Type u0) (R : A → A → Type u1) :
    Iso (CRelationClasses.PreOrder A R) (preorderNative A R) :=
  Iso.mk
    (fun h => CRelationClasses.PreOrder.rec (motive := fun _ => preorderNative A R) (fun rf tr => ⟨rf,tr⟩) h)
    (fun p => .Build_PreOrder A R p.1 p.2)
    (by intro h; induction h <;> rfl) (fun _ => rfl)
def equivalenceIso (A : Type u0) (R : A → A → Type u1) :
    Iso (CRelationClasses.Equivalence A R) (equivalenceNative A R) :=
  Iso.mk
    (fun h => CRelationClasses.Equivalence.rec (motive := fun _ => equivalenceNative A R) (fun rf sy tr => ⟨rf,sy,tr⟩) h)
    (fun p => .Build_Equivalence A R p.1 p.2.1 p.2.2)
    (by intro h; induction h <;> rfl) (fun _ => rfl)

abbrev partialOrderNative (A : Type u0) (E R : A → A → Type u1) :=
  (x y : A) → (E x y → R x y × R y x) × ((R x y × R y x) → E x y)
def partialIso (A : Type u0) (E R : A → A → Type u1) :
    Iso ((x y : A) → Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod
      (E x y → Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod (R x y) (R y x))
      (Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod (R x y) (R y x) → E x y))
      (partialOrderNative A E R) :=
  Iso.piSame (fun x => Iso.piSame (fun y =>
    convertedPairIso (functionIso (identityIso (E x y)) (pairIso _ _))
      (functionIso (pairIso _ _) (identityIso (E x y)))))

def partialOrderForward (A : Type u1) (E R : A → A → Type u4)
    (pre : preorderNative A R) (p : partialOrderNative A E R)
    (x y : A) (xy : E x y) (a b : A) (ab : E a b) (r : R x a) : R y b :=
  pre.2 y x b ((p x y).1 xy).2 (pre.2 x a b r ((p a b).1 ab).1)
def partialOrderProper (A : Type u1) (E R : A → A → Type u4)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (p : partialOrderNative A E R)
    (x y : A) (xy : E x y) (a b : A) (ab : E a b) : (R x a → R y b) × (R y b → R x a) :=
  ⟨partialOrderForward A E R pre p x y xy a b ab,
   partialOrderForward A E R pre p y x (equ.2.1 x y xy) b a (equ.2.1 a b ab)⟩
theorem partialOrderProper_agrees (A : Type u1) (E R : A → A → Type u4)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (p : partialOrderNative A E R)
    (x y : A) (xy : E x y) (a b : A) (ab : E a b) :
    (pairIso _ _).to (CMorphisms.PartialOrder_proper_type.{u0,u1,u2,u3,u4,u5}
      A E ((equivalenceIso A E).of equ) R ((preorderIso A R).of pre)
      ((partialIso A E R).of p) x y xy a b ab) = partialOrderProper A E R equ pre p x y xy a b ab := rfl

theorem mechanicalFalseTo (h : Computational.CMorphism.Rocq.Corelib.Init.Logic.False) : False :=
  Computational.CMorphism.Rocq.Corelib.Init.Logic.False.rec (fun _ => False) h
def irreflexiveIso (A : Type u0) (R : A → A → Type u1) :
    Iso (CRelationClasses.Irreflexive A R) (∀ x, R x x → False) :=
  Iso.mk (fun h x r => mechanicalFalseTo ((h x).down r))
    (fun h x => ⟨fun r => False.elim (h x r)⟩)
    (by intro h; funext x; rfl) (fun _ => rfl)
abbrev strictOrderNative (A : Type u0) (R : A → A → Type u1) :=
  PLift (∀ x, R x x → False) × ((x y z : A) → R x y → R y z → R x z)
def strictOrderIso (A : Type u0) (R : A → A → Type u1) :
    Iso (CRelationClasses.StrictOrder A R) (strictOrderNative A R) :=
  Iso.mk
    (fun h => CRelationClasses.StrictOrder.rec (motive := fun _ => strictOrderNative A R) (fun irr tr => ⟨⟨(irreflexiveIso A R).to irr⟩,tr⟩) h)
    (fun h => .Build_StrictOrder A R ((irreflexiveIso A R).of h.1.down) h.2)
    (by intro h; induction h <;> rfl) (fun _ => rfl)

def preorderChangeIso (A : Type u0) (R : A → A → Type u1) (S : A → A → Type u2)
    (e : (x y : A) → Iso (R x y) (S x y)) : Iso (CRelationClasses.PreOrder A R) (preorderNative A S) :=
  Iso.mk
    (fun h =>
      let p := (preorderIso A R).to h
      ⟨fun x => (e x x).to (p.1 x),
       fun x y z a b => (e x z).to (p.2 x y z ((e x y).of a) ((e y z).of b))⟩)
    (fun p => .Build_PreOrder A R
      (fun x => (e x x).of (p.1 x))
      (fun x y z a b => (e x z).of (p.2 x y z ((e x y).to a) ((e y z).to b))))
    (by intro h; induction h; simp only [preorderIso, Iso.of_to])
    (by intro p; simp only [preorderIso, Iso.to_of])

def sourceSumIso (A : Type u0) (B : Type u1) :
    Iso (Computational.CMorphism.Rocq.Corelib.Init.Datatypes.sum A B) (Sum A B) :=
  Iso.mk
    (fun s => Computational.CMorphism.Rocq.Corelib.Init.Datatypes.sum.rec
      (motive := fun _ => Sum A B) Sum.inl Sum.inr s)
    (fun s => match s with | .inl a => .inl A B a | .inr b => .inr A B b)
    (by intro s; induction s <;> rfl) (by intro s; cases s <;> rfl)
def liftedSumIso (A : Type u0) (B : Type u1) :
    Iso (PULift.{u2} (Computational.CMorphism.Rocq.Corelib.Init.Datatypes.sum A B)) (Sum A B) :=
  Iso.mk (fun s => (sourceSumIso A B).to s.down) (fun s => ⟨(sourceSumIso A B).of s⟩)
    (by intro s; exact congrArg PULift.up ((sourceSumIso A B).of_to s.down))
    (sourceSumIso A B).to_of

abbrev respectRelation (A : Type u0) (E : A → A → Type u1) (R : A → A → Type u2) :=
  (x y : A) → E x y → (a b : A) → E a b → (R x a → R y b) × (R y b → R x a)
def strictToPreorder (A : Type u5) (E : A → A → Type u6) (equ : equivalenceNative A E)
    (R : A → A → Type u4) (strict : strictOrderNative A R) (resp : respectRelation A E R) :
    preorderNative A (fun x y => Sum (R x y) (E x y)) :=
  ⟨fun x => .inr (equ.1 x),
   fun x y z a b => match a,b with
    | .inl r, .inl s => .inl (strict.2 x y z r s)
    | .inl r, .inr e => .inl ((resp x x (equ.1 x) z y (equ.2.1 y z e)).2 r)
    | .inr e, .inl r => .inl ((resp x y e z z (equ.1 z)).2 r)
    | .inr e, .inr f => .inr (equ.2.2 x y z e f)⟩
theorem strictToPreorder_agrees (A : Type u5) (E : A → A → Type u6) (equ : equivalenceNative A E)
    (R : A → A → Type u4) (strict : strictOrderNative A R) (resp : respectRelation A E R) :
    (preorderChangeIso A _ _ (fun x y => liftedSumIso (R x y) (E x y))).to
      (CMorphisms.StrictOrder_PreOrder.{u0,u1,u2,u3,u4,u5,u6}
        A E ((equivalenceIso A E).of equ) R ((strictOrderIso A R).of strict)
        (fun x y e a b f => (pairIso _ _).of (resp x y e a b f))) =
          strictToPreorder A E equ R strict resp := by
  apply Prod.ext
  · rfl
  · funext x y z a b
    cases a <;> cases b <;> rfl

theorem equalityReverseProof :
    Computational.CMorphism.Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement.{u0,u1} := by
  intro A x P h y e
  exact Computational.CMorphism.Rocq.Corelib.Init.Logic.eq.rec
    (motive := fun z _ => Computational.CMorphism.Rocq.Corelib.Init.Logic.eq A z y)
    (.eq_refl A y) e
theorem pointwiseProof : CMorphisms.pointwise_pointwise__rocq2lean_obligation_1.statement.{u0,u1,u2,u3,u4,u5,u6} := by
  intro A B R f g h a h0 h1
  exact .eq_refl A a

def equalitySubrelation (A : Type u0) (R : A → A → Type u1) (rf : (x : A) → R x x)
    (x y : A) (e : x = y) : R x y := e ▸ rf x
theorem equalitySubrelation_agrees (A : Type u0) (R : A → A → Type u1) (rf : (x : A) → R x x)
    (x y : A) (e : x = y) :
    @Computational.CMorphism.RocqPending.Corelib.Classes.CMorphisms.eq_subrelation.{u0,u1}
      equalityReverseProof A R rf x y (mechanicalEqOf e) = equalitySubrelation A R rf x y e := by
  cases e
  rfl

def properSubrelation (A : Type u0) (R S : A → A → Type u7)
    (sub : (x y : A) → R x y → S x y) (x y : A) (e : x = y) (r : R x x) : S y y :=
  e ▸ sub x x r
theorem properSubrelation_agrees (A : Type u0) (R S : A → A → Type u7)
    (sub : (x y : A) → R x y → S x y) (x y : A) (e : x = y) (r : R x x) :
    @Computational.CMorphism.RocqPending.Corelib.Classes.CMorphisms.proper_subrelation_proper_arrow.{u0,u1,u2,u3,u4,u5,u6,u7,u8}
      equalityReverseProof A R S sub x y (mechanicalEqOf e) r = properSubrelation A R S sub x y e r := by
  cases e
  rfl

def reflexiveEqualityDomain (B : Type u0) (R : B → B → Type u4) (rf : (x : B) → R x x)
    (A : Type u1) (f : A → B) (x y : A) (e : x = y) : R (f x) (f y) := e ▸ rf (f x)
theorem reflexiveEqualityDomain_agrees (B : Type u0) (R : B → B → Type u4) (rf : (x : B) → R x x)
    (A : Type u1) (f : A → B) (x y : A) (e : x = y) :
    @Computational.CMorphism.RocqPending.Corelib.Classes.CMorphisms.reflexive_eq_dom_reflexive.{u0,u1,u2,u3,u4}
      equalityReverseProof B R rf A f x y (mechanicalEqOf e) = reflexiveEqualityDomain B R rf A f x y e := by
  cases e
  rfl

def equalityRespectfulIso (A : Type u0) (B : Type u5) (R : B → B → Type u6) (f g : A → B) :
    Iso ((x y : A) → Computational.CMorphism.Rocq.Corelib.Init.Logic.eq A x y → R (f x) (g y))
      ((x y : A) → x = y → R (f x) (g y)) :=
  Iso.piSame (fun x => Iso.piSame (fun y =>
    functionIso (mechanicalEqIso A x y) (identityIso (R (f x) (g y)))))
def pointwiseEquality (A : Type u0) (B : Type u5) (R : B → B → Type u6) (f g : A → B) :
    (((x : A) → R (f x) (g x)) → (x y : A) → x = y → R (f x) (g y)) ×
    (((x y : A) → x = y → R (f x) (g y)) → (x : A) → R (f x) (g x)) :=
  ⟨fun h x y e => e ▸ h x,fun h x => h x x rfl⟩
theorem pointwiseEquality_agrees (A : Type u0) (B : Type u5) (R : B → B → Type u6) (f g : A → B) :
    (convertedPairIso
      (functionIso (identityIso _) (equalityRespectfulIso A B R f g))
      (functionIso (equalityRespectfulIso A B R f g) (identityIso _))).to
      (@Computational.CMorphism.RocqPending.Corelib.Classes.CMorphisms.pointwise_pointwise.{u0,u1,u2,u3,u4,u5,u6}
        equalityReverseProof pointwiseProof A B R f g) = pointwiseEquality A B R f g := by
  apply Prod.ext
  · funext h x y e
    cases e
    rfl
  · rfl

theorem partialStrictIrreflexiveProof :
    CMorphisms.PartialOrder_StrictOrder__rocq2lean_obligation_1.statement.{u0,u1,u2,u3,u4,u5} := by
  intro A E equ R pre p x edge
  exact Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod.rec
    (motive := fun _ => Computational.CMorphism.Rocq.Corelib.Init.Logic.False)
    (fun _ ne => ne (((equivalenceIso A E).to equ).1 x)) edge

theorem partialStrictTransitiveProof :
    CMorphisms.PartialOrder_StrictOrder__rocq2lean_obligation_2.statement.{u0,u1,u2,u3,u4,u5} := by
  intro A E equ R pre p x y z unused r ne hr hne unused2 s ne2 hs hns e
  let q := (partialIso A E R).to p.down
  let tr := ((preorderIso A R).to pre).2
  exact hne ((q x y).2 ⟨hr,tr y z x hs ((q x z).1 e).2⟩)

theorem strictPartialProof :
    CMorphisms.StrictOrder_PartialOrder__rocq2lean_obligation_1.statement.{u0,u1,u2,u3,u4,u5,u6,u7} := by
  intro A E equ R strict resp x y unused a b r s
  let h := (strictOrderIso A R).to strict
  exact False.elim (h.1.down x (h.2 x y x r s))

def strictEdgeIso (A : Type u0) (B : Type u1) :
    Iso (PULift.{u2} (Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod A
      (B → Computational.CMorphism.Rocq.Corelib.Init.Logic.False))) {_r : A // B → False} :=
  Iso.mk
    (fun e => Computational.CMorphism.Rocq.Corelib.Init.Datatypes.prod.rec
      (motive := fun _ => {_r : A // B → False})
      (fun a ne => ⟨a,fun b => mechanicalFalseTo (ne b)⟩) e.down)
    (fun e => ⟨.pair _ _ e.val (fun b => False.elim (e.property b))⟩)
    (by intro e; cases e with | up e => induction e <;> rfl)
    (fun _ => rfl)

def strictChangeIso (A : Type u0) (R : A → A → Type u1) (S : A → A → Type u2)
    (e : (x y : A) → Iso (R x y) (S x y)) : Iso (CRelationClasses.StrictOrder A R) (strictOrderNative A S) :=
  Iso.mk
    (fun h =>
      let p := (strictOrderIso A R).to h
      ⟨⟨fun x s => p.1.down x ((e x x).of s)⟩,
       fun x y z a b => (e x z).to (p.2 x y z ((e x y).of a) ((e y z).of b))⟩)
    (fun p => .Build_StrictOrder A R
      ((irreflexiveIso A R).of (fun x r => p.1.down x ((e x x).to r)))
      (fun x y z a b => (e x z).of (p.2 x y z ((e x y).to a) ((e y z).to b))))
    (by intro h; induction h; simp only [strictOrderIso, Iso.of_to]; rfl)
    (by intro p; simp only [strictOrderIso, Iso.to_of])

def partialToStrict (A : Type u4) (E R : A → A → Type u5)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (p : partialOrderNative A E R) :
    strictOrderNative A (fun x y => {_r : R x y // E x y → False}) :=
  ⟨⟨fun x e => e.property (equ.1 x)⟩,
   fun x y z a b => ⟨pre.2 x y z a.val b.val,
     fun e => a.property ((p x y).2 ⟨a.val,pre.2 y z x b.val ((p x z).1 e).2⟩)⟩⟩
theorem partialToStrict_agrees (A : Type u4) (E R : A → A → Type u5)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (p : partialOrderNative A E R) :
    (strictChangeIso A _ _ (fun x y => strictEdgeIso (R x y) (E x y))).to
      (@Computational.CMorphism.RocqPending.Corelib.Classes.CMorphisms.PartialOrder_StrictOrder.{u0,u1,u2,u3,u4,u5}
        partialStrictIrreflexiveProof partialStrictTransitiveProof
        A E ((equivalenceIso A E).of equ) R ((preorderIso A R).of pre) ((partialIso A E R).of p)) =
          partialToStrict A E R equ pre p := rfl

def strictToPartial (A : Type u6) (E : A → A → Type u7) (equ : equivalenceNative A E)
    (R : A → A → Type u5) (strict : strictOrderNative A R) (x y : A) :
    (E x y → Sum (R x y) (E x y) × Sum (R y x) (E y x)) ×
    ((Sum (R x y) (E x y) × Sum (R y x) (E y x)) → E x y) :=
  ⟨fun e => ⟨.inr e,.inr (equ.2.1 x y e)⟩,
   fun p => match p.1,p.2 with
    | .inl r, .inl s => False.elim (strict.1.down x (strict.2 x y x r s))
    | .inl _, .inr e => equ.2.1 y x e
    | .inr e, _ => e⟩
theorem strictToPartial_agrees (A : Type u6) (E : A → A → Type u7) (equ : equivalenceNative A E)
    (R : A → A → Type u5) (strict : strictOrderNative A R) (resp : respectRelation A E R) (x y : A) :
    (convertedPairIso
      (functionIso (identityIso _) (convertedPairIso (sourceSumIso _ _) (sourceSumIso _ _)))
      (functionIso (convertedPairIso (sourceSumIso _ _) (sourceSumIso _ _)) (identityIso _))).to
      (@Computational.CMorphism.RocqPending.Corelib.Classes.CMorphisms.StrictOrder_PartialOrder.{u0,u1,u2,u3,u4,u5,u6,u7}
        strictPartialProof A E ((equivalenceIso A E).of equ) R ((strictOrderIso A R).of strict)
        (fun a b e c d f => (pairIso _ _).of (resp a b e c d f)) x y) = strictToPartial A E equ R strict x y := by
  apply Prod.ext
  · rfl
  · funext p
    rcases p with ⟨a,b⟩
    cases a with
    | inl r =>
      cases b with
      | inl s => exact False.elim (strict.1.down x (strict.2 x y x r s))
      | inr e => rfl
    | inr e =>
      cases b <;> rfl

end NativeBridge.ComputationalCorrespondence.CMorphism
