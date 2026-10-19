import Auto_ssr_ssrsetoid
noncomputable section
namespace NativeBridge.Incremental.SSRSetoidCompatibility
universe u
def reflexivitySpec : Prop := ∀ (A : Type u) (R : A → A → Prop),
  (∀ x, R x x) → ∀ x, R x x
theorem reflexivitySpec_native : reflexivitySpec.{u} := fun _ _ h => h
theorem reflexivitySpec_proof : Rocq.Corelib.ssr.ssrsetoid.compat_Reflexive.statement.{u} := fun _ _ h => h
theorem reflexivitySpec_correspondence :
    Rocq.Corelib.ssr.ssrsetoid.compat_Reflexive.statement.{u} ↔ reflexivitySpec.{u} :=
  ⟨fun _ => reflexivitySpec_native, fun _ => @reflexivitySpec_proof.{u}⟩
end NativeBridge.Incremental.SSRSetoidCompatibility

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
  for name in ["NativeBridge.Incremental.SSRSetoidCompatibility.reflexivitySpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
