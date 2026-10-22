# Correspondence follow-up plan

Status: 2026-10-19 Start; first build the plan and dependency graph, and then execute the proof. This directory is a new workspace, with old experiments as an immutable baseline.

Goal: After mechanical translation, prove the correspondence with the specified Lean native type and operation, and allow existing certificates to be reused by subsequent claims. Mechanical nat/eq does not fall back to bootstrap.

## baseline

2180 deduplication roots: TYPE_ISO 29, OPERATION_CORRESPONDENCE 114, STATEMENT_FULL_NATIVE 143, STATEMENT_PARTIAL 702, TRANSPORT_INTERFACE_ONLY 375, NOT_YET_BRIDGED 485, EXPLICIT_PROOF_PARAMETERS 331, TYPE_VALUED_STATEMENT 1.
Source: ../mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv.
Historical certificates will not be re-claimed as executed due to new experiments; new certificates added in this round are independently verified, and baseline inheritance is indicated when summarizing.

## Execution sequence and acceptance

| steps | work | pre-dependency | Acceptance | Status |
|---|---|---|---|---|
| P0 | Warehouse archiving, retaining source code and key results | Remote archive verification | Mac Confirm recovery before cleaning; do not delete the remote operating environment | Completed: Archive verification records are available at ../../docs/STORAGE_CLEANUP.json |
| P1 | 2180 baseline task list, source dependency graph, and bridging tasks DAG | Original IR, covering ledger | Nodes are traceable, distinguishing source facts from planning dependencies, check DAG | Completed: tasks.csv, dependency-graph.json, 2180 root / 9457 dependencies |
| P2 | Existing certificate reuse and function combination mechanisms | Nat/Bool/Option/ function Iso | Combine certificates on real import; unknown operations do not falsely report success | The first batch has been verified: Registry, transport_comp, two automatic combinations; generalization continues |
| P3a | Program.Basics combiner and SSR Option, simpl_fun | P2, Option Iso, Eq bridge | Type round trip, operation equation are registered separately, Lean kernel and axiom closure check | The first batch has been verified: 6 Basics + 17 SSR operation/predicate + 1 SSR type; see the certificate table for details |
| P3b | Numeric values, comparisons, numerical representations and their conversions | Nat/N/Z/Bool Iso, representation type bridge | Clarify the native target, specification form and parameter range | Nat.iter; digital representation/reading/comparison/normalization has been advanced; writing and carry semantics have been proven; seven top-level printings have been mapped Mathlib Nat.digits; positive/N/Z bitwise operations have been mapped; signed reading is to be continued |
| P4 | Dependent functions, Sigma/Subtype, Eq transport, Acc | P2, dependency elimination corresponding | Keep index/proof dependencies and actual universe range | Started: Acc and 7 term well-founded recursion/predicate; complete Sort's Sigma/Subtype, binary well-founded recursion, basic container elimination; Eq/ Boolean equality advanced, remaining dependency statements continued |
| P5 | Gradually upgrade the 375 interface to the computing interface | Certificate of P3/P4 | For equations/iff that specify native operations, interface round-trips are not mixed | Thirty-six batches are advanced; currently only the 121 item is interfaced |
| P6 | Reprocessing Partial Statements and Shared Proof Obligations for Item 702 | Operation certificate, dependency conversion | Native statement iff; unresolved proof conditions continue to be explicitly retained | SSRBool upgrades 141 items; digital comparison upgrades and proves 8 items; 293 conditional roots have been closed and instantiated and corresponding, and the remaining 38 in this layer |
| P7 | Unified import is used in combination with Lean/Mathlib | Acceptance certificate | Used across modules to log actual test boundaries and remaining failures | The first batch of acceptance passes: 84 covers profile / 1392 certificates are jointly imported; Nat + SSR + Setoid combination, Mathlib Nat.prime_two consumption passes; see INTEROP_RESULTS.md |

