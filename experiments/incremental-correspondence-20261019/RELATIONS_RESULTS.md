# Relationship, Classes and variable parameter predicate (eighth and ninth batches)

The eighth batch added 101 completion roots, and the ninth batch added 25. The total of the two modules 126 all enters the completion category within the express range, and the denominator is not changed by expanding the module range.

| module | Roots | Type correspondence | Operation correspondence | Fully native statement |
|---|---:|---:|---:|---:|
| Relations.Relation_Definitions | 23 | 5 | 8 | 10 |
| Classes.RelationClasses | 103 | 12 | 24 | 67 |

Total database 706 / 2180: 55 type, 273 operation, 378 complete native statement; 475 partial statement, 284 only interface, 398 no certificate yet, 316 Still with conditions, 1 special Type value statement. Type correspondence categories include inductive types, type aliases, function types and proof structures, not all of which are new data types.

## Native goals and usage

- relation, unary/binary/ternary_operation, unary_predicate, binary_relation correspond to the ordinary Lean function type. The two independent universe parameters of unary_predicate are retained, and after explicit PULift conversion, A → Prop is obtained.
- equivalence/Equivalence corresponds to Lean and ready-made Equivalence. relation inclusion/subrelation corresponds to Subrelation.
- preorder, PER, StrictOrder, etc. correspond to the precise properties composed of native quantifiers and And. "Equivalent to native logical expression" is not mislabeled as an instance of the Lean ready-made class.
- The source constructor of RewriteRelation has no fields and is a tag; corresponding to True. This correspondence itself does not endow the relationship with properties such as reflexivity or symmetry.
- The equivalent relationship of Classes.PartialOrder E is still a parameter, the precise target is ∀ x y, E x y ↔ R x y ∧ R y x, while retaining the equivalence of E and the preorder premise of R. There is no assumption that E is Lean Eq.
- A real consumption example has been proven: Mechanical equivalence → Native Setoid → Quotient.sound. The example allows the Lean native quotient type API to use the relationship evidence provided by the machine side; the example does not count the Corelib root.

## Tlist and variable parameter operation

Tlist.{u} and List (Type u) are bidirectional and inverse. Arguments interprets native type lists as nested parameter tuples: PUnit for an empty list, A × Arguments tail for a non-empty list.

arrows ts B is shown to correspond to curry/uncurry Arguments (typesTo ts) → B, with round-trip proof in both directions. The predicate further removes PULift Prop and becomes Arguments (...) → Prop.

12 operation correspondences have been checked: Tlist_rec/rect → List.rec; pointwise_extension → operates point by point on the same parameter tuple; pointwise_lifting → quantizes the full name of the tuple; predicate_all/exists → ∀/∃; predicate_equivalence/implication → point by point iff/ contains; predicate_intersection/union → point by point And/Or; true/false_predicate → constant True/False.

This is not just a wrapper of the source function: the right-hand side operation only uses the specified native logical/functional expression; the transformation function is a parameter representation with proven reciprocity.

## Statements and Conditions

RelationClassStatements automatically re-normalizes the baseline partial statement of the 65 item using existing certificates, and fully nativeizes the 56 item. The candidate report still faithfully records that the other 9 items were not completed during this automatic phase; later VariadicStatements provided handwritten goals and proofs for this 9 item, and it no longer remains in the current ledger.

The 9 term is the two inductive statements of Tlist and the seven properties of the variable-argument predicate relation. Each accurate native statement is independently proved from the original statement, iff consists of two proofs; the operational level transformation is additionally proved by VariadicPredicates. There is no universal proof translation algorithm that passes off the existence of iff as an arbitrary statement.

This batch also closes two conditional roots: PartialOrder_inverse and subrelation_partial_order, using three witnesses of empty axiomatic closures to prove reverse preordering, point-wise equivalence of iff, and preordering of subrelations respectively. Original condition list extracted from Classes/RelationClasses/translation_report.json and checked.

The entire database of mechanical products still retains 331 conditional roots; this layer has accumulated 15 closures (7 definition, 8 statement), uses 13 different closure witnesses, and the remaining 316. The cumulative number of new original statement certificates is 38; this batch adds 21 copies (10 relational projections, 9 variable parameter properties, 2 conditional statements). The automatically obtained copies of 56 iff do not independently claim to have proven their original representations.

## Documentation and verification

- proofs/RelationDefinitions.lean、RelationClasses.lean、RelationClassStatements.lean。
- proofs/VariadicPredicates.lean、VariadicStatements.lean、RelationConditions.lean。
- build_relation_statements.py: Select the item 65 from the frozen baseline and reconstruct the automatic statement profile.
- reports/relations-module-coverage.json: Root-by-category verification results of the two modules.
- reports/relation-statement-candidates.json: 56 successful, 9 automatic phase residual, the latter covered by a handwritten certificate.
- reports/CERTIFICATES.md, CORELIB_LEDGER.csv: The complete proof type and native target of each source root.
- reports/condition-discharges.json, original-statement-proofs.json: Conditions and original statement proof are recorded separately.

The six new profile all passed the Lean 4.33.1 kernel and axiom closure audits, and the source code hashes of the cumulative 23 profile are consistent with the success record. Real quotient examples use standard Quot.sound; the axiom closure of the conditional witness is empty.

This conclusion only covers the above two modules, and does not include all Classes files such as CRelationClasses, Morphisms, CMorphisms. Unified cross-module import and Mathlib integration are not yet complete; continue with PLAN.md.
