# Cross-module import and Mathlib consumption results

The current joint import acceptance has passed: 130 profile and 1748 coverage certificates containing incremental coverage certificates, together with the original statement certificate and closed packaging function, a total of 2372 export entries, are imported and audited in the same Lean file. Duplicate dependency declarations 21186; these copies do not increase the correspondence coverage quantity.

## How to use it specifically

`interop/Consumer.lean` simultaneously uses three mechanical closures that cannot be imported directly at the same time:

- Mechanical Nat, addition and corresponding proof of Init.Nat;
- The mechanism of SSR is Option.map, and the container element uses the mechanism of the previous module Nat;
- Conversion of Setoid_Theory to Lean Equivalence for native Setoid / Quotient.

It has been proved that the converted Option.map is equal to the original plus one map, and the result is put into the original Quotient; it is also proved that the mechanical addition conversion result can be used as Nat.add_comm. The Mathlib consumer example uses the ready-made `Nat.prime_two` to prove that the mechanical `1 + 1` conversion result is a prime number.

Lean version 4.33.1. Reuse the remotely installed Mathlib and submit it as `0df444a360eaa60ab8c11dca51a86af692955474`; no new installation. Actual verification includes the above four consumption certificates, as well as the correspondence of the seven printing functions in NumericMathlib to Nat.digits, which does not mean that the entire Mathlib is compatible.

## implementation and boundaries

The original profile both referenced a different module named Rocq2LeanOut, and had a duplicate NativeBridge name. ProfilePack reads the dependency closure of the specified certificate from the compiled environment and re-creates the declarations in a separate namespace; each declaration passes through Lean kernel again. Keep the parameters, definition body, proof body and structure projection information of universe, do not modify the original mechanical translation, and do not map Nat/Eq to native types.

Each profile mechanical type still has an independent identity; this is a common import with a namespace. Composable across closures via proven native interfaces, all mechanical types have yet to be synthesized into a single canonical namespace. The packager also did not generate native code for calculation. The current acceptance is to prove consumption, not running performance.

New axioms, unsafe declarations, nested induction groups, and structures with inherited fields are currently explicitly rejected. opaque declares to copy the original type, and its definition body and dependencies are also verified; do not change it to transparent def. Negative fixture confirms that the new axiom cannot enter the output. The only allowed axiom closures are propext, Quot.sound, and Classical.choice; the actual entry closures are listed one by one in JSON.

## Documentation and reproduction

- `interop/ProfilePack.lean`: Statement duplication and kernel/axiom checking.
- `interop/pack_all.py`: Select the incremental coverage list and additional proof entry.
- `interop/check_all.py`: Import all PackedAll modules at one time and check the entries and axioms.
- `interop/pack_profiles.py`, `check_consumer.py`: three independent modules and Mathlib consumption example.
- `interop/check_rejection.py`: New axiom rejection test.
- `reports/interop/all/import-all-validation.json`: Jointly import evidence.
- `reports/interop/coverage-manifest.json`: A fixed list of the current 1748 coverage certificates.
- `reports/interop/consumer-validation.json`: Actual Mathlib commit, toolchain and consumption results.

Execute pack_all.py, check_all.py, and pack_profiles.py, check_consumer.py, check_rejection.py in sequence in the work area. The compilation cache and generated packaging source code are located in .work/interop and are only saved remotely. The scripts need to complete the original profile compilation first; they do not download dependencies.

The fifteenth batch of historical snapshots contains all 613 incremental coverage certificates at that time, including Specif, digital write/read, Mathlib, digits, gcd, divmod, and sqrt/log2. Registry is a mechanism verification module and does not generate coverage roots, so 37 verification profile corresponds to 36 coverage modules.

The packaging module of NumericMathlib explicitly imports Mathlib.Data.Nat.Digits.Defs, retaining the identity of the native Mathlib constants; NatIterators imports the corresponding Init arithmetic lemma. pack_all.py can pass the profile name, and only the changed modules will be rebuilt; the inherited part will check the source code, packager and certificate entry set item by item, and finally still perform a common import check for all modules.

After Peano expansion: 38 profile and 619 coverage certificates containing coverage certificates were imported and passed. For the actual number of entries and dependent copies, see reports/interop/all/import-all-validation.json.

