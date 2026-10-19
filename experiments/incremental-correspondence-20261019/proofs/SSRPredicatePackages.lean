import SSRBoolPackaging
set_option autoImplicit false
set_option maxRecDepth 4096
noncomputable section
namespace NativeBridge.Incremental.SSRPredicatePackages
open NativeBridge SSRBoolData
universe u v w
def rebase {A : Type v} (p : nativePredType.{u,v} A) (S : Type w)
    (i : Iso p.fst S) : nativePredType.{w,v} A :=
  ⟨S,fun s => p.snd (i.of s)⟩
def predicates (A : Type u) : nativePredType.{u,u} A := ⟨A → Bool,id⟩
def clone (A : Type v) (U : Type w) (toP : U → A → Bool) : nativePredType.{w,v} A := ⟨U,toP⟩
def predicateIso (A : Type u) : Iso (Rocq.Corelib.ssr.ssrbool.pred A) (A → Bool) :=
  ⟨predTo,predOf,pred_of_to,pred_to_of⟩

theorem boolfun_agrees (A : Type u) :
    rebase (predTypeTo A (Rocq.Corelib.ssr.ssrbool.boolfunPredType A)) (A → Bool) (predicateIso A) =
      predicates A := by
  change (⟨A → Bool,fun p => predTo (predOf p)⟩ : nativePredType A) = ⟨A → Bool,id⟩
  simp only [pred_to_of]
  rfl
theorem pred_agrees (A : Type u) :
    rebase (predTypeTo A (Rocq.Corelib.ssr.ssrbool.predPredType A)) (A → Bool) (predicateIso A) =
      predicates A := by
  change (⟨A → Bool,fun p => predTo (predOf p)⟩ : nativePredType A) = ⟨A → Bool,id⟩
  simp only [pred_to_of]
  rfl
theorem mem_agrees (A : Type u) :
    rebase (predTypeTo A (Rocq.Corelib.ssr.ssrbool.memPredType A)) (A → Bool) (memIso A) =
      predicates A := by
  change (⟨A → Bool,fun p => (memIso A).to ((memIso A).of p)⟩ : nativePredType A) = ⟨A → Bool,id⟩
  simp only [(memIso A).to_of]
  rfl
theorem simpl_agrees (A : Type u) :
    rebase (predTypeTo A (Rocq.Corelib.ssr.ssrbool.simplPredType A)) (A → Bool) (simplPredIso A) =
      predicates A := by
  change (⟨A → Bool,fun p => (simplPredIso A).to ((simplPredIso A).of p)⟩ : nativePredType A) = ⟨A → Bool,id⟩
  simp only [(simplPredIso A).to_of]
  rfl

theorem clone_agrees (A : Type v) (U : Type w) (pT : Rocq.Corelib.ssr.ssrbool.predType.{u,v} A)
    (a : Rocq.Corelib.ssr.ssrbool.pred_sort A pT → U)
    (toP : U → Rocq.Corelib.ssr.ssrbool.pred A)
    (h : Rocq.Corelib.ssr.ssrfun.phant_id (Rocq.Corelib.ssr.ssrbool.predType A)
      (Rocq.Corelib.ssr.ssrbool.predType A)
      (Rocq.Corelib.ssr.ssrbool.predType.PredType A U toP) pT) :
    predTypeTo A (Rocq.Corelib.ssr.ssrbool.clone_pred A U pT a toP h) =
      clone A U (fun x => predTo (toP x)) := rfl

end NativeBridge.Incremental.SSRPredicatePackages

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
  for name in ["NativeBridge.Incremental.SSRPredicatePackages.clone", "NativeBridge.Incremental.SSRPredicatePackages.predicates"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
