# Batch 44 to 48: Bytes, machine integers, byte strings and general equality interfaces

This round adds **64 deduplication roots and 64 coverage certificates**, advancing from 1731 to **1795 / 2180**. This batch does not modify the mechanical translator and does not replace the mechanical nat/eq with the native type.

| batch | new roots | Result |
|---|---:|---|
| 44：Byte | 9 | Init.Byte 10/10 |
| 45：WordOperations | 18 | PrimInt63 37/37，CarryType 1/1 |
| 46：PrimitiveStrings | 14 | PrimString 17/17 |
| 47：GenericEquality | 22 | Init.Equality 22/22 |
| 48：ArrayCapacity | 1 | PrimArray 8/8 |

"Module completion" follows the explicit scope of this project: type bidirectional inverse, specified passive symbolic native operation, or complete native statement iff. The native combined expression does not pretend to be API out of the box.

## Byte

[ByteOperations.lean](proofs/ByteOperations.lean) maps the source eight-bit mechanical bool/prod structure to eight native Bool, and byte maps to Fin 256. The first component of to_bits is the lowest bit. of_bits/to_bits covers all 256 values ​​in both directions, using the equations checked by kernel to prove; not a sampling test.

[ByteElimination.lean](proofs/ByteElimination.lean) maps the 256 branch eliminator to the nested Fin.cases, retaining the dependency motive and all branches. rec/rect and ind/sind are recorded separately; the two round-trip statements and the two summary statements are accompanied by original statement certificates. Generator [generate_byte_elimination.py](generate_byte_elimination.py) retains the complete generation method.

## 63 bit integer

[WordOperations.lean](proofs/WordOperations.lean) Proves the correspondence for carry, borrow, multiplication high and low half words, division, shift, parsing and counting for all inputs.

- head0 / tail0 are equal to Lean **BitVec.clz / BitVec.ctz** respectively; the result of zero is 63. Prove using log2 characterization and the first set position instead of a finite sample.
- addc / addcarryc / subc / subcarryc reserves overflow or borrow Bool.
- divs / mods corresponds to Int.tdiv / Int.tmod and then switches back to BitVec 63; it is not claimed to have directly corresponded to BitVec.sdiv / srem.
- diveucl_21 reserves the restriction of high < divisor; if not satisfied, return (0, 0).
- The complementary shift amount of addmuldiv uses 63 bit modulus subtraction; asr reserves a special branch for negative shift amounts.
- parser sign is retained, negative zeros are also rejected. The complete Sort parameters of carry correspond to PProd Bool A.

Eight boundary examples are compiled with the proof file, including carry to the maximum, borrow from zero minus one, leading and leading zeros of zero, negative zero parsing, and invalid double-word division.

## bounded byte string

[PrimitiveStrings.lean](proofs/PrimitiveStrings.lean) uses native representation Σ n : Fin 16777212, Vector (BitVec 8) n.val. Any bytes and NUL are reserved and not treated as Unicode String.

make corresponds to Vector.replicate plus length truncation/byte modulo; sub and cat correspond to vector slicing and bounded splicing of passive symbols. compare / eqb correspond to byte lexicographic functions on native vectors; ** It has not been proven to be equivalent to off-the-shelf List.compareLex**, and certificates are accordingly marked as native_expression.

char63 keeps BitVec 63 intact; parse only accepts one byte, and print only accepts values smaller than 256. There are compilation examples for byte modulo and empty slice beyond the end of NUL and 256.

## Universal Equality Interface

[7 type roots of GenericEquality.lean](proofs/GenericEquality.lean) correspond to the native dependent function space, and 15 operations correspond to id or explicit native function combinations. Retain the universe parameters and explicit relationship/elimination function parameters declared by each source.

The Init.Equality interface here accepts any relationship between Type values and cannot claim that any instance is Lean Eq. Additional construct PLift Eq instance, actual proof source ap / sym gives congrArg / Eq.symm respectively on this instance. PLift is an explicit adaptation in the correspondence client, not a mechanical translation rule or a new axiom.

[ArrayCapacity.lean](proofs/ArrayCapacity.lean) completes the exact correspondence of the maximum length of the array 4194303.

## Inspections and remaining work

107 profile have successful records of current source code and dependency matching; 98 certificates covering profile and 1539 have been jointly imported and passed. The unified package contains 2057 entries and 15609 dependent copies; the copies do not increase the coverage count. The axiom closure audit and the native target recursive source symbol check all passed.

Current classification: 142 type, 743 operation, 910 complete native statement; 56 only interface, 110 partial statement, 190 has no certificate yet, 29 conditional root has not been completed. The original statement has been independently verified as 224. The remaining **385 root**; the next step is to handle well-founded recursive statements and their dependencies.
