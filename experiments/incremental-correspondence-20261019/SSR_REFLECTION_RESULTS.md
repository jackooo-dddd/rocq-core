# SSR Bool Correspondence of opaque certification results: the twenty-seventh batch

This batch has added **36 operational roots**, and the total completed categories are **1526 / 2180**: 92 types, 565 operations/predicates, and 869 complete native statements. ssrbool Complete **420 / 451**.

The **275 different pre-statements of the 128 original conditional roots of this module have now been proven**; among them, the 119 root has completed the correspondence, and the other 9 root has not yet. All 318 closed proofs consist of 275 predeclarations and 43 new original statements; 227 empty axiom closures, and the remaining 91 only use the allowed Lean standard axioms.

## New corresponding 36 root

| Group | Quantity | Specify native target |
|---|---:|---|
| addbP、andP/and3P/and4P/and5P、idP/idPn、implyP、nandP、negP/negPf/negPn、norP、orP/or3P/or4P | 16 | Independently constructed native Bool logical property proof |
| andPP、orPP、negPP、implyPP、iffP、equivP、introP | 7 | Receive the original iff/ implication proof and combine the proof of the original reflection property |
| all_and2/3/4/5 | 4 | Termwise projection function for primitive conjunctions |
| unlessL、unlessR、unless_sym、bind_unless、unless_contra | 5 | Native construction and combination on Nonempty / Or |
| keyed_mem、keyed_mem_simpl、keyed_qualifier_keyed | 3 | Unit identity function after fixed external predicate/key |
| decP | 1 | Lean Decidable P constructed from Bool and its reflection iff |

The reflection function uses the existing reflect Iso to convert the mechanical result into a proof of the native proposition, and then the proof is equal to an **independently constructed native proof**. Proof independence can be used when the output is a proof object; Decidable P uses its single-valued property. The opaque source function is not expanded, and its defining volume equation is not generated.

This solves the problem of proving the semantic correspondence of objects/logical functions, not the calculation equations of arbitrary data algorithms. Both the native target and the independent native proof check the type and definition body, recursively expand the transparent definition, theorem and auxiliary declaration of opaque in NativeBridge, and reject residual source symbols. 23 reflection targets were built from the same inspected adapter; parameter conversions failed if they did not match.

## Four preconditions

The preconditions of bind_unless, keyed_mem, keyed_mem_simpl, and keyed_qualifier_keyed are proved manually in SSRBoolFinalWitnesses.lean, and they have no axiom dependence. The key packaging is eliminated according to the equation in the constructor, and bind_unless uses the existing Nonempty / Or corresponding combination.

The original input wrapper of the three keyed functions has two independent universe; the resulting wrapper uses a diagonal instance of the element universe in the original translation. Prove that the signature is retained and the two input universe are not forcibly merged.

## Verification and Documentation

- SSRBoolFinalWitnesses.lean: four closed prefix proofs.
- SSRBoolReflection.lean, ssrbool-reflection-selection.json: Native targets, input/output transformations and equations for 23 reflection operations.
- SSRBoolProofFunctions.lean, ssrbool-proof-function-selection.json: 13 logic/decision/packaging operations.
- reports/ssrbool-condition-dag.json: The exact dependencies and current state of the 128 root.
- reports/certificates.json, condition-discharges.json: Evidence by evidence.

The current source code and dependency fingerprint verification of 83 profile passed. 74 coverage certificates profile and 1264 are imported together, 1722 entrances, and 11260 dependent copies. The entire mechanical translation, old baseline, or Mathlib consumption case was not rerun. Compile and explore intermediates only on remote .work.

## Remaining

ssrbool Remaining 31 roots: 9 conditional roots that have not yet completed corresponding, 20 that have no corresponding roots, and 2 that only have interface roots.

The 9 conditional roots are all_sig2_cond, all_sig_cond, all_sig_cond_dep, all_tag_cond, all_tag_cond_dep, altP, boolP, ifP, ifPn. The first five return arbitrary selection data, and the current opaque result still lacks calculation/equation evidence; the last four rely on the index type correspondence of alt_spec / if_spec, and the next batch continues to be processed. The remaining condition category here means that the bridge has not yet been completed, **not that the prerequisite proof is still missing**.
