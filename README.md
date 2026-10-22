# Rocq Corelib to Lean

- [Rules with confirmed usage](results/USED_RULES.md): 34 original entries plus 10 measured M rules, for 44 entries in total. All 2180 roots still pass after disabling the 3 M paths with no recorded hits.
- [Complete Nat case study](results/casestudy/README.md): the source type and 58 operations, per-declaration translations and traces, exported-file explanations, and native correspondence proofs.

The current baseline **translates mechanically first, then proves correspondence with native Lean objects**.

- 67 modules and 2180 root declarations: 0 blocked roots and 0 validation failures.
- 1003 definitions/data types, 846 unconditional statements, 148 conditional definitions, and 183 conditional statements. Explicit conditions remain in 331 mechanical outputs. The frozen correspondence baseline discharges them for 314 roots; the remaining 17 are handled separately in the transparent variant.
- All 265 roots in Relation_Definitions, RelationClasses, Morphisms, Equivalence, Morphisms_Prop, and Setoid have correspondence certificates within their stated scopes. The remaining Classes roots are covered by the transparent variant.
- Source nat and eq generate separate inductive types; they are no longer mapped directly to native Nat/Eq. Their bidirectional correspondences and dependent elimination correspondences are proved in Lean.
- Correspondence coverage: 2100 / 2180 in the frozen version; 2180 / 2180 in the computationally transparent variant (164 type correspondences, 988 operation correspondences, and 1028 native statement iff proofs). A statement iff is not a proof of the original theorem. Another 318 statements have separate closed proofs of the original statement.

[Current correspondence plan and incremental results](experiments/incremental-correspondence-20261019/README.md) · [Dependency DAG](experiments/incremental-correspondence-20261019/DAG.md)

[Current results and validation](RESULTS.md) · [All rules and usage counts](results/corelib-complete/ALL_RULES.md) · [Correspondence](results/corelib-complete/CORRESPONDENCE.md) · [Per-file translations](results/corelib-complete/README.md) · [Proof directory](experiments/mechanical-correspondence-20261019/README.md)

translator/ contains the validated mechanical nat/eq implementation. Fixed experimental snapshots and proofs are stored in experiments/.
The rule catalog retains 118 review identifiers, including the disabled T06. These entries include checks and scheduling policies; they are not 118 independent semantic translation rules.

The historical 839-item results and older bootstrap baseline are retained for comparison and do not describe current behavior. Historical full runs, failed attempts, and build caches remain on the remote workstation and are excluded by .gitignore. See [PUBLISHING.txt](PUBLISHING.txt) for the publication scope and reproduction instructions.

Cross-module use has been validated: 145 profiles containing coverage certificates and 1848 incremental certificates can be imported together. There are also concrete examples using mechanical Nat, SSR Option, and Setoid with Mathlib; see the [P7 results](experiments/incremental-correspondence-20261019/INTEROP_RESULTS.md) for their validation scope.

The entries below are historical batch records. Each count describes the state at that batch; the current totals are given above and in the full-variant ledger.

Completed modules include Init.Nat, Init.Peano, Init.Datatypes, Init.Logic, Init.Specif, and Lists.ListDef. The full type of each certificate determines its universe and parameter scope. The [latest Init.Specif results](experiments/incremental-correspondence-20261019/SPECIF_COMPLETION_RESULTS.md) add 80 completed roots.

[SSR function and predicate results](experiments/incremental-correspondence-20261019/SSR_FUN_RESULTS.md): native targets are generated automatically for 27 predicates, all 50 statements are fully expressed in native terms, and Option operations are extended to the full Sort parameter scope.

[SSR data and conditional statement results](experiments/incremental-correspondence-20261019/SSR_DATA_RESULTS.md): 23 new roots; ssrfun reaches 124 / 128. Four opaque computational functions still lack usable computation equations at this stage.

[SSR Bool results](experiments/incremental-correspondence-20261019/SSR_BOOL_DATA_RESULTS.md): 14 new types, 34 operations, and 46 fully native statements; ssrbool reaches 251 / 451.

