# Batch 63 to 65: Machine integer specifications completed

Added **10 deduplication roots, 13 coverage certificates**, 1917 → **1927 / 2180**. Uint63Axioms **48/48**, Sint63Axioms **8/8** have all completed the correspondence within the express range.

## unsigned wide arithmetic

[Uint63WideSpecs.lean](proofs/Uint63WideSpecs.lean) Complete the last two items:

- mulc_spec: Multiply the high word by 2^63 and add the low word to accurately reconstruct the complete product. First prove that the quotient is less than 2^63 to ensure that the high word does not truncate the information.
- diveucl_21_spec: Retain the original premise that hi < divisor, prove that both the quotient and remainder of the double-word dividend can be loaded into the 63 bit, and independently construct two Z equality proofs at the source end. The native proposition expresses these two range conditions by "modulo 2^63 again without changing the quotient/remainder".

The source return values use the mechanical product, Z, and Eq; proof is that these are not directly replaced with native types. Numeric conversions are accomplished by combining previous explicit equations. The final file passes individual inspection in less than a second; uses explicit @ references to proven source theorems to avoid implicit parameter searches unwinding their computationally intensive statements.

## signed integer

[Sint63Operations.lean](proofs/Sint63Operations.lean)'s 5 root:

- min_int corresponds to BitVec.ofNat 63 (2^62), whose signed integer value is -2^62.
- to_Z is equal to BitVec.toInt, completely covering the positive, zero and negative intervals.
- compare_spec, ltb_spec, leb_spec correspond to the comparison/sequence of Int; the original statement is also independently proven.

[Sint63Specs.lean](proofs/Sint63Specs.lean)'s 3 root:

- div_spec: Reserve the overflow exclusion condition for x ≠ min_int or y ≠ -1; the result is equal to Int.tdiv.
- mod_spec: Without additional conditions, the result is equal to Int.tmod, including the zero divisor.
- asr_spec: Negative signed shifts return zero; otherwise equal to native sshiftRight. The original implementation truncates the non-negative shift amount to 63, which has been shown to not change the results. The negative exponential branch of source Z.pow is zero, thus retaining the full behavior of the source specification.

Three additional operation certificates cover the already counted PrimInt63.divs, mods, and asr: the first two are directly equal to Lean ready-made BitVec.sdiv/srem, and the latter is equal to the native combinatorial function with negative counting branches. Do not count roots repeatedly.

Sint63UnsignedSupport, Sint63ArithmeticSupport, Sint63QuotientSupport They only provide rechecked dependencies and do not add coverage roots. The division of N and the zero-rounding path of Z are revalidated in the Sint63 source closure, which is different from the downward rounding path used by Uint63.

## Total amount and verification

154 type root, 795 operation root, 978 complete native statement, total 1927. Remaining 25 interface only, 50 partial statement, 161 no certificate yet, 17 conditional root, total 253. Independent original statement certified total 292.

128 increments profile currently pass the verification; 115 certificates covering profile and 1674 are imported together, 2272 entrances, and 18986 dependent copies. BitVec.Bitblast is imported as a ready-made library, retaining the original declared identity of the sdiv/srem properties. All new proofs pass axiom closure and native target residual source sign checks.

This batch did not rerun the entire mechanical translation and frozen baseline. The compiled product still only leaves the remote .work. Next, process the 11 items of ArrayAxioms and the 12 items of PrimStringAxioms, and then continue with the remaining modules.
