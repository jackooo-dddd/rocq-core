import Interface_ssr_ssrunder
noncomputable section
namespace NativeBridge.Incremental.SSRUnder
universe u
theorem under_agrees (A : Type u) (R : A → A → Prop) :
    Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A R = id R := rfl
theorem over_agrees (A : Type u) (R : A → A → Prop) :
    Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A R = id R := rfl
def underEquation : Prop := ∀ (A : Type u) (R : A → A → Prop), id R = R
def underFromRelation : Prop := ∀ (A : Type u) (R : A → A → Prop) (x y : A), R x y → R x y
def overEquation : Prop := ∀ (A : Type u) (R : A → A → Prop) (x y : A), R x y = R x y
def reflexiveDone : Prop := ∀ (A : Type u) (R : A → A → Prop), Std.Refl R → ∀ x, R x x
theorem under_eq_proof : Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement.{u} :=
  fun _ _ => eqOf rfl
theorem under_from_proof : Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement.{u} :=
  fun _ _ _ _ h => h
theorem over_eq_proof : Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement.{u} :=
  fun _ _ _ _ => eqOf rfl
theorem over_done_proof : Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement.{u} :=
  fun _ _ h => h
theorem under_done_proof : Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement.{u} :=
  fun _ _ h => h
theorem under_eq_correspondence : Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement.{u} ↔ underEquation.{u} :=
  ⟨fun _ _ _ => rfl, fun _ => under_eq_proof⟩
theorem under_from_correspondence : Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement.{u} ↔ underFromRelation.{u} :=
  ⟨fun _ _ _ _ _ h => h, fun _ => under_from_proof⟩
theorem over_eq_correspondence : Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement.{u} ↔ overEquation.{u} :=
  ⟨fun _ _ _ _ _ => rfl, fun _ => over_eq_proof⟩
theorem over_done_correspondence : Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement.{u} ↔ reflexiveDone.{u} :=
  ⟨fun _ _ _ h => h.refl, fun _ => over_done_proof⟩
theorem under_done_correspondence : Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement.{u} ↔ reflexiveDone.{u} :=
  ⟨fun _ _ _ h => h.refl, fun _ => under_done_proof⟩
end NativeBridge.Incremental.SSRUnder

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
  for name in ["NativeBridge.Incremental.SSRUnder.overEquation", "NativeBridge.Incremental.SSRUnder.reflexiveDone", "NativeBridge.Incremental.SSRUnder.underEquation", "NativeBridge.Incremental.SSRUnder.underFromRelation", "id"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
