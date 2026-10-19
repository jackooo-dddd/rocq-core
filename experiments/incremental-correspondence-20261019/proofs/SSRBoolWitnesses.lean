import SSRBoolRemainingStatements
open Lean Meta Elab Command Tactic
set_option maxHeartbeats 200000
set_option linter.unusedSimpArgs false
set_option maxRecDepth 2048
elab "ssrb_cases_data" : tactic => withMainContext do
  let g ← getMainGoal
  for d in ← getLCtx do
    unless d.isImplementationDetail do
      let ty ← whnf d.type
      if ["Rocq.Corelib.Init.Datatypes.bool", "Rocq.Corelib.Init.Logic.False", "Rocq.Corelib.Init.Datatypes.reflect", "Rocq.Corelib.ssr.ssrbool.and3", "Rocq.Corelib.ssr.ssrbool.and4", "Rocq.Corelib.ssr.ssrbool.and5", "Rocq.Corelib.ssr.ssrbool.or3", "Rocq.Corelib.ssr.ssrbool.or4", "Rocq.Corelib.Init.Logic.eq", "Rocq.Corelib.Init.Logic.ex", "Rocq.Corelib.Init.Logic.ex2",
          "Rocq.Corelib.Init.Specif.sig.qualityProp", "Rocq.Corelib.Init.Specif.sig2.qualityProp", "Rocq.Corelib.Init.Specif.sig", "Rocq.Corelib.Init.Specif.sig2", "Rocq.Corelib.Init.Specif.sigT", "Rocq.Corelib.Init.Specif.sigT2", "Rocq.Corelib.Init.Logic.and", "Rocq.Corelib.Init.Logic.or"].contains (ty.getAppFn.constName?.getD Name.anonymous).toString then
        let gs ← g.cases d.fvarId
        replaceMainGoal (gs.toList.map (·.mvarId))
        return
  throwError "No source hypothesis to eliminate"
elab "ssrb_cases_eq" : tactic => withMainContext do
  let g ← getMainGoal
  for name in ["Rocq.Corelib.Init.Datatypes.bool", "Rocq.Corelib.Init.Logic.False", "Rocq.Corelib.Init.Datatypes.reflect", "Rocq.Corelib.ssr.ssrbool.and3", "Rocq.Corelib.ssr.ssrbool.and4", "Rocq.Corelib.ssr.ssrbool.and5", "Rocq.Corelib.ssr.ssrbool.or3", "Rocq.Corelib.ssr.ssrbool.or4", "Rocq.Corelib.Init.Logic.eq", "Rocq.Corelib.Init.Logic.ex",
      "Rocq.Corelib.Init.Logic.ex2", "Rocq.Corelib.Init.Logic.and", "Rocq.Corelib.Init.Logic.or",
      "Rocq.Corelib.Init.Specif.sig.qualityProp", "Rocq.Corelib.Init.Specif.sig2.qualityProp", "Rocq.Corelib.Init.Specif.sig", "Rocq.Corelib.Init.Specif.sig2",
      "Rocq.Corelib.Init.Specif.sigT", "Rocq.Corelib.Init.Specif.sigT2"] do
    for d in ← getLCtx do
      unless d.isImplementationDetail do
        let ty ← whnf d.type
        if (ty.getAppFn.constName?.getD Name.anonymous).toString == name then
          let gs ← g.cases d.fvarId
          replaceMainGoal (gs.toList.map (·.mvarId))
          return
  throwError "No source hypothesis to eliminate"

