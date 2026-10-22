# Numerical Representation and Well-founded recursion: The Third and Fourth Batch of Results

This file retains the count at the completion of both batches; see README.md, DEPENDENT_RESULTS.md for the latest totals and condition instantiations.

This batch adds 48 correspondence with deduplicated roots: 4 types, 36 operations/predicates, and 8 complete native statements. Total completions 467 → 515 (37 type + 186 operation + 292 fully native statement). Only interface 319, no certificate yet 461, partial statement 553, with condition 331, non-Prop special statement 1.

Added 48 coverage certificates; 8 original statement certificates, no duplicate root counting. The cumulative incremental coverage certificate is 230. 11 profile have successful kernel/ axiom closure checks and corresponding source code summaries; this batch only rechecks the newly added/modified 4 profile, and uses the other 7 success records and 45 interface regression records. There is no need to rerun the entire set of mechanical translations or Mathlib integration.

## Digital representation and manipulation

| Source type | Native representation | retained information |
|---|---|---|
| Decimal.signed_int | Bool × List (Fin 10) | sign, leading zero, negative zero |
| Hexadecimal.signed_int | Bool × List (Fin 16) | sign, leading zero, negative zero |
| Number.uint | Sum (List (Fin 10)) (List (Fin 16)) | Base label and all numbers |

The existing bridges of uint ↔ List (Fin radix) are reused in the corresponding profile in this batch, and new types are not recorded repeatedly.

Decimal and Hexadecimal each add 12 operation corresponding to:
- revapp、rev、app → reverse/append；
- nb_digits → List.length；
- nzhead → List.dropWhile；
- unorm → After removing leading zeros, the empty string is normalized to [0];
- Projection, symbol flipping and splicing of abs, opp, app_int → symbols/digits pair;
- uint_beq, signed_int_beq → BEq of native List/Prod;
- norm → removes leading zeros and normalizes zeros in both symbols to positive zeros.

Nat Added 5 item:
of_uint_acc、of_uint、of_hex_uint_acc、of_hex_uint → List.foldl（acc ↦ radix * acc + digit）；
of_num_uint → Press the Sum base label to select the above fold.

Among the new operations of the 36 item, the 25 item targets the ready-made Lean API, and the 11 item targets the explicit native combinatorial expression. The type correspondence is separate, and the combined expression is not described as ready-made with the same name API. For itemized target_class and complete scope of application, see certificates.json.

## Practical reuse of native theorems

The two digital modules each have the comparative soundness and completeness of uint and signed_int, with a total of 8 statements:
- The comparison result is true ⇒ both means they are equal;
- The two expressions are equal ⇒ The comparison result is true.

First prove iff between the source statement and the original BEq statement, then use eq_of_beq of Lean and reflexive comparison to prove the original statement, and finally get the proof of the original statement through iff. It's not just an interface, it's not just wrapping the original statement into a new name.

Evidence: proofs/DecimalOperations.lean, proofs/HexadecimalOperations.lean, and reports/original-statement-proofs.json.
These are proofs of a previous unconditional statement; the conditional count of the 331 term remains unchanged since it has not been instantiated thereby and eliminates the explicit obligation of statements such as eq_dec.

## certified boundary

- The reading of the digital string to Nat is not injective: both the empty string and one zero are read as zero. There are counterexample theorems for each of the two bases.
- del_head 1 Nil returns one zero; List.drop 1 [] returns an empty list. There are proofs of inequality between the two bases. del_head/del_tail has therefore not been registered as an unconditional counterpart of List.drop/take.
- signed_int and Iso of Bool × digits retain negative zero and cannot be replaced by the bidirectional inverse of signed_int ↔ Int.
- The index of Hexadecimal.hexadecimal uses Decimal.signed_int; subsequent representation bridges must retain this spanning dependency.

These boundaries are demonstrated semantic differences, not a failure of translation or an indication that other appropriate targets do not exist.

## Well-founded recursion

- Acc A R x ↔ Lean Acc R x: Bidirectional conversion and inverse law.
- well_founded A R ↔ WellFounded R。
- Fix_F、Fix → WellFounded.fixF、WellFounded.fix。
- Acc_rect, Acc_rec → Acc.rec; the registered version accepts native callbacks, and the precursor reachability is proved to be converted at the boundary.
- well_founded_induction_type、well_founded_induction → WellFounded.fix。

The range of A is Type u; the recursive result is Type v by source signature, Acc_rec and non-type suffix versions are Type. well-foundedness holds without additional assumptions: the proof required by the original API is passed in explicitly and converted.

Two use cases excluding the Corelib root:
1. Use InvImage.wf and natTo of Lean to construct the source-side well_founded proof for the metric relationship on the machine Nat;
2. Pass the sound foundation of the original Nat to the mechanical Fix, reuse the original recursive correctness proof, and get the countdown function result equal to the input.

Evidence: proofs/WellFounded.lean. The above does not mean that the automatic conversion of any carrier/dependency motive has been completed.

## Next

1. Number Little.succ and carry semantics → to_little_uint/to_little_hex_uint → to_uint/to_hex_uint and read and write properties.
2. Accurately describe the behavior of del_head when it exceeds the length, and then process del_tail; do not forcefully apply List.drop.
3. prodIso and Acc convert → Fix_F_2, well_founded_induction_type_2.
4. Sigma/Subtype and Eq transport; then use the new certificate for the remaining statements.
5. Check whether the proven comparison property can construct the concrete eq_dec task; only increment the conditional count after the product is actually instantiated, verified and updated.

The full plan is still not complete; unified import and Mathlib combination testing is still pending.
