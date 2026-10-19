import Auto_Init_Tactics
noncomputable section
namespace NativeBridge.Incremental.DecisionTactics
def leftSpec : Prop := ∀ (C : Prop) (d : Decidable C), C →
  ∀ P : Decidable C → Prop, (∀ h : C, P (.isTrue h)) → P d
def rightSpec : Prop := ∀ (C : Prop) (d : Decidable C), ¬C →
  ∀ P : Decidable C → Prop, (∀ h : ¬C, P (.isFalse h)) → P d
theorem leftSpec_native : leftSpec := by
  intro C d hc P hp
  cases d with
  | isTrue h => exact hp h
  | isFalse hn => exact False.elim (hn hc)
theorem rightSpec_native : rightSpec := by
  intro C d hn P hp
  cases d with
  | isTrue h => exact False.elim (hn h)
  | isFalse h => exact hp h
theorem leftSpec_proof : Rocq.Corelib.Init.Tactics.decide_left.statement := by
  intro C d hc P hp
  cases d with
  | left h => exact hp h
  | right hn => cases hn hc
theorem rightSpec_proof : Rocq.Corelib.Init.Tactics.decide_right.statement := by
  intro C d hn P hp
  cases d with
  | left h => cases hn h
  | right h => exact hp h
theorem leftSpec_correspondence : Rocq.Corelib.Init.Tactics.decide_left.statement ↔ leftSpec :=
  ⟨fun _ => leftSpec_native,fun _ => @leftSpec_proof⟩
theorem rightSpec_correspondence : Rocq.Corelib.Init.Tactics.decide_right.statement ↔ rightSpec :=
  ⟨fun _ => rightSpec_native,fun _ => @rightSpec_proof⟩
end NativeBridge.Incremental.DecisionTactics

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
  for name in ["NativeBridge.Incremental.DecisionTactics.leftSpec", "NativeBridge.Incremental.DecisionTactics.rightSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
