import DataCRelation
set_option autoImplicit false
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.ComputationalCorrespondence.CRelation
open Computational.CRelation.NativeBridge
open Computational.CRelation.NativeBridge.Incremental.CRelationData
open Computational.CRelation.NativeBridge.Incremental.CRelationOrder
open Computational.CRelation.NativeBridge.Incremental.CRelationStatements
open Computational.CRelation.Rocq.Corelib.Classes
universe u v w t z

def flipReflexive (A : Type u) (R : A → A → Type v) (h : reflexiveNative A R) :
    reflexiveNative A (fun x y => R y x) := h
theorem flipReflexive_agrees (A : Type u) (R : A → A → Type v) (h : reflexiveNative A R) :
    CRelationClasses.flip_Reflexive.{u,v,w} A R h = flipReflexive A R h := rfl

def flipAntisymmetric (A : Type u) (E : A → A → Type v) (R : A → A → Type w)
    (h : antisymmetricNative A E R) : antisymmetricNative A E (fun x y => R y x) :=
  fun x y a b => h x y b a
theorem flipAntisymmetric_agrees (A : Type u) (E : A → A → Type v)
    (equ : equivalenceNative A E) (R : A → A → Type w) (h : antisymmetricNative A E R) :
    CRelationClasses.flip_Antisymmetric.{u,w,v,t} A E ((EquivalenceIso A E).of equ) R h =
      flipAntisymmetric A E R h := rfl

def flipPreOrder (A : Type u) (R : A → A → Type v) (h : preorderNative A R) :
    preorderNative A (fun x y => R y x) :=
  ⟨h.1,fun x y z a b => h.2 z y x b a⟩
theorem flipPreOrder_agrees (A : Type u) (R : A → A → Type v) (h : preorderNative A R) :
    (PreOrderIso A (fun x y => R y x)).to
      (CRelationClasses.flip_PreOrder.{u,v,w} A R ((PreOrderIso A R).of h)) =
        flipPreOrder A R h := rfl

def flipPER (A : Type u) (R : A → A → Type v) (h : perNative A R) :
    perNative A (fun x y => R y x) :=
  ⟨fun x y a => h.1 y x a,fun x y z a b => h.2 z y x b a⟩
theorem flipPER_agrees (A : Type u) (R : A → A → Type v) (h : perNative A R) :
    (PERIso A (fun x y => R y x)).to
      (CRelationClasses.flip_PER.{u,v,w} A R ((PERIso A R).of h)) = flipPER A R h := rfl

def flipEquivalence (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) :
    equivalenceNative A (fun x y => R y x) :=
  ⟨h.1,fun x y a => h.2.1 y x a,fun x y z a b => h.2.2 z y x b a⟩
theorem flipEquivalence_agrees (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R) :
    (EquivalenceIso A (fun x y => R y x)).to
      (CRelationClasses.flip_Equivalence.{u,v,w} A R ((EquivalenceIso A R).of h)) =
        flipEquivalence A R h := rfl

def flipStrictOrder (A : Type u) (R : A → A → Type v) (h : strictOrderNative A R) :
    strictOrderNative A (fun x y => R y x) :=
  ⟨h.1,fun x y z a b => h.2 z y x b a⟩
theorem flipStrictOrder_agrees (A : Type u) (R : A → A → Type v) (h : strictOrderNative A R) :
    (strictOrderIso A (fun x y => R y x)).to
      (CRelationClasses.flip_StrictOrder.{u,v,w} A R ((strictOrderIso A R).of h)) =
        flipStrictOrder A R h := rfl

def inversePartialOrder (A : Type u) (E R : A → A → Type v)
    (h : partialOrderNative A E R) : partialOrderNative A E (fun x y => R y x) :=
  fun x y => ⟨fun e => ((h x y).1 e).swap, fun p => (h x y).2 p.swap⟩
theorem inversePartialOrder_agrees (A : Type u) (E R : A → A → Type v)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (h : partialOrderNative A E R) :
    partialTo A E (fun x y => R y x)
      (CRelationClasses.PartialOrder_inverse.{u,w,t,z,v} A E ((EquivalenceIso A E).of equ)
        R ((PreOrderIso A R).of pre) (partialOf A E R h)) =
          inversePartialOrder A E R h := rfl

def partialAntisymmetry (A : Type u) (E R : A → A → Type v)
    (h : partialOrderNative A E R) : antisymmetricNative A E R :=
  fun x y a b => (h x y).2 ⟨a,b⟩
theorem partialAntisymmetry_agrees (A : Type u) (E R : A → A → Type v)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (h : partialOrderNative A E R) :
    CRelationClasses.partial_order_antisym.{u,w,t,z,v} A E ((EquivalenceIso A E).of equ)
      R ((PreOrderIso A R).of pre) (partialOf A E R h) = partialAntisymmetry A E R h := rfl

def symmetricSubrelation (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) :
    subrelationNative A (fun x y => R y x) R := fun x y a => h y x a
theorem symmetricSubrelation_agrees (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) :
    CRelationClasses.subrelation_symmetric.{u,w,v} A R h = symmetricSubrelation A R h := rfl

