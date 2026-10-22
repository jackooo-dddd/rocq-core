# SSR Packaging elimination and remaining statement (25th batch)

Added 52 completion roots: 8 types, 15 operations, 29 complete native statements. The current full project completion category is 1407 / 2180 (approximately 64.5%): 92 type, 519 operation, 796 statement. Each certificate still has a clear scope of application for universe and parameters.

There is already a 301 root completion in the 451 root of ssrbool (24 type, 59 operation, 218 statement). 150 roots remaining: 128 explicit conditional roots, 20 unbridged roots, 2 interfaces only; no remaining partial statements.

## Why some packages can correspond to Unit

The parameters of manifest_simpl_pred, registered_applicative_pred, manifest_mem_pred, applicative_mem_pred, keyed_pred, keyed_qualifier have specified target predicates or qualifier; their stored values are also accompanied by equality or point-by-point equivalence proofs. Therefore after fixing the external parameters, these packages each have only one value, proven bidirectional inverse of Unit.

No arbitrary data is deleted here: the predicate and qualifier are still external parameters; the inverse transformation reconstructs the specified value and proves the round trip using the equality in the original field. The point-wise equivalence of keyed_pred results in function equality via function extensionality. There is no claim of equality between different external parameters.

There are also qualifier n A ↔ (A → Bool) and pred_key A p ↔ True bidirectional correspondence. n of qualifier is a fixed mechanical Nat index; its native target does not additionally save the index already specified by the type parameter. The Nat quantifier in the subsequent statement is converted by the existing natIso.

## 15 operations

- collective_pred_of_simpl, applicative_pred_of_simpl, rel_of_simpl: native boolean functions in wrappers.
- simpl_pred_value, applicative_pred_value, mem_pred_value: Return the predicate specified by the parameter.
- applicative_mem_pred_value: id on Unit.
- has_quality: Get the native predicate of qualifier.
- unkey_pred, unkey_qualifier: Get the predicate specified by the parameter or the explanation of qualifier.
- eq_mem: Native functions are equal.
- sub_mem: Pointwise Boolean implication.
- mem: Apply the interpretation function in native Sigma.

These equality proofs inherit all source-side Type parameters and associated independent metadata universe; they do not just verify a few specific predicates.

## 29 remaining statements are all completed

28 statements are automatically nativeized. The new mechanism directly constructs the proven conversion lemma application to the wrapped quantifier, checks that the left end is equal to the definition of the current expression, and then constructs the equation from propext; the adapter expansion and subsequent normalization both retain the proof. This avoids common simp matching gaps caused by reliance on packaging and universe parameters.

if_arg also gives the original Bool conditional function application statement, the corresponding iff, and the closed proofs of the original mechanical statement; it is not replaced by True. The total number of new original statement certificates is 140.

Further inspection shows that locked itself is a transparent definition, relying only on the opaque master_key : unit. Elimination of unit, which has only one constructor, can prove that locked A x = x, and there is no need to expand master_key. Added two new operations corresponding to locked → id, master_key → Unit.unit, and completed the native statement of is_true_locked_true. This single value type argument does not apply to any opaque function.

## Verify

- SSRBoolPackaging, SSRBoolRemainingStatements pass Lean kernel and axiom closure check.
- The current 76 verification profile is consistent with the source code and dependency fingerprints.
- 1145 incremental coverage certificates are co-imported by 70 coverage profile through: 1441 entries, 9167 dependency statement copies.
- This batch does not change the mechanical translation, does not add translation rules, and does not rerun all mechanical results or old baseline proofs; due to changes in packager support, 70 covers profile and all are repackaged for verification.
- The compilation cache and probe files in .work only remain on the remote.

The next step is to process the shared prefix proofs and remaining data operations for 128 conditional roots. For packages with carrier types, it is necessary to maintain the distinction between "the carrier can be converted in both directions" and "the two packages are equal in Lean"; the existing type Iso does not automatically provide the equation for the carrier type.

Proof and itemized results: proofs/SSRBoolPackaging.lean, proofs/SSRBoolRemainingStatements.lean, reports/ssrbool-remaining-statement-candidates.json, reports/CERTIFICATES.md.

The co-import tool adds opaque support: retain declaration types, copy and verify the definition body and its dependencies. fixture proves that any opaque Nat still cannot be expanded with rfl, and proofs on single value types can be imported; directly added axioms and new axioms hidden in opaque body are rejected.
