# Batch 37 to 39: Binary Division, Square Roots and Iteration

Added **13 deduplication roots, 16 coverage certificates**, currently **1664 / 2180**: 127 type root, 651 operation root, 886 complete native statement. The rest are 111 with only interface, 134 with partial statements, 233 with no certificate yet, and 38 with incomplete condition correspondence.

| module | Completed/Total |
|---|---:|
| BinNums.PosDef | 36 / 36 |
| BinNums.NatDef | 11 / 11 |
| BinNums.IntDef | 39 / 39 |

The three computing modules totaling 86 all have certificates within the specified range. Another module, Numbers.BinNums, has 15 roots and is currently completing only its 3 type roots; its recursive eliminator and induction statements are the next step and are not included in the above completion statement.

## Batch 37: Division 8 root

[BinaryDivision.lean](proofs/BinaryDivision.lean)

| source statement | Proven native target |
|---|---|
| N.pos_div_eucl | Non-zero divisor: division/remainder of Nat; zero divisor: (2^log2(p)-1,p) |
| Z.pos_div_eucl | Positive divisor: Int ediv/emod; non-positive divisor: explicit log2/power expression |
| Z.quotrem | (Int.tdiv, Int.tmod) |
| Z.quot | Int.tdiv |
| Z.rem | Int.tmod |
| Z.div_eucl | (Int.fdiv, Int.fmod) |
| Z.div | Int.fdiv |
| Z.modulo | Int.fmod |

The proof covers the entire input domain, including divisors by zero. The result of internal Z.pos_div_eucl versus b≤0 is:
k = 2^log2(p), results in (2k-1, p-k-(k-1)b). This is the actual behavior of the internal algorithm, it is not claimed to be standard division.

The top level Z.div is rounded down, and Z.quot is rounded towards zero; for example, -7/3 results in -3 and -2 respectively, with the remainders being 2 and -1 respectively. 8 boundary examples have been compiled. The proof is accomplished via bit-recursive invariants and primitive quotient remainder uniqueness.

## Batch 38: Square root 4 root

[BinarySqrtRem.lean](proofs/BinarySqrtRem.lean) and [BinaryPositiveSqrt.lean](proofs/BinaryPositiveSqrt.lean)

- Pos.sqrtrem_step: All mask inputs and any two higher-order functions; function correspondence assumptions are explicitly retained and are not limited to bit constructors.
- Pos.sqrtrem: The conversion result is (Nat.sqrt n, some (n - Nat.sqrt n * Nat.sqrt n)).
- Pos.sqrt: The conversion result is equal to Nat.sqrt n.
- Z.sqrtrem: Use the native square root above for z.toNat; negative numbers give (0,0).

The invariants are n=s*s+r, s>0, and r<2*s+1. Combine the upper and lower bounds of Nat.sqrt to prove uniqueness. 12345 gets the root 111, remainder 24 examples, and negative number examples all pass kernel check; there is also a consumption certificate that directly uses Nat.sqrt_le.

The IntDef derived closure contains Pos.sqrtrem but not the Pos.sqrt root. generate_positive_sqrt.py reuses the proof text in the actual PosDef closure and checks it independently; no alternative Rocq claim is generated. Repeated auxiliary proofs do not increase the number of roots.

## Batch 39: High-level iteration 1 root, 4 certificate

[BinaryIterOp.lean](proofs/BinaryIterOp.lean)

- Any Sort vector and any binary operation: corresponds to binary iteration indexed by Nat, retaining the original bracket order.
- When the operation satisfies the associative law: corresponds to List.foldr op a (List.replicate (p-1) a).
- Nat.add instance: equal to p*a.
- Nat.mul example: equal to a^p.

The associative law assumption of linear fold cannot be deleted. Proved counterexample: op(a,b)=a+2b, when repeating four copies of 5, the source binary brackets get 45, and the linear fold gets 75. Four certificates only count for one source root.

## Verify

97 increments profile have current success records. 88 certificates covering profile and 1408 were jointly imported and passed; 1893 export entrances and 13257 dependent copies. Copies and auxiliary theorems are not counted as sources. coimport_not_current_coverage=false.

All new proofs check axiom closures and native target passive symbols; there are no new axioms or incomplete proofs. Mechanical nat/eq and the original translation product remain unchanged. The proof number of the original independent statement Prop is still 200. This batch does not mix the operational equations into the proof of the original statement.

Next step: 6 dependency eliminators and 6 induction statements of Numbers.BinNums, continuing with numerical representations and the remaining provably transparent definitions.
