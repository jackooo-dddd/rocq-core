# Correspondence with native Lean objects

Two versions are counted separately. Mechanical nat/eq are independent inductive structures: translation comes first, followed by proofs connecting them to native Lean objects.

| Artifact | Type correspondences | Operation correspondences | Native statement iff | Certified roots | Remaining |
|---|---:|---:|---:|---:|---:|
| Original frozen mechanical version | 164 | 908 | 1028 | 2100 / 2180 | 80 |
| Computationally transparent variant | 164 | 988 | 1028 | 2180 / 2180 | 0 |

[Full variant results](../../experiments/incremental-correspondence-20261019/transparent-data/README.md) · [Per-root certificates for all 2180 roots](../../experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_LEDGER.json) · [Validation summary](../../experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_SUMMARY.json) · [Original frozen ledger](../../experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv).

## What the variant changes

Of the original 80 remaining roots, 69 are non-Prop opaque data declarations and 11 are transparent wrappers depending on them. Their bodies remain in the checked Lean environment. The variant copies declarations into independent namespaces and changes only non-Prop opaque data declarations to def. Types, universe parameters, and bodies are preserved modulo consistent renaming and checked again by the kernel.

This completes operation correspondences for CRelationClasses 11, CMorphisms 54, ssrbool 6, ssrfun 4, ssreflect_rw 3, and Program.Wf 2. Proofs for all original 2100 roots are rechecked under the same policy. The 173 existing profiles, 6 new proof groups, and consumer examples import together successfully; dependencies on nonstandard axioms are rejected.

These are not value equalities between old opaque constants and new def declarations. The production translator/ and its mechanical artifacts are not rewritten by these experiments. The original frozen version still has its 80-root gap.

## What correspondence means

- Type correspondences provide bidirectional conversions and both round-trip identities within their explicit parameter scope.
- Operation correspondences prove that converting a mechanical result gives the specified native result. The target may be an existing Lean/Mathlib API or an expression composed of native types and functions.
- A native statement iff proves equivalence of propositions; it does not prove the original source theorem. Another 318 independent Prop proofs establish original statements and are counted separately.
- 2180 counts distinct roots. Each certificate retains its parameter, universe, quality-branch, and prerequisite scope; a root count does not establish coverage of every possible instance.
- Some floating-point targets use exact symbolic representations; equality with the runtime Float API has not been proved. Type-valued relation data may correspond to Prod/Sum records and does not automatically become a Prop-valued Lean typeclass instance.

## Nat, Eq, and concrete use

natIso connects mechanical nat to Nat; eqIso connects mechanical equality to Lean Eq. Dependent Nat elimination and Eq transport also have correspondences. The main Nat/Eq correspondence proofs have empty axiom closures.

[Main proofs](../../experiments/mechanical-correspondence-20261019/NatEq.lean) · [Nat operations](../../experiments/mechanical-correspondence-20261019/Nat.lean) · [Dependent Nat](../../experiments/mechanical-correspondence-20261019/DependentNat.lean) · [Dependent Eq](../../experiments/mechanical-correspondence-20261019/DependentEq.lean).

The new [consumer examples](../../experiments/incremental-correspondence-20261019/transparent-data/Consumer.lean) establish properties of dependent Fin data produced by mechanical well-founded elimination and pass prime evidence obtained through mechanical conditional selection to Mathlib Prime.two_le. [Cross-module composition](../../experiments/incremental-correspondence-20261019/transparent-data/Composition.lean) further connects mechanical nat.iter, native Nat, SSR selection, and Mathlib.

The [automatic composition command](../../experiments/incremental-correspondence-20261019/transparent-data/AutoCompose.lean) generates native definitions and equality proofs from given expressions and proved correspondences. It rejects results containing source symbols, undischarged conditions, or additional axioms. It composes supplied proofs; it does not search automatically for all possible Lean/Mathlib targets.

Historical batches and initial estimates are retained in the [workspace plan](../../experiments/incremental-correspondence-20261019/PLAN.md).
