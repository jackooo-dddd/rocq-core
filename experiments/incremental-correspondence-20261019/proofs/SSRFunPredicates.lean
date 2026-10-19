import SSRFunNormalization
open Lean Meta Elab Command
private partial def sourceRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
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
   if let some v := ci.value? then found := found ++ (← sourceRefs v seen)
 return found

syntax (name := ssrPredicate) "#ssr_predicate " ident : command
@[command_elab ssrPredicate] def elabSSRPredicate : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let .defnInfo di ← getConstInfo sourceName | throwError "Expected transparent predicate"
  let ls := di.levelParams.map Level.param
  let nativeName := ("NativeBridge.Incremental.SSRFunPredicates." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.SSRFunPredicates." ++ sourceName.toString ++ ".correspondence").toName
  let mut rules : SimpTheorems := {}
  for n in [`NativeBridge.eq_correspondence,
      `NativeBridge.Incremental.SSRFunNormalization.quality_prod,
      `NativeBridge.Incremental.ssr_cancel_agrees,
      `NativeBridge.Incremental.ssr_injective_agrees,
      `NativeBridge.Incremental.ssr_left_id_agrees,
      `NativeBridge.Incremental.ssr_eqfun_agrees,
      `NativeBridge.Incremental.ssr_comp_agrees] do
    rules ← rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (native, proof) ← forallTelescope di.type fun xs result => do
    unless result == .sort .zero do throwError "Not a predicate ending in Prop"
    let sourceBody := (mkAppN di.value xs).headBeta
    let (r, _) ← Meta.simp sourceBody ctx
    let proof ← mkAppM `Iff.of_eq #[← r.getProof' sourceBody]
    return (← mkLambdaFVars xs r.expr, ← mkLambdaFVars xs proof)
  let remaining := (← sourceRefs native) ++ (← sourceRefs (← inferType native))
  unless remaining.isEmpty do throwError "Residual source references: {remaining}"
  addDecl (.defnDecl {name := nativeName, levelParams := di.levelParams, type := di.type, value := native, hints := .abbrev, safety := .safe})
  let ty ← forallTelescope di.type fun xs _ =>
    mkForallFVars xs (mkApp2 (mkConst `Iff) (mkAppN (mkConst sourceName ls) xs) (mkAppN (mkConst nativeName ls) xs))
  addDecl (.thmDecl {name := certName, levelParams := di.levelParams, type := ty, value := proof})
  let text ← ppExpr native
  logInfo m!"NATIVE_PREDICATE {(Json.mkObj [
    ("source_target",.str sourceName.toString),("certificate",.str certName.toString),
    ("native",.str nativeName.toString),("native_expression",.str text.pretty),
    ("remaining_source_symbols",.arr #[])]).compress}"

#ssr_predicate Rocq.Corelib.ssr.ssrfun.all_equal_to
#ssr_predicate Rocq.Corelib.ssr.ssrfun.homomorphism_1
#ssr_predicate Rocq.Corelib.ssr.ssrfun.homomorphism_2
#ssr_predicate Rocq.Corelib.ssr.ssrfun.idempotent_fun
#ssr_predicate Rocq.Corelib.ssr.ssrfun.idempotent_op
#ssr_predicate Rocq.Corelib.ssr.ssrfun.injective2
#ssr_predicate Rocq.Corelib.ssr.ssrfun.interchange
#ssr_predicate Rocq.Corelib.ssr.ssrfun.left_commutative
#ssr_predicate Rocq.Corelib.ssr.ssrfun.left_distributive
#ssr_predicate Rocq.Corelib.ssr.ssrfun.left_injective
#ssr_predicate Rocq.Corelib.ssr.ssrfun.left_inverse
#ssr_predicate Rocq.Corelib.ssr.ssrfun.left_loop
#ssr_predicate Rocq.Corelib.ssr.ssrfun.left_zero
#ssr_predicate Rocq.Corelib.ssr.ssrfun.monomorphism_1
#ssr_predicate Rocq.Corelib.ssr.ssrfun.monomorphism_2
#ssr_predicate Rocq.Corelib.ssr.ssrfun.morphism_1
#ssr_predicate Rocq.Corelib.ssr.ssrfun.morphism_2
#ssr_predicate Rocq.Corelib.ssr.ssrfun.rev_left_loop
#ssr_predicate Rocq.Corelib.ssr.ssrfun.rev_right_loop
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_commutative
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_distributive
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_id
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_injective
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_inverse
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_loop
#ssr_predicate Rocq.Corelib.ssr.ssrfun.right_zero
#ssr_predicate Rocq.Corelib.ssr.ssrfun.self_inverse
