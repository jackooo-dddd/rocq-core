# Batch 71 to 75: Basic markers and symbolic floating point

Added **50 deduplication roots, 50 certificates**, 1950 → **2000 / 2180**. SpecFloat Completed **38/55**; the goal here is accurate symbolic representation of passive symbols and integer arithmetic, not Lean runtime Float.

## Basic item: 12 root

| Profile | Roots | Correspond |
|---|---:|---|
| PreludeCoercions | 3 | The two type aliases correspond to the original type; reverse_coercion returns the first value passed in |
| UnconvertibleMarker | 2 | Unconvertible corresponds to Unit; unconvertible is the identity function |
| FixPrototype | 1 | fix_proto corresponds to id and remains intact Sort universe |
| DecisionTactics | 2 | The native Decidable branch of decide_left/right eliminates the statement and independently proves the mechanical original statement |
| DefaultRelationMarker | 3 | DefaultRelation is the mark of True; default_relation returns the original relationship; equivalence_default is an independent proof of the original statement |
| SSRSetoidCompatibility | 1 | Both sets of Reflexive represent ∀ x, R x x; compatibility statement and original certificate |

Proof that Unconvertible is not a ≠ b. DefaultRelation itself does not contain an equivalence proof; it is a fieldless tag. Keep the actual meaning of the definition and do not add properties by name.

## Symbol floating point: 38 root

[SpecFloatRepresentation.lean](proofs/SpecFloatRepresentation.lean)'s 14 root:

- spec_float corresponds to SpecValue in both directions: signed zero, signed infinity, single NaN, and finite values of Bool × positive Nat significant digits × Int exponent.
- location corresponds to Option Ordering; shr_record corresponds to Int × Bool × Bool. The last two digits are the rounding bit and the sticky bit.
- Absolute value, negation, three-term projection, location/shift state transition, and four-term location elimination/induction statement.
- All source structures are retained, including finite values that do not satisfy valid_binary; invalid input is not filtered first.

[SpecFloatRounding.lean](proofs/SpecFloatRounding.lean)'s 12 root:

- cond_Zopp, emin, fexp: negative condition, 3−emax−prec, max(e−prec, emin).
- digits2_pos, Zdigits2: log2+1 for positive numbers; integer zero is 0, non-zero is calculated as an absolute value.
- canonical_mantissa, bounded, valid_binary: Explicit native Bool determination.
- round_nearest_even: If the value is less than half a unit, one will not be added. If the value is more than half a unit, one will be added. When it is exactly half the value, it is determined by the integer odd or even number.
- new_location_even/odd/new_location: Constructs accurate rounding position with native Int comparison.

[SpecFloatShift.lean](proofs/SpecFloatShift.lean)'s 5 root:

- iter_pos corresponds to Nat function iterations, and any Sort is reserved.
- shr_1 uses Int.tdiv 2, which means rounding to zero; the new rounding bit takes the lower bit of the absolute value, and the new sticky bit is OR of the old two bits.
- shr Iterates over positive shifts and increments the exponent; zero or negative shifts remain input.
- shr_fexp combines proven bit, exponent and shift conversions.
- shl_align uses the power of 2 to amplify the significant digits for a smaller target index; otherwise, keep the original value and index.

[SpecFloatNormalize.lean](proofs/SpecFloatNormalize.lean)'s 7 root:

- binary_round_aux concatenates two exponential shifts with the nearest even rounding in between, preserving zeros, finite values, overflowing to infinity, and negative results NaN branch.
- binary_round aligns first and then rounds; binary_normalize branches the integer sign and retains the specified sign of zero.
- SFone, SFldexp, SFnormfr_mantissa, SFclassify pass the above corresponding combinations. The classification uses the bridged Fin 9 encoding, and the order is positive/negative normal numbers, positive/negative irregular numbers, positive/negative zero, positive/negative infinity, and NaN.

[SpecFloatArithmeticSupport.lean](proofs/SpecFloatArithmeticSupport.lean) only provides a binary integer proof of origin closure rechecking without increasing the coverage number. Use abbrev to represent the alias, maintaining definition equality and avoiding type transparency barriers in subsequent combination proofs.

## Statistics and checks

161 type root, 835 operation root, 1004 complete native statement, total **2000**. Remaining **180**: 132 no certificate yet, 24 partial statement, 7 interface only, 17 conditional root. Independent original statement certified total 318.

145 profile verification passed; 130 incremental certificates covering profile / 1748 were jointly imported, 2372 entrances, and 21186 copy statements. All new goals recursively check sourceless symbols and prove that axiom closure passes the check; no new axioms are added.

There are also 17 items and SpecFloat operations that have not been completed, mainly comparison, addition, subtraction, multiplication and division, square root, adjacent floating point values and frexp/ulp, etc.; the overall correspondence between PrimFloat and FloatAxioms has not been completed. Many of the remainders of CMorphisms are calculations of the Type value of opaque, and it cannot be proven based on the signature alone that they are equal to some newly written algorithm. The next step continues with symbolic floating point arithmetic and preserves this distinction.
