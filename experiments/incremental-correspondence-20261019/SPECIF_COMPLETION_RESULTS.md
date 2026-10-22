# Init.Specif Complete results

This batch adds **80 completion roots**: 1 types, 41 operations, and 38 complete native statements. 159 roots of Init.Specif have corresponding correspondence within the explicit range: 7 type, 60 operation, 92 completely native statement. Mechanical translation and Mechanical Nat/Eq maintain separate type identities.

**Original target and scope of application**

| source declaration group | New root number | native target/expression |
|---|---:|---|
| Exc | 1 | Option A; type bidirectional reverse coverage A: Type u |
| error / value | 2 | none / some; complete Sort parameters are represented by Option (PLift A) |
| except / absurd_set | 2 | False.elim; maintain Prop / Type limit of source signature |
| sumbool / sumor’s rec, rect | 4 | PSum.rec, relies on motive to pull back through the corresponding; rec is Type, rect is Sort |
| Choice / Choice2 | 2 | Point-wise selection function for Subtype / PSigma and its proof; input explicitly provides per-point selection without using the axiom of choice |
| bool_choice | 1 | Bool value selection function and native disjunction proof |
| dependent_choice | 1 | Nat.rec Iteration and adjacent item relationship proof |
| sig2_of_sigT2 | 1 | The two proof fields of PSigma are converted into the conjunction field of Subtype |
| rec, rect, uncurried and constructor variants of eq_sig / eq_sig2 / eq_sigT / eq_sigT2 | 28 | The branch value of the native equality index; proof_branch1/2/3 proves that it covers the argument branch |
| statement after closing condition | 38 | Subtype / PSigma Constructor, projection, equality elimination and transport native propositions |

The above operation clearly distinguishes between the ready-made API and the native expression that composes itself. The relationship of S, T to Choice is Type, and Choice2 returns Type, following the actual derived signature; there is no expansion of these instances into a unified conclusion for all universes. The type of Exc Iso is limited to Type; the complete Sort adaptation of error/value uses PLift, which does not mean that the mechanical translation rules have been changed.

**Shared Proof Dependencies**

70 residual conditional roots use 116 different prestatements; they include extraction obligations and ordinary theorems that are treated as preconditions. After merging with the original statements of this batch, a total of 140 proof targets were selected. Each goal is first proved with a conditional version, and then instantiated into a closed proof in the actual dependency order. 140 closed proofs are all checked by Lean kernel, and the axiom closures are all empty.

The actual completion conditions of this batch are closed and correspond to 70 source roots: 32 definitions and 38 statements; in addition, 10 root originally only had interfaces or no certificate. Preceding certificates, completion root, and overriding certificates are counted separately. Each of the new original statements 38 has closed proofs of the original statements, and statement iff is not a replacement for these proofs.

**Statement Transformation and Proof Parameters**

Rely on the equality family and directly use the native endpoint x = y to avoid leaving to (of x) in the parameter type of motive. Packed equality conditions prove combinations using the native Exists, Subtype.ext and PSigma equations. The transport formula uses the proven transformation naturalness lemma; the equality proof is preserved by simp for the higher-order motive explicit construction lemma instance.

Prove that parameter cleaning only accepts native candidates and their types that do not contain source symbols. They must be equal to the definition of the original expression, and the entire statement must still be defined equal before and after replacement. A type in its source form can be identical to a candidate type after reduction; it cannot be rejected simply because there is a source symbol in the type that has not yet been reduced. In the end, none of the 38 targets, together with the proof parameters and NativeBridge aliases, have Rocq / RocqPending / Rocq2Lean symbols, and iff all pass kernel. The arbitrary source theorem is not replaced by True; True is only used for general proof-independent steps such as two proofs of equality of the same proposition.

**Documents and Reproduction**

- [Shared witness ](proofs/SpecifWitnesses.lean), [Selection and dependence ](specif-witness-selection.json), [Proof DAG](reports/specif-witness-dag.json).
- [Normalization lemma ](proofs/SpecifConditionalNormalization.lean), [38 statements ](proofs/SpecifClosedStatements.lean), [statement-by-statement native expression ](reports/specif-closed-statement-candidates.json).
- [Type and elimination operation ](proofs/SpecifOperations.lean), [Selection and iteration ](proofs/SpecifChoice.lean), [28 equality eliminators](proofs/SpecifEqualityElimination.lean).
- [Module root by root result ](reports/specif-module-coverage.json), [All certificate types and axioms ](reports/CERTIFICATES.md), [Actual condition assembly ](reports/condition-discharges.json).

Run in this workspace:

    python3 verify.py SpecifWitnesses SpecifConditionalNormalization SpecifClosedStatements SpecifOperations SpecifChoice SpecifEqualityElimination
    python3 make_report.py
    python3 interop/pack_all.py SpecifOperations SpecifChoice SpecifEqualityElimination SpecifClosedStatements
    python3 interop/check_all.py
    python3 make_report.py

This batch of six profile has been compiled and audited; the dependent source code and compiled products are consistent with the verification records. All 892 currently covered certificates have been jointly imported and audited in 58 modules (1181 entries, 7322 dependency statement copies); see reports/interop/all/import-all-validation.json for records. Without rerunning the entire old baseline or the entire mechanical translation, the compile cache and heuristic files are only on the remote .work.

The complete project category is **1159 / 2180**, and there are still 1021 roots in other categories; the conditional roots at this level have been reduced from 241 to 171, and the 331 explicit conditional roots of the original mechanical product remain unchanged. The next step is to continue the conditional closure, native operation equations and remaining statements of other modules.
