import ProfilePack
open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  let rejected ← try
    ProfilePack.pack `BadSource `RejectedProfile #[`unsupportedAssumption] ".work/interop/should-not-exist.json"
    pure false
  catch ex =>
    let text ← ex.toMessageData.toString
    unless text.contains "A new axiom cannot be packed" do throw ex
    pure true
  unless rejected do throwError "Unexpectedly accepted a new axiom"
  if (← getEnv).contains `RejectedProfile.unsupportedAssumption then
    throwError "Rejected axiom entered the environment"
  IO.FS.writeFile "reports/interop/rejection.json"
    "{\"new_axiom_rejected\":true,\"rejected_declaration_absent\":true}"
