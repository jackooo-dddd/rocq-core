# Correspondence for the computationally transparent variant

This variant has correspondence certificates for **2180/2180 distinct source roots**. New proofs cover all **80/80 roots** remaining in the original baseline: CRelationClasses 11, CMorphisms 54, ssrbool 6, ssrfun 4, ssreflect_rw 3, and Program.Wf 2. All six proof groups import together successfully.

The original frozen baseline remains at **2100/2180**. The new proofs establish correspondences for unfoldable definitions in new namespaces, not value equalities between the original opaque constants and those definitions. Certificates for all previous 2100 roots have been rechecked under the same policy; 173 existing profiles, 6 new profiles, and the consumer examples import together successfully.

| Full-variant classification | Roots |
|---|---:|
| Bidirectional type correspondence | 164 |
| Operation correspondence | 988 |
| Native statement iff | 1028 |
| Total | 2180 |

The [full ledger](reports/FULL_VARIANT_LEDGER.json) lists certificates per root; the [full validation summary](reports/FULL_VARIANT_SUMMARY.json) records combined imports and axiom checks. A native statement iff is not a proof of the original source theorem. Each root retains the actual parameter, universe, quality-branch, and premise scope of its certificate.

## Export policy

TransparentPack copies dependency closures from each module's checked Lean environment, consistently adding a Computational.<module> prefix. The only computational policy change is to re-export non-Prop opaque data declarations in the source Rocq / RocqPending namespaces as def, with the same type, universe parameters, and body modulo renaming. Each declaration is checked again by the kernel. The export report also verifies equality of the renamed type and body expressions.

The original declarations are unchanged, and mechanical nat/eq remain separate inductive data types. No computation-equation axioms are added. The original and new declarations have a checked syntactic relationship; this is not a proof that their values are equal.

## Completed proofs

| Module | Candidate roots | Proved variant correspondences | Proof |
|---|---:|---:|---|
| CRelationClasses | 11 | 11 | [CRelation.lean](CRelation.lean) |
| CMorphisms | 54 | 54 | [CMorphism.lean](CMorphism.lean) |
| ssrbool | 6 | 6 | [SSRBool.lean](SSRBool.lean) |
| ssrfun | 4 | 4 | [SSRFun.lean](SSRFun.lean) |
| ssreflect_rw | 3 | 3 | [SSRRewrite.lean](SSRRewrite.lean) |
| Program.Wf | 2 | 2 | [ProgramWf.lean](ProgramWf.lean) |
| Total | 80 | 80 | |

CRelation and CMorphism preserve the computational data in Type-valued relations. They cover entire relation records, conversions between partial and strict orders, composition, and pointwise relations. All 6 conditional CMorphism roots are instantiated with closed proofs.

SSRFun preserves dependent choice data, combining pointwise Sigma/PSigma/Subtype evidence into a function with its evidence. SSRBool's conditional selection uses the supplied data when the predicate is true and retains the specified default otherwise. Correspondences cover single conditions, dependent conditions, and paired properties. SSRRewrite corresponds to function application, transport along native equality, and lookup in dependent contexts.

The two Program.Wf eliminators correspond to Lean WellFounded.fix. Their proofs include equality of recursive values, transport along return-value equalities, inverse laws for recursive callback conversions, and closed proofs of the original preconditions. Q may contain arbitrary Type w data; it is not restricted to Prop.

## Concrete examples

The theorem shapes below use abbreviations. The linked Lean files specify the full universes and parameters.

1. Conditional data selection: converting mechanical all_tag_cond_dep yields a native Sigma-packaged function with its conditional property. Pointwise, the native function is chooseValue (C x) (T x) (default x) (provided x): it selects provided when C x = true and retains default when false. The dependent property and both selection branches are proved together; see SSRBool.allTagCondDep_agrees and allSigCondDep_agrees.
2. Strict order to partial order: relation evidence is preserved as Sum (R x y) (E x y), where R and E may be Type-valued. It is not reduced to a truth-only Or. See strictToPartial_agrees in CMorphism.lean.
3. Well-founded recursive elimination: let value_agrees equate the mechanical and Lean recursive values. Passing a native callback to the mechanical eliminator through fromInvariant yields:

   ~~~text
   cast (congrArg (Q x) value_agrees)
     (mechanical.Fix_F_sub_rect ... (fromInvariant I) x accessibility)
     =
   WellFounded.fix wf I x
   ~~~

   Both composites of fromInvariant / toInvariant are identities. The equality is therefore not obtained by restricting callbacks to a subset of functions. Fix_sub_rect has analogous inverse callback conversions. See ProgramWf.fixFRect_agrees and fixSubRect_agrees.

## Automatic composition

The native_compose command in [AutoCompose.lean](AutoCompose.lean) takes an expression and proved correspondences. It uses those equalities and definitional reduction to generate a native definition and a function-equality proof. Recursive inspection of the generated target's type and body prevents source calls from being hidden in helper functions. Results with undischarged conditions or extra axioms are rejected.

[AutoExample.lean](AutoExample.lean) automatically adds two mechanical conditional-selection results, generating a function made from native if, Nat addition, and remainder. The generated definition is executable: selectedSum 10 returns 4. Another example retains a general universe parameter and automatically generates the identity function on Type u. Both equality proofs pass kernel checking. See the [validation results](reports/auto-composition-validation.json) for rejection behavior involving missing rules, hidden source calls, undischarged conditions, and forged equations. This tool composes supplied correspondences; it does not automatically discover semantic correspondences with arbitrary library functions.

## Validation and scope

All 80 certificates pass kernel checking. Every source-root universe parameter is preserved, native targets contain no source symbols throughout their recursive dependency closures, and axiom dependencies are limited to standard Lean axioms. Combined imports do not use the original profiles' search paths.

Native correspondence includes existing Lean APIs and expressions built from Lean types and functions. It does not mean that each of these 80 roots has a same-named existing Mathlib definition. A native statement iff also does not automatically prove that the source theorem is true.

All 80 roots in the six candidate modules have completed variant export and kernel rechecking. The exposure manifest includes dependencies, so its declaration count differs from the candidate-root count. Re-export alone does not count as correspondence.

- [Certificate registry](certificates.json), [per-root results](reports/ROOT_LEDGER.json), and [summary](reports/summary.json).
- [Exporter](TransparentPack.lean), [auditor](Audit.lean), and [plan and DAG](PLAN.md).
- [Existing-certificate regression script](regress_existing.py) and [combined validation](check_regression.py).
- [Consumer examples](Consumer.lean): dependent Fin data and Mathlib prime theorems; [validation results](reports/consumer-validation.json).

[Composition.lean](Composition.lean) also validates automatic rewriting across profiles: mechanical nat.iter → Lean Nat → the native result of mechanical SSR conditional selection → Mathlib Prime.two_le. The two mechanical copies need not share a datatype identity; their proved native interfaces connect them.

To reproduce, run python3 build.py, then python3 verify.py, and then python3 make_report.py. Run python3 regress_existing.py for existing-result regression, python3 check_consumer.py for the consumer examples, and python3 check_consumer.py Composition for cross-profile composition. Finally, run python3 check_regression.py for combined validation and python3 check_auto.py for automatic generation, execution, and rejection checks. Compiled artifacts, temporary files, and logs remain only in the remote .work/transparent-data directory.
