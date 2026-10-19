import PeanoBridge
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
 unless !(← sourceRefs (mkConst `NativeBridge.MN)).isEmpty do
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
  for rule in ["NativeBridge.eq_correspondence", "NativeBridge.nat_eq_native", "NativeBridge.nat_family_forall", "NativeBridge.nat_binary_family_forall", "NativeBridge.nat_inner_family_forall", "NativeBridge.nat_forall_correspondence", "NativeBridge.nat_exists_correspondence", "NativeBridge.natTo_of", "NativeBridge.natOf_to", "NativeBridge.natTo_zero", "NativeBridge.natTo_succ", "NativeBridge.true_agrees", "NativeBridge.false_agrees", "NativeBridge.not_agrees", "NativeBridge.peano_le_agrees", "NativeBridge.peano_lt_agrees", "NativeBridge.peano_ge_agrees", "NativeBridge.peano_gt_agrees", "NativeBridge.Incremental.PeanoBridge.pred_agrees", "NativeBridge.Incremental.PeanoBridge.add_agrees", "NativeBridge.Incremental.PeanoBridge.iteration_agrees", "NativeBridge.Incremental.PeanoBridge.isSucc_agrees", "NativeBridge.Incremental.PeanoBridge.mul_agrees", "NativeBridge.Incremental.PeanoBridge.min_agrees", "NativeBridge.Incremental.PeanoBridge.max_agrees"] do
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

#incremental_statement Rocq.Corelib.Init.Peano.O_S.statement
#incremental_statement Rocq.Corelib.Init.Peano.eq_S.statement
#incremental_statement Rocq.Corelib.Init.Peano.eq_add_S.statement
#incremental_statement Rocq.Corelib.Init.Peano.f_equal2_mult.statement
#incremental_statement Rocq.Corelib.Init.Peano.f_equal2_nat.statement
#incremental_statement Rocq.Corelib.Init.Peano.f_equal2_plus.statement
#incremental_statement Rocq.Corelib.Init.Peano.f_equal_nat.statement
#incremental_statement Rocq.Corelib.Init.Peano.f_equal_pred.statement
#incremental_statement Rocq.Corelib.Init.Peano.le_0_n.statement
#incremental_statement Rocq.Corelib.Init.Peano.le_S_n.statement
#incremental_statement Rocq.Corelib.Init.Peano.le_ind.statement
#incremental_statement Rocq.Corelib.Init.Peano.le_n_S.statement
#incremental_statement Rocq.Corelib.Init.Peano.le_pred.statement
#incremental_statement Rocq.Corelib.Init.Peano.le_sind.statement
#incremental_statement Rocq.Corelib.Init.Peano.max_l.statement
#incremental_statement Rocq.Corelib.Init.Peano.max_r.statement
#incremental_statement Rocq.Corelib.Init.Peano.min_l.statement
#incremental_statement Rocq.Corelib.Init.Peano.min_r.statement
#incremental_statement Rocq.Corelib.Init.Peano.mult_n_O.statement
#incremental_statement Rocq.Corelib.Init.Peano.mult_n_Sm.statement
#incremental_statement Rocq.Corelib.Init.Peano.n_Sn.statement
#incremental_statement Rocq.Corelib.Init.Peano.nat_case.statement
#incremental_statement Rocq.Corelib.Init.Peano.nat_double_ind.statement
#incremental_statement Rocq.Corelib.Init.Peano.nat_rect_plus.statement
#incremental_statement Rocq.Corelib.Init.Peano.nat_rect_succ_r.statement
#incremental_statement Rocq.Corelib.Init.Peano.not_eq_S.statement
#incremental_statement Rocq.Corelib.Init.Peano.plus_O_n.statement
#incremental_statement Rocq.Corelib.Init.Peano.plus_Sn_m.statement
#incremental_statement Rocq.Corelib.Init.Peano.plus_n_O.statement
#incremental_statement Rocq.Corelib.Init.Peano.plus_n_Sm.statement
#incremental_statement Rocq.Corelib.Init.Peano.pred_Sn.statement

run_cmd Lean.Elab.Command.liftTermElabM do
  let mut rows : Array Json := #[]
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.O_S.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.O_S"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_S.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.eq_S"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.eq_add_S.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.eq_add_S"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_mult.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.f_equal2_mult"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_nat.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.f_equal2_nat"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal2_plus.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.f_equal2_plus"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.f_equal_nat.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.f_equal_nat"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_0_n.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.le_0_n"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_S_n.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.le_S_n"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_ind.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.le_ind"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_n_S.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.le_n_S"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.le_sind.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.le_sind"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_l.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.max_l"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.max_r.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.max_r"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_l.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.min_l"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.min_r.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.min_r"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_O.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.mult_n_O"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.mult_n_Sm.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.mult_n_Sm"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.n_Sn.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.n_Sn"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_case.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.nat_case"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.nat_double_ind.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.nat_double_ind"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.not_eq_S.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.not_eq_S"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_O_n.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.plus_O_n"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_Sn_m.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.plus_Sn_m"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_O.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.plus_n_O"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  let ci ← getConstInfo `NativeBridge.Statements.Rocq.Corelib.Init.Peano.plus_n_Sm.statement.native
  let some v := ci.value? | throwError "Missing old target"
  let refs ← sourceRefs v
  rows := rows.push (Json.mkObj [("source",.str "Corelib.Init.Peano.plus_n_Sm"),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])
  IO.FS.writeFile "reports/Peano-baseline-target-audit.json" (Json.pretty (.arr rows))
