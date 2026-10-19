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
   if let some v := ci.value? then
    found := found ++ (← sourceRefs v seen)
 return found

run_cmd Lean.Elab.Command.liftTermElabM do
 unless !(← sourceRefs (mkConst `NativeBridge.RBool)).isEmpty do
  throwError "Source-containing alias incorrectly classified as native"
 unless (← sourceRefs (mkConst `Bool)).isEmpty do
  throwError "Native Bool incorrectly classified as source-containing"

syntax (name := ssrboolExtendedStatement) "#ssrbool_extended_statement " ident : command
@[command_elab ssrboolExtendedStatement] def elabSsrboolExtendedStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  unless di.type == .sort .zero do throwError "Conditional/type-valued statement excluded"
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.is_true_agrees", "NativeBridge.bool_to_of", "NativeBridge.bool_of_to", "NativeBridge.andb_agrees", "NativeBridge.orb_agrees", "NativeBridge.negb_agrees", "NativeBridge.xorb_agrees", "NativeBridge.implb_agrees", "NativeBridge.option_to_of", "NativeBridge.option_of_to", "NativeBridge.Incremental.bool_rec_native", "NativeBridge.Incremental.bool_function_forall", "NativeBridge.Incremental.bool_binary_function_forall", "NativeBridge.Incremental.bool_forall_native", "NativeBridge.Incremental.bool_exists_native", "NativeBridge.Incremental.bool_equality_native", "NativeBridge.Incremental.bool_eq_native", "NativeBridge.Incremental.reflect_arrow_native", "NativeBridge.Incremental.boolTo_true", "NativeBridge.Incremental.boolTo_false", "NativeBridge.Incremental.ssr_addb_agrees", "NativeBridge.Incremental.ssr_if_expr_agrees", "NativeBridge.Incremental.ssr_isSome_agrees", "NativeBridge.Incremental.ssr_subpred_agrees", "NativeBridge.Incremental.ssr_subrel_agrees", "NativeBridge.Incremental.ssr_reflexive_agrees", "NativeBridge.Incremental.ssr_irreflexive_agrees", "NativeBridge.Incremental.ssr_symmetric_agrees", "NativeBridge.Incremental.ssr_transitive_agrees", "NativeBridge.Incremental.ssr_antisymmetric_agrees", "NativeBridge.Incremental.ssr_total_agrees", "NativeBridge.Incremental.ssr_cancel_agrees", "NativeBridge.Incremental.ssr_commutative_agrees", "NativeBridge.Incremental.ssr_associative_agrees", "NativeBridge.Incremental.ssr_involutive_agrees", "NativeBridge.Incremental.ssr_injective_agrees", "NativeBridge.Incremental.ssr_eqfun_agrees", "NativeBridge.Incremental.ssr_eqrel_agrees", "NativeBridge.Incremental.ssr_left_id_agrees", "NativeBridge.Incremental.true_agrees", "NativeBridge.Incremental.false_agrees", "NativeBridge.Incremental.and_agrees", "NativeBridge.Incremental.or_agrees", "NativeBridge.Incremental.not_agrees", "NativeBridge.Incremental.notT_agrees", "NativeBridge.Incremental.iff_agrees", "NativeBridge.Incremental.ex_agrees", "NativeBridge.Incremental.ex2_agrees", "NativeBridge.Incremental.inhabited_agrees", "NativeBridge.Incremental.all_agrees", "Rocq.Corelib.ssr.ssrfun.right_commutative", "Rocq.Corelib.ssr.ssrfun.left_commutative", "Rocq.Corelib.ssr.ssrfun.interchange", "Rocq.Corelib.ssr.ssrfun.right_id", "Rocq.Corelib.ssr.ssrfun.right_injective", "Rocq.Corelib.ssr.ssrfun.right_loop", "Rocq.Corelib.ssr.ssrfun.left_loop", "Rocq.Corelib.ssr.ssrfun.self_inverse", "Rocq.Corelib.ssr.ssrfun.left_zero", "Rocq.Corelib.ssr.ssrfun.right_zero", "Rocq.Corelib.ssr.ssrfun.idempotent_op", "Rocq.Corelib.ssr.ssrfun.idempotent_fun", "Rocq.Corelib.ssr.ssrbool.pred", "Rocq.Corelib.ssr.ssrbool.rel", "NativeBridge.Incremental.SSRBoolLogic.and3_agrees", "NativeBridge.Incremental.SSRBoolLogic.and4_agrees", "NativeBridge.Incremental.SSRBoolLogic.and5_agrees", "NativeBridge.Incremental.SSRBoolLogic.or3_agrees", "NativeBridge.Incremental.SSRBoolLogic.or4_agrees", "NativeBridge.Incremental.SSRBoolLogic.pre_symmetric_agrees", "NativeBridge.Incremental.SSRBoolLogic.left_transitive_agrees", "NativeBridge.Incremental.SSRBoolLogic.right_transitive_agrees", "NativeBridge.Incremental.SSRBoolLogic.equivalence_rel_agrees", "NativeBridge.Incremental.SSRBoolLogic.quality_prod_agrees", "NativeBridge.Incremental.SSRBoolData.classically_agrees", "NativeBridge.Incremental.SSRBoolData.unless_agrees", "NativeBridge.Incremental.SSRBoolExtendedStatements.simpl_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.mem_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.implies_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.decidable_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.coerce_of", "NativeBridge.Incremental.SSRBoolExtendedStatements.mem_of", "NativeBridge.Incremental.SSRBoolExtendedStatements.phantom_agrees", "Rocq.Corelib.ssr.ssrfun.left_injective", "Rocq.Corelib.ssr.ssrfun.left_distributive", "Rocq.Corelib.ssr.ssrfun.right_distributive", "Rocq.Corelib.ssr.ssrfun.homomorphism_1", "Rocq.Corelib.ssr.ssrfun.homomorphism_2", "Rocq.Corelib.ssr.ssrfun.monomorphism_1", "Rocq.Corelib.ssr.ssrfun.monomorphism_2", "Rocq.Corelib.ssr.ssrfun.comp", "Rocq.Corelib.ssr.ssrbool.predArgType", "Rocq.Corelib.ssr.ssrbool.sort_of_predArgType", "Rocq.Corelib.ssr.ssrbool.pre_symmetric", "Rocq.Corelib.ssr.ssrbool.left_transitive", "Rocq.Corelib.ssr.ssrbool.right_transitive", "Rocq.Corelib.ssr.ssrbool.equivalence_rel", "Rocq.Corelib.ssr.ssrbool.prop_for", "Rocq.Corelib.ssr.ssrbool.prop_in1", "Rocq.Corelib.ssr.ssrbool.prop_in2", "Rocq.Corelib.ssr.ssrbool.prop_in3", "Rocq.Corelib.ssr.ssrbool.prop_in11", "Rocq.Corelib.ssr.ssrbool.prop_in12", "Rocq.Corelib.ssr.ssrbool.prop_in21", "Rocq.Corelib.ssr.ssrbool.prop_in111", "Rocq.Corelib.ssr.ssrbool.prop_on1", "Rocq.Corelib.ssr.ssrbool.prop_on2", "Rocq.Corelib.ssr.ssrbool.sub_mem", "Rocq.Corelib.ssr.ssrbool.eq_mem", "Rocq.Corelib.ssr.ssrbool.predPredType", "Rocq.Corelib.ssr.ssrbool.memPredType", "Rocq.Corelib.ssr.ssrbool.simplPredType", "Rocq.Corelib.ssr.ssrbool.mem", "Rocq.Corelib.ssr.ssrbool.in_mem", "Rocq.Corelib.ssr.ssrbool.pred_of_mem", "Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce", "Rocq.Corelib.ssr.ssrbool.simpl_of_mem", "Rocq.Corelib.ssr.ssrbool.SimplPred", "Rocq.Corelib.ssr.ssrbool.rel_of_simpl", "Rocq.Corelib.ssr.ssrbool.relU", "Rocq.Corelib.ssr.ssrbool.SimplRel", "Rocq.Corelib.ssr.ssrbool.subrel", "Rocq.Corelib.ssr.ssrfun.eqfun", "Rocq.Corelib.ssr.ssrfun.fun_of_simpl"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (first, _) ← Meta.simp di.value ctx
  let mut r := first
  for _ in [:8] do
   let (next, _) ← Meta.simp r.expr ctx
   if next.expr == r.expr then break
   let proof ← mkAppM `Eq.trans #[← r.getProof' di.value, ← next.getProof' r.expr]
   r := { expr := next.expr, proof? := some proof }
  let nativeName := ("NativeBridge.Incremental.SSRBoolExtendedStatements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.SSRBoolExtendedStatements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=r.expr,hints:=.abbrev,safety:=.safe})
  let ls := di.levelParams.map Level.param
  let ty := mkApp2 (mkConst `Iff) (mkConst sourceName ls) (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← r.getProof' di.value]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs r.expr
  let text ← ppExpr r.expr
  let j := Json.mkObj [("source_target",.str sourceName.toString),("certificate",.str certName.toString),
   ("native",.str nativeName.toString),("native_expression",.str text.pretty),
   ("remaining_source_symbols",.arr (remaining.map (fun x => .str x.toString))),
   ("full",.bool remaining.isEmpty)]
  logInfo m!"NATIVE_RESULT {j.compress}"
