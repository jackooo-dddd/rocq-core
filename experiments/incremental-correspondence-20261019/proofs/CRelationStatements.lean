import CRelationData
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.CRelationStatements
open NativeBridge CRelationData
universe u v w t z

abbrev strictOrderNative (A : Type u) (R : A → A → Type v) :=
  PLift (irreflexiveNative A R) × transitiveNative A R
def strictOrderIso (A : Type u) (R : A → A → Type v) :
    Iso (Rocq.Corelib.Classes.CRelationClasses.StrictOrder A R) (strictOrderNative A R) where
  to x := match x with | .Build_StrictOrder _ _ irr tr => ⟨⟨(irreflexiveIso A R).to irr⟩, tr⟩
  of x := .Build_StrictOrder A R ((irreflexiveIso A R).of x.1.down) x.2
  of_to x := by
    cases x with
    | Build_StrictOrder irr tr =>
      change Rocq.Corelib.Classes.CRelationClasses.StrictOrder.Build_StrictOrder A R
        ((irreflexiveIso A R).of ((irreflexiveIso A R).to irr)) tr = _
      rw [(irreflexiveIso A R).of_to]
  to_of x := by
    cases x with
    | mk irr tr => cases irr; rfl

def strictTransitiveNative (A : Type u) (R : A → A → Type v) (h : strictOrderNative A R) := h.2
theorem strictTransitive_agrees (A : Type u) (R : A → A → Type v) (h : strictOrderNative A R) :
    Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Transitive A R ((strictOrderIso A R).of h) =
      strictTransitiveNative A R h := rfl

def markerNative : Prop := True
theorem markerNative_proof : markerNative := by trivial
theorem RewriteRelation_instance_0_source : Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_0.statement.{u} := by exact .Build_RewriteRelation _ _
theorem RewriteRelation_instance_0_agrees : Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_0.statement.{u} ↔ markerNative :=
  ⟨fun _ => markerNative_proof, fun _ => RewriteRelation_instance_0_source⟩

theorem RewriteRelation_instance_1_source : Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_1.statement.{u} := by exact .Build_RewriteRelation _ _
theorem RewriteRelation_instance_1_agrees : Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_1.statement.{u} ↔ markerNative :=
  ⟨fun _ => markerNative_proof, fun _ => RewriteRelation_instance_1_source⟩

def rewriteRelationsNative : Prop := ∀ (A : Type u), True
theorem rewriteRelationsNative_proof : rewriteRelationsNative := by intro A; trivial
theorem RewriteRelation_instance_2_source : Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_2.statement.{u,v,w,t} := by intro A; exact .Build_RewriteRelation _ _
theorem RewriteRelation_instance_2_agrees : Rocq.Corelib.Classes.CRelationClasses.RewriteRelation_instance_2.statement.{u,v,w,t} ↔ rewriteRelationsNative.{u} :=
  ⟨fun _ => rewriteRelationsNative_proof.{u}, fun _ => RewriteRelation_instance_2_source⟩

def strictAsymmetricNative : Prop := ∀ (A : Type u) (R : A → A → Type w) (h : strictOrderNative A R), asymmetricNative A R
theorem strictAsymmetricNative_proof : strictAsymmetricNative := by intro A R h x y a b; exact h.1.down x (h.2 x y x a b)
theorem StrictOrder_Asymmetric_source : Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Asymmetric.statement.{u,v,w} := by intro A R h x y a b; cases h with | Build_StrictOrder irr tr => exact (irr x).down (tr x y x a b)
theorem StrictOrder_Asymmetric_agrees : Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Asymmetric.statement.{u,v,w} ↔ strictAsymmetricNative.{u,w} :=
  ⟨fun _ => strictAsymmetricNative_proof.{u,w}, fun _ => StrictOrder_Asymmetric_source⟩

def strictIrreflexiveNative : Prop := ∀ (A : Type u) (R : A → A → Type v) (h : strictOrderNative A R), irreflexiveNative A R
theorem strictIrreflexiveNative_proof : strictIrreflexiveNative := by intro A R h; exact h.1.down
theorem StrictOrder_Irreflexive_source : Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Irreflexive.statement.{u,v} := by intro A R h x a; cases h with | Build_StrictOrder irr tr => exact (irr x).down a
theorem StrictOrder_Irreflexive_agrees : Rocq.Corelib.Classes.CRelationClasses.StrictOrder_Irreflexive.statement.{u,v} ↔ strictIrreflexiveNative.{u,v} :=
  ⟨fun _ => strictIrreflexiveNative_proof.{u,v}, fun _ => StrictOrder_Irreflexive_source⟩

