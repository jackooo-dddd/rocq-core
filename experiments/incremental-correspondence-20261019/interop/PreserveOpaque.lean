import ProfilePack
open Lean Meta in
run_cmd Lean.Elab.Command.liftTermElabM do
  ProfilePack.pack `OpaqueSource `OpaqueCopy #[`oneEq,`mysteryNat] ".work/interop/opaque-fixture-pack.json"
  for n in [`OpaqueCopy.one,`OpaqueCopy.mysteryNat] do
    let .opaqueInfo _ ← getConstInfo n | throwError "Opacity not preserved: {n}"
  let .opaqueInfo v ← getConstInfo `OpaqueCopy.mysteryNat | throwError "Expected opaque"
  let c := mkConst v.name
  let ty ← mkEq c v.value
  let value ← mkEqRefl c
  let decl := Declaration.thmDecl { name := `ForbiddenOpaqueUnfold, levelParams := [], type := ty, value := value }
  match (← getEnv).addDeclCore 200000 2048 decl none true with
  | .error (.declTypeMismatch ..) => pure ()
  | _ => throwError "Opaque body became definitionally accessible"
  unless (← collectAxioms `OpaqueCopy.oneEq).isEmpty do throwError "Unexpected axiom"
  IO.FS.writeFile "reports/interop/opaque-preservation.json"
    "{\"opaque_kind_preserved\":true,\"body_rfl_rejected\":true,\"singleton_proof_packed\":true,\"singleton_proof_axioms\":[]}"
