# Batch 49 to 54: Well-founded recursion and SSR rewritten interface

Added **76 deduplication roots and 76 coverage certificates**, advancing from 1795 to **1871 / 2180**.

| batch | new roots | Current module results |
|---|---:|---|
| 49：WellFoundedStatements | 11 | Init.Wf 21/21 |
| 50：ProgramWellFounded | 10 | Program.Wf 10/12 |
| 51：SSRRewriteData | 32 | Packaging types, projections, arbitrary arity contractual predicates |
| 52：SSRRewriteStatements | 12 | ssreflect_rw Total 52/55 |
| 53：SSRClasses | 4 | ssrclasses 4/4 |
| 54：SSRUnder | 7 | ssrunder 7/7 |

## Well-founded recursion

[WellFoundedStatements.lean](proofs/WellFoundedStatements.lean) gives a complete native statement for the induction, reverse reachability, Fix_F expansion and proven irrelevance of Acc, and the Fix expansion. Native targets use Lean Acc, WellFounded.fixF / fix. Each item has both iff and independent source statement proof. The explicit extensionality assumptions and universe parameters in the original declaration remain.

The extraction condition for Acc_inv_dep is constructed directly from the source Acc_intro, and the subsequent proof relies on an inductive statement; this root no longer carries an unclosed condition.

[ProgramWellFounded.lean](proofs/ProgramWellFounded.lean) uses the native Subtype to represent the smaller input of the recursion, handing its recursive calls to WellFounded.fixF/fix. sourceStep / nativeStep The two callback adapters prove to be inverses of each other, so the source subtype parameters are not hidden into the native target. MR corresponds to InvImage, and measure_wf corresponds to InvImage.wf.

The 8 conditional roots of this module have been closed and corresponding, and there are also MR and measure_wf. The remaining Fix_F_sub_rect / Fix_sub_rect are all opaque_data, returning arbitrary Type values: there are currently insufficient computational equations to prove that they are equal to the specified native implementation. Merely guessing recursive behavior from a function signature does not count as completion.

## SSR Rewrite infrastructure

[SSRRewriteData.lean](proofs/SSRRewriteData.lean)'s 32 root coverage:

- call/test data and projection of NonPropType; Type payload corresponds to native Type, and test mark corresponds to Unit.
- TheCanonical.put, phant, and phantom correspond to True; their value functions correspond to the native id.
- external_view corresponds to Type, and the dependent eliminator corresponds to direct function application.
- abstract_lock corresponds to Unit; abstract, argumentType, returnType, and dependentReturnType retain their actual selected native types.
- unlockable retains the full Sort load range, proving its bidirectional inverse to Unit; unlocked returns the value it proves equal to.
- nary_congruence_statement corresponds to a recursively defined passive symbolic predicate on Nat, proving iff for any arity and continuation k. Mechanical Eq is replaced at each level by Lean Eq by proven correspondence.

[SSRRewriteStatements.lean](proofs/SSRRewriteStatements.lean) Added 10 complete native statements and 2 conditional operations. The contractuality of arbitrary numbers is proved by induction of natural numbers; although master_key is opaque, its Unit type has only one value, and the lock/unlock equation can be strictly proved. ssr_converse corresponds to PProd True R, retaining the complete Sort parameters and explicit inverse mapping.

ssreflect_rw The remaining 3 roots are abstract_context, ssr_congr_arrow, ssr_have_upoly, all opaque calculations of any Type value. They are different from the unique value master_key case, for which the native calculation results have not been proven.

[SSRClasses.lean](proofs/SSRClasses.lean) maps reflexivity to Lean Std.Refl, instances of native Eq / Iff and the reflexivity statement are independently proven. [SSRUnder.lean](proofs/SSRUnder.lean) preserves the actual relationship R, Under / Over corresponds to id R, and proves the relevant equations and reflexive statements.

## Statistics and verification

Currently: 154 type root, 771 operation root, 946 complete native statement, total 1871. The remaining 41 has only interface, 82 is partial statement, 169 has no certificate yet, 17 conditional root has not been completed, totaling 309. The original statement was independently certified from 224 to 260.

There are still 331 explicit conditional roots in the mechanical export; 314 of the correspondence layer have been closed and completed, leaving 17. There are no changes to the mechanical translator or filling in the proofs with new axioms.

Current validation records exist for 113 incremental profile. The 1615 certificates from 104 coverage profile import together successfully. Including original-statement proofs and wrappers, there are 2181 entry points and 16091 copied dependencies; entry-point and copy counts are not counts of distinct source roots. Axiom-closure and source-symbol checks on native targets pass. Compiled artifacts remain only in the remote .work.

The next step is to promote the native numerical operations and specification statements of Uint63Axioms / Sint63Axioms, and reuse the correspondence between BitVec and mechanical Z/N/nat; the floating point and opaque calculation gaps are listed separately and cannot be mixed together. The ready-made API has been found.