[SSR packaging and statement results](experiments/incremental-correspondence-20261019/SSR_PACKAGING_RESULTS.md): 52 new roots; ssrbool reaches 301 / 451, and all previously partial statements are completed.

See [CORRESPONDENCE_EXAMPLES.md](results/CORRESPONDENCE_EXAMPLES.md) for concrete correspondences and proof locations: gcd, sqrt, saturating subtraction, masks, signed powers/shifts, if_spec, and Type-valued relations.

[Binary operation completion](experiments/incremental-correspondence-20261019/BATCH37_39_RESULTS.md): all 86 roots in BinNums.PosDef/NatDef/IntDef have correspondence certificates, including division rounding direction, square roots with remainders, and binary iteration of arbitrary operations. Eliminators in Numbers.BinNums are completed in later batches.

[Dependent elimination and digit representation results](experiments/incremental-correspondence-20261019/BATCH40_43_RESULTS.md): Numbers.BinNums 15/15, Init.Decimal 40/40, Init.Hexadecimal 38/38, and Init.Number 17/17. Formatting, leading zeros, and negative zero are preserved; all 36 premises of 9 equality-decision functions are discharged.

[Bytes, machine integers, byte strings, and generic equality interfaces](experiments/incremental-correspondence-20261019/BATCH44_48_RESULTS.md): 64 new roots. Byte, PrimInt63, CarryType, PrimString, Init.Equality, and PrimArray are completed within their stated scopes.

[Well-founded recursion and SSR rewriting interfaces](experiments/incremental-correspondence-20261019/BATCH49_54_RESULTS.md): 76 new roots and 17 conditional roots remaining. Init.Wf, ssrclasses, and ssrunder are complete; Program.Wf reaches 10/12 and ssreflect_rw reaches 52/55.

[63-bit integer definitions and conversions](experiments/incremental-correspondence-20261019/BATCH55_56_RESULTS.md): all 22 transparent definitions in Uint63Axioms correspond to native BitVec/Nat/Int expressions, covering all inputs and arbitrary recursion bit counts.

[63-bit integer specifications](experiments/incremental-correspondence-20261019/BATCH57_59_RESULTS.md): 15 specifications receive native statement correspondences and separate proofs of the source statement; Uint63Axioms reaches 37/48.

[Integer arithmetic, shift, and zero-count specifications](experiments/incremental-correspondence-20261019/BATCH60_62_RESULTS.md): 9 new full-domain specifications and original-statement proofs; Uint63Axioms reaches an audited 46/48.

[Machine integer specification completion](experiments/incremental-correspondence-20261019/BATCH63_65_RESULTS.md): Uint63Axioms 48/48 and Sint63Axioms 8/8. All specifications retain their original premises and have separate proofs. Direct correspondences with the existing BitVec.sdiv/srem APIs are also added.

[Symbolic floating-point completion](experiments/incremental-correspondence-20261019/BATCH76_81_RESULTS.md): SpecFloat 55/55. Comparison, addition, subtraction, multiplication, division, square roots, and adjacent values are proved to agree with exact symbolic algorithms over native Bool/Nat/Int. Equality with the runtime Float API has not been proved.

[Primitive floating-point representation and operation completion](experiments/incremental-correspondence-20261019/BATCH82_85_RESULTS.md): PrimFloat 37/37. Canonical binary64 corresponds to a combination of Option/Sum/Fin/BitVec; bitwise integer square root is also proved equal to Nat.sqrt.

[Floating-point conversions and specification statements](experiments/incremental-correspondence-20261019/BATCH86_89_RESULTS.md): FloatOps 8/8 and FloatAxioms 33/33. Of these, 24 are fully native statement iff proofs, not independently proved original theorems.

[Computationally transparent variant](experiments/incremental-correspondence-20261019/transparent-data/README.md): retains the mechanical bodies and re-exports only non-Prop opaque data as def. Correspondences are proved for all 80/80 remaining candidate roots, and all previous 2100 roots pass regression, bringing the variant to 2180/2180. All 173 existing profiles and 6 new profiles import together successfully. The frozen baseline remains at 2100/2180. These are correspondences for definitions in new namespaces, not equalities between the original opaque constants and the new definitions.