After the seventeenth batch of expansions: 42 profile and 651 coverage certificates containing coverage certificates were jointly imported and passed; corresponding to all current incremental coverage.

After the eighteenth batch of extensions: 46 profile and 666 coverage certificates containing coverage certificates were all imported and passed.

After the nineteenth batch of extensions: 49 profile and 718 coverage certificates containing coverage certificates were jointly imported and passed. DatatypeQuantifiers and Registry are verification modules without independent coverage entries, and the required dependencies are encapsulated with the certificate closure.

After the twentieth batch of extensions: 54 profile and 812 coverage certificates containing coverage certificates were jointly imported and passed. LogicWitnesses is a shared proof dependency module. Its proof is encapsulated with the dependency closure of the user certificate and does not add a separate coverage root.

After the twenty-first batch of expansions: 58 profile and 892 coverage certificates containing coverage certificates were jointly imported and passed. Added SpecifOperations, SpecifChoice, SpecifEqualityElimination, and SpecifClosedStatements; shared witness and normalization modules are included with dependency closures. Current listing is consistent with certificates.json, coimport_not_current_coverage=false.

After the twenty-second batch of expansion: 63 coverage certificates profile and 976 coverage certificates were jointly imported and passed, 1265 entries, and 7828 copies of dependency declarations. Added SSRFunNormalization, SSRFunPredicates, SSRFunOption, SSRNonProp, SSRFunStatements.

After the twenty-third batch of expansions: 65 coverage certificates profile and 999 coverage certificates were jointly imported and passed, 1294 entries, and 8015 copies of dependency declarations. SSRFunOpacity is only used for diagnosis and does not generate coverage entries.

After the twenty-fourth batch of expansions: 68 coverage certificates profile and 1093 coverage certificates were jointly imported and passed, 1388 entries, and 8655 copies of dependency declarations. Added SSRBoolData, SSRBoolLogic, SSRBoolExtendedStatements.

After the twenty-fifth batch of expansions: 70 coverage certificates profile and 1145 coverage certificates were jointly imported and passed, 1441 entries, and 9167 copies of dependency declarations. Added SSRBoolPackaging, SSRBoolRemainingStatements.

Independent verification supported by opaque see interop/check_opaque.py and reports/interop/opaque-preservation.json: kind reserved, body equation of any opaque Nat is rejected by synchronization kernel, unit single value proof is available. check_rejection.py Both the direct new axioms and the new axioms in opaque body are rejected.

After the twenty-sixth batch of expansions: 72 coverage certificates covering profile and 1228 certificates were jointly imported and passed, 1650 entries, and 10315 dependent copies. Added SSRBoolClosedStatements, SSRBoolClosedOperations.

After the twenty-seventh batch of expansions: 74 coverage certificates profile and 1264 coverage certificates were jointly imported and passed, 1722 entrances, and 11260 dependent copies. Added SSRBoolReflection and SSRBoolProofFunctions, and the opaque function maintains its original type.

After the 28th to 30th batch of expansions: Added SSRBoolIndexed, SSRBoolRestrictions, BinaryPower, SumboolBridge, CRelationData; 79 certificates covering profile, 1336 were jointly imported and passed, 1803 entrances, 11977 dependent copies. Newly certified native targets retain no source symbols. The old Mathlib consumption example has not been rerun this round; the common import check still contains the Mathlib module.

After the 32nd batch of expansion: CRelationStatements is added; 80 certificates covering profile and 1353 are imported together, 1835 entrances, and 12111 dependent copies.

After the thirty-third batch of CRelationOrder was added, 81 certificates covering profile and 1360 were jointly imported and passed; 1844 export entrances and 12229 dependency statements. New goals cover preserving the partially ordered representation of the Type data, as well as Lean Equivalence Eq/Iff. This batch of joint import includes the existing Mathlib import check, and the old consumption cases are not rerun.

Batch 34 to 36: Added CMorphismData, BinaryBitwise, BinaryIntBitwise. The latter actually imports Mathlib.Data.Int.Bitwise, proving that Z.land/lor/lxor corresponds to the ready-made Int API, and there are four negative examples; it proves the commutative law of mechanical N.land through Nat.and_comm. The joint import is 84 certificates covering profile and 1392. Compiled using the same Mathlib submission; the old consumer example was not recompiled in this batch. The new examples and commutative properties are checked in the original profile, without additional registration as the Corelib overlay root.

