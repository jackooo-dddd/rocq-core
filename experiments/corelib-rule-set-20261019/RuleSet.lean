import Lean
namespace Rocq2Lean
/-- Optional transformations only. Kernel, source-fact and generality checks have no switches. -/
def configurableMechanisms : Array String := #["fact-reduce", "fact-interpretation", "motive-sort", "cumulativity", "reference-lowering", "implicit-discovery", "set-delta", "result-sort", "instance-hypotheses", "joint-levels", "occurrence-levels", "prop-lift", "phantom-sort", "type-lift", "operand-split", "alias-delta", "source-compute", "carrier-copies", "template-sort", "poly-model", "wf-obligations"]
def disabledMechanisms : IO (Array String) := do
  let raw := (← IO.getEnv "ROCQ2LEAN_DISABLED_RULES").getD ""
  let xs := (raw.splitOn ",").filter (· != "")
  for x in xs do
    unless configurableMechanisms.contains x do
      throw (IO.userError s!"unknown disabled translation mechanism: {x}")
  return xs.toArray
def mechanismEnabled (name : String) : IO Bool := do
  unless configurableMechanisms.contains name do
    throw (IO.userError s!"unknown translation mechanism: {name}")
  return !(← disabledMechanisms).contains name
def firstDisabledMechanism (used : List (String × Bool)) : IO (Option String) := do
  let disabled ← disabledMechanisms
  return used.findSome? fun (name, active) =>
    if active && disabled.contains name then some name else none
end Rocq2Lean
