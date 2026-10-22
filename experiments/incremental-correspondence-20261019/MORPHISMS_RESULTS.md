# Morphisms (10th batch)

This batch adds 68 completion roots: 5 types/tags, 8 operations, and 55 complete native statements. Along with the 19 complete native statements already in the baseline, the 87 roots of Classes.Morphisms all enter the completion category within the explicit scope.

Total library 774 / 2180: 60 type, 281 operation, 433 complete native statement. Remaining 420 partial statement, 275 interface only, 394 no certificate yet, 316 still with conditions, 1 special Type value statement.

## precise target

| source item | Native correspondence |
|---|---|
| Proper、ProperProxy | R f f |
| ReflexiveProxy | ∀ x, R x x |
| respectful | ∀ x y, R x y → S (f x) (g y) |
| respectful_hetero | ∀ x y, R x y → S x y (f x) (g y), retain two dependent return families |
| pointwise_relation | ∀ x, R (f x) (g x) |
| forall_relation | ∀ x, R x (f x) (g x) |
| Normalizes | ∀ x y, R x y ↔ S x y |
| forall_def | Native dependent function type |
| Params、PartialApplication、apply_subrelation、normalization_done | True: All four are tags without fields |

The eight operation targets are all designated native logical expressions, labeled native_expression; there is no claim that they are all Mathlib out-of-the-box API. Normalizes Here is a relational equivalence proposition, not a runtime normalization process. The isomorphism of the Params notation holds for any source arity; the representation of the machine Nat is not thereby altered.

respectful covers the input/output of the same Type u by mechanical signature; pointwise_relation covers two independent Type universe; respectful_hetero covers four independent Sort universe and dependent return families. The certificate complete type is the final scope basis.

## Automatically used downstream

build_morphism_statements.py selects 55 partial statements from the frozen baseline and renormalizes them using relational, logical, and functional overall correspondences, and all 55 pass:
- Automatically construct the proof of the original statement ↔.
- Recursively expand NativeBridge alias check, native target has no mechanical source symbol.
- Proved global equations are also used when functions are passed as arguments: compose, impl, pointwise_relation.
- The useless unit parameters of a statement are removed by certified "∀ unit, P ↔ P" instead of deleting parameters without basis.

These are 55 statement equivalence certificates; no original statement certificates were separately registered for this batch. Therefore, the total number of newly added original statement certificates in the entire database is still 38, and if it does not increase, it will be 93.

proper_across_iso is an actual use example: input a carrier Iso, function operation correspondence, and proof that the native function maintains the relationship, and get the Proper proof of the mechanical function. The operation corresponding to hf is an explicit premise. It is not assumed that the source function behaves the same as any native function just because the function type is convertible. The example does not include additional roots.

## Verification and reuse boundaries

Both proofs/Morphisms.lean and proofs/MorphismStatements.lean passed Lean 4.33.1 kernel and axiom audits; a total of 25 source code hashes of profile matched successful records. There is no new conditional root resolution, there are still 15 closed and 316 pending.

Morphisms profile reuses the filtered relation auxiliary proof and rechecks it within the actual derived closure of Morphisms. The Rocq2LeanOut with the same name of other profile is not forcibly mixed and imported; the unified cross-module import of P7 still needs to be processed. Repeated auxiliary proofs do not count roots repeatedly.

Evidence:
- reports/morphism-statement-candidates.json: 55/55 are automatically native.
- reports/relations-module-coverage.json: Classification check of Relation_Definitions 23, RelationClasses 103, Morphisms 87 total 213 roots.
- reports/CERTIFICATES.md, CORELIB_LEDGER.csv, summary.json: complete mapping and current statistics.
- reports/Morphisms-audit.json, MorphismStatements-audit.json: proof type, axiom closure and source reference.
