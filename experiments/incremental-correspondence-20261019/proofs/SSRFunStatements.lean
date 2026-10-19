import SSRFunPredicates
import SSRFunOption
import SSRNonProp
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

syntax (name := incrementalStatement) "#incremental_statement " ident : command
@[command_elab incrementalStatement] def elabIncrementalStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  unless di.type == .sort .zero do throwError "Conditional/type-valued statement excluded"
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.Incremental.SSRFunNormalization.quality_prod", "NativeBridge.Incremental.SSRFunNormalization.bijective_agrees", "NativeBridge.Incremental.SSRFunNormalization.true_agrees", "NativeBridge.Incremental.SSRFunNormalization.false_agrees", "NativeBridge.Incremental.SSRFunNormalization.and_agrees", "NativeBridge.Incremental.SSRFunNormalization.or_agrees", "NativeBridge.Incremental.SSRFunNormalization.not_agrees", "NativeBridge.Incremental.SSRFunNormalization.notT_agrees", "NativeBridge.Incremental.SSRFunNormalization.iff_agrees", "NativeBridge.Incremental.SSRFunNormalization.ex_agrees", "NativeBridge.Incremental.SSRFunNormalization.ex2_agrees", "NativeBridge.Incremental.SSRFunNormalization.inhabited_agrees", "NativeBridge.Incremental.SSRFunNormalization.all_agrees", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.all_equal_to.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.homomorphism_1.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.homomorphism_2.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.idempotent_fun.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.idempotent_op.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.injective2.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.interchange.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_commutative.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_distributive.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_injective.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_inverse.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_loop.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.left_zero.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.monomorphism_1.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.monomorphism_2.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.morphism_1.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.morphism_2.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.rev_left_loop.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.rev_right_loop.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_commutative.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_distributive.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_id.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_injective.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_inverse.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_loop.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.right_zero.correspondence", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.self_inverse.correspondence", "Rocq.Corelib.ssr.ssrfun.cancel", "Rocq.Corelib.ssr.ssrfun.injective", "Rocq.Corelib.ssr.ssrfun.eqfun", "Rocq.Corelib.ssr.ssrfun.eqrel", "Rocq.Corelib.ssr.ssrfun.comp", "Rocq.Corelib.ssr.ssrfun.catcomp", "Rocq.Corelib.ssr.ssrfun.idfun", "Rocq.Corelib.ssr.ssrfun.fun_of_simpl", "NativeBridge.Incremental.SSRFunNormalization.comp_function", "NativeBridge.Incremental.SSRFunNormalization.sig_forall", "NativeBridge.Incremental.SSRFunNormalization.sig_projection", "NativeBridge.Incremental.SSRFunNormalization.sig2_forall", "NativeBridge.Incremental.SSRFunNormalization.sig2_projection", "NativeBridge.Incremental.SSRFunNormalization.unit_forall", "NativeBridge.Incremental.SSRFunNormalization.unit_equality", "NativeBridge.Incremental.SSRFunNormalization.unit_to_of", "NativeBridge.Incremental.SSRFunNormalization.unit_to_tt", "NativeBridge.Incremental.SSRFunNormalization.sum_equality", "NativeBridge.Incremental.SSRFunNormalization.sum_left", "NativeBridge.Incremental.SSRFunNormalization.sum_right", "NativeBridge.Incremental.ssr_involutive_agrees", "NativeBridge.Incremental.SSRFunOption.of_to", "NativeBridge.Incremental.SSRFunOption.to_of", "NativeBridge.Incremental.SSRFunOption.equality", "NativeBridge.Incremental.SSRFunOption.forall_native", "NativeBridge.Incremental.SSRFunOption.function_forall", "NativeBridge.Incremental.SSRFunOption.to_some", "NativeBridge.Incremental.SSRFunOption.to_none", "NativeBridge.Incremental.SSRFunOption.apply_agrees", "NativeBridge.Incremental.SSRFunOption.default_agrees", "NativeBridge.Incremental.SSRFunOption.map_agrees", "NativeBridge.Incremental.SSRFunOption.bind_agrees", "NativeBridge.Incremental.SSRFunOption.lift_agrees", "NativeBridge.Incremental.SSRFunOption.empty_forall", "Rocq.Corelib.ssr.ssrfun.pcancel", "Rocq.Corelib.ssr.ssrfun.ocancel", "Rocq.Corelib.ssr.ssrfun.pcomp", "Rocq.Corelib.ssr.ssrfun.of_void", "NativeBridge.Incremental.SSRFunPredicates.Rocq.Corelib.ssr.ssrfun.all_equal_to.native", "NativeBridge.Incremental.SSRFunOption.function_equality", "NativeBridge.Incremental.SSRNonProp.forall_native", "NativeBridge.Incremental.SSRNonProp.callee_of", "NativeBridge.Incremental.SSRFunOption.to_elim"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." || rule.endsWith ".native" then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (r, _) ← Meta.simp di.value ctx
  let nativeName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".correspondence").toName
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

#incremental_statement Rocq.Corelib.ssr.ssrfun.Some_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.bij_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.bij_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.canLR.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.canRL.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.can_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.can_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.can_pcan.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.compA.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.eq_bij.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.eq_can.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.eq_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.eq_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.eq_omap.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.frefl.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.fsym.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.ftrans.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inj_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inj_compr.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inj_id.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inj_omap.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inl_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inr_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inv_bij.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.inv_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.oappEmap.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.oapp_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.obindEapp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.ocan_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.of_voidK.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.olift_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.omapEapp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.omapEbind.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.omapK.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.omap_comp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.omap_id.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.pair_of_and.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.pcan_inj.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.rrefl.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.s2valP.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.s2valP'.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.svalP.statement
#incremental_statement Rocq.Corelib.ssr.ssrfun.unitE.statement
