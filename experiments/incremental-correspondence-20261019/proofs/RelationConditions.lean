import RelationClasses
noncomputable section
namespace NativeBridge.Incremental.RelationConditions
open NativeBridge.Incremental
open Rocq.Corelib.Classes.RelationClasses
universe u

theorem inverse_preorder_obligation :
    PartialOrder_inverse__rocq2lean_obligation_1.statement.{u} := by
  intro A E he R hp _
  cases hp with
  | Build_PreOrder hr ht =>
    exact .Build_PreOrder A _ hr (fun x y z hxy hyz => ht z y x hyz hxy)

theorem subrelation_equivalence_obligation :
    subrelation_partial_order__rocq2lean_obligation_1.statement.{u} := by
  intro A
  refine .Build_Equivalence _ _ ?_ ?_ ?_
  · intro R x y
    exact .conj _ _ (fun h => h) (fun h => h)
  · intro R S h x y
    cases h x y with | conj h1 h2 => exact .conj _ _ h2 h1
  · intro R S T h1 h2 x y
    cases h1 x y with
    | conj hRS hSR =>
      cases h2 x y with
      | conj hST hTS => exact .conj _ _ (fun h => hST (hRS h)) (fun h => hSR (hTS h))

theorem subrelation_preorder_obligation :
    subrelation_partial_order__rocq2lean_obligation_2.statement.{u} := by
  intro A
  exact .Build_PreOrder _ _ (fun _ _ _ h => h)
    (fun _ _ _ h1 h2 x y h => h2 x y (h1 x y h))

def inversePartialOrderNative : Prop :=
  ∀ (A : Type u) (E : A → A → Prop), _root_.Equivalence E →
    ∀ (R : A → A → Prop), RC.NativePreorder R →
      (∀ x y, E x y ↔ R x y ∧ R y x) →
      ∀ x y, E x y ↔ R y x ∧ R x y

theorem PartialOrder_inverse_native :
    (@RocqPending.Corelib.Classes.RelationClasses.PartialOrder_inverse.statement.{u}
      inverse_preorder_obligation) ↔ inversePartialOrderNative.{u} := by
  unfold RocqPending.Corelib.Classes.RelationClasses.PartialOrder_inverse.statement
    inversePartialOrderNative PartialOrder
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    RC.equivalence_native, RC.preorder_native, RC.relation_equivalence_native,
    RC.conjunction_native, Rocq.Corelib.Program.Basics.flip]

theorem PartialOrder_inverse_closed :
    @RocqPending.Corelib.Classes.RelationClasses.PartialOrder_inverse.statement.{u}
      inverse_preorder_obligation :=
  PartialOrder_inverse_native.mpr (fun _ _ _ _ _ h x y => (h x y).trans and_comm)

def subrelationPartialOrderNative : Prop :=
  ∀ (A : Type u) (R S : A → A → Prop),
    (∀ x y, R x y ↔ S x y) ↔ (Subrelation R S ∧ Subrelation S R)

theorem subrelation_partial_order_native :
    (@RocqPending.Corelib.Classes.RelationClasses.subrelation_partial_order.statement.{u}
      subrelation_equivalence_obligation subrelation_preorder_obligation) ↔
      subrelationPartialOrderNative.{u} := by
  unfold RocqPending.Corelib.Classes.RelationClasses.subrelation_partial_order.statement
    subrelationPartialOrderNative PartialOrder
  simp only [Rocq.Corelib.Relations.Relation_Definitions.relation,
    RC.relation_equivalence_native, RC.conjunction_function_native,
    RC.subrelation_function_native, RC.flip_function_native]

theorem subrelation_partial_order_closed :
    @RocqPending.Corelib.Classes.RelationClasses.subrelation_partial_order.statement.{u}
      subrelation_equivalence_obligation subrelation_preorder_obligation :=
  subrelation_partial_order_native.mpr (fun _ _ _ =>
    ⟨fun h => ⟨fun {x y} => (h x y).mp, fun {x y} => (h x y).mpr⟩,
      fun h x y => ⟨@h.1 x y,@h.2 x y⟩⟩)

end NativeBridge.Incremental.RelationConditions

open Lean Meta in
private partial def dependentNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      if let some body := (← getConstInfo n).value? then
        found := found ++ (← dependentNativeRefs body seen)
  return found

open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["RelationConditions.inversePartialOrderNative", "RelationConditions.subrelationPartialOrderNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
