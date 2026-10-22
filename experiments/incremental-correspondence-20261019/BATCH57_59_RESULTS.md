# Batch 57 to 59: 63 digit integer specification

Added 15 deduplication roots and 15 complete native statement certificates, 1893 → **1908 / 2180**. The original mechanical statements of 15 have independent closed proofs; not only iff is given.

| batch | File | root |
|---|---|---:|
| 57 | [Uint63Statements.lean](proofs/Uint63Statements.lean) | 6 |
| 58 | [Uint63DefinitionSpecs.lean](proofs/Uint63DefinitionSpecs.lean) | 7 |
| 59 | [Uint63OrderSpecs.lean](proofs/Uint63OrderSpecs.lean) | 2 |

## This batch of statements

- eqb_correct, eqb_refl: Correctness and reflexivity of native BitVec Boolean equality.
- land_spec, lor_spec, lxor_spec: Bit-wise AND/OR/XOR equations on any word-valued index, out-of-bounds cases are also covered.
- of_to_Z: BitVec.ofInt 63 (Int.ofNat x.toNat) = x; source of_Z (to_Z x) = x is also independently proven.
- addc_def_spec, addcarryc_def_spec, subc_def_spec, subcarryc_def_spec: The primitives are equal to the normally defined carry/borrow algorithm, retaining the overflow boundary and the extra one-bit operation.
- compare_def_spec: The comparison branch of the primitive is consistent with unsigned Nat compare.
- diveucl_def_spec, addmuldiv_def_spec: The primitives are consistent with the common definitions. The same native expression is used after conversion on both sides, so the native proposition is reduced to a reflexive equation; the equality of the two implementations at the source is still checked independently.
- ltb_spec, leb_spec: The Boolean unsigned comparison is consistent with the integer sequence obtained by to_Z. Comparison aid proof of mechanical positive/Z in current source module closure recheck.

No new axioms are used. The definition expansion of type alias/Iso projection on complex bit operation parameters once caused check timeout; the auxiliary lemma directly writes the input type and the injectivity of bool/carry to avoid these unnecessary expansions, and all final files pass the check.

## current scope

Uint63Axioms **37 / 48**. Remaining 11 Root: add_spec, sub_spec, mul_spec, div_spec, mod_spec, lsl_spec, lsr_spec, mulc_spec, diveucl_21_spec, head0_spec, tail0_spec.

Full Corelib: 154 type root, 793 operation root, 961 complete native statement, total 1908. Remaining 27 interface only, 67 partial statement, 161 no certificate yet, 17 conditional root, total 272. The total number of independent original statement certifications is 275.

118 increments profile are currently verified; 109 certificates covering profile and 1652 are successfully imported together, 2233 entries, and 16814 dependent copies. Axiom closure and native target source symbol checks pass. There is no rerunning of all mechanical translations or freezing of baselines; intermediate compiled files remain only remote.

The next step is to reuse the proofs of binary addition, subtraction, multiplication, division, and exponentiation, independently verify the actual dependent closure on Uint63Axioms, and then complete the remaining arithmetic and shift specifications. N/mask auxiliary declarations that are not exported by this closure are not directly mixed in.
