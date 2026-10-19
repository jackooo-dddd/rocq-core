import Interface_Classes_CMorphisms
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.CMorphismData
open NativeBridge
universe u v w t z a b c d e f g h i j

def pairIso (A : Type u) (B : Type v) :
    Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B) where
  to x := match x with | .pair _ _ x y => ⟨x,y⟩
  of x := .pair _ _ x.1 x.2
  of_to x := by cases x; rfl
  to_of x := rfl

abbrev relationPairNative (A : Type u) (R S : A → A → Type v) :=
  (x y : A) → (R x y → S x y) × (S x y → R x y)
def relationPairIso (A : Type u) (R S : A → A → Type v) :
    Iso ((x y : A) → Rocq.Corelib.Init.Datatypes.prod (R x y → S x y) (S x y → R x y))
      (relationPairNative A R S) :=
  Iso.piSame (fun x => Iso.piSame (fun y => pairIso (R x y → S x y) (S x y → R x y)))

abbrev normalizesNative := @relationPairNative
def normalizesIso (A : Type u) (R S : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CMorphisms.Normalizes.{u,w,t,v} A R S)
      (normalizesNative A R S) where
  to h := (relationPairIso A R S).to h.down
  of h := ⟨(relationPairIso A R S).of h⟩
  of_to h := by cases h; exact congrArg PULift.up ((relationPairIso A R S).of_to _)
  to_of h := (relationPairIso A R S).to_of h

def normalizesNativeOp (A : Type u) (R S : A → A → Type v)
    (h : normalizesNative A R S) := h
theorem normalizes_agrees (A : Type u) (R S : A → A → Type v)
    (h : normalizesNative A R S) :
    (normalizesIso.{u,v,w,t} A R S).to
      (Rocq.Corelib.Classes.CMorphisms.normalizes.{u,w,t,v} A R S
        ((normalizesIso A R S).of h)) = normalizesNativeOp A R S h :=
  (normalizesIso.{u,v,w,t} A R S).to_of h

def markerNative : Prop := True
def paramsNative (A : Type u) (_ : A) (_ : Nat) : Prop := True
def paramsIso (A : Type u) (x : A) (arity : Nat) :
    Iso (Rocq.Corelib.Classes.CMorphisms.Params A x (natOf arity)) (paramsNative A x arity) :=
  ⟨fun _ => True.intro, fun _ => .Build_Params A x (natOf arity), fun _ => rfl, fun _ => rfl⟩
def partialApplicationIso :
    Iso Rocq.Corelib.Classes.CMorphisms.PartialApplication markerNative :=
  ⟨fun _ => True.intro, fun _ => .Build_PartialApplication, fun _ => rfl, fun _ => rfl⟩
def applySubrelationIso :
    Iso Rocq.Corelib.Classes.CMorphisms.apply_subrelation markerNative :=
  ⟨fun _ => True.intro, fun _ => .do_subrelation, fun _ => rfl, fun _ => rfl⟩
def normalizationDoneIso :
    Iso Rocq.Corelib.Classes.CMorphisms.normalization_done markerNative :=
  ⟨fun _ => True.intro, fun _ => .did_normalization, fun _ => rfl, fun _ => rfl⟩

abbrev properNative (A : Type u) (R : A → A → Type v) (x : A) := R x x
def properIso (A : Type u) (R : A → A → Type v) (x : A) :
    Iso (Rocq.Corelib.Classes.CMorphisms.Proper A R x) (properNative A R x) := identityIso _
def properProxyIso (A : Type u) (R : A → A → Type v) (x : A) :
    Iso (Rocq.Corelib.Classes.CMorphisms.ProperProxy A R x) (properNative A R x) := identityIso _
def properPrfNative (A : Type u) (R : A → A → Type v) (x : A) (h : properNative A R x) := h
theorem proper_prf_agrees (A : Type u) (R : A → A → Type v) (x : A) (h : properNative A R x) :
    Rocq.Corelib.Classes.CMorphisms.proper_prf A R x h = properPrfNative A R x h := rfl
theorem proper_proxy_agrees (A : Type u) (R : A → A → Type v) (x : A) (h : properNative A R x) :
    Rocq.Corelib.Classes.CMorphisms.proper_proxy A R x h = properPrfNative A R x h := rfl
