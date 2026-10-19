import ProfilePack
open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for root in [`unsupportedAssumption,`unsupportedOpaque] do
    let rejected ← try
      ProfilePack.pack `BadSource `RejectedProfile #[root] ".work/interop/should-not-exist.json"
      pure false
    catch ex =>
      let text ← ex.toMessageData.toString
      unless text.contains "A new axiom cannot be packed" do throw ex
      pure true
    unless rejected do throwError "Unexpectedly accepted a new axiom dependency"
    if (← getEnv).contains (`RejectedProfile ++ root) then
      throwError "Rejected declaration entered the environment"
  IO.FS.writeFile "reports/interop/rejection.json"
    "{\"new_axiom_rejected\":true,\"axiom_inside_opaque_rejected\":true,\"rejected_declaration_absent\":true}"