P2/P3a adopts a small step cycle: first implement the minimum reusable mechanism, then verify on specific functions, and return to the mechanism layer after supplementing the certificate.
The first batch selects Program.Basics, SSR, Option/ function packaging and Nat.iter; multiple certificates with the same declaration will not be counted repeatedly in the root number.
The relational nature of Classes can be advanced after basic bridging; the value relation of Type cannot be compressed into Prop without authorization. Floating point and array boundary conventions are treated as separate semantic topics.

## Product of each step

- PLAN.md: Step status, completion evidence and next step.
- DAG.md: human-readable task dependency graph; dependency-graph.json / source-dependencies.csv: actual source dependency and SCC information.
- tasks.csv: Each root’s baseline status, source dependencies and current round progress.
- proofs/: universal correspondence for handwriting; complete certification documents, scripts and registration forms generated.
- reports/: kernel validation, axiom closure, explicit source root to certificate mapping, updated coverage ledger.
- .work/: Compilation cache, detection, temporary output, only retained remotely.

## Counting and Correctness

The new certificate must explicitly register the proven source statement, and cannot be counted as a coverage just because the theorem type mentions a statement.
Distinguishing types bidirectional inverse, native interface round trip, operation consistency, statement iff; with additional assumptions must be retained.
Mathematical impossibility cannot be inferred from "generator not found bridge". Canonicalization/one-way interpretation cannot be passed off as bijection.
The native target can be a combination expression specifying Lean, but must be marked separately from the direct correspondence of the ready-made API.
In each round, only the items that actually passed the verification are updated; unfinished steps continue to be listed and are not marked as completed.

## The first batch of execution records

P0/P1 completed. P2/P3a The first batch of 5 and profile all passed, adding 1 type roots and 24 operation/predicate roots (including Nat.iter). P3b has started Nat.iter, and the remaining numerical work is to be continued. P4/P6/P7 has not started yet. P5 In this batch, 23 interface roots have been upgraded, and 1 operation roots without certificates have been supplemented; there are also 352 interface-only roots.

Code inspection found that type aliases may bypass bridge lookups; the new generator performs weak-head normalization before identityIso determination, and automatically obtains the native Bool function interface with mechanical Bool's simpl_fun parameter validation. This modification has not yet been rolled out to verify all old interfaces.

## Second batch of execution records

The SSR Bool/ relational predicate, pred/rel type correspondence, and reflect's native logical correspondence have passed the partial kernel check; these rules have been applied to the 216 partial native statement, the 141 unsourced symbol, and the 75 entry continues to remain a partial correspondence. For the estimated coverage quantity, see ESTIMATE.md (subjective planning estimate, not a proven result).

The second batch adds 3 type roots (pred, rel, reflect), 12 operation/predicate roots, and 141 complete native statement roots. All seven certificates profile passed. The complete count is based on reports/summary.json.

Generator regression exposing premature whnf crossing array/string registered bridges; adjusted to match registered bridges first, then expand unknown aliases before identityIso. The inspection of 45 old interfaces profile is recorded in reports/alias-regression.json. Finally, 45 and profile all pass, and no old interfaces are lost/added before they can be released.

## The third and fourth batch of execution records

Added 4 type, 36 operation/predicate, 8 completely native statement; the latter 8 item has original statement proof. A total of 515 / 2180, 11 and profile verification records have been completed in total. The specific results of digital representation and boundary, Acc/WellFounded/Fix and native theorem reuse are shown in NUMERIC_WF_RESULTS.md. P3b/P4/P5/P6 are all continued, P7 is not yet completed.

## The fifth batch of execution records

The sig/sig2/sigT/sigT2/prod type bridge of complete Sort adds 5 certificates, and the type roots are not counted repeatedly; 16 new operation roots are added. 5 empty axiom closures witness that 4 conditional roots are actually instantiated; 327 remain in this layer, and the original mechanical derivation is still 331. The current completion category 531 root, 12 increments profile has a successful record. See DEPENDENT_RESULTS.md for details.

