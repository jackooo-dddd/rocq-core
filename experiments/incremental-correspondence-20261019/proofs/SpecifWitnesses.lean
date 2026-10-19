import SpecifNormalization
open Lean Meta Elab Command Tactic
set_option maxHeartbeats 800000
set_option maxRecDepth 2048
elab "source_cases_data" : tactic => withMainContext do
  let g ← getMainGoal
  for d in ← getLCtx do
    unless d.isImplementationDetail do
      let ty ← whnf d.type
      if ["Rocq.Corelib.Init.Logic.eq", "Rocq.Corelib.Init.Logic.ex", "Rocq.Corelib.Init.Logic.ex2",
          "Rocq.Corelib.Init.Specif.sig.qualityProp", "Rocq.Corelib.Init.Specif.sig2.qualityProp", "Rocq.Corelib.Init.Specif.sig", "Rocq.Corelib.Init.Specif.sig2", "Rocq.Corelib.Init.Specif.sigT", "Rocq.Corelib.Init.Specif.sigT2", "Rocq.Corelib.Init.Logic.and", "Rocq.Corelib.Init.Logic.or"].contains (ty.getAppFn.constName?.getD Name.anonymous).toString then
        let gs ← g.cases d.fvarId
        replaceMainGoal (gs.toList.map (·.mvarId))
        return
  throwError "No source hypothesis to eliminate"
