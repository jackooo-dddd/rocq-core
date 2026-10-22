# Computationally transparent body experiment

## Questions and Counting Conventions

Freeze baseline completed 2100/2180. The remaining body of the 80 root remains in the Lean environment, the 69 root is opaque, and the 11 root is its transparent packaging. opaque Type The value cannot be expanded by proving irrelevance.

This experiment re-exports the same batch of mechanically translated texts: all source declarations are renamed to independent namespaces; only non-Prop opaque data declarations at the source end use ordinary def, and the type, universe, and body expressions are only renamed consistently. All statements are still submitted to Lean kernel for inspection item by item, and new axiom/sorry/unsafe are prohibited.

This is a proof of equality that computes the transparent variant of correspondence, not the frozen baseline opaque constant. Variant coverage and frozen baseline 2100/2180 are counted separately. The remainder of the old baseline will not be eliminated through renaming or porting.

## steps

1. [Complete] Check the remaining items of the original baseline root by root, save the category, type, retain body status and the latest opaque dependency.
2. [Done] Implement isolation exporter; retain native Lean constants, recheck all source dependencies; output a manifest of each exposure statement.
3. [Complete 11/11] CRelationClasses: 11 relational data combinators, relying on existing relation record Iso.
4. [Complete 54/54] CMorphisms: 54 roots, prioritizing projection, flipping, combination and point-by-point relationships, then processing six roots with explicit conditions.
5. [Complete 13/13] SSR: 13 roots, dependent on Sigma/PSigma/ predicate and equality conversion; maintain conditions and selection data.
6. [Complete 2/2] Program.Wf: 2 Type value elimination function; check dependency return values and recursion rules.
7. [Done] Co-import, native target closure and axiom audit; record whether additional properties are missing. Update results and synchronize Git/Mac.

~~~mermaid
flowchart TD
 A[Freeze Mechanical IR / Checked Lean body] --> B[Independent namespace re-export]
 B --> C [Only if the source is not Prop opaque is converted to def]
 C --> D[Item-by-item kernel inspection and exposure list]
 D --> E[CRelationClasses 11]
 E --> F[CMorphisms 54]
 D --> G[SSR 13]
 D --> H[Program.Wf 2]
 E --> I[Type Iso / Operation correspondence / Condition proof]
 F --> I
 G --> I
 H --> I
 I --> J[Variant co-import and independent coverage report]
~~~

If there are still problems with dependency elimination, calculation rules or conditions after the body is exposed, keep them one by one, and you cannot add new equations and axioms to complete them. Whether this export strategy will be extended to the official translator in the future will be based on this experimental verification.

## Compatibility regression

8. [Complete] For the currently completed 2100 root, copy and recheck the existing certificates and dependency closures according to the same transparent policy; the existing incremental profile and early baseline profile are included. Write the root-by-root list and results to reports/regression.
9. [Complete] Import the existing proof that passed the regression together with the 80 new certificates this time; verify that there are no additional axioms and generate an independent full-database variant ledger. Retain the original frozen baseline ledger and its 80 item gap.
10. [Done] Provide consumption examples based on full regression results; out-of-the-box API, combined native expressions, type representations, and statement iff are explained separately.

## Proof of dependence on data and combination DAG

~~~mermaid
flowchart TD
 Value[Mechanical recursion value = value of WellFounded.fix] --> Cast[Equal transport dependent on return type]
 Cast --> Callback[recursive callback two-way reverse]
 Callback --> RectF[Fix_F_sub_rect]
 RectF --> RectSub[Fix_sub_rect]
 RectF --> Fin [depending on Fin consumption example]
 BoolIso [Mechanical Bool / Eq / Sigma / Subtype corresponding] --> Choice [Dependent condition selection]
 Choice --> Prime[native Nat.Prime evidence]
 Prime --> Mathlib[Mathlib Prime.two_le]
 NatIter[Old nat.iter certificate rechecked according to transparent policy] --> NativeNat[Lean Nat]
 NativeNat --> Choice
~~~

The above new certificate and the two consumption documents have passed the check; they do not increase the root number beyond the 80 item.

11. [Done] Automatic composition based on a given correspondence: generates native functions and proofs of equality; kernel checks, executable examples and three-category rejection tests pass. Does not automatically search for any library function correspondence.

Final: original frozen version 2100/2180; calculated transparent variant 2180/2180. See reports/FULL_VARIANT_SUMMARY.json and root-by-root ledger.
