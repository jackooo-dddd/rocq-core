import SpecifNormalization
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
 unless !(← sourceRefs (mkConst `Rocq.Corelib.Init.Specif.sig)).isEmpty do
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
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.true_agrees", "NativeBridge.false_agrees", "NativeBridge.and_agrees", "NativeBridge.or_agrees", "NativeBridge.not_agrees", "NativeBridge.notT_agrees", "NativeBridge.iff_agrees", "NativeBridge.ex_agrees", "NativeBridge.ex2_agrees", "NativeBridge.inhabited_agrees", "NativeBridge.all_agrees", "NativeBridge.Incremental.subtype_forall_native", "NativeBridge.Incremental.subtype_exists_native", "NativeBridge.Incremental.subtype_of_equality", "NativeBridge.Incremental.subtype2_forall_native", "NativeBridge.Incremental.subtype2_native_roundtrip", "NativeBridge.Incremental.subtype2_equality_native", "NativeBridge.Incremental.psigma_forall_native", "NativeBridge.Incremental.psigma_exists_native", "NativeBridge.Incremental.psigma_of_equality", "NativeBridge.Incremental.psigma2_forall_native", "NativeBridge.Incremental.psigma2_exists_native", "NativeBridge.Incremental.psigma2_of_equality", "NativeBridge.Incremental.subtype_forward_roundtrip", "NativeBridge.Incremental.psigma_forward_roundtrip", "NativeBridge.Incremental.psigma2_forward_roundtrip", "NativeBridge.Incremental.subtype_projection_native", "NativeBridge.Incremental.psigma_projection_native", "NativeBridge.Incremental.psigma_value_native", "NativeBridge.Incremental.source_iff_native", "NativeBridge.Incremental.specif_ex_native", "NativeBridge.Incremental.specif_ex2_native", "NativeBridge.Incremental.specif_inhabited_native", "NativeBridge.Incremental.subtype_nonempty_native", "NativeBridge.Incremental.psigma_equality_native", "NativeBridge.Incremental.psigma2_equality_native", "NativeBridge.Incremental.psigma_constructor_native", "NativeBridge.Incremental.psigma2_constructor_native", "NativeBridge.Incremental.psigma2_drop_native", "NativeBridge.Incremental.psigma2_third_native", "NativeBridge.Incremental.specif_eq_rect_native", "NativeBridge.Incremental.subtype_family_forall", "NativeBridge.Incremental.subtype2_family_forall", "NativeBridge.Incremental.psigma_family_forall", "NativeBridge.Incremental.psigma2_family_forall"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
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

#incremental_statement Rocq.Corelib.Init.Specif.eq_existT2_curried.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT2_l.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT2_r.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT_curried.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT_l.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT_r.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT2.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sig_hprop.statement
#incremental_statement Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement
#incremental_statement Rocq.Corelib.Init.Specif.ex2_of_sig2.statement
#incremental_statement Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement
#incremental_statement Rocq.Corelib.Init.Specif.ex_of_sig.statement
#incremental_statement Rocq.Corelib.Init.Specif.ex_of_sigT.statement
#incremental_statement Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement
#incremental_statement Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement
#incremental_statement Rocq.Corelib.Init.Specif.prod_sigT_prod.statement
#incremental_statement Rocq.Corelib.Init.Specif.proj1_sig_eq.statement
#incremental_statement Rocq.Corelib.Init.Specif.proj2_sig.statement
#incremental_statement Rocq.Corelib.Init.Specif.projT1_eq.statement
#incremental_statement Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement
#incremental_statement Rocq.Corelib.Init.Specif.sig2_ind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sig2_sind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT2_eta.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT2_ind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT2_sind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT_eta.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT_ind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement
#incremental_statement Rocq.Corelib.Init.Specif.sigT_sind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sig_ind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sig_sind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sumbool_ind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sumbool_sind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sumor_ind.statement
#incremental_statement Rocq.Corelib.Init.Specif.sumor_sind.statement
