# List and binary numbers: Batch 17

Added 32 completion roots: List 1 operations + 2 statements, binary number 29 operations/predicates. A total of 922 / 2180 roots belong to the completion category; 43 increments profile have successful records, and 651 coverage certificates are all jointly imported and passed.

## List

list_compare corresponds to List.compareLex, which is true for any comparator and does not require the comparator to form a total sequence; the comparison result is converted to Ordering. The statements Forall_ind and Forall_sind convert to the induction principle on ordinary List, the passive symbol. All 10 roots of Lists.ListDef have correspondence within the stated range. The List parameter range is Type u; no native type declaration has been added for the complete Sort list.

## binary number

| source range | New root number | native target |
|---|---:|---|
| PosDef | 9 | compare_cont、compare、eqb、leb、div2、div2_up、pred_N、Ndouble、Nsucc_double |
| NatDef | 5 | compare、leb、double、succ_double、succ_pos |
| IntDef | 15 | compare、eqb、ltb、leb、lt、gt、le、ge、max、min、double、succ_double、pred_double、div2、to_pos |

Pos.compare_cont corresponds to the native expression with "returns the specified Ordering when equal". The rest are existing native Nat/Int operations and necessary boundary adaptation combinations. See the certificate list for specific equations. Positive integer truncation rules are strictly retained: Pos.div2 corresponds to max 1 (n/2), Pos.div2_up corresponds to (n+1)/2; Z.to_pos corresponds to max 1 z.toNat. Z.div2 corresponds to Euclidean /2 of Lean Int, and negative odd numbers are rounded towards negative infinity.

BinaryOrder, BinaryInt checked on the actual mechanical closure of IntDef, and no mechanical definition was replaced with a native type. The conversion type comes from the existing positive/N/Z certificate. The re-proven auxiliary lemmas such as succ/pred_double do not count covering roots repeatedly. All newly added operational equations hold for all values ​​of the listed input types without additional preconditions.

Positive integer subtraction mask, complete integer division, bitwise operations and square roots are not solved in this batch. The following will take the representation correspondence and subtraction invariant of mask as the starting point.

Evidence: proofs/ListBridge.lean, ListStatements.lean, BinaryOrder.lean, BinaryInt.lean; reports/certificates.json and each profile audit; reports/list-module-coverage.json.
