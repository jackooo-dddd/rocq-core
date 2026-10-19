import CRelationData
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.CRelationOrder
open NativeBridge CRelationData
universe u v w t z

abbrev partialOrderNative (A : Type u) (E R : A → A → Type v) :=
  (x y : A) → (E x y → R x y × R y x) × ((R x y × R y x) → E x y)

def partialTo (A : Type u) (E R : A → A → Type v)
    (h : (x y : A) → Rocq.Corelib.Init.Datatypes.prod
      (E x y → Rocq.Corelib.Init.Datatypes.prod (R x y) (R y x))
      (Rocq.Corelib.Init.Datatypes.prod (R x y) (R y x) → E x y)) :
    partialOrderNative A E R := fun x y =>
  match h x y with
  | .pair _ _ f g => ⟨fun e => match f e with | .pair _ _ a b => ⟨a,b⟩,
      fun p => g (.pair _ _ p.1 p.2)⟩

def partialOf (A : Type u) (E R : A → A → Type v) (h : partialOrderNative A E R) :=
  fun x y => Rocq.Corelib.Init.Datatypes.prod.pair
    (E x y → Rocq.Corelib.Init.Datatypes.prod (R x y) (R y x))
    (Rocq.Corelib.Init.Datatypes.prod (R x y) (R y x) → E x y)
    (fun e => .pair _ _ ((h x y).1 e).1 ((h x y).1 e).2)
    (fun p => match p with | .pair _ _ a b => (h x y).2 ⟨a,b⟩)

theorem partial_to_of (A : Type u) (E R : A → A → Type v) (h : partialOrderNative A E R) :
    partialTo A E R (partialOf A E R h) = h := by rfl

theorem partial_of_to (A : Type u) (E R : A → A → Type v) (h) :
    partialOf A E R (partialTo A E R h) = h := by
  funext x y
  dsimp only [partialOf, partialTo]

def partialOrderIso (A : Type u) (E R : A → A → Type v)
    (equ : equivalenceNative A E) (pre : preorderNative A R) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.PartialOrder.{u,w,t,v,z}
      A E ((EquivalenceIso A E).of equ) R ((PreOrderIso A R).of pre))
      (partialOrderNative A E R) where
  to h := partialTo A E R h.down
  of h := ⟨partialOf A E R h⟩
  of_to h := by cases h; exact congrArg PULift.up (partial_of_to A E R _)
  to_of h := partial_to_of A E R h

def antisymmetryNative (A : Type u) (E : A → A → Type v) (R : A → A → Type w)
    (h : antisymmetricNative A E R) := h
theorem antisymmetry_agrees (A : Type u) (E : A → A → Type v)
    (equ : equivalenceNative A E) (R : A → A → Type w) (h : antisymmetricNative A E R) :
    Rocq.Corelib.Classes.CRelationClasses.antisymmetry
      A E ((EquivalenceIso A E).of equ) R h = antisymmetryNative A E R h := rfl

def flipSymmetricNative (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) :=
  fun x y r => h y x r
