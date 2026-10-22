# The 90th batch: SSR predicate package value

Added 5 deduplication roots, and the frozen baseline reaches **2100/2180**: 164 type, 908 operation, 1028 complete native statement; the independent original statement proves to still be 318.

Proof: [SSRPredicatePackages.lean](proofs/SSRPredicatePackages.lean).

| source statement | native results |
|---|---|
| boolfunPredType | The bearer type is converted along predicateIso to (A → Bool, id) |
| predPredType | Same as above |
| memPredType | The bearer type is converted along memIso to (A → Bool, id) |
| simplPredType | The bearer type is converted along simplPredIso to (A → Bool, id) |
| clone_pred | (U, fun x => predTo (toP x)) |

The first four terms give the bidirectional inverse of the load-carrying type explicitly with rebase, and prove the package equation after transport. The proof preserves the predicated computable field; it does not use univalence, nor does it assert that the original two vector types are equal. clone retains the original universes, phant_id and all parameters.

166 verification profile passed; 145 incremental certificates covering profile and 1848 were jointly imported and passed, 2472 entries, and 26507 dependent copies passed. Axiom closure and target residual-free source sign check pass.

Remaining 80 root: 57 no certificate yet, 6 interface only, 17 condition class; partial statement 0. audit_remaining.py checked the actual environment of each module and found 69 opaque roots and 11 transparent packages; 80 roots are not Prop, and the body is retained. It is not that the body does not exist, but that the original constants do not provide expandable calculation equations. The following transparent body experiments will be counted separately.
