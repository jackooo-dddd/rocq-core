import SSRBoolConditionalNormalization
set_option maxHeartbeats 800000
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

private def packagingForall (e : Expr) : MetaM (Option Simp.Result) := do
 let .forallE binder domain body bi := e | return none
 let some source := domain.getAppFn.constName? | return none
 let suffix := match source.toString with
  | "Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred" => "manifestSimpl_forall"
  | "Rocq.Corelib.ssr.ssrbool.registered_applicative_pred" => "registered_forall"
  | "Rocq.Corelib.ssr.ssrbool.manifest_mem_pred" => "manifestMem_forall"
  | "Rocq.Corelib.ssr.ssrbool.applicative_mem_pred" => "applicativeMem_forall"
  | "Rocq.Corelib.ssr.ssrbool.pred_key" => "predKey_forall"
  | "Rocq.Corelib.ssr.ssrbool.keyed_pred" => "keyedPred_forall"
  | "Rocq.Corelib.ssr.ssrbool.keyed_qualifier" => "keyedQualifier_forall"
  | _ => ""
 if suffix.isEmpty then return none
 try
  withTransparency .all do
   let n := ("NativeBridge.Incremental.SSRBoolRemainingStatements." ++ suffix).toName
   let proof ← mkAppM n (domain.getAppArgs.push (.lam binder domain body bi))
   let ty ← inferType proof
   unless ty.isAppOfArity `Iff 2 do return none
   let args := ty.getAppArgs
   unless ← isDefEq args[0]! e do return none
   let equality ← mkAppM `propext #[proof]
   return some { expr := ← instantiateMVars args[1]!, proof? := some (← instantiateMVars equality) }
 catch _ => return none

