# Batch Six: Binary Recursion, Dependency Statements and Basic Eliminators

Added 30 completion roots: 25 operations, 5 complete native statements, totaling 531 → 561. Currently, it is 37 type root, 227 operation root, and 297 complete native statement root. Add another complete Sort certificate of sum → PSum without repeatedly increasing the number of type roots.

Three new PairRecursion, DependentStatements, and DatatypeElimination profile all pass Lean kernel and axiom closure checks. A total of 15 profile have successful records corresponding to the current source code; the old 12 have been inherited and have results. This batch does not rerun the old mechanical translation, 45 interface regression or Mathlib.

## Binary well-founded recursion

| source statement | native target |
|---|---|
| Init.Wf.Fix_F_2 | WellFounded.fixF, the input is native Prod |
| Init.Wf.well_founded_induction_type_2 | WellFounded.fix, the input is native Prod |

The proof contains Acc, WellFounded bidirectional conversion between mechanical pair and native Prod. The relationship is pulled back from the native pair to the mechanical pair; the step function receives the native parameters; P : A → B → Type w maintains dependence on the two parameters, A/B universe are respectively Type u/Type v.

Use example pair_countdown_mechanical_correct: Use the sum of native Nat as a metric to provide a termination proof for mechanical binary recursion, and then reuse the native recursion correctness theorem to prove that the result is equal to x+y. Use cases and auxiliary bridges do not count the Corelib root.

File: proofs/PairRecursion.lean.

## The same conditional proof is reused to five statements

All five roots rely on the proven sig_of_sig2 projection obligation. This batch provides actual instantiation, native iff, and original statement proof for each root:

| source statement | native content |
|---|---|
| proj3_sig | The Subtype element with the P ∧ Q attribute satisfies Q |
| proj1_sig_of_sig2_eq | Equal elements have equality val |
| sig_of_sig2_eq | Remove the second proof property to remain equal |
| eq_sig2_hprop | The equality after deleting the second proof attribute indicates that the original elements are equal. |
| eq_sig2_hprop_iff | iff of the above equality relationship |

The original Q proof uniqueness premise remains in the original statement; the source semantic premise is not deleted as an extraction obligation. Source Eq, dependent Subtype parameters and projections are converted via the existing correspondence.

The native target check recursively expands the NativeBridge auxiliary definition and confirms that there are no Rocq, RocqPending, Rocq2Lean symbols. There is independent proof of the original statement; it is not just iff or the interface.

A total of 9 conditional roots have been instantiated in this layer: 4 definitions and 5 statements. The number of reused independent task witnesses is still 5, and the axiom closures are all empty. The unresolved condition root of this layer is 322; the original mechanical export still retains 331 condition interfaces.

Files: proofs/DependentStatements.lean, reports/dependent-native-targets.json, reports/condition-discharges.json, reports/original-statement-proofs.json.

## Basic datatype eliminator

18 rec/rect operations:
- bool → Bool.rec；
- comparison → Ordering.rec；
- unit → PUnit.rec (Unit is an alias);
- Empty_set → Empty.rec；
- option → Option.rec；
- list → List.rec；
- prod → PProd.rec；
- sum → PSum.rec；
- result → Except.rec。

There are also curry, uncurry, id, ID, IDProp, a total of 5 items: respectively corresponding to parameter combination/splitting, id, polymorphic function type and proposition on the native pair. curry/uncurry and ID/IDProp are marked as native combined expressions and do not impersonate the library API with the same name.

The new type certificate of sum is supported by PSum: A: Sort u, B: Sort v. The full Sort bridge of prod is re-instantiated in the current module to support operation and no longer registers duplicate type roots or certificates.

### Scope of application that must be retained

- prod/sum supports full Sort parameters; fixed Bool/Ordering/Unit/Empty has no element universe parameters.
- The elements of list/option are currently Type u; the value/error of result is Type u/Type v. There is no claim to cover all instances of the Prop element in these source containers.
- motive of rec returns Type; motive of rect can return Sort z; both retain dependent return types.
- The root count means that the root has certified correspondence with a clear scope of application, but does not mean that all universe instances have been covered. The specific scope is documented item by item in the certificates.json and complete Lean theorem types.

File: proofs/DatatypeElimination.lean.

## Follow-up

Continue Eq transport, remaining dependency eliminators, and remaining conditional obligations; number writing, unified import, and Mathlib integration are still incomplete. This batch does not change the mechanical translation rules, nor does it change the mechanical nat/eq back to its native mapping.
