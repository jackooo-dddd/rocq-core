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
  for rule in RULE_NAMES do
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
