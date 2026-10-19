import DatatypeQuantifiers
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
  for rule in ["NativeBridge.Incremental.DatatypeNormalization.fullList_of_to", "NativeBridge.Incremental.DatatypeNormalization.fullList_to_of", "NativeBridge.Incremental.DatatypeNormalization.fullOption_of_to", "NativeBridge.Incremental.DatatypeNormalization.fullOption_to_of", "NativeBridge.Incremental.DatatypeNormalization.fullResult_of_to", "NativeBridge.Incremental.DatatypeNormalization.fullResult_to_of", "NativeBridge.Incremental.DatatypeNormalization.mechanical_eq", "NativeBridge.Incremental.DatatypeNormalization.mechanical_not", "NativeBridge.Incremental.DatatypeNormalization.mechanical_and", "NativeBridge.Incremental.DatatypeNormalization.mechanical_iff", "NativeBridge.Incremental.DatatypeNormalization.boolTo_true", "NativeBridge.Incremental.DatatypeNormalization.boolTo_false", "NativeBridge.Incremental.DatatypeNormalization.comparisonTo_eq", "NativeBridge.Incremental.DatatypeNormalization.comparisonTo_lt", "NativeBridge.Incremental.DatatypeNormalization.comparisonTo_gt", "NativeBridge.Incremental.DatatypeNormalization.unitTo_tt", "NativeBridge.Incremental.DatatypeNormalization.fullList_nil", "NativeBridge.Incremental.DatatypeNormalization.fullList_cons", "NativeBridge.Incremental.DatatypeNormalization.fullOption_some", "NativeBridge.Incremental.DatatypeNormalization.fullOption_none", "NativeBridge.Incremental.DatatypeNormalization.fullResult_ok", "NativeBridge.Incremental.DatatypeNormalization.fullResult_error", "NativeBridge.Incremental.DatatypeNormalization.pprod_pair", "NativeBridge.Incremental.DatatypeNormalization.psum_inl", "NativeBridge.Incremental.DatatypeNormalization.psum_inr", "NativeBridge.Incremental.DatatypeNormalization.pprod_fst", "NativeBridge.Incremental.DatatypeNormalization.pprod_snd", "NativeBridge.Incremental.DatatypeNormalization.boolSpec_agrees", "NativeBridge.Incremental.DatatypeNormalization.compareSpec_agrees", "NativeBridge.Incremental.DatatypeNormalization.compSpec_agrees", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_of_to", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_to_of", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_eq", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_lt", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_gt", "NativeBridge.Incremental.DatatypeNormalization.eq_rect_agrees", "NativeBridge.Incremental.DatatypeNormalization.eq_proof_forall", "NativeBridge.Incremental.DatatypeNormalization.pprod_transport", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_total_family_forall", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_total_forall", "NativeBridge.Incremental.DatatypeNormalization.reflect_of_to", "NativeBridge.Incremental.DatatypeNormalization.reflect_to_of", "NativeBridge.Incremental.DatatypeNormalization.reflect_total_family_forall", "NativeBridge.Incremental.DatatypeNormalization.reflect_total_forall", "NativeBridge.Incremental.DatatypeNormalization.reflect_true", "NativeBridge.Incremental.DatatypeNormalization.reflect_false", "NativeBridge.Incremental.DatatypeNormalization.compareSpecT_of_forall", "NativeBridge.Incremental.DatatypeNormalization.reflect_of_forall", "NativeBridge.Incremental.DatatypeQuantifiers.bool_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.bool_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.bool_forall", "NativeBridge.Incremental.DatatypeQuantifiers.bool_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.bool_eq", "NativeBridge.Incremental.DatatypeQuantifiers.comparison_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.comparison_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.comparison_forall", "NativeBridge.Incremental.DatatypeQuantifiers.comparison_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.comparison_eq", "NativeBridge.Incremental.DatatypeQuantifiers.unit_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.unit_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.unit_forall", "NativeBridge.Incremental.DatatypeQuantifiers.unit_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.unit_eq", "NativeBridge.Incremental.DatatypeQuantifiers.empty_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.empty_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.empty_forall", "NativeBridge.Incremental.DatatypeQuantifiers.empty_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.empty_eq", "NativeBridge.Incremental.DatatypeQuantifiers.list_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.list_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.list_forall", "NativeBridge.Incremental.DatatypeQuantifiers.list_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.list_eq", "NativeBridge.Incremental.DatatypeQuantifiers.option_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.option_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.option_forall", "NativeBridge.Incremental.DatatypeQuantifiers.option_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.option_eq", "NativeBridge.Incremental.DatatypeQuantifiers.result_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.result_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.result_forall", "NativeBridge.Incremental.DatatypeQuantifiers.result_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.result_eq", "NativeBridge.Incremental.DatatypeQuantifiers.prod_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.prod_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.prod_forall", "NativeBridge.Incremental.DatatypeQuantifiers.prod_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.prod_eq", "NativeBridge.Incremental.DatatypeQuantifiers.sum_of_to", "NativeBridge.Incremental.DatatypeQuantifiers.sum_to_of", "NativeBridge.Incremental.DatatypeQuantifiers.sum_forall", "NativeBridge.Incremental.DatatypeQuantifiers.sum_family_forall", "NativeBridge.Incremental.DatatypeQuantifiers.sum_eq", "NativeBridge.andb_agrees", "NativeBridge.orb_agrees", "NativeBridge.negb_agrees", "NativeBridge.xorb_agrees", "NativeBridge.implb_agrees", "NativeBridge.is_true_agrees", "NativeBridge.compOpp_agrees", "NativeBridge.eqTo_of", "NativeBridge.eqOf_to", "NativeBridge.Incremental.datatypes_IDProp_agrees"] do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (r, _) ← Meta.simp di.value ctx
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
    return .done e)
  unless ← isDefEq r.expr finalExpr do throwError "Proof cleanup changed the statement"
  let nativeName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=finalExpr,hints:=.abbrev,safety:=.safe})
  let ls := di.levelParams.map Level.param
  let ty := mkApp2 (mkConst `Iff) (mkConst sourceName ls) (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← r.getProof' di.value]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs finalExpr
  let text ← ppExpr finalExpr
  let j := Json.mkObj [("source_target",.str sourceName.toString),("certificate",.str certName.toString),
   ("native",.str nativeName.toString),("native_expression",.str text.pretty),
   ("remaining_source_symbols",.arr (remaining.map (fun x => .str x.toString))),
   ("full",.bool remaining.isEmpty)]
  logInfo m!"NATIVE_RESULT {j.compress}"

#incremental_statement Rocq.Corelib.Init.Datatypes.BoolSpec_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.BoolSpec_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompOpp_iff.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompOpp_inj.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompOpp_involutive.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompareSpecT_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompareSpecT_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompareSpec_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.CompareSpec_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.Empty_set_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.Empty_set_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.andb_prop.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.andb_true_intro.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.bool_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.bool_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.comparison_eq_stable.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.comparison_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.comparison_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.idProp.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.injective_projections.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.list_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.list_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.option_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.option_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.pair_equal_spec.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.prod_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.prod_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.reflect_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.reflect_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.result_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.result_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.rew_pair.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.sum_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.sum_sind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.surjective_pairing.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.unit_ind.statement
#incremental_statement Rocq.Corelib.Init.Datatypes.unit_sind.statement
