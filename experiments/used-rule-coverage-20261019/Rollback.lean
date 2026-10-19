import Rocq2Lean.RuleTrace
open Lean Meta Rocq2Lean
run_meta do
  ruleTraceBegin "rollback_test"
  let before := (ruleTraceExt.getState (← getEnv)).hits
  let saved ← saveState
  ruleHit "M01"
  unless (ruleTraceExt.getState (← getEnv)).hits.size == before.size + 1 do
    throwError "rule hit was not recorded"
  saved.restore
  unless (ruleTraceExt.getState (← getEnv)).hits == before do
    throwError "an abandoned attempt retained its rule hit"
  ruleHit "M03"
  let hits := (ruleTraceExt.getState (← getEnv)).hits
  unless hits.back! == ("M03", "rollback_test") do
    throwError "successful rule attribution was lost"
