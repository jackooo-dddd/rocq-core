import LogicNormalization
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
 unless !(← sourceRefs (mkConst `NativeBridge.ME)).isEmpty do
  throwError "Source-containing alias incorrectly classified as native"
 unless (← sourceRefs (mkConst `Bool)).isEmpty do
  throwError "Native Bool incorrectly classified as source-containing"


private def nativeProofCandidates (ty : Expr) : MetaM (Array Expr) := do
  let mut candidates : Array Expr := #[]
  let mut equalities : Array Expr := #[]
  for decl in ← getLCtx do
    unless decl.isImplementationDetail do
      let e := mkFVar decl.fvarId
      if (← isProof e) && (← sourceRefs decl.type).isEmpty then
        candidates := candidates.push e
        if decl.type.getAppFn.constName? == some `Eq then equalities := equalities.push e
        if decl.type.getAppFn.constName? == some `Exists then
          for helper in [`NativeBridge.Incremental.LogicNormalization.exProof,
              `NativeBridge.Incremental.LogicNormalization.ex2Proof] do
            try candidates := candidates.push (← mkAppM helper #[e]) catch _ => pure ()
  for e in equalities do
    try candidates := candidates.push (← mkAppM `Eq.symm #[e]) catch _ => pure ()
    if ty.getAppFn.constName? == some `Eq then
      let args := ty.getAppArgs
      if args.size == 3 then
        if let .app f _ := args[1]! then
          try candidates := candidates.push (← mkAppM `congrArg #[f,e]) catch _ => pure ()
    for f in equalities do
      try candidates := candidates.push (← mkAppM `Eq.trans #[e,f]) catch _ => pure ()
  return candidates

syntax (name := incrementalStatement) "#incremental_statement " ident : command
@[command_elab incrementalStatement] def elabIncrementalStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  let ls := di.levelParams.map Level.param
  let mut sourceApp := mkConst sourceName ls
  if di.type != .sort .zero then
    let closedName := ("NativeBridge.Incremental.LogicWitnesses.closed." ++ sourceName.toString).toName
    sourceApp ← inferType (mkConst closedName ls)
  let body := (mkAppN di.value sourceApp.getAppArgs).headBeta
  let wrapperName := ("NativeBridge.Incremental.LogicStatements.closed." ++ sourceName.toString).toName
  addDecl (.defnDecl {name:=wrapperName,levelParams:=di.levelParams,type:=.sort .zero,value:=sourceApp,hints:=.abbrev,safety:=.safe})
  let mut rules : SimpTheorems := {}
  for rule in ["NativeBridge.Incremental.LogicNormalization.proof_equality", "NativeBridge.Incremental.LogicNormalization.eq_exists", "NativeBridge.Incremental.LogicNormalization.proof_eq_family_forall", "NativeBridge.eq_correspondence", "NativeBridge.eqTo_of", "NativeBridge.eqOf_to", "NativeBridge.true_agrees", "NativeBridge.false_agrees", "NativeBridge.and_agrees", "NativeBridge.or_agrees", "NativeBridge.not_agrees", "NativeBridge.notT_agrees", "NativeBridge.iff_agrees", "NativeBridge.ex_agrees", "NativeBridge.ex2_agrees", "NativeBridge.inhabited_agrees", "NativeBridge.all_agrees", "NativeBridge.Incremental.LogicNormalization.eq_forall", "NativeBridge.Incremental.LogicNormalization.ex_forall", "NativeBridge.Incremental.LogicNormalization.ex2_forall", "NativeBridge.Incremental.LogicNormalization.and_forall", "NativeBridge.Incremental.LogicNormalization.unique_agrees", "NativeBridge.Incremental.LogicNormalization.uniqueness_agrees", "NativeBridge.Incremental.LogicNormalization.subrelation_agrees", "NativeBridge.Incremental.LogicNormalization.eq_rect_agrees", "NativeBridge.Incremental.LogicNormalization.eq_rect_r_agrees", "NativeBridge.Incremental.LogicNormalization.ex_proj1_agrees", "NativeBridge.Incremental.LogicNormalization.ex_proj1_of_ex2_agrees"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (r, _) ← Meta.simp body ctx
  -- Remove source terms inside proof-irrelevant native proof arguments only.
  -- A local native proof of exactly the same proposition must exist.
  let finalExpr ← Meta.transform r.expr (post := fun e => do
    if (← isProof e) && !(← sourceRefs e).isEmpty then
      let ty ← inferType e
      if (← sourceRefs ty).isEmpty then
        for decl in (← getLCtx) do
          unless decl.isImplementationDetail do
            let candidate := mkFVar decl.fvarId
            if (← isProof candidate) && (← sourceRefs decl.type).isEmpty &&
                (← isDefEq ty decl.type) && (← isDefEq e candidate) then
              return .done candidate

        for candidate in ← nativeProofCandidates ty do
          let candidate ← instantiateMVars candidate
          unless candidate.hasMVar do
            if (← isDefEq ty (← inferType candidate)) && (← sourceRefs candidate).isEmpty &&
                (← isDefEq e candidate) then
              return .done candidate
    return .done e)
  unless ← isDefEq r.expr finalExpr do throwError "Proof cleanup changed the statement"
  let nativeName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=finalExpr,hints:=.abbrev,safety:=.safe})
  let ty := mkApp2 (mkConst `Iff) sourceApp (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← r.getProof' body]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs finalExpr
  let text ← ppExpr finalExpr
  let j := Json.mkObj [("source_target",.str sourceName.toString),("certificate",.str certName.toString),
   ("native",.str nativeName.toString),("native_expression",.str text.pretty),
   ("remaining_source_symbols",.arr (remaining.map (fun x => .str x.toString))),
   ("full",.bool remaining.isEmpty)]
  logInfo m!"NATIVE_RESULT {j.compress}"

#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_eta.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_hprop.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_hprop_iff.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_ind.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_ind_uncurried.statement
#incremental_statement Rocq.Corelib.Init.Logic.eq_ex2_nondep.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_uncurried.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex2_uncurried_iff.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_eta.statement
#incremental_statement Rocq.Corelib.Init.Logic.eq_ex_hprop.statement
#incremental_statement Rocq.Corelib.Init.Logic.eq_ex_hprop_iff.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_ind.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_ind_uncurried.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro2.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro2_hprop_nondep.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro2_l.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro2_r.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro2_uncurried.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro_hprop.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro_l.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro_r.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_intro_uncurried.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_uncurried.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_ex_uncurried_iff.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_id_comm_l.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_id_comm_r.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_refl_map_distr.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_sym_map_distr.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_assoc.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_map.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_map_distr.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_refl_l.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_refl_r.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_rew_distr.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_sym_distr.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_l.statement
#incremental_statement RocqPending.Corelib.Init.Logic.eq_trans_sym_inv_r.statement
#incremental_statement RocqPending.Corelib.Init.Logic.ex2_eta.statement
#incremental_statement RocqPending.Corelib.Init.Logic.ex_eta.statement
#incremental_statement RocqPending.Corelib.Init.Logic.ex_of_ex2_eq.statement
#incremental_statement Rocq.Corelib.Init.Logic.ex_proj1_eq.statement
#incremental_statement Rocq.Corelib.Init.Logic.ex_proj1_of_ex2_eq.statement
#incremental_statement Rocq.Corelib.Init.Logic.ex_proj2.statement
#incremental_statement RocqPending.Corelib.Init.Logic.ex_proj2_eq.statement
#incremental_statement RocqPending.Corelib.Init.Logic.ex_proj2_of_ex2_eq.statement
#incremental_statement Rocq.Corelib.Init.Logic.ex_proj3.statement
#incremental_statement RocqPending.Corelib.Init.Logic.ex_proj3_eq.statement
#incremental_statement RocqPending.Corelib.Init.Logic.f_equal_compose.statement
#incremental_statement Rocq.Corelib.Init.Logic.f_equal_dep.statement
#incremental_statement RocqPending.Corelib.Init.Logic.f_equal_dep2.statement
#incremental_statement Rocq.Corelib.Init.Logic.forall_exists_coincide_unique_domain.statement
#incremental_statement Rocq.Corelib.Init.Logic.forall_exists_unique_domain_coincide.statement
#incremental_statement Rocq.Corelib.Init.Logic.map_subst.statement
#incremental_statement RocqPending.Corelib.Init.Logic.map_subst_map.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_compose.statement
#incremental_statement Rocq.Corelib.Init.Logic.rew_const.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_ex.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_ex2.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_map.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_opp_l.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_opp_r.statement
#incremental_statement RocqPending.Corelib.Init.Logic.rew_swap.statement
#incremental_statement Rocq.Corelib.Init.Logic.unique_existence.statement