def asymmetryNative : Prop := ∀ (A : Type u) (R : A → A → Type w) (h : asymmetricNative A R), asymmetricNative A R
theorem asymmetryNative_proof : asymmetryNative := by intro A R h; exact h
theorem asymmetry_source : Rocq.Corelib.Classes.CRelationClasses.asymmetry.statement.{u,v,w} := by intro A R h x y a b; exact (h x y a).down b
theorem asymmetry_agrees : Rocq.Corelib.Classes.CRelationClasses.asymmetry.statement.{u,v,w} ↔ asymmetryNative.{u,w} :=
  ⟨fun _ => asymmetryNative_proof.{u,w}, fun _ => asymmetry_source⟩

def complementIrreflexiveNative : Prop := ∀ (A : Type u) (R : A → A → Type v) (h : reflexiveNative A R) (x : A), (R x x → False) → False
theorem complementIrreflexiveNative_proof : complementIrreflexiveNative := by intro A R h x n; exact n (h x)
theorem complement_Irreflexive_source : Rocq.Corelib.Classes.CRelationClasses.complement_Irreflexive.statement.{u,v} := by intro A R h x n; exact n.down (h x)
theorem complement_Irreflexive_agrees : Rocq.Corelib.Classes.CRelationClasses.complement_Irreflexive.statement.{u,v} ↔ complementIrreflexiveNative.{u,v} :=
  ⟨fun _ => complementIrreflexiveNative_proof.{u,v}, fun _ => complement_Irreflexive_source⟩

def complementSymmetricNative : Prop := ∀ (A : Type u) (R : A → A → Type v) (h : symmetricNative A R) (x y : A), (R x y → False) → R y x → False
theorem complementSymmetricNative_proof : complementSymmetricNative := by intro A R h x y n a; exact n (h y x a)
theorem complement_Symmetric_source : Rocq.Corelib.Classes.CRelationClasses.complement_Symmetric.statement.{u,v} := by intro A R h x y n a; exact n.down (h y x a)
theorem complement_Symmetric_agrees : Rocq.Corelib.Classes.CRelationClasses.complement_Symmetric.statement.{u,v} ↔ complementSymmetricNative.{u,v} :=
  ⟨fun _ => complementSymmetricNative_proof.{u,v}, fun _ => complement_Symmetric_source⟩

def equivalenceRewriteNative : Prop := ∀ (A : Type u) (R : A → A → Type v) (h : equivalenceNative A R), True
theorem equivalenceRewriteNative_proof : equivalenceRewriteNative := by intro A R h; trivial
theorem equivalence_rewrite_crelation_source : Rocq.Corelib.Classes.CRelationClasses.equivalence_rewrite_crelation.statement.{u,v} := by intro A R h; exact .Build_RewriteRelation A R
theorem equivalence_rewrite_crelation_agrees : Rocq.Corelib.Classes.CRelationClasses.equivalence_rewrite_crelation.statement.{u,v} ↔ equivalenceRewriteNative.{u,v} :=
  ⟨fun _ => equivalenceRewriteNative_proof.{u,v}, fun _ => equivalence_rewrite_crelation_source⟩

def flipAsymmetricNative : Prop := ∀ (A : Type u) (R : A → A → Type z), asymmetricNative A R → asymmetricNative A (fun x y => R y x)
theorem flipAsymmetricNative_proof : flipAsymmetricNative := by intro A R h x y a b; exact h y x a b
theorem flip_Asymmetric_source : Rocq.Corelib.Classes.CRelationClasses.flip_Asymmetric.statement.{u,v,w,t,z} := by intro A R h x y a b; exact (h y x a).down b
theorem flip_Asymmetric_agrees : Rocq.Corelib.Classes.CRelationClasses.flip_Asymmetric.statement.{u,v,w,t,z} ↔ flipAsymmetricNative.{u,z} :=
  ⟨fun _ => flipAsymmetricNative_proof.{u,z}, fun _ => flip_Asymmetric_source⟩

