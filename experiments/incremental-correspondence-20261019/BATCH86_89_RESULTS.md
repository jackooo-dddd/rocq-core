# Batch 86 to 89: Floating point conversion and specification statements

Added 41 deduplication roots, covering **2095/2180**: 164 type, 903 operation, 1028 complete native statement. The original statement independent proof Prop is still 318. This batch does not include the specification statement equivalently in the original theorem proof.

| batch | profile | new roots | content |
|---|---|---:|---|
| 86 | FloatOperations | 7 | precision、emax、shift、Z.ldexp、Z.frexp、SF2Prim、Prim2SF |
| 87 | Float64Operations | 9 | 8 fixed-precision symbolic arithmetic wrappers with flatten_cmp_opt |
| 88 | FloatStatements | 24 | FloatAxioms Source statement of all specifications ↔ Complete native statement |
| 89 | FloatUlp | 1 | In FloatOps this module closure check ulp |

FloatOps has completed 8/8, FloatAxioms 33/33. SpecFloat 55/55, PrimFloat 37/37 remain passed.

## what has been proven

Two exact algorithms representing transformation functions have proven correspondence; this does not automatically prove that they are inverses of each other. roundtrip, injectivity, validity and the arithmetic specifications have complete native statements in FloatStatements and iff proofs, where the original valid_binary assumptions are all retained. Specifications without independent proof of original representation still need to be proven and their authenticity cannot be obtained by iff.

The native target consists of the canonical binary64 field and SpecValue, Bool/Nat/Int/BitVec, with no remaining source symbols; there is no claim to be equal to runtime Float API.

## Verification and dependencies

FloatClosureSupport rechecks the sign and primitive floating point proofs in the actual derived closure of FloatAxioms; FloatWordSupport rechecks the integer conversions of Uint63. ulp is not in that closure, so FloatUlpSupport is in the FloatOps closure and the necessary subset is rechecked. Declarations of the same name for different closures are not mixed, nor are mechanical baselines re-exported or modified.

165 profile The current source code and dependency verification passed. 144 incremental certificates covering profile and 1843 are imported together, 2467 entries, and 26442 dependent copies. Axiom closures, native target recursive auditing, registry and co-import consistency checks all pass.

Remaining 85 root: no certificate yet 62, interface only 6, explicit condition 17; partial native statement 0. The next step is to check whether the transparent predicate package value of SSR can be described with the bearer type bidirectional inverse predicate operation, and continue to troubleshoot the opaque Type value calculation.
