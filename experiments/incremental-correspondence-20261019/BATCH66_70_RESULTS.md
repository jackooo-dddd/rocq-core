# Batch 66 to 70: Array and byte string specifications completed

Added **23 deduplication roots, 24 coverage certificates**, 1927 → **1950 / 2180**. ArrayAxioms **11/11**, PrimStringAxioms **12/12** completed. The three byte string definitions are classified as operational correspondence; the 20 specification has both complete native statement correspondence and independent mechanical original statement proof.

## array

[ArraySpecs.lean](proofs/ArraySpecs.lean) maintains a representation of "bounded length, Vector content, default elements", overriding defaults, copying, reading, updating, repeated construction, capacity, and extensionality.

- get_out_of_bounds: Out of bounds and return to the default element.
- get_set_same / get_set_other: Read back after the effective position is updated; other positions remain unchanged.
- length_make: The length is min n 4194303; default_set / length_set keeps the default value and length.
- array_ext: The same length, each valid position, and the default value are equal, and the arrays are equal. The default value cannot be omitted, even if the effective elements are exactly the same, the out-of-bounds observations may still be different.

All element types universe are reserved; there is no special case just for Nat arrays.

## Byte string definition and specifications

[StringUnsignedSupport.lean](proofs/StringUnsignedSupport.lean) In this module closure, recheck the conversion of Z / unary nat / 63 bit index to avoid mixing types with the same name in other mechanical closures.

[The three new operations of StringOperations.lean](proofs/StringOperations.lean) correspond to:

| source statement | native target |
|---|---|
| char63_valid | c.toNat < 256 |
| to_list | toList bounded Vector, and then zero-extend each BitVec 8 to BitVec 63 |
| of_list | List.foldr, repeatedly construct a byte and splice it, keeping the capacity truncated |

[StringSpecs.lean](proofs/StringSpecs.lean) Proves reading, length, repeat construction, truncation, character validity, and maximum length. Reading out of bounds returns 0; make truncates the character into low 8 bits and truncates the length to 16777211; sub retains the behavior of returning an empty string when offset exceeds bounds.

[StringRoundtrip.lean](proofs/StringRoundtrip.lean) Prove that concatenation is equal to list concatenation take 16777211, and prove of_list (to_list s) = s. First prove the native toWords single shot, then prove the list content of ofWords, and finally restore the mechanical Eq explicitly. Any byte is reserved, including NUL; it is not replaced with Unicode String.

[StringComparison.lean](proofs/StringComparison.lean) proves that List.compareLex is equal to Lean in byte-by-byte comparison. Identical prefixes are sorted by length, including empty strings. In addition, a calculation certificate directly connected to the ready-made List.compareLex is added for the already covered PrimString.compare without repeatedly adding the source root.

## Verification and Total

154 type root, 798 operation root, 998 complete native statement, total **1950**. Remaining **230**: 22 interface only, 30 partial statement, 161 no certificate yet, 17 conditional root. Independent original statement certified total 312.

134 increments profile verified successfully. 120 certificates covering profile and 1698 are imported together; 2316 entrances and 19997 copy statements, the number of copies does not increase the number of coverages. The native target recursively checks for residue-free source symbols; new proofs are checked for axiom closure and Lean kernel.

No reruns to freeze baseline or mechanical translation. Machine nat/eq is still an independent summary definition; only remote .work is left for compiled products, detection scripts and temporary logs. The next step is to deal with basic markup, decision aids and relationship classes, before moving on to the larger CMorphisms and floating point gaps.
