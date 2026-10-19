import EqualityTransport
open Lean Meta Elab Command Tactic
set_option maxHeartbeats 200000
set_option maxRecDepth 2048
elab "source_cases" : tactic => withMainContext do
  let g ← getMainGoal
  for d in ← getLCtx do
    unless d.isImplementationDetail do
      let ty ← whnf d.type
      if ["Rocq.Corelib.Init.Logic.eq", "Rocq.Corelib.Init.Logic.ex", "Rocq.Corelib.Init.Logic.ex2",
          "Rocq.Corelib.Init.Logic.and", "Rocq.Corelib.Init.Logic.or"].contains (ty.getAppFn.constName?.getD Name.anonymous).toString then
        let gs ← g.cases d.fvarId
        replaceMainGoal (gs.toList.map (·.mvarId))
        return
  throwError "No source hypothesis to eliminate"
syntax (name := tryStatementProof) "#try_statement_proof " ident ident : command
@[command_elab tryStatementProof] def elabTryStatementProof : CommandElab := fun stx => do
  liftTermElabM do
    let source := stx[1].getId
    let target := stx[2].getId
    let saved ← saveState
    try
      let ci ← getConstInfo source
      let type ← forallTelescope ci.type fun args result => do
        unless result == .sort .zero do throwError "Not a Prop-valued statement"
        mkForallFVars args (mkAppN (mkConst source (ci.levelParams.map Level.param)) args)
      let goal ← mkFreshExprMVar type
      let tactic ← `(tactic| first
        | solve | repeat' (first | assumption | rfl | (intro h) | source_cases | constructor)
        | solve | repeat' (first | assumption | rfl | (intro h) | source_cases | (solve_by_elim) | constructor))
      let remaining ← Tactic.run goal.mvarId! (Tactic.evalTactic tactic)
      unless remaining.isEmpty do
        throwError "Unsolved goals: {← remaining.mapM (fun g => ppGoal g)}"
      let value ← instantiateMVars goal
      if value.hasMVar then throwError "Unsolved metavariable"
      addDecl (.thmDecl {name:=target,levelParams:=ci.levelParams,type:=type,value:=value})
      let axioms ← Lean.collectAxioms target
      unless axioms.all (fun n => [`propext,`Quot.sound,`Classical.choice].contains n) do
        throwError "Unexpected axiom"
      let j := Json.mkObj [("source",.str source.toString),("proof",.str target.toString),
        ("success",.bool true),("type",.str (← ppExpr type).pretty),
        ("axioms",.arr (axioms.map (fun n => .str n.toString)))]
      logInfo m!"CONDITIONAL_PROOF {j.compress}"
    catch ex =>
      saved.restore
      throw ex

