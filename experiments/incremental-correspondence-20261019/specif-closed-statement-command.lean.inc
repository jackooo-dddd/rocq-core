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


private partial def nativeProjections (e : Expr) (depth : Nat := 3) : MetaM (Array Expr) := do
  if depth == 0 then return #[]
  let ty ← whnf (← inferType e)
  let name := ty.getAppFn.constName?.getD Name.anonymous
  let projections : Array Name := if name == `Subtype then #[`Subtype.val,`Subtype.property]
    else if name == `PSigma then #[`PSigma.fst,`PSigma.snd]
    else if name == `PProd then #[`PProd.fst,`PProd.snd]
    else if name == `And then #[`And.left,`And.right]
    else #[]
  let mut out := #[]
  for projection in projections do
    try
      let value ← mkAppM projection #[e]
      if ← isProof value then out := out.push value
      out := out ++ (← nativeProjections value (depth-1))
    catch _ => pure ()
  return out

private partial def nativeProofCandidates (ty : Expr) : MetaM (Array Expr) := do
  let mut candidates : Array Expr := #[]
  let mut equalities : Array Expr := #[]
  for decl in ← getLCtx do
    unless decl.isImplementationDetail do
      let e := mkFVar decl.fvarId
      if (← sourceRefs decl.type).isEmpty then candidates := candidates ++ (← nativeProjections e)
      if (← isProof e) then
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
        if let .proj struct idx arg := args[1]! then
          let fn ← withLocalDeclD `x (← inferType arg) fun x =>
            mkLambdaFVars #[x] (Expr.proj struct idx x)
          try candidates := candidates.push (← mkAppM `congrArg #[fn,e]) catch _ => pure ()

    for f in equalities do
      try candidates := candidates.push (← mkAppM `Eq.trans #[e,f]) catch _ => pure ()
  if ty.isAppOfArity `Eq 3 then
    let args := ty.getAppArgs
    for decl in ← getLCtx do
      if decl.type.getAppFn.constName? == some `Exists then
        for helper in [`NativeBridge.Incremental.SpecifConditionalNormalization.nativeSubtypeExistsEq,
            `NativeBridge.Incremental.SpecifConditionalNormalization.nativePSigmaExistsEq,
            `NativeBridge.Incremental.SpecifConditionalNormalization.nativePSigma2ExistsEq] do
          try candidates := candidates.push (← mkAppM helper #[args[1]!,args[2]!,mkFVar decl.fvarId]) catch _ => pure ()
    for p in equalities do
      try candidates := candidates.push (← mkAppM `NativeBridge.Incremental.SpecifConditionalNormalization.nativeSubtypeEq #[args[1]!,args[2]!,p]) catch _ => pure ()
      for q in equalities do
        try candidates := candidates.push (← mkAppM `NativeBridge.Incremental.SpecifConditionalNormalization.nativePSigmaEq #[args[1]!,args[2]!,p,q]) catch _ => pure ()
        for r in equalities do
          try candidates := candidates.push (← mkAppM `NativeBridge.Incremental.SpecifConditionalNormalization.nativePSigma2Eq #[args[1]!,args[2]!,p,q,r]) catch _ => pure ()
  let ta := ty.getAppArgs
  if ta.size >= 2 then
    let transported := ta.back!
    if transported.isAppOfArity `Eq.rec 6 then
      let ra := transported.getAppArgs
      let family? ← lambdaTelescope ra[2]! fun bs body => do
        unless bs.size == 2 do return none
        if body.containsFVar bs[1]!.fvarId! then return none
        return some (← mkLambdaFVars #[bs[0]!] body)
      if let some family := family? then
        let predicate := mkAppN ty.getAppFn (ta.extract 0 (ta.size-2))
        for p in candidates do
          try
            let proof ← mkAppM `NativeBridge.Incremental.SpecifConditionalNormalization.nativeTransportProperty
              #[ra[0]!,family,predicate,ra[1]!,ra[4]!,ra[5]!,ra[3]!,p]
            candidates := candidates.push proof
          catch _ => pure ()
  if ty.isAppOfArity `And 2 then
    let args := ty.getAppArgs
    for left in ← nativeProofCandidates args[0]! do
      if ← isDefEq (← inferType left) args[0]! then
        for right in ← nativeProofCandidates args[1]! do
          if ← isDefEq (← inferType right) args[1]! then
            candidates := candidates.push (← mkAppM `And.intro #[left,right])
  return candidates

private def transportResult (e : Expr) : MetaM (Option Simp.Result) := do
  let pairs := #[
    (`NativeBridge.Incremental.subtypeTo, `Rocq.Corelib.Init.Specif.sig, `NativeBridge.Incremental.SpecifConditionalNormalization.sig_transport_rec),
    (`NativeBridge.Incremental.subtype2To, `Rocq.Corelib.Init.Specif.sig2, `NativeBridge.Incremental.SpecifConditionalNormalization.sig2_transport_rec),
    (`NativeBridge.Incremental.psigmaTo, `Rocq.Corelib.Init.Specif.sigT, `NativeBridge.Incremental.SpecifConditionalNormalization.sigT_transport_rec),
    (`NativeBridge.Incremental.psigma2To, `Rocq.Corelib.Init.Specif.sigT2, `NativeBridge.Incremental.SpecifConditionalNormalization.sigT2_transport_rec)]
  let some (_conversion, source, theoremName) := pairs.find? (fun p => e.getAppFn.isConstOf p.1) | return none
  let ea := e.getAppArgs
  if ea.isEmpty then return none
  let recursor := ea.back!
  unless recursor.isAppOfArity `Eq.rec 6 do return none
  let ra := recursor.getAppArgs
  let params? ← lambdaTelescope ra[2]! fun bs body => do
    unless bs.size == 2 && body.getAppFn.isConstOf source do return none
    let mut params := #[ra[0]!]
    for a in body.getAppArgs do
      if a.containsFVar bs[1]!.fvarId! then return none
      params := params.push (← mkLambdaFVars #[bs[0]!] a)
    return some params
  let some params := params? | return none
  let proof ← mkAppM theoremName (params ++ #[ra[1]!,ra[4]!,ra[5]!,ra[3]!])
  let ty ← inferType proof
  unless ty.isAppOfArity `Eq 3 do return none
  let args := ty.getAppArgs
  unless ← isDefEq args[1]! e do return none
  return some {expr := args[2]!, proof? := some proof}

syntax (name := incrementalStatement) "#incremental_statement " ident : command
@[command_elab incrementalStatement] def elabIncrementalStatement : CommandElab := fun stx => do
 let sourceName := stx[1].getId
 liftTermElabM do
  let ci ← getConstInfo sourceName
  let .defnInfo di := ci | throwError "Expected translated statement definition"
  let ls := di.levelParams.map Level.param
  let closedName := ("NativeBridge.Incremental.SpecifWitnesses.closed." ++ sourceName.toString).toName
  let sourceApp ← inferType (mkConst closedName ls)
  let body := (mkAppN di.value sourceApp.getAppArgs).headBeta
  let wrapperName := ("NativeBridge.Incremental.SpecifClosedStatements.closed." ++ sourceName.toString).toName
  addDecl (.defnDecl {name:=wrapperName,levelParams:=di.levelParams,type:=.sort .zero,value:=sourceApp,hints:=.abbrev,safety:=.safe})
  let mut rules : SimpTheorems := {}
  for rule in RULE_NAMES do
   let n := rule.toName
   if (← getEnv).contains n then
    rules ← if rule.startsWith "Rocq." then rules.addDeclToUnfold n else rules.addConst n
  let ctx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[rules])
  let (r1, _) ← Meta.simp body ctx
  let mut cleanup : SimpTheorems := {}
  for n in [`NativeBridge.Incremental.subtypeOf,`NativeBridge.Incremental.subtype2Of,
      `NativeBridge.Incremental.psigmaOf,`NativeBridge.Incremental.psigma2Of,
      `NativeBridge.Incremental.subtypeTo,`NativeBridge.Incremental.subtype2To,
      `NativeBridge.Incremental.psigmaTo,`NativeBridge.Incremental.psigma2To,
      `Rocq.Corelib.Init.Specif.proj1_sig,`Rocq.Corelib.Init.Specif.projT1,
      `Rocq.Corelib.Init.Specif.projT2,`Rocq.Corelib.Init.Specif.projT3,
      `RocqPending.Corelib.Init.Specif.sig_of_sig2,`Rocq.Corelib.Init.Specif.sigT_of_sigT2] do
    cleanup ← cleanup.addDeclToUnfold n
  let cleanupCtx ← Simp.mkContext (config := { maxSteps := 20000 }) (simpTheorems := #[cleanup])
  -- simp does not traverse proof arguments. Replace only this specific
  -- roundtrip cast by its native proof, checking definitional equality.
  let clean (input : Expr) : MetaM Expr := Meta.transform input (pre := fun e => do
    if e.getAppFn.isConst && [`Rocq.Corelib.Init.Specif.proj1_sig,`Rocq.Corelib.Init.Specif.projT1,
        `Rocq.Corelib.Init.Specif.projT2,`Rocq.Corelib.Init.Specif.projT3,
        `RocqPending.Corelib.Init.Specif.sig_of_sig2,`Rocq.Corelib.Init.Specif.sigT_of_sigT2].contains e.getAppFn.constName! then
      let e' ← withTransparency .all (whnf e)
      if e' != e then return .visit e'
    return .continue) (post := fun e => do
    if e.isAppOfArity `Eq.ndrec 6 || e.isAppOfArity `Eq.rec 6 then
      let candidate := e.getAppArgs[3]!
      if (← isProof candidate) && (← isDefEq e candidate) then
        return .done candidate
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
    if (← isProof e) && !(← sourceRefs e).isEmpty then
      let ty ← withTransparency .all (reduce (← inferType e))
      -- A reducible source presentation of the type is allowed only when
      -- a source-free candidate and its native type are definitionally equal.
      for decl in (← getLCtx) do
        unless decl.isImplementationDetail do
          let candidate := mkFVar decl.fvarId
          if (← isProof candidate) && (← sourceRefs decl.type).isEmpty &&
              (← isDefEq ty decl.type) && (← isDefEq e candidate) then
            return .done candidate

      for candidate in ← nativeProofCandidates ty do
        if ← isDefEq ty (← inferType candidate) then
          let candidate ← instantiateMVars candidate
          unless candidate.hasMVar do
            if (← sourceRefs candidate).isEmpty && (← sourceRefs (← inferType candidate)).isEmpty && (← isDefEq e candidate) then
              return .done candidate
    return .done e)
  let beforeTransport ← clean (← clean r1.expr)
  unless ← isDefEq r1.expr beforeTransport do throwError "Pre-transport cleanup changed the statement"
  let defaults := Simp.mkDefaultMethodsCore #[]
  let methods : Simp.Methods := { defaults with pre := fun e => do
    if let some result ← transportResult e then return .visit result
    defaults.pre e }
  let (transport, _) ← Simp.mainCore beforeTransport ctx {} (methods := methods)
  let (r, _) ← Meta.simp transport.expr cleanupCtx
  let mut finalExpr := r.expr
  for _ in [:12] do
    let next ← clean finalExpr
    if next == finalExpr then break
    finalExpr := next
  unless ← isDefEq r.expr finalExpr do throwError "Cleanup changed the statement"
  let nativeName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".native").toName
  let certName := ("NativeBridge.Incremental.Statements." ++ sourceName.toString ++ ".correspondence").toName
  addDecl (.defnDecl {name:=nativeName,levelParams:=di.levelParams,type:=.sort .zero,value:=finalExpr,hints:=.abbrev,safety:=.safe})
  let ty := mkApp2 (mkConst `Iff) sourceApp (mkConst nativeName ls)
  let proof ← mkAppM `Iff.of_eq #[← mkEqTrans (← mkEqTrans (← r1.getProof' body) (← transport.getProof' beforeTransport)) (← r.getProof' transport.expr)]
  addDecl (.thmDecl {name:=certName,levelParams:=di.levelParams,type:=ty,value:=proof})
  let remaining ← sourceRefs finalExpr
  let text ← ppExpr finalExpr
  let j := Json.mkObj [("source_target",.str sourceName.toString),("certificate",.str certName.toString),
   ("native",.str nativeName.toString),("native_expression",.str text.pretty),
   ("remaining_source_symbols",.arr (remaining.map (fun x => .str x.toString))),
   ("full",.bool remaining.isEmpty)]
  logInfo m!"NATIVE_RESULT {j.compress}"
