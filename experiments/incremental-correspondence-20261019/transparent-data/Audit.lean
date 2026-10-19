import Lean
open Lean Meta Elab Command
namespace TransparentAudit
private partial def nativeRefs (n : Name) (seen : IO.Ref NameSet) : MetaM (Array Name) := do
  if (← seen.get).contains n then return #[]
  seen.modify (·.insert n)
  let s := n.toString
  if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." ||
      (s.startsWith "Computational." && ((s.splitOn ".").contains "Rocq" || (s.splitOn ".").contains "RocqPending")) then
    return #[n]
  unless s.startsWith "NativeBridge." || s.startsWith "Computational." do return #[]
  let ci ← getConstInfo n
  let mut found := #[]
  let expressions := #[ci.type] ++ (ci.value? true).toArray
  for e in expressions do
    for d in e.getUsedConstants do found := found ++ (← nativeRefs d seen)
  return found
private partial def occurrences (root : Name) : Expr → Array (List Level)
  | .const n ls => if n == root then #[ls] else #[]
  | .app f a => occurrences root f ++ occurrences root a
  | .lam _ t b _ | .forallE _ t b _ => occurrences root t ++ occurrences root b
  | .letE _ t v b _ => occurrences root t ++ occurrences root v ++ occurrences root b
  | .proj _ _ e | .mdata _ e => occurrences root e
  | _ => #[]
def check (entries : Array (Name × Name × Name)) (path : String) : MetaM Unit := do
  let mut rows := #[]
  for (root,proof,target) in entries do
    let ci ← getConstInfo proof
    unless ← isProp ci.type do throwError "Certificate must be a proposition: {proof}"
    let refs := occurrences root ci.type
    unless !refs.isEmpty do throwError "Certificate does not directly mention source variant: {proof}"
    let source ← getConstInfo root
    unless refs.any (fun ls => ls.length == source.levelParams.length &&
      ls.all (fun l => match l with | .param _ => true | _ => false) &&
      ls.eraseDups.length == ls.length) do
      throwError "Source universe coverage was narrowed: {proof}"
    let seen ← IO.mkRef ({} : NameSet)
    let residual ← nativeRefs target seen
    unless residual.isEmpty do throwError "Residual source symbols in native target: {target}: {residual}"
    let axs ← collectAxioms proof
    for ax in axs do
      unless ["propext","Quot.sound","Classical.choice"].contains ax.toString do
        throwError "Unapproved certificate axiom {ax}"
    let ty ← ppExpr ci.type
    rows := rows.push (Json.mkObj [
      ("source_variant",.str root.toString),("certificate",.str proof.toString),
      ("native_target",.str target.toString),("type",.str ty.pretty),
      ("remaining_source_symbols",.arr #[]),("source_universes_unspecialized",.bool true),
      ("axioms",toJson (axs.map Name.toString))])
  IO.FS.writeFile path (Json.pretty (Json.mkObj [("certificates",.arr rows)]))
end TransparentAudit