def implReflexiveNative : Prop := ∀ P : Prop, P → P
theorem implReflexiveNative_proof : implReflexiveNative := by intro P h; exact h
theorem impl_Reflexive_source : Rocq.Corelib.Classes.CRelationClasses.impl_Reflexive.statement.{u} := by intro P h; exact h
theorem impl_Reflexive_agrees : Rocq.Corelib.Classes.CRelationClasses.impl_Reflexive.statement.{u} ↔ implReflexiveNative :=
  ⟨fun _ => implReflexiveNative_proof, fun _ => impl_Reflexive_source⟩

theorem impl_Reflexive_obligation_1_source : Rocq.Corelib.Classes.CRelationClasses.impl_Reflexive_obligation_1.statement := by intro P h; exact h
theorem impl_Reflexive_obligation_1_agrees : Rocq.Corelib.Classes.CRelationClasses.impl_Reflexive_obligation_1.statement ↔ implReflexiveNative :=
  ⟨fun _ => implReflexiveNative_proof, fun _ => impl_Reflexive_obligation_1_source⟩

def implTransitiveNative : Prop := ∀ P Q R : Prop, (P → Q) → (Q → R) → P → R
theorem implTransitiveNative_proof : implTransitiveNative := by intro P Q R f g h; exact g (f h)
theorem impl_Transitive_source : Rocq.Corelib.Classes.CRelationClasses.impl_Transitive.statement.{u} := by intro P Q R f g h; exact g (f h)
theorem impl_Transitive_agrees : Rocq.Corelib.Classes.CRelationClasses.impl_Transitive.statement.{u} ↔ implTransitiveNative :=
  ⟨fun _ => implTransitiveNative_proof, fun _ => impl_Transitive_source⟩

theorem impl_Transitive_obligation_1_source : Rocq.Corelib.Classes.CRelationClasses.impl_Transitive_obligation_1.statement := by intro P Q R f g h; exact g (f h)
theorem impl_Transitive_obligation_1_agrees : Rocq.Corelib.Classes.CRelationClasses.impl_Transitive_obligation_1.statement ↔ implTransitiveNative :=
  ⟨fun _ => implTransitiveNative_proof, fun _ => impl_Transitive_obligation_1_source⟩

def irreflexivityNative : Prop := ∀ (A : Type u) (R : A → A → Type v) (h : irreflexiveNative A R), irreflexiveNative A R
theorem irreflexivityNative_proof : irreflexivityNative := by intro A R h; exact h
theorem irreflexivity_source : Rocq.Corelib.Classes.CRelationClasses.irreflexivity.statement.{u,v} := by intro A R h x a; exact (h x).down a
theorem irreflexivity_agrees : Rocq.Corelib.Classes.CRelationClasses.irreflexivity.statement.{u,v} ↔ irreflexivityNative.{u,v} :=
  ⟨fun _ => irreflexivityNative_proof.{u,v}, fun _ => irreflexivity_source⟩

end NativeBridge.Incremental.CRelationStatements

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
  for name in ["NativeBridge.Incremental.CRelationStatements.asymmetryNative", "NativeBridge.Incremental.CRelationStatements.complementIrreflexiveNative", "NativeBridge.Incremental.CRelationStatements.complementSymmetricNative", "NativeBridge.Incremental.CRelationStatements.equivalenceRewriteNative", "NativeBridge.Incremental.CRelationStatements.flipAsymmetricNative", "NativeBridge.Incremental.CRelationStatements.implReflexiveNative", "NativeBridge.Incremental.CRelationStatements.implTransitiveNative", "NativeBridge.Incremental.CRelationStatements.irreflexivityNative", "NativeBridge.Incremental.CRelationStatements.markerNative", "NativeBridge.Incremental.CRelationStatements.rewriteRelationsNative", "NativeBridge.Incremental.CRelationStatements.strictAsymmetricNative", "NativeBridge.Incremental.CRelationStatements.strictIrreflexiveNative", "NativeBridge.Incremental.CRelationStatements.strictOrderNative", "NativeBridge.Incremental.CRelationStatements.strictTransitiveNative"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
