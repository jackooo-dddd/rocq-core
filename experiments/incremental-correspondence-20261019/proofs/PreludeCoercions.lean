import Interface_Init_Prelude
noncomputable section
namespace NativeBridge.Incremental.PreludeCoercions
universe u v
def identityType (A : Type u) : Type u := A
def constantValue {A : Type u} {B : Type v} (a : A) (_ : B) : A := a
def sourceIso (A : Type u) : Iso (Rocq.Corelib.Init.Prelude.ReverseCoercionSource A) (identityType A) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
def targetIso (A : Type u) : Iso (Rocq.Corelib.Init.Prelude.ReverseCoercionTarget A) (identityType A) :=
  ⟨id,id,fun _ => rfl,fun _ => rfl⟩
theorem reverseCoercion_agrees (A : Type u) (B : Type v) (a : A) (b : B) :
  Rocq.Corelib.Init.Prelude.reverse_coercion A B a b = constantValue a b := rfl
end NativeBridge.Incremental.PreludeCoercions

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
  for name in ["NativeBridge.Incremental.PreludeCoercions.constantValue", "NativeBridge.Incremental.PreludeCoercions.identityType"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
