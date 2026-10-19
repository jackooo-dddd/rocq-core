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
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.eqTo_of", "NativeBridge.eqOf_to", "NativeBridge.sumbool_to_of", "NativeBridge.true_agrees", "NativeBridge.false_agrees", "NativeBridge.and_agrees", "NativeBridge.or_agrees", "NativeBridge.not_agrees", "NativeBridge.notT_agrees", "NativeBridge.iff_agrees", "NativeBridge.ex_agrees", "NativeBridge.ex2_agrees", "NativeBridge.inhabited_agrees", "NativeBridge.all_agrees", "NativeBridge.Incremental.subtype_forall_native", "NativeBridge.Incremental.subtype_exists_native", "NativeBridge.Incremental.subtype_of_equality", "NativeBridge.Incremental.subtype2_forall_native", "NativeBridge.Incremental.subtype2_native_roundtrip", "NativeBridge.Incremental.subtype2_equality_native", "NativeBridge.Incremental.psigma_forall_native", "NativeBridge.Incremental.psigma_exists_native", "NativeBridge.Incremental.psigma_of_equality", "NativeBridge.Incremental.psigma2_forall_native", "NativeBridge.Incremental.psigma2_exists_native", "NativeBridge.Incremental.psigma2_of_equality", "NativeBridge.Incremental.subtype_forward_roundtrip", "NativeBridge.Incremental.psigma_forward_roundtrip", "NativeBridge.Incremental.psigma2_forward_roundtrip", "NativeBridge.Incremental.subtype_projection_native", "NativeBridge.Incremental.psigma_projection_native", "NativeBridge.Incremental.psigma_value_native", "NativeBridge.Incremental.source_iff_native", "NativeBridge.Incremental.specif_ex_native", "NativeBridge.Incremental.specif_ex2_native", "NativeBridge.Incremental.specif_inhabited_native", "NativeBridge.Incremental.subtype_nonempty_native", "NativeBridge.Incremental.psigma_equality_native", "NativeBridge.Incremental.psigma2_equality_native", "NativeBridge.Incremental.psigma_constructor_native", "NativeBridge.Incremental.psigma2_constructor_native", "NativeBridge.Incremental.psigma2_drop_native", "NativeBridge.Incremental.psigma2_third_native", "NativeBridge.Incremental.specif_eq_rect_native", "NativeBridge.Incremental.subtype_family_forall", "NativeBridge.Incremental.subtype2_family_forall", "NativeBridge.Incremental.psigma_family_forall", "NativeBridge.Incremental.psigma2_family_forall", "NativeBridge.Incremental.subtype_constructor_native", "NativeBridge.Incremental.subtype2_constructor_native", "NativeBridge.Incremental.subtype2_of_equality", "NativeBridge.Incremental.psigma_eta_projection_native", "NativeBridge.Incremental.psigma_eta_value_native", "NativeBridge.Incremental.psigma2_eta_drop_native", "NativeBridge.Incremental.sumbool_forall_native", "NativeBridge.Incremental.sumbool_family_forall", "NativeBridge.Incremental.sumor_forall_native", "NativeBridge.Incremental.sumor_family_forall", "NativeBridge.Incremental.sumbool_left_native", "NativeBridge.Incremental.sumbool_right_native", "NativeBridge.Incremental.sumor_left_native", "NativeBridge.Incremental.sumor_right_native", "NativeBridge.Incremental.sumor_forward_roundtrip", "NativeBridge.Incremental.quality_sigT_native", "NativeBridge.Incremental.quality_sigT2_native", "NativeBridge.Incremental.eq_proof_exists_native", "NativeBridge.Incremental.eq_proof_forall_native", "NativeBridge.Incremental.pprod_forall_native", "NativeBridge.Incremental.pprod_equality_native", "NativeBridge.Incremental.pprod_forward_roundtrip", "NativeBridge.Incremental.prod_of_sigT_agrees", "NativeBridge.Incremental.sigT_of_prod_agrees"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (r1, _) ← Meta.simp di.value ctx
  let mut cleanup : SimpTheorems := {}
  for n in [`NativeBridge.Incremental.subtypeOf,`NativeBridge.Incremental.subtype2Of,
      `NativeBridge.Incremental.psigmaOf,`NativeBridge.Incremental.psigma2Of,
      `NativeBridge.Incremental.subtypeTo,`NativeBridge.Incremental.subtype2To,
      `NativeBridge.Incremental.psigmaTo,`NativeBridge.Incremental.psigma2To,
      `Rocq.Corelib.Init.Specif.proj1_sig,`Rocq.Corelib.Init.Specif.projT1,
      `Rocq.Corelib.Init.Specif.projT2,`Rocq.Corelib.Init.Specif.projT3,
      `Rocq.Corelib.Init.Specif.sigT_of_sigT2] do
    cleanup ← cleanup.addDeclToUnfold n
  let cleanupCtx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[cleanup])
  let (r, _) ← Meta.simp r1.expr cleanupCtx
  -- simp does not traverse proof arguments. Replace only this specific
  -- roundtrip cast by its native proof, checking definitional equality.
  let finalExpr ← Meta.transform r.expr (pre := fun e => do
    if e.getAppFn.isConst && [`Rocq.Corelib.Init.Specif.proj1_sig,`Rocq.Corelib.Init.Specif.projT1,
        `Rocq.Corelib.Init.Specif.projT2,`Rocq.Corelib.Init.Specif.projT3,
        `Rocq.Corelib.Init.Specif.sigT_of_sigT2].contains e.getAppFn.constName! then
      let e' ← withTransparency .all (whnf e)
      if e' != e then return .visit e'
    return .continue) (post := fun e => do
    if e.isAppOfArity `Eq.substr 6 then
      let candidate := e.getAppArgs[5]!
      if (← isProof candidate) && (← isDefEq e candidate) then
        return .done candidate
    if e.isAppOfArity `NativeBridge.eqTo 4 then
      let proof := e.getAppArgs[3]!
      if proof.isAppOfArity `NativeBridge.eqOf 4 then
        let candidate := proof.getAppArgs[3]!
        if (← isProof candidate) && (← isDefEq e candidate) then
          return .done candidate
      if proof.isAppOfArity `Eq.substr 6 then
        let candidate := proof.getAppArgs[5]!
        if (← isProof candidate) && (← isDefEq e candidate) then
          return .done candidate
    return .done e)
  unless ← isDefEq r.expr finalExpr do throwError "Cleanup changed the statement"
  let nativeName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=finalExpr,hints:=.abbrev,safety:=.safe})
  let ls := di.levelParams.map Level.param
  let ty := mkApp2 (mkConst `Iff) (mkConst sourceName ls) (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← mkEqTrans (← r1.getProof' di.value) (← r.getProof' r1.expr)]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs finalExpr
  let text ← ppExpr finalExpr
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
