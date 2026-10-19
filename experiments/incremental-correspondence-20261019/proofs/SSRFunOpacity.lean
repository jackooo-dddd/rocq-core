import SSRFunConditions
open Lean Meta Elab Command
run_cmd liftTermElabM do
  for n in [`Rocq.Corelib.ssr.ssrfun.all_tag, `Rocq.Corelib.ssr.ssrfun.all_tag2,
      `RocqPending.Corelib.ssr.ssrfun.all_sig, `RocqPending.Corelib.ssr.ssrfun.all_sig2] do
    let .opaqueInfo v ← getConstInfo n | throwError "Expected opaque declaration: {n}"
    let c := mkConst n (v.levelParams.map Level.param)
    let eq ← mkEq c v.value
    let refl ← mkEqRefl c
    let decl := Declaration.thmDecl { name := n ++ `opacityRegression, levelParams := v.levelParams, type := eq, value := refl }
    let rejected := match (← getEnv).addDeclCore 200000 2048 decl none true with
      | .error (.declTypeMismatch ..) => true
      | .error _ => false
      | .ok _ => false
    unless rejected do throwError "Opaque body unexpectedly unfolded in kernel: {n}"
    let mut directTheorems : Array Json := #[]
    for (k, ci) in (← getEnv).constants.toList do
      if ci.isTheorem && ci.type.getUsedConstants.contains n then
        directTheorems := directTheorems.push (.str k.toString)
    logInfo m!"OPAQUE_AUDIT {Json.compress (Json.mkObj [
      ("target",.str n.toString),("kind",.str "opaque"),("body_present",.bool true),
      ("kernel_rejected_body_rfl",.bool rejected),("direct_existing_theorems",.arr directTheorems)])}"