## The sixth batch of execution records

Added 2 binary well-founded recursions, 23 basic datatype operators/eliminators, and 5 native statements after closing conditions, totaling 30 roots, totaling 561. The 5 new statements are all proved by the original statements, and the existing obligatory witnesses are reused; the independent witnesses are still 5, and the instantiated conditional root is 9. Added PSum's complete Sort type certificate without duplicate root counting. 15 profile have successful records. See RECURSION_STATEMENTS_RESULTS.md.

## The seventh batch of execution records

Eq transport and Boolean equation add 19 root, totaling 580. 17 profile verification records passed; the remaining conditional roots of this layer are 318. The newly added 4 complete original statements are accompanied by original statement certificates. See EQUALITY_RESULTS.md for details.

## The eighth and ninth batches of execution records

A total of 126 roots of the two relationship modules have all obtained certificates within the express scope, and the 17 type, 32 operation, and 77 complete original statements have been added; among them, 21 copies have original statement certificates. Tlist/ variable parameter predicate and two conditional roots have been processed. The cumulative completion of 706, 23 increments profile records passed. See RELATIONS_RESULTS.md for details.

## The tenth batch of execution records

Morphisms adds 5 type/tag, 8 operation, and 55 complete native statement, totaling 68 roots; all 87 roots of this module have explicit correspondence within the scope. The cumulative completion of 774; 25 incremental profile verification records passed, and the new original statement certificate is still 38. See MORPHISMS_RESULTS.md for details.

## The eleventh batch of execution records

Added 40 completed roots of Equivalence / Morphisms_Prop / Setoid, totaling 814; these three modules have a total of 52 roots with express scope certificates. 29 profile records passed, and the new original statement certificate was 43. See EQUIVALENCE_SETOID_RESULTS.md. Next check the unified import of P7 while keeping the remaining corresponding tasks.

## P7 first batch of execution records

28 535 incremental coverage certificates and additional certificates of profile, totaling 585 entry/2967 dependency statement copies, were imported successfully. The original mechanical type identity is preserved and composed across closures through native interfaces. Mathlib consumption and new axiom rejection test passed; the coverage root number is still 814. See INTEROP_RESULTS.md for details.

## The twelfth batch of execution records

Of the 49 partial statements of Init.Specif, 49 have been shown to be equivalent to native statements of passive symbols. Added Subtype / PSigma quantifiers, function families, equations and projection rules; no new proof of the original statement will be added. A total of 863 roots have been completed, and 31 profile verifications have passed. See SPECIF_STATEMENTS_RESULTS.md.

## The thirteenth batch of execution records

The new 1 type and 11 operation are added to digital writing, and 875 roots are accumulated. Universal carry, iteration, and numerical properties of mechanically printed results are demonstrated. 32 and profile have successful records with current source code; seven top-level prints have subsequently been supplemented with the adaptation equations for ready-made Nat.digits. See NUMERIC_WRITE_RESULTS.md.

## Execution records of the 14th and 15th batches

Signed read adds 3 root; gcd, divmod, sqrt/log2 and two internal iterators of Nat add 6 root. Init.Nat's 58 roots have express in-scope certificates. All project completion categories 884, 37 and profile passed the verification, and all 613 coverage certificates were jointly imported and passed. The terminating condition of gcd is handled by a closed proofs under the standard Lean axioms, with the remaining conditional root 315. See SIGNED_READ_RESULTS.md and NAT_COMPLETION_RESULTS.md.

## The sixteenth batch of execution records

Peano adds 1 operations and 5 complete native statements; module 36 roots all have certificates with clear scope. 31 Peano statements are all checked, and 26 existing completion roots are not counted repeatedly. The old 143 completely native targets were reviewed according to the actual selection module of the ledger, and all passed. A total of 890; 39 profile and 619 incremental coverage certificates have been imported and passed. The next step continues with the basic eliminator, List and binary number operations. See PEANO_RESULTS.md.

