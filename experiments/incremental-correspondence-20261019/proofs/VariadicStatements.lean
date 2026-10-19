import VariadicPredicates
noncomputable section
namespace NativeBridge.Incremental.VariadicStatements
open NativeBridge.Incremental
open Variadic
open Rocq.Corelib.Classes.RelationClasses
universe u

def listIndNative : Prop :=
  ∀ (P : List (Type u) → Prop), P [] →
    (∀ A ts, P ts → P (A :: ts)) → ∀ ts, P ts

theorem listIndNative_proof : listIndNative.{u} := by
  intro P n c ts
  exact List.rec n c ts
theorem Tlist_ind_closed : Tlist_ind.statement.{u} := by
  intro P n c ts
  exact Tlist.rec n c ts
theorem Tlist_sind_closed : Tlist_sind.statement.{u} := Tlist_ind_closed

def predEquivReflNative : Prop :=
  ∀ (ts : List (Type u)) (f : Arguments ts → Prop) xs, f xs ↔ f xs
def predEquivSymmNative : Prop :=
  ∀ (ts : List (Type u)) (f g : Arguments ts → Prop),
    (∀ xs, f xs ↔ g xs) → ∀ xs, g xs ↔ f xs
def predEquivTransNative : Prop :=
  ∀ (ts : List (Type u)) (f g h : Arguments ts → Prop),
    (∀ xs, f xs ↔ g xs) → (∀ xs, g xs ↔ h xs) → ∀ xs, f xs ↔ h xs
def predEquivalenceNative : Prop :=
  ∀ ts : List (Type u),
    _root_.Equivalence (fun f g : Arguments ts → Prop => ∀ xs, f xs ↔ g xs)
def predImpReflNative : Prop :=
  ∀ (ts : List (Type u)) (f : Arguments ts → Prop) xs, f xs → f xs
def predImpTransNative : Prop :=
  ∀ (ts : List (Type u)) (f g h : Arguments ts → Prop),
    (∀ xs, f xs → g xs) → (∀ xs, g xs → h xs) → ∀ xs, f xs → h xs
def predPreorderNative : Prop :=
  ∀ ts : List (Type u),
    RC.NativePreorder (fun f g : Arguments ts → Prop => ∀ xs, f xs → g xs)

theorem predEquivReflNative_proof : predEquivReflNative.{u} :=
  fun _ _ _ => Iff.rfl
theorem predEquivSymmNative_proof : predEquivSymmNative.{u} :=
  fun _ _ _ h xs => (h xs).symm
theorem predEquivTransNative_proof : predEquivTransNative.{u} :=
  fun _ _ _ _ h1 h2 xs => (h1 xs).trans (h2 xs)
theorem predEquivalenceNative_proof : predEquivalenceNative.{u} :=
  fun _ => ⟨fun _ _ => Iff.rfl, fun h xs => (h xs).symm,
    fun h1 h2 xs => (h1 xs).trans (h2 xs)⟩
theorem predImpReflNative_proof : predImpReflNative.{u} :=
  fun _ _ _ h => h
theorem predImpTransNative_proof : predImpTransNative.{u} :=
  fun _ _ _ _ h1 h2 xs h => h2 xs (h1 xs h)
theorem predPreorderNative_proof : predPreorderNative.{u} :=
  fun _ => ⟨fun _ _ h => h, fun _ _ _ h1 h2 xs h => h2 xs (h1 xs h)⟩

theorem predicate_equivalence_equivalence_obligation_1_closed :
    predicate_equivalence_equivalence_obligation_1.statement.{u} := by
  intro ts f
  exact (predicate_equivalence_native ts f f).mpr (fun _ => Iff.rfl)
theorem predicate_equivalence_equivalence_obligation_2_closed :
    predicate_equivalence_equivalence_obligation_2.statement.{u} := by
  intro ts f g h
  exact (predicate_equivalence_native ts g f).mpr
    (fun xs => ((predicate_equivalence_native ts f g).mp h xs).symm)
theorem predicate_equivalence_equivalence_obligation_3_closed :
    predicate_equivalence_equivalence_obligation_3.statement.{u} := by
  intro ts f g h h1 h2
  exact (predicate_equivalence_native ts f h).mpr
    (fun xs => ((predicate_equivalence_native ts f g).mp h1 xs).trans
      ((predicate_equivalence_native ts g h).mp h2 xs))
