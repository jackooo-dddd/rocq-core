import Interface_Classes_SetoidTactics
noncomputable section
namespace NativeBridge.Incremental.DefaultRelationMarker
universe u
def nativeMarker (A : Type u) (_R : A → A → Prop) : Prop := True
def nativeRelation (A : Type u) (R : A → A → Prop) (_ : True) := R
def markerIso (A : Type u) (R : A → A → Prop) :
    Iso (Rocq.Corelib.Classes.SetoidTactics.DefaultRelation A R) (nativeMarker A R) :=
  ⟨fun _ => True.intro, fun _ => .Build_DefaultRelation A R, fun _ => rfl, fun _ => rfl⟩
theorem relation_agrees (A : Type u) (R : A → A → Prop)
    (h : Rocq.Corelib.Classes.SetoidTactics.DefaultRelation A R) :
    Rocq.Corelib.Classes.SetoidTactics.default_relation A R h = nativeRelation A R ((markerIso A R).to h) := rfl
def equivalenceSpec : Prop := ∀ (A : Type u) (R : A → A → Prop), Equivalence R → nativeMarker A R
theorem equivalenceSpec_native : equivalenceSpec.{u} := fun _ _ _ => True.intro
theorem equivalenceSpec_proof : Rocq.Corelib.Classes.SetoidTactics.equivalence_default.statement.{u} :=
  fun A R _ => .Build_DefaultRelation A R
theorem equivalenceSpec_correspondence :
    Rocq.Corelib.Classes.SetoidTactics.equivalence_default.statement.{u} ↔ equivalenceSpec.{u} :=
  ⟨fun _ => equivalenceSpec_native,fun _ => @equivalenceSpec_proof.{u}⟩
end NativeBridge.Incremental.DefaultRelationMarker

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
  for name in ["NativeBridge.Incremental.DefaultRelationMarker.equivalenceSpec", "NativeBridge.Incremental.DefaultRelationMarker.nativeMarker", "NativeBridge.Incremental.DefaultRelationMarker.nativeRelation"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