## The seventeenth batch of execution records

List The remaining 3 roots and binary number comparison/multiplication/halving, etc. 29 root passed, and the total 922 was completed; 43 profile, and 651 coverage certificates were jointly imported and passed. Next step: Lossless representation of Pos.mask, double recursive invariant of subtraction, combined with N/Z subtraction and addition. See LIST_BINARY_RESULTS.md.

## The eighteenth batch of execution records

The lossless Iso, two-term eliminator, two induction statements and subtraction invariants of mask have been proved, and N.sub and Z.pos_sub/add/sub have been completed. Added 15 root, and completed 937 in total. 47 increments profile were recompiled and 666 coverage certificates were jointly imported and passed. The next step is to add the native statement of Datatypes corresponding to the complete Sort parameter, and continue the unfinished bit operation/iteration of the binary number. See BINARY_MASK_RESULTS.md.

## The nineteenth batch of execution records

Datatypes 37 remaining statements are all native, 4 index eliminators and 2 conditional transformations have been processed; module 110 roots have clear range correspondences. The newly added root 48 and a total of 985; 51 profile and 718 coverage certificates were imported and passed. The complete Sort container corresponds to the use of PLift at the bridge layer, and the Type case is compatible with the original bridge; the mechanical rules remain unchanged. The next step continues the shared proof obligation and remaining elimination operations of Init.Logic / Specif. See DATATYPE_COMPLETION_RESULTS.md.

## The twentieth batch of execution records

151 shared dependencies/original statement targets of Init.Logic have closed proofs of empty axiomatic closures. 72 conditional roots (18 definition, 54 statement) are actually corresponding, and 13 partial statements and 9 operations are upgraded; 94 root is added. Module 176 root all has express scope certificates, total completion category 1079. 57 verification profile and 812 coverage certificates were jointly imported and passed. The next step continues Init.Specif’s shared dependency, dependent data elimination and equality elimination. See LOGIC_COMPLETION_RESULTS.md.

## The twenty-first batch of execution records

140 shared dependencies/original statement targets of Init.Specif have closed proofs of empty axiom closures, and 70 conditional roots actually complete the correspondence. Added 1 type, 41 operation, 38 complete native statement, totaling 80 roots; module 159 roots all have explicit certificates within the scope, and the cumulative completion category is 1159. 63 verification profile; currently 892 coverage certificates have been jointly imported and passed. The next step is to continue the conditional closure and native operation equations of other modules. See SPECIF_COMPLETION_RESULTS.md.

## Twenty-second batch of execution records

SSR adds 27 predicates, 50 complete native statements, bijective and NonPropType.type two types corresponding; 5 Option operations supplement the complete Sort proof. The newly added root 79, a total of 1238, 68 and profile have passed the verification. ssrfun still has the 27 root unfinished. The next step is to process the packaging type, data projection and six conditional roots. See SSR_FUN_RESULTS.md.

## The twenty-third batch of execution records

SSR packaging type, dependent data and some functions are added with 23 root, and 1261 is completed. 71 verification profile and 999 incremental certificates are jointly imported and passed; the remaining four opaque calculation functions of ssrfun require additional calculation equations and cannot be regarded as corresponding after only reading body. Next, after recording the dependency gap, continue transparent operations such as ssrbool and prove that the conditions are closed; the declared meaning of the frozen mechanical product will not be changed. See SSR_DATA_RESULTS.md.

## Twenty-fourth batch of execution records

SSR Bool adds 14 type, 34 operation, 46 complete native statement, totaling 94 roots, and total 1355 is completed. Module 451 root completes 251 root; 46 of 75 partial statements are completed, 29 continue to retain source symbols. 74 verification profile and 1093 coverage certificates were jointly imported and passed. The next step is to add manifest/keyed packaging, mem/prop_in/prop_on dependency and sharing proof conditions. The computational gaps in the equations of opaque are kept alone, and no copies of body are passed off as corresponding proofs. See SSR_BOOL_DATA_RESULTS.md.