syntax (name := ssrboolClosedStatement) "#ssrbool_closed_statement " ident : command
@[command_elab ssrboolClosedStatement] def elabSsrboolClosedStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  let ls := di.levelParams.map Level.param
  let mut prerequisiteType := di.type
  let mut witnesses : Array Expr := #[]
  while let .forallE _ domain body _ := prerequisiteType do
    let some dependency := domain.getAppFn.constName? | throwError "Non-constant prerequisite"
    let witnessName := ("NativeBridge.Incremental.SSRBoolWitnesses.closed." ++ dependency.toString).toName
    let witness ← mkConstWithFreshMVarLevels witnessName
    unless ← isDefEq (← inferType witness) domain do throwError "Witness type mismatch"
    witnesses := witnesses.push (← instantiateMVars witness)
    prerequisiteType := body.instantiate1 witness
  unless prerequisiteType == .sort .zero do throwError "Not a statement"
  let sourceApp := mkAppN (mkConst sourceName ls) witnesses
  let body := (mkAppN di.value witnesses).headBeta
  let wrapperName := ("NativeBridge.Incremental.SSRBoolClosedStatements.closed." ++ sourceName.toString).toName
  addDecl (.defnDecl {name:=wrapperName,levelParams:=di.levelParams,type:=.sort .zero,value:=sourceApp,hints:=.abbrev,safety:=.safe})
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.Incremental.SSRBoolConditionalNormalization.sigNativeBool_forall", "NativeBridge.Incremental.SSRBoolConditionalNormalization.sigNativeBool_projection", "NativeBridge.Incremental.SSRBoolConditionalNormalization.bijective_agrees", "NativeBridge.Incremental.SSRBoolConditionalNormalization.sig_projection", "NativeBridge.Incremental.SSRBoolConditionalNormalization.sigOf", "NativeBridge.Incremental.SSRBoolConditionalOption.of_to", "NativeBridge.Incremental.SSRBoolConditionalOption.to_of", "NativeBridge.Incremental.SSRBoolConditionalOption.equality", "NativeBridge.Incremental.SSRBoolConditionalOption.forall_native", "NativeBridge.Incremental.SSRBoolConditionalOption.function_forall", "NativeBridge.Incremental.SSRBoolConditionalOption.to_some", "NativeBridge.Incremental.SSRBoolConditionalOption.to_none", "NativeBridge.Incremental.SSRBoolConditionalOption.apply_agrees", "NativeBridge.Incremental.SSRBoolConditionalOption.default_agrees", "NativeBridge.Incremental.SSRBoolConditionalOption.map_agrees", "NativeBridge.Incremental.SSRBoolConditionalOption.bind_agrees", "NativeBridge.Incremental.SSRBoolConditionalOption.lift_agrees", "NativeBridge.Incremental.SSRBoolConditionalOption.empty_forall", "NativeBridge.Incremental.SSRBoolConditionalOption.function_equality", "NativeBridge.Incremental.SSRBoolConditionalOption.to_elim", "NativeBridge.Incremental.SSRBoolConditionalOption.pred_oapp_agrees", "Rocq.Corelib.ssr.ssrbool.pred_of_argType", "Rocq.Corelib.ssr.ssrbool.predT", "RocqPending.Corelib.ssr.ssrbool.bijective_in", "RocqPending.Corelib.ssr.ssrbool.bijective_on", "Rocq.Corelib.ssr.ssrfun.bijective", "NativeBridge.eq_correspondence", "NativeBridge.is_true_agrees", "NativeBridge.bool_to_of", "NativeBridge.bool_of_to", "NativeBridge.andb_agrees", "NativeBridge.orb_agrees", "NativeBridge.negb_agrees", "NativeBridge.xorb_agrees", "NativeBridge.implb_agrees", "NativeBridge.option_to_of", "NativeBridge.option_of_to", "NativeBridge.Incremental.bool_rec_native", "NativeBridge.Incremental.bool_function_forall", "NativeBridge.Incremental.bool_binary_function_forall", "NativeBridge.Incremental.bool_forall_native", "NativeBridge.Incremental.bool_exists_native", "NativeBridge.Incremental.bool_equality_native", "NativeBridge.Incremental.bool_eq_native", "NativeBridge.Incremental.reflect_arrow_native", "NativeBridge.Incremental.boolTo_true", "NativeBridge.Incremental.boolTo_false", "NativeBridge.Incremental.ssr_addb_agrees", "NativeBridge.Incremental.ssr_if_expr_agrees", "NativeBridge.Incremental.ssr_isSome_agrees", "NativeBridge.Incremental.ssr_subpred_agrees", "NativeBridge.Incremental.ssr_subrel_agrees", "NativeBridge.Incremental.ssr_reflexive_agrees", "NativeBridge.Incremental.ssr_irreflexive_agrees", "NativeBridge.Incremental.ssr_symmetric_agrees", "NativeBridge.Incremental.ssr_transitive_agrees", "NativeBridge.Incremental.ssr_antisymmetric_agrees", "NativeBridge.Incremental.ssr_total_agrees", "NativeBridge.Incremental.ssr_cancel_agrees", "NativeBridge.Incremental.ssr_commutative_agrees", "NativeBridge.Incremental.ssr_associative_agrees", "NativeBridge.Incremental.ssr_involutive_agrees", "NativeBridge.Incremental.ssr_injective_agrees", "NativeBridge.Incremental.ssr_eqfun_agrees", "NativeBridge.Incremental.ssr_eqrel_agrees", "NativeBridge.Incremental.ssr_left_id_agrees", "NativeBridge.Incremental.true_agrees", "NativeBridge.Incremental.false_agrees", "NativeBridge.Incremental.and_agrees", "NativeBridge.Incremental.or_agrees", "NativeBridge.Incremental.not_agrees", "NativeBridge.Incremental.notT_agrees", "NativeBridge.Incremental.iff_agrees", "NativeBridge.Incremental.ex_agrees", "NativeBridge.Incremental.ex2_agrees", "NativeBridge.Incremental.inhabited_agrees", "NativeBridge.Incremental.all_agrees", "Rocq.Corelib.ssr.ssrfun.right_commutative", "Rocq.Corelib.ssr.ssrfun.left_commutative", "Rocq.Corelib.ssr.ssrfun.interchange", "Rocq.Corelib.ssr.ssrfun.right_id", "Rocq.Corelib.ssr.ssrfun.right_injective", "Rocq.Corelib.ssr.ssrfun.right_loop", "Rocq.Corelib.ssr.ssrfun.left_loop", "Rocq.Corelib.ssr.ssrfun.self_inverse", "Rocq.Corelib.ssr.ssrfun.left_zero", "Rocq.Corelib.ssr.ssrfun.right_zero", "Rocq.Corelib.ssr.ssrfun.idempotent_op", "Rocq.Corelib.ssr.ssrfun.idempotent_fun", "Rocq.Corelib.ssr.ssrbool.pred", "Rocq.Corelib.ssr.ssrbool.rel", "NativeBridge.Incremental.SSRBoolLogic.and3_agrees", "NativeBridge.Incremental.SSRBoolLogic.and4_agrees", "NativeBridge.Incremental.SSRBoolLogic.and5_agrees", "NativeBridge.Incremental.SSRBoolLogic.or3_agrees", "NativeBridge.Incremental.SSRBoolLogic.or4_agrees", "NativeBridge.Incremental.SSRBoolLogic.pre_symmetric_agrees", "NativeBridge.Incremental.SSRBoolLogic.left_transitive_agrees", "NativeBridge.Incremental.SSRBoolLogic.right_transitive_agrees", "NativeBridge.Incremental.SSRBoolLogic.equivalence_rel_agrees", "NativeBridge.Incremental.SSRBoolLogic.quality_prod_agrees", "NativeBridge.Incremental.SSRBoolData.classically_agrees", "NativeBridge.Incremental.SSRBoolData.unless_agrees", "NativeBridge.Incremental.SSRBoolExtendedStatements.simpl_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.mem_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.implies_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.decidable_forall", "NativeBridge.Incremental.SSRBoolExtendedStatements.coerce_of", "NativeBridge.Incremental.SSRBoolExtendedStatements.mem_of", "NativeBridge.Incremental.SSRBoolExtendedStatements.phantom_agrees", "Rocq.Corelib.ssr.ssrfun.left_injective", "Rocq.Corelib.ssr.ssrfun.left_distributive", "Rocq.Corelib.ssr.ssrfun.right_distributive", "Rocq.Corelib.ssr.ssrfun.homomorphism_1", "Rocq.Corelib.ssr.ssrfun.homomorphism_2", "Rocq.Corelib.ssr.ssrfun.monomorphism_1", "Rocq.Corelib.ssr.ssrfun.monomorphism_2", "Rocq.Corelib.ssr.ssrfun.comp", "Rocq.Corelib.ssr.ssrbool.predArgType", "Rocq.Corelib.ssr.ssrbool.sort_of_predArgType", "Rocq.Corelib.ssr.ssrbool.pre_symmetric", "Rocq.Corelib.ssr.ssrbool.left_transitive", "Rocq.Corelib.ssr.ssrbool.right_transitive", "Rocq.Corelib.ssr.ssrbool.equivalence_rel", "Rocq.Corelib.ssr.ssrbool.prop_for", "Rocq.Corelib.ssr.ssrbool.prop_in1", "Rocq.Corelib.ssr.ssrbool.prop_in2", "Rocq.Corelib.ssr.ssrbool.prop_in3", "Rocq.Corelib.ssr.ssrbool.prop_in11", "Rocq.Corelib.ssr.ssrbool.prop_in12", "Rocq.Corelib.ssr.ssrbool.prop_in21", "Rocq.Corelib.ssr.ssrbool.prop_in111", "Rocq.Corelib.ssr.ssrbool.prop_on1", "Rocq.Corelib.ssr.ssrbool.prop_on2", "Rocq.Corelib.ssr.ssrbool.sub_mem", "Rocq.Corelib.ssr.ssrbool.eq_mem", "Rocq.Corelib.ssr.ssrbool.predPredType", "Rocq.Corelib.ssr.ssrbool.memPredType", "Rocq.Corelib.ssr.ssrbool.simplPredType", "Rocq.Corelib.ssr.ssrbool.mem", "Rocq.Corelib.ssr.ssrbool.in_mem", "Rocq.Corelib.ssr.ssrbool.pred_of_mem", "Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce", "Rocq.Corelib.ssr.ssrbool.simpl_of_mem", "Rocq.Corelib.ssr.ssrbool.SimplPred", "Rocq.Corelib.ssr.ssrbool.rel_of_simpl", "Rocq.Corelib.ssr.ssrbool.relU", "Rocq.Corelib.ssr.ssrbool.SimplRel", "Rocq.Corelib.ssr.ssrbool.subrel", "Rocq.Corelib.ssr.ssrfun.eqfun", "Rocq.Corelib.ssr.ssrfun.fun_of_simpl", "NativeBridge.Incremental.SSRBoolRemainingStatements.manifestSimpl_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.registered_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.manifestMem_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.applicativeMem_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.qualifier_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.predKey_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.keyedPred_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.keyedQualifier_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.predType_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.predType_sort", "NativeBridge.Incremental.SSRBoolRemainingStatements.nat_forall", "NativeBridge.Incremental.SSRBoolRemainingStatements.decidable_nonempty", "NativeBridge.Incremental.SSRBoolRemainingStatements.mem_equality", "NativeBridge.Incremental.SSRBoolRemainingStatements.memOf_eval", "Rocq.Corelib.ssr.ssrbool.applicative_pred_value", "Rocq.Corelib.ssr.ssrbool.simpl_pred_value", "Rocq.Corelib.ssr.ssrbool.mem_pred_value", "Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value", "Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl", "Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl", "Rocq.Corelib.ssr.ssrbool.unkey_pred", "Rocq.Corelib.ssr.ssrbool.unkey_qualifier", "Rocq.Corelib.ssr.ssrbool.has_quality", "NativeBridge.Incremental.SSRBoolData.memIso", "NativeBridge.Incremental.SSRBoolData.simplPredIso", "NativeBridge.Incremental.SSRBoolData.predTypeOf", "NativeBridge.Incremental.SSRBoolData.predTypeTo", "NativeBridge.Incremental.SSRBoolData.predTo", "NativeBridge.Incremental.SSRBoolData.predOf", "NativeBridge.Incremental.SSRBoolPackaging.manifestSimplIso", "NativeBridge.Incremental.SSRBoolPackaging.registeredIso", "NativeBridge.Incremental.SSRBoolPackaging.manifestMemIso", "NativeBridge.Incremental.SSRBoolPackaging.applicativeMemIso", "NativeBridge.Incremental.SSRBoolPackaging.qualifierIso", "NativeBridge.Incremental.SSRBoolPackaging.predKeyIso", "NativeBridge.Incremental.SSRBoolPackaging.keyedPredIso", "NativeBridge.Incremental.SSRBoolPackaging.keyedQualifierIso", "Rocq.Corelib.ssr.ssrbool.pred_sort", "Rocq.Corelib.ssr.ssrbool.topred", "NativeBridge.Incremental.SSRBoolRemainingStatements.sig_nonempty", "NativeBridge.Incremental.SSRBoolRemainingStatements.sum_nonempty", "NativeBridge.Incremental.SSRBoolRemainingStatements.bool_function_equality", "NativeBridge.Incremental.SSRBoolRemainingStatements.predTo_native", "NativeBridge.Incremental.SSRBoolRemainingStatements.simplFun_constructor", "NativeBridge.Incremental.SSRBoolPackaging.locked_agrees", "id"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." || rule.startsWith "RocqPending." || (← getConstInfo n).isDefinition then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let defaults := Simp.mkDefaultMethodsCore #[]
  let methods : Simp.Methods := { defaults with pre := fun e => do
   if let some r ← packagingForall e then return .visit r
   defaults.pre e }
  let (first, _) ← Simp.mainCore body ctx {} (methods := methods)
  let mut r := first
  for _ in [:8] do
   let (next, _) ← Simp.mainCore r.expr ctx {} (methods := methods)
   if next.expr == r.expr then break
   let proof ← mkAppM `Eq.trans #[← r.getProof' body, ← next.getProof' r.expr]
   r := { expr := next.expr, proof? := some proof }
  let nativeName := ("NativeBridge.Incremental.SSRBoolClosedStatements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.SSRBoolClosedStatements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=r.expr,hints:=.abbrev,safety:=.safe})
  let ty := mkApp2 (mkConst `Iff) sourceApp (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← r.getProof' body]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs r.expr
  let text ← ppExpr r.expr
  let j := Json.mkObj [("source_target",.str sourceName.toString),("certificate",.str certName.toString),
   ("native",.str nativeName.toString),("native_expression",.str text.pretty),
   ("remaining_source_symbols",.arr (remaining.map (fun x => .str x.toString))),
   ("full",.bool remaining.isEmpty)]
  logInfo m!"NATIVE_RESULT {j.compress}"

#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.canLR_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.canLR_on.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.canRL_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.canRL_on.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in1T.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in1W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in1_sig.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in2T.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in2W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in2_sig.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in3T.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in3W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in3_sig.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.inT_bij.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.inW_bij.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on1P.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on1S.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on1W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on2P.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on2S.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_on2W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.monoW_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1S.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1S_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1T.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1W_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1lS.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1lT.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1lW.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on2S.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on2S_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on2T.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on2W.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on2W_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.onS_can.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.onT_bij.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.onW_bij.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.onW_can.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement
#ssrbool_closed_statement RocqPending.Corelib.ssr.ssrbool.subon_bij.statement
