# Batch 55 to 56: 63 digit integer definition and conversion

Added 22 deduplication roots, 22 operation certificates, 1871 → **1893 / 2180**. 22 transparent definitions of Uint63Axioms are all completed; 26 specification statements are pending for subsequent batches.

## Define corresponding (16 root)

[Uint63Operations.lean](proofs/Uint63Operations.lean) coverage digits, size, max_int, addcarry, addc_def, addcarryc_def, subc_def, subcarryc_def, diveucl_def, compare_def, is_zero, addmuldiv_def, is_even, get_digit, bit, set_digit.

- Addition/subtraction retains the 63 bit modulus operation; additional carry and borrow conditions for addition/subtraction by one are proven separately.
- The logo of addc_def / subc_def corresponds to BitVec.uaddOverflow / usubOverflow.
- get_digit and bit are both equal to getLsbD, and there is still a global proof when the index exceeds 62.
- set_digit is only updated when the index is less than 63; the index 63 maintains the original value, and the top bit 62 can be set.
- addmuldiv_def retains the modulus 63 bit subtraction used by the original function to calculate the shift amount, and does not replace it with natural number saturated subtraction without authorization.
- compare_def corresponds to compare of unsigned toNat.

## Numeric conversion (6 root)

[Uint63Conversions.lean](proofs/Uint63Conversions.lean)：

| source definition | Proven native results |
|---|---|
| of_pos_rec n p | BitVec.ofNat 63 (positiveTo p % 2^(natTo n)) |
| of_pos p | BitVec.ofNat 63 (positiveTo p) |
| of_Z z | BitVec.ofInt 63 (zTo z) |
| wB | Integer 2^63 |
| to_Z_rec n x | Int.ofNat (x.toNat % 2^(natTo n)) |
| to_Z x | Int.ofNat x.toNat |

The two recursive proofs cover any fuel, not just the final call of 63; of_Z includes any negative integer. The mechanical positive/Z/nat itself maintains an independent structure, and the conversion equation is proved separately.

The proof is done by bitwise induction and low-bit modular decomposition. The recurser motive of to_Z_rec explicitly maintains the source type writing to avoid expensive definition expansion caused by type aliases during checking; it does not increase the trust scope or add axioms.

## Statistics and Inspection

154 type roots, 793 operation roots, 946 complete native statements, totaling 1893. Remaining: 27 interface only, 82 partial statement, 161 no certificate yet, 17 conditional root incomplete, total 287.

115 profile certificates passed the verification, and 1637 incremental certificates passed the axiom closure and native target checks. 106 covering profile were jointly imported successfully, with a total of 2203 entries and 16332 dependent copies; the number of entries/copies is not the number of deduplication roots. The independent original statement certificate is still 260, and the remaining condition is still 17.

This batch does not rerun all mechanical translations or all frozen baseline proofs. Compile products and intermediate probes are still only on remote .work. The next step is to independently prove bitwise operations, equality judgments, and integer conversion round-trip specifications, and then deal with remaining arithmetic and signed specifications.