## The twenty-fifth batch of execution records

SSR packaging and locked/master_key add 8 type and 15 operation; among 29 remaining statements, 28 are automatically nativeized, and if_arg is completed with independent natural targets and original statement proofs. Total new 52 roots, total completion 1407. ssrbool completes 301 / 451, and all the original statements are completed; the remaining unfinished ones are mainly 128 conditional roots. 76 certificates covering profile and 1145 were verified; after the packager added support for retaining opacity, 70 certificates covering profile were all repackaged and imported together. Subsequent closure conditions by shared dependency preserve the equality constraints between computational opaque and packages carrying carrier types. See SSR_PACKAGING_RESULTS.md.

Among the next batch of 128 ssrbool conditional roots, 73 are statements and 55 are definitions; they directly depend on a total of 275 different predeclarations. DefaultKeying The two export source names use slashes, and the ledger uses points. Subsequent normalization must be explicitly performed and the original sources retained to avoid omissions.

## Twenty-sixth batch of execution records

SSR Bool's 314 dependency/original statement targets have closed proofs, covering 271 / 275 pre-statements; all pre-proofs of 124 conditional roots are complete. The corresponding 83 root (73 statement, 10 operation) is completed, and 1490; 80 verifications profile and 1228 certificates are jointly imported and passed. There are still four shared prestatements that are unproven, as well as the closed but uncorresponding opaque result. The next step is to deal with the four gaps first, and then use the single-value nature of outputs such as reflect to advance the opaque proof packaging; the calculation equations for arbitrary data selection functions are still handled separately. See SSR_CONDITIONS_RESULTS.md.

## Twenty-seventh batch of execution records

Complete the last four shared prerequisite proofs of ssrbool, and all 275 predicate statements are closed. 23 reflect functions and 13 logic/judgment/packaging functions complete the correspondence, all of which maintain the original opacity of the source function. A total of 1526, 83 verification certificates profile, 1264 certificates have been imported together. ssrbool remaining 31 root; next step processing alt_spec / if_spec index type, remaining restricted domain predicate and container discrimination. The five data selection functions still require independent computational evidence. See SSR_REFLECTION_RESULTS.md.


## Execution records from the 28th to the 30th batch

The 28th batch completed the alt_spec / if_spec type round trip and four downstream functions, and completed the restricted domain predicate and container branch determination. A total of 20 roots (2 type, 18 operation) were added, with a total of 1546.

The twenty-ninth batch proves that the binary iteration corresponds to Nat.rec and combines certificates for multiplication and division by two to complete integer powers, parity, and signed shifts. Added 6 root and 7 certificates, accumulating 1552; the conventions of returning zero for negative exponents, reversing direction for negative shifts, and rounding down for negative numbers are all retained.

The 30th batch completed all 7 roots of Init.Sumbool, accumulating 1559; 12 closed precondition proofs and processed 4 original conditional roots. bool_eq_ind has additional proof of original statement. The AND/OR operation covers any four propositions and is not limited to the complementary case of Decidable.

The thirty-first batch completed 18 types of CRelationClasses corresponding to 20 projection/combination operations, accumulating 1597. The Type value relationship retains its data and is not confused with the ordinary Prop type class; iffT only requires functions in two directions and does not require bidirectional inversion.

88 increments profile currently pass the verification; 79 certificates covering profile and 1336 pass the joint import check. See BATCH28_31_RESULTS.md for detailed evidence and ../../results/CORRESPONDENCE_EXAMPLES.md for specific use cases. The next step is to reuse the type bridge of CRelationData to advance the remaining statements and continue binary operations/number representation; the opaque data function still needs to calculate the evidence independently.

## The thirty-second batch of execution records

