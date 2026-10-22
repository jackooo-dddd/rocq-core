# SSR Function predicate and statement nativeization

This batch adds **79 completion roots**: 27 predicates, 50 complete native statements, and 2 type correspondences. In addition, the proof of the complete Sort parameters is supplemented for the completed 5 SSR Option operations without repeatedly adding completion roots. A total of 84 coverage certificates were added in this batch.

Among the 128 roots of ssrfun, currently the 101 root belongs to the completion category: 2 type, 44 operation, 55 fully native statement; there are still 27 roots to be processed (11 only interface, 10 No certificate yet, 6 with conditions). Another new type root NonPropType.type in this batch belongs to ssreflect_rw.

**27 predicates**

Homomorphism, operation preservation, distributive law, commutative law, left and right inverse, left and right elimination, left and right zero elements, idempotence, binary injectivity, etc., are all converted into predicates containing only Lean primitive type variables, function application, Eq, quantifiers, implication and And. For the item-by-item complete expression, see [predicate result ](reports/ssrfun-predicate-candidates.json).

#ssr_predicate reads the actual definition body of the specified transparent predicate, instantiates the parameters and uses the proven iff normalization to generate the native function and point-wise iff. Both native function bodies and parameter types are checked for source symbols, and certificates are accepted by kernel. This overrides the automatic target generation of the current 27 predicates and does not represent the automatic target synthesis of any compute function. They fall under "native combination expressions" and do not pretend to have the same names Mathlib API.

**2 types corresponding**

| source type/proposition | Native correspondence | Scope |
|---|---|---|
| ssrfun.bijective A B f | The inverse function g exists and satisfies the cancellation laws on both sides | A, B: Type; Proposition Iso is proved in both directions; not any function is bijective |
| ssreflect_rw.NonPropType.type | Bool × Type u | Preserves Boolean metadata as well as carrier type; both inverse laws prove |

NonPropType You cannot simply drop the boolean field while maintaining the bidirectional inverse. This field is retained in this batch; the representation of Some_inj is then normalized on this native representation.

**Option and 50 statements**

The original Option calculation certificate mainly covers Type parameters. Source export allows Sort parameters, so this batch uses Option (PLift A):
- map, bind, apply, default, and lift respectively correspond to the native Option.map, bind, elim, getD, and some, and the loaded PLift.up/down appear explicitly.
- Quantifiers and function parameters returning Option are transported through bidirectional conversion; function equality is first converted to point-by-point equality.
- Transformation with the commutative lemma of Option.elim enables the same rule to cover multiple statements.
- The source Sum corresponds to PSum; the quantifiers and projections of sig/sig2 use Subtype; unit uses Unit.
- The universal proposition in the air domain can be reduced to True. According to Empty_set, there is no general proof of constructor; there is no replacement of the arbitrary source theorem with True.

The selected original part statements 50 all got native targets of unsourced symbols and kernel checked for iff, see [statement-by-statement result ](reports/ssrfun-statement-candidates.json). This is statement correspondence; this batch does not add independent proofs of these 50 original theorem, nor does it close the remaining 6 conditional roots.

**Documentation and Verification**

- proofs/SSRFunNormalization.lean: Correspondence of bijective, logic, Subtype, Sum and unit.
- proofs/SSRFunPredicates.lean, ssrfun-predicate-command.lean.inc: Predicate target generation and proof.
- proofs/SSRFunOption.lean: Option bridge of complete Sort and native API equations.
- proofs/SSRNonProp.lean: Lossless representation of NonPropType.
- proofs/SSRFunStatements.lean: Normalization of 50 statements and iff.
- reports/ssrfun-module-coverage.json: Module classification with remaining 27 root.

When reviewing this batch, execute verify.py SSRFunNormalization SSRFunPredicates SSRFunOption SSRNonProp SSRFunStatements, then run make_report.py, interop/pack_all.py, interop/check_all.py and make_report.py corresponding to five profile. Reuse the original pinned Lean and mechanical snapshots without installing dependencies or rerunning the entire old baseline. Temporary probe and build files are left on the remote .work.

The current full project completion category is **1238 / 2180**: 69 type, 450 operation, 719 completely native statement. The remaining packaging types, conditional obligations and other modules will still need to be processed after this batch.

This batch of joint imports passed: 63 covering all 976 current coverage certificates in profile; 68 verification profile in the entire workspace has a successful record consistent with the source code and dependencies.
