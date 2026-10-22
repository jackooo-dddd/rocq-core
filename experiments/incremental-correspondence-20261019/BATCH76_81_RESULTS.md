# Batch 76 to 81: Symbolic floating point operations completed

Added 17 deduplication source roots, all corresponding to operations. Total coverage **2017 / 2180**: 161 type, 852 operation, 1004 complete original statement; the original statement also has 318 independent Prop proofs, and no such proofs are added in this batch.

| batch | profile | new roots | Corresponding content |
|---|---|---:|---|
| 76 | SpecFloatComparison | 4 | SFcompare、SFeqb、SFltb、SFleb |
| 77 | SpecFloatArithmetic | 3 | SFadd、SFsub、SFmul |
| 78 | SpecFloatExponent | 3 | SFmax、SFfrexp、SFulp |
| 79 | SpecFloatAdjacent | 3 | SFpred_pos、SFsucc、SFpred |
| 80 | SpecFloatDivision | 2 | SFdiv_core_binary、SFdiv |
| 81 | SpecFloatSqrt | 2 | SFsqrt_core_binary、SFsqrt |

## Proof scope

SpecFloat Completed **55 / 55**. NativeBridge.Incremental.SpecFloatRepresentation.SpecValue stores positive and negative zero, infinity, single NaN, signed positive significant digits and integer exponents. The target of the operation consists of Bool/Nat/Int, Option, Ordering, and this representation; there is no residual Rocq/Rocq2Lean symbol and it has not been proven to be equal to Lean when running the Float operation.

All proofs retain the original defined arbitrary input range without adding the valid_binary assumption. The comparison compares exponents and significant figures according to the original algorithm for any finite symbolic value; without proof of validity, this comparison is not declared to be a numerical comparison under any representation.

Use Int.fdiv/fmod for division and prove the quotient remainder and the sign rule; use Nat.sqrt for square roots and prove the integer remainder. Both reuse the proven complete nearest even rounding. Precursor and successor preserve boundary significant digits, infinity and positive and negative zero branches. Non-finite values ​​of frexp return the index signature specified by the original algorithm.

## Dependency and verification

Three new ones, SpecFloatMaskSupport, SpecFloatDivisionSupport, and SpecFloatSqrtSupport, are added to support profile; they do not count repeatedly. Integer proof rechecked in SpecFloat actual dependency closure. The subtractive borrow auxiliary term of the square root is taken from the second projection of the same mutual recursive term of the mechanical sub_mask and checked by the Lean kernel.

154 profile current source code and dependency verification passed; 136 incremental certificates covering profile and 1765 were imported together. The specified native target recursive audit, axiom closure and certificate directly related to the source root check all passed. There are no new sorry or axioms. Compile products, temporary probes, and log run directories remain in remote .work.

Remaining 163 root: no certificate yet 115, partial native statement 24, interface only 7, explicit condition 17. The next step is to process PrimFloat / FloatOps / FloatAxioms; opaque Type value data will not be counted as operation correspondence based on type packaging alone.