Reusing the bridge for Type-valued relations adds StrictOrder types and projections and 15 fully native statements: 17 new roots, for 1614 / 2180 overall. 15 items also have proofs of the original statement. CRelationClasses reaches 63 / 81. Validation covers 89 profile, and the 1353 certificates from 80 coverage profile import together successfully. Next are the data representation of PartialOrder, the remaining binary operations, and gaps caused by data opacity; see CRELATION_STATEMENTS_RESULTS.md.

## Batch 33: Partial ordering and equality/logical equivalence

Added 7 root, currently 1621 / 2180; CRelationClasses is 70 / 81. PartialOrder retains the two-way function in the value relationship of Type; eq_equivalence and iff_equivalence are converted to Lean Equivalence Eq/Iff, and two inverse laws and six preconditions are proved. 90 profile and 1360 coverage certificates were verified, and 81 coverage certificates profile were jointly imported and passed. For details, see [Result ](CRELATION_ORDER_RESULTS.md). The remaining 11 CRelationClasses roots are all opaque_data. They are first reserved as missing result descriptions, and then promoted to transparent operations and nativeizable statements in other modules.

## Batch 34 to 36: Relational Preservation and Bitwise Operations

Added 30 root, currently 1651 / 2180. The 19 root of CMorphisms covers transparent relational interfaces, tags, Type value statements and calculation functions; the 8 root of positive/N and the 3 root of Z prove to be consistent with Nat/Mathlib Int bitwise operations. Two additional Mathlib and API certificates will be added for the difference, and the number of roots will not be repeated.

93 profile have current verification records, and 84 certificates covering profile / 1392 are jointly imported and passed. The four negative input examples and the commutative law pushing back the machine N.land from Nat.and_comm actually compile. For details, see [Result ](BATCH34_36_RESULTS.md).

Next step: IntDef Remaining 8 Items (div, div_eucl, modulo, pos_div_eucl, quot, quotrem, rem, sqrtrem), first distinguish between rounding down and rounding towards zero, then prove the core of positive division and signed combination; continue to reuse existing values Iso, comparison, subtraction and recursive invariants. CMorphisms The remaining 54 items, some of which are transparent outer layers, still rely on opaque_data internal calculations, and this outer layer is not misjudged as having been able to prove the native implementation equation.

## Batch 37 to 39: Binary operation module completed

Added 13 root and 16 certificates, totaling 1664 / 2180. Division 8 roots, square roots 4 roots, iter_op 1 roots; the latter respectively provide unconditional binary bracket correspondence, associative law foldr correspondence, and Nat.add/mul special case. BinNums.PosDef 36/36, NatDef 11/11, IntDef 39/39.

97 profile have current verification records; 88 certificates covering profile and 1408 are jointly imported and passed. For details, see [Result ](BATCH37_39_RESULTS.md).

The next step is to advance 6 dependency eliminators and 6 induction statements of Numbers.BinNums by dependency: first establish a complete native recursive target, then prove that the actual source eliminator calculation is consistent, and finally nativeize the induction statement. The rest of the numerical representation and the opaque data calculation gap continue to remain, and the equation cannot be realized from the signature guess.

## Batch 40 to 43: Dependency elimination and digital representation completed

Added 67 root, currently 1731 / 2180. Numbers.BinNums 15/15, Init.Decimal 40/40, Init.Hexadecimal 38/38, Init.Number 17/17 All correspondence within the stated range has been completed. The 36 prefix proofs of 9 equality determination functions are closed; the condition corresponds to the remaining 29. The original statement was independently verified and 20 was added, totaling 220.

101 profile certificates passed the verification; 92 certificates covering profile and 1475 certificates were imported together. For details, see [Result ](BATCH40_43_RESULTS.md).

The next step is to process the 9 root of Init.Byte: first establish the correspondence between the eight-bit Boolean tuple and Fin 256 / BitVec 8, and then process of_bits/to_bits, dependency elimination and two round-trip statements. Actual bit ordering is preserved; proof of global enumeration is checked by kernel and is not replaced by sample testing.

## Batch 44 to 48: Byte and native data operations

