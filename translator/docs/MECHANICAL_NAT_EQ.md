# Mechanical source nat and eq

This experimental build has an empty bootstrap registry. Source Corelib.Init.Datatypes.nat
and Corelib.Init.Logic.eq pass through the ordinary inductive generator. Their target names
are Rocq.Corelib.Init.Datatypes.nat and Rocq.Corelib.Init.Logic.eq, with generated constructors
and recursors. They are not abbreviations for Lean Nat/Eq and are not definitionally equal
to them.

The independent Python audit and preflight bootstrap tables are also empty. Restoring either
historical bootstrap mapping in a report is rejected. The consumer uses the same empty
registry through its existing verification API.

Lean's own Nat/Eq may still occur in metaprogramming, primitive-model internals, recursor
bookkeeping and checked auxiliary proofs. Those occurrences are not a source inductive
mapping. Generated source references must resolve to the generated source declarations.

The mechanical translation phase does not substitute native Nat/Eq APIs. Separate Nat/Eq
correspondence proofs have now been completed; see the subsequent-proof section below. Earlier native-correspondence-main75 artifacts belong to the previous bootstrap
baseline and must not be imported as evidence for this new baseline.

Existing pending proof parameters remain explicit. Translating a theorem statement does
not prove the theorem. Full experiment evidence is in ../.. relative to the translator.

## Subsequent correspondence proofs (2026-10-19)

The separate mechanical-correspondence-20261019 experiment now proves natIso, eq_correspondence, eqIso and dependent transport agreement. Primary Nat/Eq bridges have empty axiom closure. The translator itself still only generates the mechanical types; it does not substitute native API objects. See the repository RESULTS.md and results/corelib-complete/CORRESPONDENCE.md.