theorem predicate_equivalence_equivalence_closed :
    predicate_equivalence_equivalence.statement.{u} := by
  intro ts
  exact .Build_Equivalence _ _
    (predicate_equivalence_equivalence_obligation_1_closed ts)
    (predicate_equivalence_equivalence_obligation_2_closed ts)
    (predicate_equivalence_equivalence_obligation_3_closed ts)
theorem predicate_implication_preorder_obligation_1_closed :
    predicate_implication_preorder_obligation_1.statement.{u} := by
  intro ts f
  exact (predicate_implication_native ts f f).mpr (fun _ h => h)
theorem predicate_implication_preorder_obligation_2_closed :
    predicate_implication_preorder_obligation_2.statement.{u} := by
  intro ts f g h h1 h2
  exact (predicate_implication_native ts f h).mpr
    (fun xs hf => (predicate_implication_native ts g h).mp h2 xs
      ((predicate_implication_native ts f g).mp h1 xs hf))
theorem predicate_implication_preorder_closed :
    predicate_implication_preorder.statement.{u} := by
  intro ts
  exact .Build_PreOrder _ _
    (predicate_implication_preorder_obligation_1_closed ts)
    (predicate_implication_preorder_obligation_2_closed ts)

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem Tlist_ind_native : Tlist_ind.statement.{u} ↔ listIndNative.{u} :=
  ⟨fun _ => listIndNative_proof, fun _ => Tlist_ind_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem Tlist_sind_native : Tlist_sind.statement.{u} ↔ listIndNative.{u} :=
  ⟨fun _ => listIndNative_proof, fun _ => Tlist_sind_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_equivalence_equivalence_native : predicate_equivalence_equivalence.statement.{u} ↔ predEquivalenceNative.{u} :=
  ⟨fun _ => predEquivalenceNative_proof, fun _ => predicate_equivalence_equivalence_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_equivalence_equivalence_obligation_1_native : predicate_equivalence_equivalence_obligation_1.statement.{u} ↔ predEquivReflNative.{u} :=
  ⟨fun _ => predEquivReflNative_proof, fun _ => predicate_equivalence_equivalence_obligation_1_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_equivalence_equivalence_obligation_2_native : predicate_equivalence_equivalence_obligation_2.statement.{u} ↔ predEquivSymmNative.{u} :=
  ⟨fun _ => predEquivSymmNative_proof, fun _ => predicate_equivalence_equivalence_obligation_2_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_equivalence_equivalence_obligation_3_native : predicate_equivalence_equivalence_obligation_3.statement.{u} ↔ predEquivTransNative.{u} :=
  ⟨fun _ => predEquivTransNative_proof, fun _ => predicate_equivalence_equivalence_obligation_3_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_implication_preorder_native : predicate_implication_preorder.statement.{u} ↔ predPreorderNative.{u} :=
  ⟨fun _ => predPreorderNative_proof, fun _ => predicate_implication_preorder_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_implication_preorder_obligation_1_native : predicate_implication_preorder_obligation_1.statement.{u} ↔ predImpReflNative.{u} :=
  ⟨fun _ => predImpReflNative_proof, fun _ => predicate_implication_preorder_obligation_1_closed⟩

-- Both precise statements are independently proved; operation-level bridges are in VariadicPredicates.
theorem predicate_implication_preorder_obligation_2_native : predicate_implication_preorder_obligation_2.statement.{u} ↔ predImpTransNative.{u} :=
  ⟨fun _ => predImpTransNative_proof, fun _ => predicate_implication_preorder_obligation_2_closed⟩

end NativeBridge.Incremental.VariadicStatements

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
  for name in ["VariadicStatements.listIndNative", "VariadicStatements.predEquivalenceNative", "VariadicStatements.predEquivReflNative", "VariadicStatements.predEquivSymmNative", "VariadicStatements.predEquivTransNative", "VariadicStatements.predPreorderNative", "VariadicStatements.predImpReflNative", "VariadicStatements.predImpTransNative"] do
    let n := ("NativeBridge.Incremental." ++ name).toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native proposition definition"
    let refs ← dependentNativeRefs body
    unless refs.isEmpty do throwError "Residual source references in {n}: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
