open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
 let env ← Lean.getEnv
 let mut rows : Array Lean.Json := #[]
 for (n, ci) in env.constants.toList do
  if (n.toString.startsWith "NativeBridge.Incremental." || n.toString.startsWith "NativeBridge.IncrementalInterfaces.") && (ci.isDefinition || ci.isTheorem) then
   let axs ← Lean.collectAxioms n
   for ax in axs do
    unless ["propext", "Quot.sound", "Classical.choice"].contains ax.toString do
     throwError "Unapproved axiom in {n}: {ax}"
   let ty ← Lean.Meta.ppExpr ci.type
   let refs := ci.type.getUsedConstants.filter (fun x => (x.toString.startsWith "Rocq." || x.toString.startsWith "RocqPending."))
   rows := rows.push (Lean.Json.mkObj [
    ("name", .str n.toString), ("kind", .str (if ci.isTheorem then "theorem" else "definition")),
    ("type", .str ty.pretty), ("axioms", .arr (axs.map (fun x => .str x.toString))),
    ("source_references", .arr (refs.map (fun x => .str x.toString)))])
 IO.FS.writeFile "AUDIT_PATH" (Lean.Json.pretty (.arr rows))