Added 64 root, currently 1795 / 2180. Byte 10/10, PrimInt63 37/37, CarryType 1/1, PrimString 17/17, Init.Equality 22/22, PrimArray 8/8. 107 profile certificates were verified, and 98 certificates covering profile / 1539 certificates were jointly imported and passed. For details, see [Result ](BATCH44_48_RESULTS.md).

Next step: 10 unconditional statements of Init.Wf are first generated and proved independently, and then the explicit conditions of Acc_inv_dep are processed. Reuse the existing Acc/WellFounded Iso and Fix/Fix_F correspondences, retaining the extensional premise and universe scope of the original declaration. Subsequently, Program.Wf and SSR were promoted to rewrite the interface and floating point representation; the opaque data gap still needs to be calculated and evidenced.

## Batch 49 to 54: Well-founded recursion and SSR rewriting

Added 76 root, currently 1871/2180; Init.Wf 21/21, Program.Wf 10/12, ssreflect_rw 52/55, ssrclasses 4/4, ssrunder 7/7. 314 original conditional roots have been closed and corresponding, leaving 17; the original statement is independently proven 260. 113 profile certificates were verified, and 104 certificates covering profile / 1615 certificates were jointly imported and passed. For details, see [Result ](BATCH49_54_RESULTS.md).

Next step: Uint63Axioms / Sint63Axioms. First bridge its transparent definition (carry definition, comparison, bit test, to_Z, bit width), and then rely on the existing machine integer and binary integer corresponding processing specification statements. Specification iff and original specification certificate are counted separately. The floating point model, opaque data calculation and remaining class interfaces will continue to be retained according to the ledger.

## Batch 55 to 56: Uint63 transparent definition completed

Added 22 roots, currently 1893 / 2180. Uint63Operations 16 items, Uint63Conversions 6 items; any recursive fuel, negative integer, out-of-bounds index are covered. 115 profile certificates were verified, and 106 certificates covering profile / 1637 certificates were jointly imported and passed. For details, see [Result ](BATCH55_56_RESULTS.md).

Next step: Uint63Statements, first prove the bitwise operations, source statements and native correspondences of eqb, of_to_Z, and then use integer arithmetic/comparison bridging to handle the remaining specifications.

## Batch 57 to 59: Uint63 specifications

Added 15 roots, 1908/2180; Uint63Axioms 37/48. 15 items are all independently proven source statements, and the complete original proposition certificate is passed at the same time. 118 profile certificates are verified; 109 certificates covering profile and 1652 certificates are imported together. For details, see [Result ](BATCH57_59_RESULTS.md).

The next step to process the remaining specifications of 11 is to recheck the arithmetic and division proofs of Z in the actual dependency closure of this module; this closure does not contain N/mask, so only the required Z path is reused. Then push Sint63Axioms and the rest of the modules.

## Batch 60 to 62: Arithmetic and bit counting specifications

Added 9 root, 1917/2180; Uint63Axioms 46/48. Addition, subtraction, multiplication and division, left and right shifts, and clz/ctz specifications are all independently proven. 122 profile certificates are verified; 112 certificates covering profile and 1661 certificates are imported together. See [results](BATCH60_62_RESULTS.md).

Continuing with Uint63WideSpecs: The wide multiplication equation for mulc has been passed alone; diveucl_21 is handling the range bounds of the quotient and the conversion of the source product return value. After the profile is passed as a whole, two more pieces will be registered.

## Batch 63 to 65: Machine integer specifications completed

Added 10 root, 13 certificates, 1927 / 2180. Uint63Axioms 48/48, Sint63Axioms 8/8; All original premises retained and specifications independently proven. 128 profile certificates are verified, and 115 certificates covering profile / 1674 certificates are imported together. See [results](BATCH63_65_RESULTS.md).

Next step: ArrayAxioms 11 items. Retaining bounded length, default values, and out-of-bounds read/update semantics, first prove the normal get/set/make/copy specification, then prove array extension; then PrimStringAxioms 12 terms.