abbrev liftedRelations (A : Type u) := PULift.{max (max u w) (v+1) + 1} (A → A → Type v)
abbrev liftedImplication (A : Type u) (R S : liftedRelations.{u,v,w} A) :=
  PULift.{max (max u t) v + 1} ((x y : A) → R.down x y → S.down x y)
abbrev implicationRelation (A : Type u) (R S : A → A → Type v) :=
  (x y : A) → R x y → S x y

def implicationPreorderIso (A : Type u) :
    Iso (CRelationClasses.PreOrder (liftedRelations.{u,v,w} A) (liftedImplication.{u,v,w,t} A))
      (preorderNative (A → A → Type v) (implicationRelation A)) :=
  Iso.mk
    (fun h =>
      let p := (PreOrderIso _ _).to h
      ⟨fun R => (p.1 ⟨R⟩).down,
       fun R S T f g => (p.2 ⟨R⟩ ⟨S⟩ ⟨T⟩ ⟨f⟩ ⟨g⟩).down⟩)
    (fun p => .Build_PreOrder _ _
      (fun R => ⟨p.1 R.down⟩)
      (fun R S T f g => ⟨p.2 R.down S.down T.down f.down g.down⟩))
    (by intro h; cases h; rfl)
    (by intro p; rfl)

def implicationPreorder (A : Type u) :
    preorderNative (A → A → Type v) (implicationRelation A) :=
  ⟨fun _ _ _ a => a,fun _ _ _ f g x y a => g x y (f x y a)⟩
theorem implicationPreorder_agrees (A : Type u) :
    (implicationPreorderIso.{u,v,w,t} A).to
      (CRelationClasses.relation_implication_preorder.{u,w,t,v} A) =
        implicationPreorder A := rfl

abbrev liftedEquivalence (A : Type u) (R S : liftedRelations.{u,v,w} A) :=
  PULift.{max (max u t) v + 1} ((x y : A) →
    Computational.CRelation.Rocq.Corelib.Init.Datatypes.prod
      (R.down x y → S.down x y) (S.down x y → R.down x y))

def equivValueIso (A : Type u) (R S : A → A → Type v) :
    Iso (liftedEquivalence.{u,v,w,t} A ⟨R⟩ ⟨S⟩) (relationEquivalenceNative A R S) :=
  Iso.mk
    (fun h x y => match h.down x y with | .pair _ _ f g => ⟨f,g⟩)
    (fun h => ⟨fun x y => .pair _ _ (h x y).1 (h x y).2⟩)
    (by
      intro h
      cases h with
      | up h =>
        apply congrArg PULift.up
        funext x y
        dsimp only)
    (by intro h; rfl)

def relationEquivalenceRecordIso (A : Type u) :
    Iso (CRelationClasses.Equivalence (liftedRelations.{u,v,w} A) (liftedEquivalence.{u,v,w,t} A))
      (equivalenceNative (A → A → Type v) (relationEquivalenceNative A)) :=
  Iso.mk
    (fun h =>
      let p := (EquivalenceIso _ _).to h
      ⟨fun R => (equivValueIso.{u,v,w,t} A R R).to (p.1 ⟨R⟩),
       fun R S f => (equivValueIso.{u,v,w,t} A S R).to
         (p.2.1 ⟨R⟩ ⟨S⟩ ((equivValueIso.{u,v,w,t} A R S).of f)),
       fun R S T f g => (equivValueIso.{u,v,w,t} A R T).to
         (p.2.2 ⟨R⟩ ⟨S⟩ ⟨T⟩ ((equivValueIso.{u,v,w,t} A R S).of f)
           ((equivValueIso.{u,v,w,t} A S T).of g))⟩)
    (fun p => .Build_Equivalence _ _
      (fun R => (equivValueIso.{u,v,w,t} A R.down R.down).of (p.1 R.down))
      (fun R S f => (equivValueIso.{u,v,w,t} A S.down R.down).of
        (p.2.1 R.down S.down ((equivValueIso.{u,v,w,t} A R.down S.down).to f)))
      (fun R S T f g => (equivValueIso.{u,v,w,t} A R.down T.down).of
        (p.2.2 R.down S.down T.down ((equivValueIso.{u,v,w,t} A R.down S.down).to f)
          ((equivValueIso.{u,v,w,t} A S.down T.down).to g))))
    (by intro h; cases h; simp only [EquivalenceIso, Iso.of_to]; rfl)
    (by intro p; simp only [EquivalenceIso]; rfl)

def relationEquivalenceRecord (A : Type u) :
    equivalenceNative (A → A → Type v) (relationEquivalenceNative A) :=
  ⟨fun _ _ _ => ⟨id,id⟩,
   fun _ _ f x y => (f x y).swap,
   fun _ _ _ f g x y => ⟨(g x y).1 ∘ (f x y).1,(f x y).2 ∘ (g x y).2⟩⟩
theorem relationEquivalenceRecord_agrees (A : Type u) :
    (relationEquivalenceRecordIso.{u,v,w,t} A).to
      (CRelationClasses.relation_equivalence_equivalence.{u,w,t,v} A) =
        relationEquivalenceRecord A := rfl

end NativeBridge.ComputationalCorrespondence.CRelation