theorem flip_Symmetric_agrees (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.flip_Symmetric.{u,w,v} A R h =
      flipSymmetricNative A R h := rfl

def flipTransitiveNative (A : Type u) (R : A → A → Type v) (h : transitiveNative A R) :=
  fun x y z r s => h z y x s r
theorem flip_Transitive_agrees (A : Type u) (R : A → A → Type v) (h : transitiveNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.flip_Transitive.{u,w,v} A R h =
      flipTransitiveNative A R h := rfl

def partialOrderEquivalenceNative (A : Type u) (E R : A → A → Type v)
    (h : partialOrderNative A E R) := h
theorem partial_order_equivalence_agrees (A : Type u) (E R : A → A → Type v)
    (equ : equivalenceNative A E) (pre : preorderNative A R) (h : partialOrderNative A E R) :
    partialTo A E R (Rocq.Corelib.Classes.CRelationClasses.partial_order_equivalence.{u,w,t,v,z}
      A E ((EquivalenceIso A E).of equ) R ((PreOrderIso A R).of pre) (partialOf A E R h)) =
        partialOrderEquivalenceNative A E R h := partial_to_of A E R h


theorem eqProof1 : Rocq.Corelib.Classes.CRelationClasses.eq_equivalence__rocq2lean_obligation_1.statement.{u} :=
  fun _ _ => eqOf rfl
theorem eqProof2 : Rocq.Corelib.Classes.CRelationClasses.eq_equivalence__rocq2lean_obligation_2.statement.{u} :=
  fun _ _ _ h => eqOf (eqTo h).symm
theorem eqProof3 : Rocq.Corelib.Classes.CRelationClasses.eq_equivalence__rocq2lean_obligation_3.statement.{u} :=
  fun _ _ _ _ h k => eqOf ((eqTo h).trans (eqTo k))

def equalityEquivalenceNative (A : Type u) : _root_.Equivalence (@Eq A) :=
  ⟨Eq.refl, Eq.symm, Eq.trans⟩

def equalityEquivalenceIso (A : Type u) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.Equivalence A
      (fun x y => PULift.{1} (Rocq.Corelib.Init.Logic.eq A x y)))
      (_root_.Equivalence (@Eq A)) where
  to h := match h with
    | .Build_Equivalence _ _ refl sym tr =>
      ⟨fun x => eqTo (refl x).down,
       fun h => eqTo (sym _ _ ⟨eqOf h⟩).down,
       fun h k => eqTo (tr _ _ _ ⟨eqOf h⟩ ⟨eqOf k⟩).down⟩
  of h := .Build_Equivalence _ _ (fun x => ⟨eqOf (h.refl x)⟩)
    (fun _ _ k => ⟨eqOf (h.symm (eqTo k.down))⟩)
    (fun _ _ _ k l => ⟨eqOf (h.trans (eqTo k.down) (eqTo l.down))⟩)
  of_to h := by cases h; rfl
  to_of _ := rfl

def eqEquivalenceClosed (A : Type u) :=
  @RocqPending.Corelib.Classes.CRelationClasses.eq_equivalence.{u} eqProof1 eqProof2 eqProof3 A
theorem eq_equivalence_agrees (A : Type u) :
    (equalityEquivalenceIso A).to
      (@RocqPending.Corelib.Classes.CRelationClasses.eq_equivalence.{u} eqProof1 eqProof2 eqProof3 A) =
        equalityEquivalenceNative A := rfl

theorem mechIffTo {P Q : Prop} (h : Rocq.Corelib.Init.Logic.iff P Q) : P ↔ Q :=
  match h with | .conj _ _ f g => ⟨f,g⟩
theorem mechIffOf {P Q : Prop} (h : P ↔ Q) : Rocq.Corelib.Init.Logic.iff P Q :=
  .conj _ _ h.mp h.mpr

theorem iffProof1 : Rocq.Corelib.Classes.CRelationClasses.iff_Reflexive.statement.{u} :=
  fun _ => mechIffOf Iff.rfl
theorem iffProof2 : Rocq.Corelib.Classes.CRelationClasses.iff_Symmetric.statement.{u} :=
  fun _ _ h => mechIffOf (mechIffTo h).symm
theorem iffProof3 : Rocq.Corelib.Classes.CRelationClasses.iff_Transitive.statement.{u} :=
  fun _ _ _ h k => mechIffOf ((mechIffTo h).trans (mechIffTo k))

def iffEquivalenceNative : _root_.Equivalence Iff :=
  ⟨fun _ => Iff.rfl, Iff.symm, Iff.trans⟩

def iffEquivalenceIso :
    Iso (Rocq.Corelib.Classes.CRelationClasses.Equivalence (PULift.{u+1} Prop)
      (fun x y => PULift.{1} (Rocq.Corelib.Init.Logic.iff x.down y.down)))
      (_root_.Equivalence Iff) where
  to h := match h with
    | .Build_Equivalence _ _ refl sym tr =>
      ⟨fun x => mechIffTo (refl ⟨x⟩).down,
       fun h => mechIffTo (sym _ _ ⟨mechIffOf h⟩).down,
       fun h k => mechIffTo (tr _ _ _ ⟨mechIffOf h⟩ ⟨mechIffOf k⟩).down⟩
  of h := .Build_Equivalence _ _ (fun x => ⟨mechIffOf (h.refl x.down)⟩)
    (fun _ _ k => ⟨mechIffOf (h.symm (mechIffTo k.down))⟩)
    (fun _ _ _ k l => ⟨mechIffOf (h.trans (mechIffTo k.down) (mechIffTo l.down))⟩)
  of_to h := by cases h; rfl
  to_of _ := rfl

def iffEquivalenceClosed :=
  @RocqPending.Corelib.Classes.CRelationClasses.iff_equivalence.{u} iffProof1 iffProof2 iffProof3
theorem iff_equivalence_agrees :
    iffEquivalenceIso.to
      (@RocqPending.Corelib.Classes.CRelationClasses.iff_equivalence.{u} iffProof1 iffProof2 iffProof3) =
        iffEquivalenceNative := rfl

end NativeBridge.Incremental.CRelationOrder

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
  for name in ["NativeBridge.Incremental.CRelationOrder.antisymmetryNative", "NativeBridge.Incremental.CRelationOrder.equalityEquivalenceNative", "NativeBridge.Incremental.CRelationOrder.flipSymmetricNative", "NativeBridge.Incremental.CRelationOrder.flipTransitiveNative", "NativeBridge.Incremental.CRelationOrder.iffEquivalenceNative", "NativeBridge.Incremental.CRelationOrder.partialOrderEquivalenceNative", "NativeBridge.Incremental.CRelationOrder.partialOrderNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