theorem proper_flip_proper_agrees (A : Type u) (R : A → A → Type v) (x : A) (h : properNative A R x) :
    Rocq.Corelib.Classes.CMorphisms.proper_flip_proper.{u,v,w} A R x h = properPrfNative A R x h := rfl

abbrev forallNative (A : Type u) (P : A → Type v) := (x : A) → P x
def forallIso (A : Type u) (P : A → Type v) :
    Iso (Rocq.Corelib.Classes.CMorphisms.forall_def.{u,v,w} A P) (forallNative A P) :=
  ⟨PULift.down,PULift.up,fun _ => rfl,fun _ => rfl⟩

abbrev forallRelationNative (A : Type u) (P : A → Type v)
    (R : (a : A) → P a → P a → Type w) (f g : (a : A) → P a) := (a : A) → R a (f a) (g a)
def forallRelationIso (A : Type u) (P : A → Type v)
    (R : (a : A) → P a → P a → Type w) (f g : (a : A) → P a) :
    Iso (Rocq.Corelib.Classes.CMorphisms.forall_relation.{u,v,w,t,z} A P R f g)
      (forallRelationNative A P R f g) :=
  ⟨PULift.down,PULift.up,fun _ => rfl,fun _ => rfl⟩

abbrev pointwiseNative (A : Type u) (B : Type v) (R : B → B → Type w) (f g : A → B) :=
  (x : A) → R (f x) (g x)
def pointwiseIso (A : Type u) (B : Type v) (R : B → B → Type w) (f g : A → B) :
    Iso (Rocq.Corelib.Classes.CMorphisms.pointwise_relation.{u,v,w,t,z} A B R f g)
      (pointwiseNative A B R f g) :=
  ⟨PULift.down,PULift.up,fun _ => rfl,fun _ => rfl⟩

abbrev respectfulNative (A : Type u) (B : Type v)
    (R : A → A → Type w) (S : B → B → Type t) (f g : A → B) :=
  (x y : A) → R x y → S (f x) (g y)
def respectfulIso (A : Type u) (B : Type v)
    (R : A → A → Type w) (S : B → B → Type t) (f g : A → B) :
    Iso (Rocq.Corelib.Classes.CMorphisms.respectful.{u,w,v,t,z,a} A B R S f g)
      (respectfulNative A B R S f g) :=
  ⟨PULift.down,PULift.up,fun _ => rfl,fun _ => rfl⟩

abbrev respectfulHeteroNative (A : Type u) (B : Type v) (C : A → Type w) (D : B → Type t)
    (R : A → B → Type z) (S : (x : A) → (y : B) → C x → D y → Type a)
    (f : (x : A) → C x) (g : (y : B) → D y) :=
  (x : A) → (y : B) → R x y → S x y (f x) (g y)
def respectfulHeteroIso (A : Type u) (B : Type v) (C : A → Type w) (D : B → Type t)
    (R : A → B → Type z) (S : (x : A) → (y : B) → C x → D y → Type a)
    (f : (x : A) → C x) (g : (y : B) → D y) :
    Iso (Rocq.Corelib.Classes.CMorphisms.respectful_hetero.{b,u,v,w,t,z,a,c} A B C D R S f g)
      (respectfulHeteroNative A B C D R S f g) :=
  ⟨PULift.down,PULift.up,fun _ => rfl,fun _ => rfl⟩

abbrev perNative (A : Type u) (R : A → A → Type v) :=
  ((x y : A) → R x y → R y x) × ((x y z : A) → R x y → R y z → R x z)
def perIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.PER A R) (perNative A R) where
  to x := match x with | .Build_PER _ _ sy tr => ⟨sy,tr⟩
  of x := .Build_PER A R x.1 x.2
  of_to x := by cases x; rfl
  to_of x := rfl
def respectfulSymmetryNative (A : Type u) (B : Type v)
    (R : A → A → Type w) (S : B → B → Type t)
    (h : perNative A R) (k : perNative B S) (f g : A → B)
    (rel : respectfulNative A B R S f g) : respectfulNative A B R S g f :=
  fun x y r => k.1 (f y) (g x) (rel y x (h.1 x y r))