syntax (name := trySSRStatementProof) "#try_ssrb_statement_proof " ident ident num : command
@[command_elab trySSRStatementProof] def elabTrySSRStatementProof : CommandElab := fun stx => do
  liftTermElabM do
    let source := stx[1].getId
    let target := stx[2].getId
    let t0 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | ssrb_cases_data | constructor))
    let t1 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | ssrb_cases_eq | constructor))
    let t2 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | ssrb_cases_data | (solve_by_elim) | constructor))
    let t3 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | ssrb_cases_eq | (solve_by_elim) | constructor))
    let iffProof ← `(tactic| (
      repeat' (intro h)
      constructor
      · intro e
        cases e
        repeat' constructor
      · intro e
        repeat' (first | assumption | rfl | (intro h) | ssrb_cases_data | constructor)))
    let normalized ← `(tactic| (unfold $(mkIdent source); simp only [NativeBridge.Incremental.not_agrees, NativeBridge.Incremental.false_agrees, NativeBridge.Incremental.and_agrees, NativeBridge.Incremental.or_agrees, NativeBridge.Incremental.iff_agrees, NativeBridge.is_true_agrees, NativeBridge.Incremental.bool_eq_native, NativeBridge.Incremental.boolTo_false, NativeBridge.Incremental.boolTo_true, NativeBridge.Incremental.SSRBoolLogic.and3_agrees, NativeBridge.Incremental.SSRBoolLogic.and4_agrees, NativeBridge.Incremental.SSRBoolLogic.and5_agrees, NativeBridge.Incremental.SSRBoolLogic.or3_agrees, NativeBridge.Incremental.SSRBoolLogic.or4_agrees, NativeBridge.Incremental.bool_forall_native, NativeBridge.negb_agrees, NativeBridge.bool_to_of, NativeBridge.bool_of_to, NativeBridge.andb_agrees, NativeBridge.orb_agrees, NativeBridge.eq_correspondence]; grind))
    let normalizedMore ← `(tactic| (unfold $(mkIdent source); simp only [NativeBridge.Incremental.not_agrees, NativeBridge.Incremental.false_agrees, NativeBridge.Incremental.and_agrees, NativeBridge.Incremental.or_agrees, NativeBridge.Incremental.iff_agrees, NativeBridge.is_true_agrees, NativeBridge.Incremental.bool_eq_native, NativeBridge.Incremental.bool_equality_native, NativeBridge.Incremental.reflect_arrow_native, NativeBridge.Incremental.bool_rec_native, NativeBridge.Incremental.boolTo_false, NativeBridge.Incremental.boolTo_true, NativeBridge.Incremental.SSRBoolLogic.and3_agrees, NativeBridge.Incremental.SSRBoolLogic.and4_agrees, NativeBridge.Incremental.SSRBoolLogic.and5_agrees, NativeBridge.Incremental.SSRBoolLogic.or3_agrees, NativeBridge.Incremental.SSRBoolLogic.or4_agrees, NativeBridge.Incremental.bool_forall_native, NativeBridge.negb_agrees, NativeBridge.bool_to_of, NativeBridge.bool_of_to, NativeBridge.andb_agrees, NativeBridge.orb_agrees, NativeBridge.eq_correspondence]; grind))
    let tactics := if stx[3].isNatLit? == some 0 then #[t0,t1,t2,t3,iffProof] else if stx[3].isNatLit? == some 1 then #[normalized,t0,t1,t2,t3,iffProof] else #[normalizedMore,t0,t1,t2,t3,iffProof]
    let mut messages : Array String := #[]
    for tactic in tactics do
      let saved ← saveState
      try
        let ci ← getConstInfo source
        let type ← forallTelescope ci.type fun args result => do
          unless result == .sort .zero do throwError "Not a statement"
          mkForallFVars args (mkAppN (mkConst source (ci.levelParams.map Level.param)) args)
        let goal ← mkFreshExprMVar type
        let remaining ← Tactic.run goal.mvarId! (Tactic.evalTactic tactic)
        unless remaining.isEmpty do throwError "Unsolved goals"
        let value ← instantiateMVars goal
        if value.hasMVar then throwError "Unsolved metavariable"
        let decl := Declaration.thmDecl {name:=target,levelParams:=ci.levelParams,type:=type,value:=value}
        match (← getEnv).addDeclCore 200000 2048 decl none true with
        | .ok _ => pure ()
        | .error _ => throwError "Kernel rejected"
        addDecl decl
        let axioms ← Lean.collectAxioms target
        unless axioms.all (fun n => [`propext,`Quot.sound,`Classical.choice].contains n) do
          throwError "Unexpected axiom: {axioms}"
        let j := Json.mkObj [("source",.str source.toString),("proof",.str target.toString),
          ("success",.bool true),("axioms",.arr (axioms.map (fun n => .str n.toString)))]
        logInfo m!"CONDITIONAL_PROOF {j.compress}"
        return
      catch ex =>
        let msg ← ex.toMessageData.toString
        saved.restore
        messages := messages.push msg
    throwError "All SSR proof attempts failed for {source}: {messages}"


