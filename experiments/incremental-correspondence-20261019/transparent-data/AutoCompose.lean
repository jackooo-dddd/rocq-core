import Lean
open Lean Meta Elab Command
namespace NativeBridge.AutoCompose

/-- Follow user helpers as well as generated private helpers; do not hide source operations behind an alias. -/
private partial def sourceRefs (n : Name) (seen : IO.Ref NameSet) : MetaM (Array Name) := do
  if (← seen.get).contains n then return #[]
  seen.modify (·.insert n)
  let parts := n.toString.splitOn "."
  if ["Rocq","RocqPending","Rocq2Lean"].any parts.contains then return #[n]
  let ci ← getConstInfo n
  let mut out := #[]
  for e in #[ci.type] ++ (ci.value? true).toArray do
    for c in e.getUsedConstants do out := out ++ (← sourceRefs c seen)
  return out

/-- Generate a native body and its equation using only supplied correspondence theorems. -/
elab "native_compose " name:ident " := " term:term " using " "[" rules:ident,* "]" : command => do
  let declName := (← getCurrNamespace) ++ name.getId
  liftTermElabM do
    let expr ← Term.elabTerm term none
    Term.synthesizeSyntheticMVarsNoPostponing
    let expr ← instantiateMVars expr
    let type ← instantiateMVars (← inferType expr)
    unless !expr.hasMVar && !expr.hasLevelMVar do throwError "Provide a fully instantiated input expression"
    let mut thms : SimpTheorems := {}
    for r in rules.getElems do
      let n ← realizeGlobalConstNoOverloadWithInfo r
      thms ← thms.addConst n
    let ctx ← Simp.mkContext (simpTheorems := #[thms])
    let (result,_) ← simp expr ctx
    let body ← instantiateMVars result.expr
    let seen ← IO.mkRef ({} : NameSet)
    let mut refs := #[]
    for e in #[type,body] do
      for n in e.getUsedConstants do refs := refs ++ (← sourceRefs n seen)
    unless refs.isEmpty do throwError "Composition still contains source symbols: {refs.toList.eraseDups}"
    let proof ← instantiateMVars (← result.getProof' expr)
    for n in proof.getUsedConstants ++ expr.getUsedConstants ++ type.getUsedConstants do
      for ax in (← collectAxioms n) do
        unless ["propext","Quot.sound","Classical.choice"].contains ax.toString do throwError "Unexpected axiom {ax}"
    let levels := (collectLevelParams (collectLevelParams (collectLevelParams (collectLevelParams {} type) body) expr) proof).params.toList
    addAndCompile (.defnDecl {name := declName,levelParams := levels,type := type, value := body, hints := .regular (getMaxHeight (← getEnv) body + 1),safety := .safe}) false
    let rhs := mkConst declName (levels.map Level.param)
    let proofName := declName ++ "correspondence".toName
    addDecl (.thmDecl {name := proofName,levelParams := levels,type := ← mkEq expr rhs,value := proof})
    for ax in (← collectAxioms proofName) do
      unless ["propext","Quot.sound","Classical.choice"].contains ax.toString do throwError "Unexpected axiom {ax}"
    logInfo m!"Generated native definition {declName} and checked equation {proofName}"

end NativeBridge.AutoCompose