theorem respectful_per_obligation_1_agrees (A : Type u) (B : Type v)
    (R : A → A → Type w) (S : B → B → Type t)
    (h : perNative A R) (k : perNative B S) (f g : A → B)
    (rel : respectfulNative A B R S f g) :
    Rocq.Corelib.Classes.CMorphisms.respectful_per_obligation_1.{u,v,z,a,w,t}
      A R ((perIso A R).of h) B S ((perIso B S).of k) f g rel =
        respectfulSymmetryNative A B R S h k f g rel := rfl

def iffImplNative : Prop := ∀ P Q : Prop, (P ↔ Q) → P → Q
theorem iffImplNative_proof : iffImplNative := fun _ _ h => h.mp
theorem iffImplSource_proof : Rocq.Corelib.Classes.CMorphisms.iff_impl_subrelation.statement.{u} := by
  intro P Q h
  cases h with
  | conj f _ => exact f
theorem iff_impl_subrelation_agrees :
    Rocq.Corelib.Classes.CMorphisms.iff_impl_subrelation.statement.{u} ↔ iffImplNative :=
  ⟨fun _ => iffImplNative_proof, fun _ => iffImplSource_proof⟩


abbrev flipArrowNative :=
  (A : Type v) → (R S : A → A → Type w) →
  relationPairNative A R (fun x y => S y x) →
  (B : Type t) → (T U : B → B → Type z) →
  relationPairNative B T (fun x y => U y x) →
  (f g : A → B) →
    (respectfulNative A B R T f g → respectfulNative A B S U g f) ×
    (respectfulNative A B S U g f → respectfulNative A B R T f g)

def flipArrowIso :
    Iso Rocq.Corelib.Classes.CMorphisms.flip_arrow.type.{u,v,w,t,z,a,b,c,d,e,f,g,h,i,j}
      flipArrowNative.{v,w,t,z} where
  to fn A R S hs B T U ht f g :=
    (pairIso _ _).to
      (fn A R S ((relationPairIso A R (fun x y => S y x)).of hs)
        B T U ((relationPairIso B T (fun x y => U y x)).of ht) f g)
  of fn A R S hs B T U ht f g :=
    (pairIso _ _).of
      (fn A R S ((relationPairIso A R (fun x y => S y x)).to hs)
        B T U ((relationPairIso B T (fun x y => U y x)).to ht) f g)
  of_to fn := by
    funext A R S hs B T U ht f g
    simp only [Iso.of_to]
  to_of fn := by
    funext A R S hs B T U ht f g
    simp only [Iso.to_of]

def flipArrowNativeWitness : flipArrowNative.{v,w,t,z} :=
  fun _A _R _S hs _B _T _U ht f g =>
    ⟨fun rel x y s => (ht (f y) (g x)).1 (rel y x ((hs y x).2 s)),
     fun rel x y r => (ht (f x) (g y)).2 (rel y x ((hs x y).1 r))⟩

-- The export retained a Type-valued statement. This constructs an inhabitant
-- of that statement; it does not identify an unavailable original opaque body.
def flipArrowSourceWitness :
    Rocq.Corelib.Classes.CMorphisms.flip_arrow.type.{u,v,w,t,z,a,b,c,d,e,f,g,h,i,j} :=
  flipArrowIso.of flipArrowNativeWitness

end NativeBridge.Incremental.CMorphismData

open Lean Meta Elab Command
private partial def indexedNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      let ci ← getConstInfo n
      let body? := match ci with
        | .defnInfo v => some v.value
        | .thmInfo v => some v.value
        | .opaqueInfo v => some v.value
        | _ => none
      if let some body := body? then
        found := found ++ (← indexedNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.CMorphismData.flipArrowNative", "NativeBridge.Incremental.CMorphismData.forallNative", "NativeBridge.Incremental.CMorphismData.forallRelationNative", "NativeBridge.Incremental.CMorphismData.iffImplNative", "NativeBridge.Incremental.CMorphismData.markerNative", "NativeBridge.Incremental.CMorphismData.normalizesNative", "NativeBridge.Incremental.CMorphismData.normalizesNativeOp", "NativeBridge.Incremental.CMorphismData.paramsNative", "NativeBridge.Incremental.CMorphismData.pointwiseNative", "NativeBridge.Incremental.CMorphismData.properNative", "NativeBridge.Incremental.CMorphismData.properPrfNative", "NativeBridge.Incremental.CMorphismData.respectfulHeteroNative", "NativeBridge.Incremental.CMorphismData.respectfulNative", "NativeBridge.Incremental.CMorphismData.respectfulSymmetryNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