## Batch 66 to 70: Container specifications completed

Added 23 root, 24 certificates, 1950 / 2180. ArrayAxioms 11/11, PrimStringAxioms 12/12. 20 specifications are independently proven source statements; PrimString.compare additionally corresponds to List.compareLex. 134 profile certificates are verified, and 120 certificates covering profile / 1698 certificates are imported together. See [results](BATCH66_70_RESULTS.md).

Next step: first close Prelude/Classes.Init tags, decision aids and DefaultRelation; then process CMorphisms computable data and provable statements. Floating-point targets must preserve binary format, NaN, infinity, and rounding; the exact representation must not be called Lean Float without proof. The calculation result cannot be guessed from the opaque Type value constant signature.

## Batch 71 to 75: Basic markers and symbolic floating point

Added 50 root, 2000 / 2180. SpecFloat 38/55, base mark/decision/relationship compatible six modules complete 12 root. 145 verification certificates profile and 130 covering profile / 1748 certificates are imported together. See [results](BATCH71_75_RESULTS.md). The next step continues SpecFloat with the remaining 17 items, PrimFloat representing the AND operation, and FloatOps conversion; the floating point axioms must retain the original premises such as validity and comparison, and cannot claim to support Lean Float just because the symbolic algorithm corresponds.

## Batch 76 to 81: Symbolic floating point completion

Added 17 root, 2017/2180; SpecFloat 55/55. 154 verification profile, 136 incremental certificates covering profile / 1765 are imported together. For details, see [Result ](BATCH76_81_RESULTS.md). Next, the PrimFloat specification binary representation and operation, FloatOps representation conversion, and then the floating point specifications are processed item by item; the equivalence with runtime Float API has not yet been proven.

## Batch 82 to 85: PrimFloat completed

Added 37 root, 2054/2180; PrimFloat 37/37. 158 certificates profile and 140 certificates covering profile / 1802 are imported together. See [results](BATCH82_85_RESULTS.md). Continue to recheck the dependency in the actual closure of FloatAxioms, and then prove that the 8 item of FloatOps and the 33 item of FloatAxioms natively correspond; the independent proof of the original specification is separately distinguished.

## Batch 86 to 89: Floating point conversion and specification statement completed

Added 41 root, 2095 / 2180. FloatOps 8/8, FloatAxioms 33/33; among them, item 24 is the statement iff, and the independent proof of the original statement is still 318. 165 certificates profile and 144 covering profile / 1843 certificates are imported together. See [results](BATCH86_89_RESULTS.md). The next step is to review the bidirectional correspondence and predicate fields of the bearer type SSR predicate package, and then process the remaining Type value data.

## Batch 90: predicate package and opacity review

The complete correspondence of 5 package passes, freezing the baseline 2100/2180. 166 profile / 1848 certificates passed verification and joint import. The remaining 80 roots have been inspected module by module. 69 direct opaque and 11 transparent packages are all non-Prop values.

The next step is to establish a computationally transparent experiment preserving the body in [transparent-data](transparent-data/PLAN.md). The original environment is not modified; the expandable machine definition of the new namespace and the native operation correspond to separate statistics. The newly defined value equation of the original opaque constant ↔ still requires independent evidence and cannot be deduced from the same body or the same signature. Process CRelationClasses first, then CMorphisms, SSR, and Program.Wf.

## Compute transparent branch completed

The newly added 80 root certificates all passed, and the original 2100 root was rechecked in 173 profile; it was successfully imported together with 6 new profile, dependent Fin and Mathlib consumer cases. Variants up to 2180/2180: 164 type, 988 operation, 1028 native statement iff. The original frozen version is still 2100/2180.

Automatic composition of a given correspondence has been implemented, automatically generating native functions and proofs of equality; missing rules, unsatisfied conditions, or extra axioms are rejected. For the specific scope, recurrence and complete ledger, see [Transparent Branch ](transparent-data/README.md).
