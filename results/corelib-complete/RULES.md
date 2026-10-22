Rules and simplification results

This page is categorized by mechanism. The number of categories is not equal to the number of rules/switches in the code. Declaration-by-declaration of the actual rules, all attempt labels, universe instances, transformations and conditions is given in the eponymous JSON/MD.

1. Source-side classification and proof conditions: Classify according to the actual reduced Prop/SProp results, retaining the application of local assumptions; the proof implementation is extracted into explicit conditions, supporting different instances of polymorphic conditions. The final pending status is based on the actual remaining condition telescope.
2. Universe constraints and explanations: Completely export and recheck native facts; explicit parameters, template Sort parameters, local constraint closures, and necessary instance correspondences are retained. Local interpretation with global upper bounds only handles checked outwardly constrained fragments; public parameters, native constraints, and reference checks are not omitted.
3. SProp/Prop/Type quality: 23 original roots are represented by natively checked complete quality family, for a total of 603 instances (23 primary items plus 580 additional branches). Do not delete 23 original roots from the statistical range.
4. Exact source transformations: actual instance replacement for transparent aliases, beta/delta/zeta reduction, restricted recursive evaluation driven by known constructors. Independently audited reconstruction of each deployment; no arbitrary deployment of opaque certified.
5. Explicit cumulative representation: PULift up/down, combined conversion of function arguments and results, and non-recursive, single-constructor, field-by-field conversion of unindexed records. Preserves field order, payloads, all dependency types, and public conditions.
6. Recursion and elimination: Structural recursion, real kernel recursor, accessibility/well-founded correspondence and checked deferred guard processing; conditions required for terminability remain explicit.
7. Primitive model: kernel-registered Int63→BitVec63; bounded array; byte string; binary64 model that preserves signed zero/infinity/NaN. Operation identity, size limits, constructor roles, source primitives and target payloads are checked separately.
8. Mechanical induction and subsequent correspondence: Sources nat, eq use ordinary induction rules to generate independent types; the bootstrap table is empty. Bidirectional correspondence to Lean Nat/Eq is proven separately after translation, see CORRESPONDENCE.md.

The inspection package includes source-side roundtrip, independent Lean consumer/ kernel inspection, independent structural audit, public interface/universe inspection and error injection testing. Theorem statements are not theorem proofs; the conditions to be proved are not hidden as axiom or sorry.

History simplification main74→main75 (control before canceling bootstrap):
- The Type path of liftCoerceValue no longer takes the independent direct up/down first, and then the combination up/down; it is unified and processed by recursive combination rules, and direct conversion is its basic situation.
- The two failed rollbacks are merged into tryLiftConversion, and the elaborator status and conversion count are restored at the same time.
- Retain the limitations of the Prop-only early path; do not delete the independent check and do not change the source range.
- Full 2180 entry coverage keeps 0 blocked, full regression and all campaign checks passed.
- All 4314 module-by-module declarations including dependencies, auxiliary declarations and quality branches appear, and their status, name, target type, type, body, constructor, universe parameters and unproven conditions are completely consistent with those before streamlining (the structure JSON is compared, not just the success rate).

This is a round of proven iterative mechanism merging, not proof that the number of rules has reached a mathematical global minimum. Retain the general rule of failing to prove redundancy, in particular not to remove 2180 roots based solely on the number of hits they depend on or the paths that MathComp may require.

For rule hit statistics, see rule-usage.json; for streamlined patches, see simplification.patch; for full statement comparison, see simplification-artifacts.json. Early failed experiments are left in work/snapshots and work/tests and are not used as evidence of success.

The current mechanical baseline only removes two items of bootstrap and does not add new translation rules; the rule coverage and times have been recalculated from the new full-v1. The old stripped-down patches and comparisons are historical evidence and do not imply that the old and new target AST are identical.
