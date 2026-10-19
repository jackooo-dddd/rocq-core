# Remaining Corelib blockers after certified main46

All 2180 roots in 67 installed modules remain in scope. Certified: 2152 checked, 28 blocked; no unvalidated successes. Counts include definitions, checked statements, and explicit conditional artifacts, not completed proofs of every source theorem.

| Module | Blocked roots |
|---|---:|
| Corelib.Classes.CMorphisms | 3 |
| Corelib.Classes.CRelationClasses | 2 |
| Corelib.Classes.Equivalence | 4 |
| Corelib.Classes.Morphisms | 11 |
| Corelib.Classes.Morphisms_Prop | 2 |
| Corelib.Classes.RelationClasses | 2 |
| Corelib.Init.Sumbool | 1 |
| Corelib.ssr.ssrbool | 3 |

These are 28 declarations, not 28 distinct missing rules. Three are dependency-blocked; 25 are direct frontiers. Complete messages and dependency impact are in work/quality-main46-frontiers.json.

Current investigations:

- main49: remove unused legacy ssr_have_upoly lowering and support opaque callers. All 77 focused roots and opaque client controls pass; full regression running. This fixes a client boundary, with no claimed further Corelib root gain.
- main50: implicit reference levels are lost by filtering extraOwn against explicit source universe annotations after alias expansion. Retain discovered implicit levels, remove only erased explicit levels, and reuse Type transport for computational type dependencies. Targeted three-module experiment running.
- main47/48: R8 reference shifts alone did not unblock any of 536 tested roots; active source reverted.
- Preserve P0/public quantification, native universe checks, source roundtrip, exact target structure, and axiom-free checks. A kernel-valid target alone does not establish source fidelity.

## Corelib.Classes.CMorphisms

- Corelib.Classes.CMorphisms.PartialOrder_StrictOrder: TRANSLATION_FAILED
- Corelib.Classes.CMorphisms.pointwise_pointwise: TRANSLATION_FAILED
- Corelib.Classes.CMorphisms.respectful_morphism: TRANSLATION_FAILED

## Corelib.Classes.CRelationClasses

- Corelib.Classes.CRelationClasses.eq_equivalence: KERNEL_REJECTED
- Corelib.Classes.CRelationClasses.relation_equivalence_equivalence: TRANSLATION_FAILED

## Corelib.Classes.Equivalence

- Corelib.Classes.Equivalence.respecting_equiv: UNIVERSE_REJECTED
- Corelib.Classes.Equivalence.respecting_equiv_obligation_1: UNIVERSE_REJECTED
- Corelib.Classes.Equivalence.respecting_equiv_obligation_2: UNIVERSE_REJECTED
- Corelib.Classes.Equivalence.respecting_equiv_obligation_3: UNIVERSE_REJECTED

## Corelib.Classes.Morphisms

- Corelib.Classes.Morphisms.PartialOrder_proper: INTERFACE_REJECTED
- Corelib.Classes.Morphisms.StrictOrder_PartialOrder: BLOCKED_DEPENDENCY
- Corelib.Classes.Morphisms.StrictOrder_PreOrder: INTERFACE_REJECTED
- Corelib.Classes.Morphisms.flip_arrow: UNIVERSE_REJECTED
- Corelib.Classes.Morphisms.flip_forall: UNIVERSE_REJECTED
- Corelib.Classes.Morphisms.proper_proper: INTERFACE_REJECTED
- Corelib.Classes.Morphisms.proper_sym_flip: UNIVERSE_REJECTED
- Corelib.Classes.Morphisms.proper_sym_flip_2: UNIVERSE_REJECTED
- Corelib.Classes.Morphisms.proper_sym_impl_iff_2: INTERFACE_REJECTED
- Corelib.Classes.Morphisms.rewrite_relation_eq_dom: UNIVERSE_REJECTED
- Corelib.Classes.Morphisms.subrelation_id_proper: UNIVERSE_REJECTED

## Corelib.Classes.Morphisms_Prop

- Corelib.Classes.Morphisms_Prop.Acc_rel_morphism: INTERFACE_REJECTED
- Corelib.Classes.Morphisms_Prop.well_founded_morphism: INTERFACE_REJECTED

## Corelib.Classes.RelationClasses

- Corelib.Classes.RelationClasses.false_predicate: UNIVERSE_REJECTED
- Corelib.Classes.RelationClasses.true_predicate: UNIVERSE_REJECTED

## Corelib.Init.Sumbool

- Corelib.Init.Sumbool.bool_eq_rec: KERNEL_REJECTED

## Corelib.ssr.ssrbool

- Corelib.ssr.ssrbool.all_sig2_cond: BLOCKED_DEPENDENCY
- Corelib.ssr.ssrbool.all_sig_cond: BLOCKED_DEPENDENCY
- Corelib.ssr.ssrbool.all_sig_cond_dep: UNIVERSE_REJECTED
