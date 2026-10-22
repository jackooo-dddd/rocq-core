# Equivalence, Morphisms_Prop and Setoid (11th batch)

Added 40 completion roots: 2 types, 2 operations, 36 complete native statements. Total library 814 / 2180 (62 type, 283 operation, 469 statement); remaining 384 partial statement, 274 interface only, 391 no certificate yet, 316 Subject to conditions and 1 special statements.

The 17 root of Classes.Equivalence, the 29 root of Classes.Morphisms_Prop, and the 6 root of Setoids.Setoid all have certificates within the express scope. Among them, 12 complete native statements of Morphisms_Prop inherit the baseline, and 17 are added in this batch; there is no duplicate count. Together with the first three relationship modules, the root-by-root verification of 6 modules totaling 265 is shown in reports/relations-module-coverage.json.

## Corresponding result

- equiv / pequiv: After inputting the converted Equivalence / PER evidence, the returned relationship is equal to the original relationship R.
- respecting: Mutually inverse with Lean Subtype {f : A → B // ∀ x y, R x y → S (f x) (f y)}. Cover A, B according to source type: Type u; do not expand to the universe range not provided by the source signature without authorization.
- Setoid_Theory: The proof type is reciprocal with the ready-made Lean Equivalence R.
- 14 statements of Equivalence are all automatically native, and the quantifiers and projections of Subtype are processed through the conversion certificate; some of the dependent statements retain different input/output universe. For the complete type, see audit.
- 17 statements of Morphisms_Prop are all automatically native; existing Acc conversions are rechecked in the actual mechanical closure of this module. The native results include Lean Acc and native And/Or/Not/iff.
- The five statements of construction, reflexivity, symmetry, transitivity and gen_st of Setoid all have original iff, and are also proved by the original statements. gen_st retains the source Type 0 range.

respecting's native function package has proven composite examples; auxiliary examples do not increase the number of source roots. 31 automatic iff for Morphisms_Prop / Equivalence without additional registration of original statement certificate. The new original statement certificate in the entire database has been increased from 38 to 43.

## Verify

4 new profile: EquivalenceBridge, EquivalenceStatements, MorphismsProp, SetoidBridge. All passed Lean 4.33.1 kernel and axiom closure checks; the cumulative source code hashes of 29 profile are consistent with the success record.

Added new generation scripts: build_equivalence_statements.py, build_morphisms_prop.py; native target recursive check excludes hidden source aliases. Acc and relational auxiliary proofs are recompiled in each actual closure, without additional repeated root counting.

There is no new conditional root digestion; the mechanical product is still 331 conditional root, correspondence layer has been closed 15, and 316 remains. Unified cross-module imports and Mathlib integration continue to be processed.