syntax (name := closeLogicProof) "#close_logic_proof " ident : command
@[command_elab closeLogicProof] def elabCloseLogicProof : CommandElab := fun stx => do
  liftTermElabM do
    let source := stx[1].getId
    let ci ← getConstInfo source
    let ls := ci.levelParams.map Level.param
    let mut ty := ci.type
    let mut witnesses : Array Expr := #[]
    while let .forallE _ domain body _ := ty do
      let some dependency := domain.getAppFn.constName? | throwError "Non-constant prerequisite"
      let witnessName := ("NativeBridge.Incremental.LogicWitnesses.closed." ++ dependency.toString).toName
      let witness ← mkConstWithFreshMVarLevels witnessName
      unless ← isDefEq (← inferType witness) domain do throwError "Witness type mismatch for {dependency}"
      witnesses := witnesses.push (← instantiateMVars witness)
      ty := body.instantiate1 witness
    unless ty == .sort .zero do throwError "Not a statement"
    let proposition := mkAppN (mkConst source ls) witnesses
    let conditionalName := ("NativeBridge.Incremental.LogicWitnesses.conditional." ++ source.toString).toName
    let value := mkAppN (mkConst conditionalName ls) witnesses
    let closedName := ("NativeBridge.Incremental.LogicWitnesses.closed." ++ source.toString).toName
    addDecl (.thmDecl {name:=closedName,levelParams:=ci.levelParams,type:=proposition,value:=value})
    let axs ← Lean.collectAxioms closedName
    unless axs.isEmpty do throwError "Closed Logic witness has axioms: {axs}"
    logInfo m!"CLOSED_LOGIC_PROOF {closedName}"
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_eta__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_eta__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_hprop__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_hprop__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop_iff__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_hprop_iff__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop_iff__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_hprop_iff__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_proj2_of_ex2_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_proj2_of_ex2_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_proj3_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_proj3_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_4.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried_iff__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_uncurried_iff__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried_iff__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex2_uncurried_iff__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_eta__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_eta__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_eta.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_eta.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_ind__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_ind__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_ind__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_ind__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_ind.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_ind.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_ind_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_ind_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_4.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_4.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_4.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro_hprop__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro_hprop__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro_hprop__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro_hprop__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro_l__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_l__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_l__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro_r__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_r__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_r__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_3.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_3.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_proj1_eq.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_proj1_eq.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_proj2_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_proj2_eq__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_uncurried__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_uncurried__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_ex_uncurried_iff__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_ex_uncurried_iff__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_id_comm_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_id_comm_l__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_id_comm_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_id_comm_r__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_refl_map_distr__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_refl_map_distr__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_refl_map_distr__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_refl_map_distr__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_sym_map_distr__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_sym_map_distr__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_sym_map_distr__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_sym_map_distr__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_assoc__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_assoc__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_assoc__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_assoc__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_map__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_map__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_map.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_map.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_map_distr__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_map_distr__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_map_distr__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_map_distr__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_refl_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_refl_l__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_refl_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_refl_r__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_rew_distr__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_rew_distr__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_sym_distr__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_sym_distr__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_sym_distr__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_sym_distr__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_l__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_sym_inv_l__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_l__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_sym_inv_l__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_r__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_sym_inv_r__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_r__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.eq_trans_sym_inv_r__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex2_eta__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex2_eta__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.ex2_eta.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.ex2_eta.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_eta__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_eta__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.ex_eta.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.ex_eta.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_of_ex2_eq__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_of_ex2_eq__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.ex_of_ex2_eq__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.ex_of_ex2_eq__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement
#try_statement_proof Rocq.Corelib.Init.Logic.f_equal_compose__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.f_equal_compose__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.f_equal_compose__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.f_equal_compose__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.f_equal_compose.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.f_equal_compose.statement
#try_statement_proof Rocq.Corelib.Init.Logic.f_equal_dep2__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.f_equal_dep2__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.f_equal_dep2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.f_equal_dep2.statement
#try_statement_proof Rocq.Corelib.Init.Logic.map_subst_map__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.map_subst_map__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.map_subst_map.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.map_subst_map.statement
#try_statement_proof Rocq.Corelib.Init.Logic.rew_compose__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.rew_compose__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_compose.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_compose.statement
#try_statement_proof Rocq.Corelib.Init.Logic.rew_ex__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.rew_ex__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.rew_ex__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.rew_ex__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_ex.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_ex.statement
#try_statement_proof Rocq.Corelib.Init.Logic.rew_ex2__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.rew_ex2__rocq2lean_obligation_1.statement
#try_statement_proof Rocq.Corelib.Init.Logic.rew_ex2__rocq2lean_obligation_2.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.rew_ex2__rocq2lean_obligation_2.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_ex2.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_ex2.statement
#try_statement_proof Rocq.Corelib.Init.Logic.rew_map__rocq2lean_obligation_1.statement NativeBridge.Incremental.LogicWitnesses.conditional.Rocq.Corelib.Init.Logic.rew_map__rocq2lean_obligation_1.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_map.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_map.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_opp_l.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_opp_l.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_opp_r.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_opp_r.statement
#try_statement_proof RocqPending.Corelib.Init.Logic.rew_swap.statement NativeBridge.Incremental.LogicWitnesses.conditional.RocqPending.Corelib.Init.Logic.rew_swap.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_eta__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop_iff__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_hprop_iff__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_proj2_of_ex2_eq__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_proj3_eq__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2__rocq2lean_obligation_4.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_l__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_r__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried_iff__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex2_uncurried_iff__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_eta__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_eta.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_ind__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_ind__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_ind.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_ind_uncurried__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep__rocq2lean_obligation_4.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried__rocq2lean_obligation_4.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro_hprop__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro_hprop__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro_l__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_l__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro_r__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_r__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried__rocq2lean_obligation_3.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_proj1_eq.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_proj2_eq__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_uncurried__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_ex_uncurried_iff__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_id_comm_l__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_id_comm_r__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_refl_map_distr__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_refl_map_distr__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_sym_map_distr__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_sym_map_distr__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_assoc__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_assoc__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_map__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_map.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_map_distr__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_map_distr__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_refl_l__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_refl_r__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_rew_distr__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_sym_distr__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_sym_distr__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_l__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_l__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_r__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.eq_trans_sym_inv_r__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex2_eta__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.ex2_eta.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_eta__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.ex_eta.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_of_ex2_eq__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.ex_of_ex2_eq__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement
#close_logic_proof Rocq.Corelib.Init.Logic.f_equal_compose__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.f_equal_compose__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.f_equal_compose.statement
#close_logic_proof Rocq.Corelib.Init.Logic.f_equal_dep2__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.f_equal_dep2.statement
#close_logic_proof Rocq.Corelib.Init.Logic.map_subst_map__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.map_subst_map.statement
#close_logic_proof Rocq.Corelib.Init.Logic.rew_compose__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_compose.statement
#close_logic_proof Rocq.Corelib.Init.Logic.rew_ex__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.rew_ex__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_ex.statement
#close_logic_proof Rocq.Corelib.Init.Logic.rew_ex2__rocq2lean_obligation_1.statement
#close_logic_proof Rocq.Corelib.Init.Logic.rew_ex2__rocq2lean_obligation_2.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_ex2.statement
#close_logic_proof Rocq.Corelib.Init.Logic.rew_map__rocq2lean_obligation_1.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_map.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_opp_l.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_opp_r.statement
#close_logic_proof RocqPending.Corelib.Init.Logic.rew_swap.statement
