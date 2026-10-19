import Interface_ssr_ssrclasses
noncomputable section
namespace NativeBridge.Incremental.SSRClasses
universe u
def nativeReflexive {A : Sort u} (R : A → A → Prop) : Prop := Std.Refl R
theorem reflexive_agrees (A : Sort u) (R : A → A → Prop) :
    Rocq.Corelib.ssr.ssrclasses.Reflexive A R ↔ nativeReflexive R :=
  ⟨fun h => ⟨h⟩, fun h => h.refl⟩
def eqReflexive : Prop := ∀ A : Sort u, Std.Refl (@Eq A)
def iffReflexive : Prop := Std.Refl Iff
def reflexivityStatement : Prop :=
  ∀ (A : Sort u) (R : A → A → Prop), Std.Refl R → ∀ x, R x x
theorem eq_proof : Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement.{u} := fun _A _x => eqOf rfl
theorem iff_proof : Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement := by
  intro P
  exact Rocq.Corelib.Init.Logic.and.conj _ _ (fun h => h) (fun h => h)
theorem reflexivity_proof : Rocq.Corelib.ssr.ssrclasses.reflexivity.statement.{u} := fun _ _ h => h
theorem eq_correspondence : Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement.{u} ↔ eqReflexive.{u} :=
  ⟨fun _ _ => ⟨fun _ => rfl⟩, fun _ => eq_proof⟩
theorem iff_correspondence : Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement ↔ iffReflexive :=
  ⟨fun _ => ⟨fun _ => Iff.rfl⟩, fun _ => iff_proof⟩
theorem reflexivity_correspondence : Rocq.Corelib.ssr.ssrclasses.reflexivity.statement.{u} ↔ reflexivityStatement.{u} :=
  ⟨fun _ _ _ h => h.refl, fun _ => reflexivity_proof⟩
end NativeBridge.Incremental.SSRClasses

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
  for name in ["NativeBridge.Incremental.SSRClasses.eqReflexive", "NativeBridge.Incremental.SSRClasses.iffReflexive", "NativeBridge.Incremental.SSRClasses.nativeReflexive", "NativeBridge.Incremental.SSRClasses.reflexivityStatement"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
