# Batch 40 to 43: Dependency Elimination and Numerical Representation

Added **67 deduplication roots, 67 certificates**, accumulative **1731 / 2180**: 130 type root, 695 operation root, 906 complete native statement. The rest are 100 with only interface, 114 with partial statements, 206 with no certificate yet, and 29 with incomplete condition correspondence.

| Modules completed in this batch | Add new root | Current completion / total |
|---|---:|---:|
| Numbers.BinNums | 12 | 15 / 15 |
| Init.Decimal | 21 | 40 / 40 |
| Init.Hexadecimal | 19 | 38 / 38 |
| Init.Number | 15 | 17 / 17 |

## Dependency Eliminator and Induction Principle

[The 6 eliminator proofs of BinaryElimination.lean](proofs/BinaryElimination.lean) cover return types that vary with input: positive corresponds to binary recursion on positive natural numbers subtype, N corresponds to the zero/positive branch of Nat, and Z corresponds Zero/positive/negative branch of Int.

rect retains any Sort, and rec retains the original Type range. The native motive pulls back the source type along with the proven Iso. A checked example returns Fin (n+1), thus not just demonstrating a constant return type.

6 ind/sind statements correspond to complete native induction/branching principles, and each has a source statement closed proofs. Following the previous batch, the four modules of binary type and operation totaling 101 / 101 are completed.

## Complete information represented by numbers

[DecimalRepresentation.lean](proofs/DecimalRepresentation.lean)、[HexadecimalRepresentation.lean](proofs/HexadecimalRepresentation.lean)、[NumberRepresentation.lean](proofs/NumberRepresentation.lean)。

| Source type | Native representation |
|---|---|
| Decimal.decimal | signed decimal integer number × decimal number × optional signed decimal exponent |
| Hexadecimal.hexadecimal | signed hexadecimal integer number × decimal number × optional signed decimal exponent |
| Number.number | Sum of the above two native records, retaining format tags |

Each proves two converse laws. Leading zeros, empty numeric strings, negative zeros, whether to write exponents explicitly, and format tags are all preserved. The exponent part of a hexadecimal literal is still expressed in decimal and cannot be uniformly replaced with hexadecimal numbers.

The completed operations include structural equality testing, head and tail deletion, tail zero elimination and counting, little endian double/succ_double, identity function, dependency eliminator, and equality determination. The target uses List, Fin, Bool, Prod, Option, Sum and Decidable and their combined expressions.

Source del_head gets [] when exactly all the digits are deleted, and [0] when the length is exceeded; del_head_int drops the symbols, and del_tail_int keeps the symbols. Correspondence proofs cover these distinctions. Eliminating the trailing zeros of decimal 12300 gives ([1, 2, 3], 2); doubling little endian [5, 9] gives [0, 9, 1]. Negative zero and positive zero are still represented differently. These examples are compiled and checked.

The generation scripts for HEX and Number only reuse the proof text and recheck it in the actual source module closure respectively, without adding or replacing the Rocq source declaration. The multiplexed auxiliary type Iso does not count additional roots.

## Proof premise of equality judgment

Closure proofs have been given for 9 eq_dec functions and a total of 36 premises of the three representation modules, and the original RocqPending function has been instantiated explicitly. Certificate statements directly reference the actual source function; closed wrapped functions are audited separately.

The output sumbool is converted to native Decidable equality, and proven to be equal to the native determination. The native comparison is the complete representation, not the numerical value of the string and then comparison. The 331 conditions of the mechanical product remain unchanged. The correspondence layer has completed 302, leaving 29.

This batch adds 20 independent proofs of the original statement Prop, totaling 220; the original statement iff is not directly regarded as proven the original theorem.

## Verification and next steps

101 increments profile have current verification; 92 certificates covering profile and 1475 have been jointly imported and passed. 1989 export entries and 14200 dependency copies. The new goal recursively checks sourceless symbols and axiomatic closures all pass.

The increase in the jointly imported check entry triggers the default recursion depth of the audit code; check_all.py re-passes after explicitly setting maxRecDepth to 16384. Check that the set of content and allowed axioms is not reduced.

The next step is to continue the 9 remaining roots of Init.Byte, and then process other unfinished modules according to shared dependencies. The remaining 449 roots are not equal to 449 objects that cannot be corresponding.