elab "source_cases_eq" : tactic => withMainContext do
  let g ← getMainGoal
  for name in ["Rocq.Corelib.Init.Logic.eq", "Rocq.Corelib.Init.Logic.ex",
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

namespace NativeBridge.Incremental.SpecifWitnessHints
open NativeBridge.Incremental
theorem choice : Rocq.Corelib.Init.Specif.Choice__rocq2lean_obligation_1.statement := by
  intro S S' R H z
  exact (subtypeTo (H z)).property
theorem boolChoice : Rocq.Corelib.Init.Specif.bool_choice__rocq2lean_obligation_1.statement := by
  intro S R1 R2 H x
  cases H x with
  | left p => exact .or_introl _ _ (.conj _ _ (.eq_refl _ _) p)
  | right p => exact .or_intror _ _ (.conj _ _ (.eq_refl _ _) p)
theorem dependentChoice : Rocq.Corelib.Init.Specif.dependent_choice__rocq2lean_obligation_1.statement := by
  intro X R H x0
  constructor
  · constructor
  · intro n
    exact (subtypeTo (H _)).property
end NativeBridge.Incremental.SpecifWitnessHints


syntax (name := tryStatementProof) "#try_statement_proof " ident ident : command
@[command_elab tryStatementProof] def elabTryStatementProof : CommandElab := fun stx => do
  liftTermElabM do
    let source := stx[1].getId
    let target := stx[2].getId
    let t0 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | source_cases_data | constructor))
    let t1 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | source_cases_eq | constructor))
    let t2 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | source_cases_data | (solve_by_elim) | constructor))
    let t3 ← `(tactic| repeat' (first | assumption | rfl | (intro h) | source_cases_eq | (solve_by_elim) | constructor))
    let hints ← `(tactic| first | exact NativeBridge.Incremental.SpecifWitnessHints.choice | exact NativeBridge.Incremental.SpecifWitnessHints.boolChoice | exact NativeBridge.Incremental.SpecifWitnessHints.dependentChoice)
    let iffProof ← `(tactic| (
      repeat' (intro h)
      constructor
      · intro e
        cases e
        repeat' constructor
      · intro e
        repeat' (first | assumption | rfl | (intro h) | source_cases_data | constructor)))
    let tactics := #[hints,t0,t1,t2,t3,iffProof]
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
        addDecl (.thmDecl {name:=target,levelParams:=ci.levelParams,type:=type,value:=value})
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
    throwError "All proof attempts failed for {source}: {messages}"

syntax (name := closeSpecifProof) "#close_specif_proof " ident : command
@[command_elab closeSpecifProof] def elabCloseSpecifProof : CommandElab := fun stx => do
  liftTermElabM do
    let source := stx[1].getId
    let ci ← getConstInfo source
    let ls := ci.levelParams.map Level.param
    let mut ty := ci.type
    let mut witnesses : Array Expr := #[]
    while let .forallE _ domain body _ := ty do
      let some dependency := domain.getAppFn.constName? | throwError "Non-constant prerequisite"
      let witnessName := ("NativeBridge.Incremental.SpecifWitnesses.closed." ++ dependency.toString).toName
      let witness ← mkConstWithFreshMVarLevels witnessName
      unless ← isDefEq (← inferType witness) domain do throwError "Witness type mismatch for {dependency}"
      witnesses := witnesses.push (← instantiateMVars witness)
      ty := body.instantiate1 witness
    unless ty == .sort .zero do throwError "Not a statement"
    let proposition := mkAppN (mkConst source ls) witnesses
    let conditionalName := ("NativeBridge.Incremental.SpecifWitnesses.conditional." ++ source.toString).toName
    let value := mkAppN (mkConst conditionalName ls) witnesses
    let closedName := ("NativeBridge.Incremental.SpecifWitnesses.closed." ++ source.toString).toName
    addDecl (.thmDecl {name:=closedName,levelParams:=ci.levelParams,type:=proposition,value:=value})
    let axs ← Lean.collectAxioms closedName
    unless axs.isEmpty do throwError "Closed Logic witness has axioms: {axs}"
    logInfo m!"CLOSED_SPECIF_PROOF {closedName}"
#try_statement_proof Rocq.Corelib.Init.Specif.Choice__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.Choice__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.bool_choice__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.bool_choice__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.dependent_choice__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.dependent_choice__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist2_curried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist2_curried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_curried__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_curried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.sig_of_sig2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.sig_of_sig2__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_l.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_l.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_r__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_r__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_r__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_r.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_r.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist2_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist2_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist2_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist2_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT2_curried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT2_curried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT2_l.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT2_l.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT2_r.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT2_r.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_curried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_curried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_curried_map__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_curried_map__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_curried_map__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_curried_map__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_curried_trans__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_curried_trans__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_curried_trans__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_curried_trans__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_l.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_l.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_existT_r.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_existT_r.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist_curried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist_curried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist_curried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist_curried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist_l__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist_l__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist_l__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist_l.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist_l.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist_r__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist_r.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist_r.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_exist_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_exist_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_5.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_5.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_5.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_5.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement
#try_statement_proof Rocq.Corelib.Init.Specif.proj2_sig.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.proj2_sig.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj3_sig.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj3_sig.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj3_sig_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj3_sig_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj3_sig_eq__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj3_sig_eq__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_4.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sigT.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sigT.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sigT2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sigT2.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sigT2_ind__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sigT2_ind__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sigT2_ind_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sigT2_ind_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.projT2_of_sigT2_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.projT2_of_sigT2_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.projT3_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.projT3_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.projT3_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.projT3_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sigT_ind__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sigT_ind__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sigT_ind_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sigT_ind_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.projT1_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.projT1_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.projT2_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.projT2_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.projT2_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.projT2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig_ind.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig_ind.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_3.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.proj1_sig_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.proj1_sig_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.proj2_sig_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.proj2_sig_eq__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.proj2_sig_eq__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.proj2_sig_eq__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried_iff__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_uncurried_iff__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried_iff__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.eq_sig_uncurried_iff__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement
#try_statement_proof Rocq.Corelib.Init.Specif.rew_sig__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.rew_sig__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.rew_sig.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.rew_sig.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.rew_sig2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.rew_sig2__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.rew_sig2__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.rew_sig2__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.rew_sig2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.rew_sig2.statement
#try_statement_proof Rocq.Corelib.Init.Specif.rew_sigT__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.rew_sigT__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.rew_sigT.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.rew_sigT.statement
#try_statement_proof Rocq.Corelib.Init.Specif.rew_sigT2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.rew_sigT2__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.rew_sigT2__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.rew_sigT2__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.rew_sigT2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.rew_sigT2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.sig2_eta__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.sig2_eta__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.sig2_eta__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.sig2_eta__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.sig2_eta.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.sig2_eta.statement
#try_statement_proof Rocq.Corelib.Init.Specif.sig2_of_sigT2__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.sig2_of_sigT2__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Specif.sig2_of_sigT2__rocq2lean_obligation_2.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.sig2_of_sigT2__rocq2lean_obligation_2.statement
#try_statement_proof Rocq.Corelib.Init.Specif.sig_eta__rocq2lean_obligation_1.statement NativeBridge.Incremental.SpecifWitnesses.conditional.Rocq.Corelib.Init.Specif.sig_eta__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Specif.sig_eta.statement NativeBridge.Incremental.SpecifWitnesses.conditional.RocqPending.Corelib.Init.Specif.sig_eta.statement
#close_specif_proof Rocq.Corelib.Init.Specif.Choice__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.bool_choice__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.dependent_choice__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist2_curried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_curried__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.sig_of_sig2__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_l__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_l.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_r__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_r__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_r.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist2_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist2_uncurried__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT2_curried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT2_l.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT2_r.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_curried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_congr__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_curried_map__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_curried_map__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_curried_trans__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_curried_trans__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_l.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_existT_r.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist_curried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist_curried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist_l__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist_l__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist_l.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist_r__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist_r.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_exist_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind__rocq2lean_obligation_5.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried__rocq2lean_obligation_5.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement
#close_specif_proof Rocq.Corelib.Init.Specif.proj2_sig.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj3_sig.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj3_sig_eq__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj3_sig_eq__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff__rocq2lean_obligation_4.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sigT.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sigT2.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sigT2_ind__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sigT2_ind_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.projT2_of_sigT2_eq__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.projT3_eq__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.projT3_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sigT_ind__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sigT_ind_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.projT1_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.projT2_eq__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.projT2_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig_ind__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig_ind.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried__rocq2lean_obligation_3.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.proj1_sig_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.proj2_sig_eq__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.proj2_sig_eq__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried_iff__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.eq_sig_uncurried_iff__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement
#close_specif_proof Rocq.Corelib.Init.Specif.rew_sig__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.rew_sig.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.rew_sig2__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.rew_sig2__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.rew_sig2.statement
#close_specif_proof Rocq.Corelib.Init.Specif.rew_sigT__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.rew_sigT.statement
#close_specif_proof Rocq.Corelib.Init.Specif.rew_sigT2__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.rew_sigT2__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.rew_sigT2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.sig2_eta__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.sig2_eta__rocq2lean_obligation_2.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.sig2_eta.statement
#close_specif_proof Rocq.Corelib.Init.Specif.sig2_of_sigT2__rocq2lean_obligation_1.statement
#close_specif_proof Rocq.Corelib.Init.Specif.sig2_of_sigT2__rocq2lean_obligation_2.statement
#close_specif_proof Rocq.Corelib.Init.Specif.sig_eta__rocq2lean_obligation_1.statement
#close_specif_proof RocqPending.Corelib.Init.Specif.sig_eta.statement