Batch 37 to 39: Newly added BinaryDivision, BinarySqrtRem, BinaryPositiveSqrt, BinaryIterOp. 88 certificates covering profile and 1408 were jointly imported and passed, 1893 entrances, and 13257 copies. Additional import of Init.Data.Nat.Log2 / Sqrt.Lemmas maintains the original claim identity; the old Mathlib consumption example is not re-run.

Batch 40 to 43: Added BinaryElimination, DecimalRepresentation, HexadecimalRepresentation, NumberRepresentation. 92 certificates covering profile and 1475 were jointly imported and passed; 1989 entrances and 16091 copies. The checker sets maxRecDepth=16384 on the growing entry list without reducing any checks.

Batch 55 to 56: New Uint63Operations, Uint63Conversions, 106 certificates covering profile, 1637 were jointly imported and passed; 2203 entrances, 16332 dependent copies. BitVec.Lemmas maintains the native claim identity, and currently manifest is consistent with the registry.

Batch 57 to 59: Added Uint63Statements, Uint63DefinitionSpecs, Uint63OrderSpecs. 109 certificates covering profile and 1652 are imported together, 2233 entrances, and 16814 dependent copies. Added 15 original statement certificates with certificate dependency closure encapsulation, currently coverage manifest are consistent.

Batch 60 to 62: Uint63ArithmeticSpecs, Uint63ShiftSpecs, Uint63CountSpecs and their rechecked arithmetic dependencies. 112 certificates covering profile and 1661 are imported together, 2251 entrances, and 17904 dependent copies. Sharing Uint63ArithmeticSupport does not increase coverage roots individually.

Batch 63 to 65: Uint63WideSpecs, Sint63Operations, Sint63Specs and re-inspection support. 115 certificates covering profile and 1674 are imported together, 2272 entrances, and 18986 copies. BitVec.Bitblast is imported as a library, and two ready-made sdiv/srem API certificates and a right-shift certificate with a negative count branch are added, without duplicating the source root.

Batch 66 to 70: ArraySpecs, StringOperations, StringSpecs, StringRoundtrip, StringComparison. 120 certificates covering profile and 1698 are imported together, 2316 entrances, and 19997 copies. Byte string comparison uses native List.compareLex; arrays retain default values, byte strings retain capacity and byte truncation.

Batch 71 to 75: six base markers/decisions/compatible profile with four symbol floating point overlays profile. 130 certificates covering profile / 1748 are imported together, 2372 entrances, and 21186 copies. The floating point target is an exact symbolic arithmetic and is not declared to correspond to the runtime Float; support for profile is not counted separately.

Batch 76 to 81: six symbolic floating point coverage profile; 136 coverage profile, 1765 certificates are imported together, 2389 entries, 23420 dependent copies. Nat.Sqrt.Lemmas is imported explicitly, retaining the square root native declaration identity. The old Mathlib consumer example was not rerun; the symbolic floating point target was not equivalent to the proven runtime Float counterpart.

Batch 82 to 85: PrimFloatRepresentation, PrimFloatArithmetic, PrimFloatExponent, PrimFloatSqrt; 140 certificates covering profile, 1802 are imported together, 2426 entrances, 23746 copies. The new type target consists of the ready-made Option/Sum/Fin/BitVec; the original identity of Nat.sqrt is retained by the formula.

Batch 86 to 89: FloatOperations, Float64Operations, FloatStatements, FloatUlp; 144 certificates covering profile, 1843 are imported together, 2467 entrances, 26442 copies. Proofs of different floating-point closures coexist through re-examination and independent packaging; the 24 specification only registers statement iff, without the original theorem proof count increment.

The 90th batch: SSRPredicatePackages; 145 certificates covering profile and 1848 were jointly imported and passed, 2472 entrances, and 26507 copies. Calculate transparent variants and do a separate joint import check, see [independent result ](transparent-data/README.md), not mixed into this baseline.

Compute transparent branch final check: 173 existing profile covering the original 2100 root, 6 new profile covering the 80 root; 2752 existing certificates/auxiliary entries and 28608 dependent copies re-examined. Successfully imported with new proofs, Consumer and Composition. The original frozen statistics remain unchanged. Automatically generated native functions are also imported together with the full variant; see [Full variant result ](transparent-data/README.md)] for details.
