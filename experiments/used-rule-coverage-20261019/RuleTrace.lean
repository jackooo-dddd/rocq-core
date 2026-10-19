import Lean
namespace Rocq2Lean
open Lean Meta
structure RuleTraceState where
  source : String := ""
  hits : Array (String × String) := #[]
  deriving Inhabited
initialize ruleTraceExt : EnvExtension RuleTraceState ← registerEnvExtension (pure {})
def ruleTraceBegin (name : String) : MetaM Unit :=
  modifyEnv fun e => ruleTraceExt.modifyState e fun s => { s with source := name }
/-- Recorded in the environment, hence discarded by the translator's normal rollback. -/
def ruleHit (id : String) : MetaM Unit := do
  let disabled := ((← IO.getEnv "ROCQ2LEAN_DISABLED_ITEMIZED_RULES").getD "").splitOn ","
  if disabled.contains id then throwError "disabled itemized rule: {id}"
  modifyEnv fun e => ruleTraceExt.modifyState e fun s =>
    { s with hits := s.hits.push (id, s.source) }
end Rocq2Lean
