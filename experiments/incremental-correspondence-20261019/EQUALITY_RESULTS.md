# Eq transport and Boolean equations (seventh batch)

This batch adds 19 completion roots: 1 types, 14 operations, and 4 complete native statements. The cumulative completion category is 580 / 2180 (38 type, 241 operation, 301 statement). There are still 550 partial statements, 308 interface-only statements, 423 statements without certificates yet, 318 statements with conditions, and 1 special Type value statements.

## Actual proof

| source declaration group | native target | Number of roots in this batch |
|---|---|---:|
| Logic.eq_rec、eq_rew、eq_rew_r | Eq.ndrec (use Eq.symm in reverse) | 3 |
| Logic.eq_rec_r、eq_rect_r | After proving and passing in the symmetry obligation, it is equal to Eq.ndrec | 2 |
| Logic.eq_rew_r_dep | The dependence of the original equation is eliminated on the right, leaving the proof parameter motive | 1 |
| Logic.eq_sym_involutive | Dual symmetry of native equations; proven on both source and native sides | 1 |
| Datatypes.eq_true | For each mechanical Boolean value b, the proof types of boolTo b = true are mutually inverse | 1 |
| 8 computational eliminators of Datatypes.eq_true | 6 Eq.ndrec, 2 native equation dependent elimination combinations | 8 |
| Datatypes.eq_true_ind、eq_true_sind、eq_true_ind_r | The elimination statement of the native Bool predicate; there is also the original statement proof | 3 |

Implementations that rely on elimination combination use only the native Eq; not a direct alias of the out-of-the-box API, tagged native_expression. Normal erasure target mark existing_api. The correspondence of eq_true is a two-way proof of the index proposition, without passing it off as the Bool data itself.

## Conditions and Proof Boundaries

This batch actually instantiates 4 conditional roots: eq_rec_r, eq_rect_r, eq_rew_r_dep, and eq_sym_involutive. A total of 13 conditional roots have been closed (7 definition, 6 statement), and the original mechanical product still has 331 conditional roots. There are 318 remaining in this layer.

Added 5 different witnesses: two reversely eliminated symmetry obligations, the original statement of eq_sym, the identity obligation of eq_sym_involutive and its original statement. All checked by axiom closure are empty; there are 10 different witnesses in total. eq_rew_r_dep uses the last three of them explicitly. All its downstream users cannot be automatically marked as complete.

eq_sym_involutive is an equation between proofs of equality on both sides, and the proof using the proof of Lean is irrelevant; this is not a runtime bijection of data operations. After the obligation is instantiated, both the proof of the source statement and the proof of the original statement are retained, and no extraction obligation is assumed.

The Eq carrier covers Sort u; the return family signature of eq_rec/eq_rec_r and eq_true_rec/eq_true_rec_r is Type by source, and the rest cover Sort. eq_rew_across_iso is also certified as transport under any carrier Iso, which can be used to convert mechanical Nat to native Nat; this auxiliary example does not count additional roots.

## Evidence and examination

- proofs/EqualityTransport.lean、proofs/BooleanEquality.lean。
- Both new profile passed kernel inspection and axiom audit of pinned Lean 4.33.1. The source code hashes of 17 accumulated profile are consistent with the success records.
- reports/condition-discharges.json: Each primitive condition set, closure witness and instantiation certificate.
- condition-obligations.json: Added the original report path and hash of Logic; the original source of Specif continues to be retained.
- reports/dependent-native-targets.json: Three new native targets recursively expanded NativeBridge alias check, unsourced symbols; two forward Bool statements share the same target.
- reports/original-statement-proofs.json: A total of 17 new original statement certificates have been added. The count is distinguished from the iff coverage.
- reports/summary.json, CORELIB_LEDGER.csv, CERTIFICATES.md: updated deduplication ledger and complete certificate types.

Continuing the successful track record of old profile, there is no re-running of all mechanical translations, all old correspondence or Mathlib integrations. The entire plan continues.
