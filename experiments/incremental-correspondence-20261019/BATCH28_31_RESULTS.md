# Correspondence Twenty-eighth to thirty-first batch

In this round, **71 deduplication roots and 72 coverage certificates** were added to the original 1526 completed roots, reaching **1597 / 2180**. The additional certificate is the carrier conversion version of Pos.iter, without repeated root counting. The mechanical translation product and the independent induction structure of nat/eq remain intact.

| batch | Add new root | Add new certificate | content |
|---|---:|---:|---|
| 28 | 20 | 20 | SSR: 2 index types, 18 branch, reflection, restricted domain predicate and wrapper operations |
| 29 | 6 | 7 | Pos.iter、Z.pow_pos、Z.pow、Z.even、Z.shiftl、Z.shiftr |
| 30 | 7 | 7 | Init.Sumbool full module: 6 operations, 1 original statements iff, and prove the original statement |
| 31 | 38 | 38 | CRelationClasses: 18 types corresponding, 20 projection/combination operations |

## Indexing and opacity

[SSRBoolIndexed.lean](proofs/SSRBoolIndexed.lean) maps alt_spec and if_spec to the native conditional propositions packaged by PLift, retaining the Boolean index, branch evidence and value index respectively. Both types come with full round-trip proof.

All preconditions of altP, boolP, ifP, and ifPn are instantiated using existing closed proofs. The corresponding target is constructed independently from the native Bool; the output after conversion is of a single-value type, and its single-value nature is used to prove equality. The original opaque functions were not expanded, nor were they supplemented with assumed calculation equations.

[SSRBoolRestrictions.lean](proofs/SSRBoolRestrictions.lean) adds left and right branch judgments, 10 restricted fields/application predicates, sumboolP and member packaging transformations. phantom proves that the parameters can be chosen arbitrarily, and the target expression ignores these parameters; mem_pred has been proved that memIso is converted into the native Bool predicate. is_inleft retains Sort parameters.

ssrbool is currently completed 440 / 451. The remaining 11 items include 5 opaque data selection functions, impliesP, clone_pred and 4 predType packages carrying carriers. The prerequisite proofs of the five conditional roots are complete, but the corresponding results have not yet been obtained, and they are not counted as completed.

## Numerical operations

[BinaryPower.lean](proofs/BinaryPower.lean) proves that the binary iteration is consistent with the Nat.rec iteration, covering any Sort vector. Further giving the combinatorial version of the transformation function: the corresponding proof of the step function must be provided explicitly.

- Z.pow_pos corresponds to the natural number exponent power of Int.
- Z.pow corresponds to an expression whose negative exponent returns zero and non-negative exponent is calculated to the power of a natural number.
- Z.even corresponds to the Bool judgment that the integer modulo 2 is equal to zero.
- Z.shiftl corresponds to positive shift multiplied by the power of 2 and negative shift to perform integer division.
- Z.shiftr corresponds to reverse shift; negative division uses the Euclidean division of Lean, and the positive power of 2 is rounded down.

Four specific examples also pass kernel in this document: (-2)^(-3)=0, (-2)^3=-8, (-3) Shift right 1 Bit=-2, 3 left shift -1 Bit=1. The power and shift here refer to the converted result of the mechanical Rocq operation.

## Sumbool

[SumboolBridge.lean](proofs/SumboolBridge.lean) proves all 7 roots of this module. 12 prefixes obligation give closed proofs, and 4 original conditional roots complete the correspondence. bool_eq_ind has both the original statement iff and independent proof of the original statement.

sumbool_and, sumbool_or corresponds to the branch combination of PSum, covering any A, B, C, D; not required B=¬A, D=¬C. The target of bool_of_sumbool retains the Bool label and branch certificate, and cannot just throw away the certificate and return to Bool. The correspondence of bool_eq_rec remains Type-valued motive in the derived signature, and does not claim to have been extended to the eliminator of any universe.

## Type value relationship

[CRelationData.lean](proofs/CRelationData.lean) retains the data in the relationship value and its function operations.

PreOrder, PER, and Equivalence correspond to the product of native functions; iffT corresponds to functions in two directions without additional reciprocal conditions, so it is not equal to Lean Equiv. relation_conjunction and relation_disjunction correspond to Prod and Sum respectively, and give two-way conversion to the extra universe of the original machine PULift.

The payloads of complement, Irreflexive, and Asymmetric only contain counterevidence to prove that they lead to the original proposition Iso; this does not mean that any Type value relationship is compressed into Prop. RewriteRelation is a logical tag without data, corresponding to True.

This module is currently completed with 46 / 81 roots. For opaque results with actual function data, calculation correspondence cannot be established solely by proving irrelevance; the remaining entries continue to be processed one by one based on source code transparency and output data.

## Verify

5 The proofs of the new profile are compiled and pass the axiom closure check, and the allowed range is only Lean standard axioms; there are no new axioms or sorry. The type and definition body of each specified native target are recursively checked for the NativeBridge auxiliary definition, leaving no source symbols.

All 88 increments profile have successful records matching the current source code and dependencies; 79 covering 1336 coverage certificates covering profile have been jointly imported and passed. This round recompiles the new proofs and affected dependencies, and re-executes the co-import; there is no re-running of all old baseline proofs or Corelib mechanical translations, nor is there re-running of the old Mathlib consumption examples.

For the exact certificate type and axiom dependency, see [Certificate Report ](reports/CERTIFICATES.md), for root-by-root status, see [Covering Ledger ](reports/CORELIB_LEDGER.csv), and for common import, see [Verification Record ](reports/interop/all/import-all-validation.json). Compile cache and exploration scripts are only saved in remote .work.

## subsequent sequence

Continue with P3/P4/P5/P6: Prioritize reusing the type bridge of the Type value relationship to process the remaining statements, and then advance binary bit operations, division and digital representation. The opaque function distinguishes between results that can be uniquely determined by the output type, and arbitrary data results that still require the equation to be evaluated. The current remaining 583 roots have not yet reached the completion category, and the absence of a correspondence cannot be inferred from the not-found proof.