syntax (name := closeSSRBoolProof) "#close_ssrb_proof " ident : command
@[command_elab closeSSRBoolProof] def elabCloseSSRBoolProof : CommandElab := fun stx => do
  liftTermElabM do
    let source := stx[1].getId
    let ci ← getConstInfo source
    let ls := ci.levelParams.map Level.param
    let mut ty := ci.type
    let mut witnesses : Array Expr := #[]
    while let .forallE _ domain body _ := ty do
      let some dependency := domain.getAppFn.constName? | throwError "Non-constant prerequisite"
      let witnessName := ("NativeBridge.Incremental.SSRBoolWitnesses.closed." ++ dependency.toString).toName
      let witness ← mkConstWithFreshMVarLevels witnessName
      unless ← isDefEq (← inferType witness) domain do throwError "Witness type mismatch for {dependency}"
      witnesses := witnesses.push (← instantiateMVars witness)
      ty := body.instantiate1 witness
    unless ty == .sort .zero do throwError "Not a statement"
    let proposition := mkAppN (mkConst source ls) witnesses
    let conditionalName := ("NativeBridge.Incremental.SSRBoolWitnesses.conditional." ++ source.toString).toName
    let value := mkAppN (mkConst conditionalName ls) witnesses
    let closedName := ("NativeBridge.Incremental.SSRBoolWitnesses.closed." ++ source.toString).toName
    addDecl (.thmDecl {name:=closedName,levelParams:=ci.levelParams,type:=proposition,value:=value})
    let axs ← Lean.collectAxioms closedName
    unless axs.all (fun n => [`propext,`Quot.sound,`Classical.choice].contains n) do throwError "Unexpected witness axiom: {axs}"
    logInfo m!"CLOSED_SSRBOOL_PROOF {closedName}"

#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_3.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_and2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_and2__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_and3__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_and3__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_and4__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_and4__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_and5__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_and5__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_5.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_5.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_6.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_6.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_7.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_7.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_8.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_8.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_5.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_5.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_6.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_6.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_7.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_7.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_8.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_8.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_9.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_9.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_10.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_10.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_11.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_11.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_12.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_12.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_13.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_13.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_14.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_14.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_15.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_15.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_16.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_16.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_5.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_5.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_6.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_6.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_7.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_7.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_8.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_8.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_9.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_9.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_10.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_10.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_11.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_11.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_12.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_12.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_13.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_13.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_14.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_14.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_15.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_15.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_16.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_16.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_17.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_17.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_18.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_18.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_19.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_19.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_20.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_20.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_21.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_21.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_22.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_22.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_23.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_23.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_24.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_24.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_25.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_25.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_26.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_26.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_27.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_27.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_28.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_28.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_29.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_29.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_30.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_30.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_31.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_31.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_32.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_32.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_2.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.is_true_true.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.is_true_true.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.canLR_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.canLR_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.canRL_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.canRL_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.decP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.decP__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.equivP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.equivP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.expose_mem_pred__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.expose_mem_pred__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.expose_simpl_pred__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.expose_simpl_pred__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_2.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in1T__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in1T__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in1T.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in1T.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in1W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in1W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in1W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in1W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in1_sig__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in1_sig__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in1_sig.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in1_sig.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in2T__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in2T__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in2T.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in2T.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in2W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in2W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in2W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in2W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in2_sig__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in2_sig__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in2_sig.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in2_sig.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in3T__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in3T__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in3T.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in3T.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in3W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in3W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in3W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in3W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in3_sig__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in3_sig__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in3_sig.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in3_sig.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inT_bij.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inT_bij.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1S__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1S__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_on1S.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_on1S.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_on1W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_on1W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1lS__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1lS__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on1lW__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on1lW__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on2S__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on2S__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_on2S.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_on2S.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_on2W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_on2W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_on2W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_on2W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_onS_can__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_onS_can__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.in_onW_can__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.in_onW_can__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_5.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_5.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_2.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_1.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1S.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1S.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1S_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1S_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1T.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1T.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1W_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1W_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lS.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lS.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lT.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lT.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lW.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lW.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on2S.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on2S.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on2T.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on2T.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on2W.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on2W.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on2W_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on2W_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onS_can.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onS_can.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onT_bij.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onT_bij.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onW_can.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onW_can.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_4.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_2.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_5.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_5.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4.statement 1
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_1.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_2.statement 2
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_3.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_3.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_2.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_2.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement 0
#try_ssrb_statement_proof RocqPending.Corelib.ssr.ssrbool.subon_bij.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.RocqPending.Corelib.ssr.ssrbool.subon_bij.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.unlessL__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.unlessL__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.unlessR__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.unlessR__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.unless_contra__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.unless_contra__rocq2lean_obligation_1.statement 0
#try_ssrb_statement_proof Rocq.Corelib.ssr.ssrbool.unless_sym__rocq2lean_obligation_1.statement NativeBridge.Incremental.SSRBoolWitnesses.conditional.Rocq.Corelib.ssr.ssrbool.unless_sym__rocq2lean_obligation_1.statement 0

#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_and2__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_and3__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_and4__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_and5__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_5.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_6.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_7.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_8.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_5.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_6.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_7.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_8.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_9.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_10.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_11.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_12.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_13.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_14.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_15.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_16.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_5.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_6.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_7.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_8.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_9.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_10.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_11.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_12.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_13.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_14.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_15.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_16.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_17.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_18.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_19.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_20.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_21.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_22.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_23.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_24.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_25.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_26.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_27.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_28.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_29.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_30.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_31.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_32.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.is_true_true.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.canLR_in__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.canRL_in__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.decP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.equivP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_3.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.expose_mem_pred__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.expose_simpl_pred__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_3.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in1T__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in1T.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in1W__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in1W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in1_sig__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in1_sig.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in2T__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in2T.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in2W__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in2W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in2_sig__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in2_sig.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in3T__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in3T.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in3W__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in3W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in3_sig__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in3_sig.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inT_bij.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1S__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_on1S.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1W__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_on1W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1lS__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on1lW__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on2S__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_on2S.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_on2W__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_on2W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_onS_can__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.in_onW_can__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_3.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_3.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_4.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_5.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.norP__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1S.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1S_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1T.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1W_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lS.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lT.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lW.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on2S.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on2T.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on2W.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on2W_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onS_can.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onT_bij.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onW_can.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_3.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_5.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_2.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_3.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_1.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_2.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement
#close_ssrb_proof RocqPending.Corelib.ssr.ssrbool.subon_bij.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.unlessL__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.unlessR__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.unless_contra__rocq2lean_obligation_1.statement
#close_ssrb_proof Rocq.Corelib.ssr.ssrbool.unless_sym__rocq2lean_obligation_1.statement
