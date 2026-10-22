# SSR Bool Sharing conditions and native correspondence: the twenty-sixth batch

This batch adds **83 completion roots: 73 native statements, 10 operations/predicates**. The cumulative completion category is **1490 / 2180**; including type 92, operation 529, and complete native statement 869. The ssrbool module is advanced from 301 / 451 to **384 / 451**.

## Conditional closure and correspondence statistics are separated

| Project | Quantity | meaning |
|---|---:|---|
| The conditional root of this batch of entries | 128 | 73 statements, 55 definitions/opaque functions |
| different predeclarations | 275 | pending_hypotheses union of exact frozen report |
| Proved forward statement | 271 | Each has proof of closure Lean, the other four are still pending |
| Total number of independent closed proofs | 314 | 271 predeclarations, plus 43 original statements; not counting 314 new correspondences |
| Proof of empty axiom closure | 223 | The remaining 91 only use Lean standard axioms and record them item by item. |
| All forward declarations proved roots | 124 | Among them, 41 have not yet established calculation correspondence and cannot be upgraded and covered in advance. |
| Complete the corresponding conditional root | 83 | 73 statement + 10 operation; actual upgraded deduplication root |
| This batch has not yet completed the corresponding roots. | 45 | Not 45 missing pre-proofs |

73 statements have all been source symbol scanned, including recursively expanding the NativeBridge alias. 43 have independent proofs of the original statement; the iff certificates of the remaining 30 cannot be regarded as proving the original theorem. A total of 183 new original statement certificates were added to the entire project.

The original mechanical product remains unchanged. Among the original 331 conditional roots in the entire project, the bridge layer has been closed and instantiated and completed corresponding to 247 (72 definition, 175 statement), leaving 84.

## The goal of ten operations

| source operation | native target | Description |
|---|---|---|
| bijective_in、bijective_on | The restricted domain bidirectional inverse predicate represented by Exists / And / Eq | Native Bool predicate determines domain; prove pointwise iff |
| ApplicativePred、applicative_pred_applicative | Unit constructor | After fixing the external predicate, the wrapper is converted by the proven single value type Iso |
| expose_mem_pred、expose_simpl_pred | Unit constructor | Same as above; not removing the external predicate |
| KeyedPred、DefaultKeying.default_keyed_pred | Unit constructor | Native Bool predicate, key proof converted to True |
| KeyedQualifier、DefaultKeying.default_keyed_qualifier | Unit constructor | The input uses the native Nat and Bool predicates, and the mechanical parameters are provided by the existing inverse transformation |

These targets are native expressions/representations; do not pretend to be ten ready-made Mathlib API. The packaging output is Unit because the internal load is unique after the external parameters are fixed, and the previous batch has proven the bidirectional inversion.

## Certification process and documents

1. ssrbool-witness-selection.json Fixed source target, pre-dependency, conditional proof and closed proof name.
2. proofs/SSRBoolWitnesses.lean: The structure is deleted or the original Bool/ logic corresponds to grind. After success, Lean kernel is checked synchronously, and then closed according to the dependency sequence. Failure does not add to the official list; no new axioms are generated.
3. proofs/SSRBoolConditionalNormalization.lean: Reconstruct the universal bridge of Option, Subtype, bijection within the current ssrbool mechanical closure. The Bool condition subtype directly corresponds to {x // p x = true}, so that no mechanical is_true remains in the type.
4. proofs/SSRBoolClosedStatements.lean: Practically apply all prerequisite proofs to generate 73 native statements and iff.
5. proofs/SSRBoolClosedOperations.lean: Point-by-point proof of ten closed functions and specified native objectives.
6. reports/ssrbool-condition-dag.json: Each root’s pre-certification, unproven dependencies and current corresponding status. Source name slash-to-dot normalization is collision-checked, preserving the original export name.
7. reports/condition-discharges.json, reports/certificates.json: The evidence used for coverage counting, separate from the number of proofs for all 314 targets.

## Verification and follow-up

The current source code and compilation dependency fingerprints of 80 profile passed; four new profile have been compiled. 72 coverage certificates profile and 1228 were imported and passed together, 1650 entries, and 10315 copy dependency statements. Not re-running all mechanical translations, old baselines or Mathlib consumption examples. Caching, exploration failure logs, and compiled files continue to leave only remote .work.

The four forward claims that have not yet been proven belong to bind_unless, keyed_mem, keyed_mem_simpl, and keyed_qualifier_keyed. Subsequently, these four will be completed first, and then the return values ​​of reflect and other proof properties will be processed. opaque not automatically means that it cannot correspond: if the output is determined by the index and is a single-valued type, the correspondence can be established by the proven single-valued property; opaque that returns arbitrary data/selection function still requires separate calculation or equality evidence.
