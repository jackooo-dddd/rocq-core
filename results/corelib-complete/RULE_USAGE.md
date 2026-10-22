Mechanical nat/eq baseline rule-by-rule usage statistics

[Full catalog](ALL_RULES.md). Counts use 2180 distinct original roots: the left count checks the primary representation; the right also includes quality branches, deduplicated by root.

The table groups 118 review entries by evidence category, including disabled T06. These are entry counts, not rule usage counts. Per-rule figures count distinct roots; execution invocations were not independently collected.

| Evidence category | Review entries | Meaning | How to read the count (with examples) |
|---|---:|---|---|
| Processing scope | 8 | Declarations covered by a check or processing stage; not every declaration must trigger a special transformation. | For example, 2180 means that 2180 roots are covered, not that 2180 rewrites occurred. E01: export scope; V03: kernel checks of generated declarations. |
| Source metadata | 12 | Declarations selected by source IR kind, flags, or fields. | Counts roots with that source feature; it does not confirm execution of a target transformation branch. T09: npars > nparams_rec; E04: obligations on the root itself. |
| Artifact structure | 13 | Selection by the final target declaration kind, AST, or visible attributes. | Counts distinct roots with the artifact feature; repeated occurrences in one root count as 1. T07: target kind inductive; U08: native Lean Eq directly in the target AST. |
| Not separately recorded | 46 | Available evidence has no independent record attributable to this submechanism. | Both root usage and invocation counts are unknown (null), not 0; parent-mechanism counts cannot substitute. M03 has no independent path events in this historical report; a source fix is only related structural evidence. |
| Result report fields | 28 | Final report fields are nonempty, nonzero, or satisfy the stated conditions. | Counts roots meeting those conditions. A field may record a policy or a solution, so it is not necessarily a rewrite count. U15: implicit_levels; L02: nonzero prop_lift_coercions. |
| Not enabled in this run | 3 | The current configuration does not use the mechanism, or its historical path has been disabled. | The current count is 0; this does not imply that the mechanism is absent or unnecessary for every input. T06 is explicitly disabled. T06: empty bootstrap table; E14: no externally supplied proofs assembled in this run. |
| Partial submechanisms | 3 | Only part of a composite entry has identifiable evidence. | The count covers only the part named in basis. Total entry usage remains unknown, and this is not a lower bound on invocation count. T11 records conditional inductive subcases, not nested inductive types separately. |
| Policy flag | 1 | The report records a policy that was tried, without the individual conversions inside it. | Counts roots with the flag. Enabling a policy does not show that a corresponding raising or conversion occurred. U28: universe_lowered / universe_cumulativity. |
| Module validation results | 2 | The module containing the declaration has an explicit successful independent validation result. | Counts roots covered by validated modules, not per-rule proofs or check invocations. V07: consumer=OK; V08: audit=OK. |
| Attempt records | 2 | A declaration has tier_times, or a specified attempt kind occurs in that record. | The main table counts roots with such records; the retry-switch table separately gives attempt totals. S02: tier_times exists; S04: an inductive i[...] attempt. |

Partial-submechanism evidence is not labeled as a lower bound for the whole rule. Q05/Q06, U06/V05, and T06/V02 share predicates; their counts cannot be added. 0 means no qualifying hit or not enabled in this run; null means unknown/not separately recorded.

| ID | Rule | Main item / including number of branches | Basis |
|---|---|---|---|
| E01 | Dependency closure export | 2180 / 2180（Processing scope） | Export override of original root; non-function call count. |
| E02 | Classification after reduction | 2070 / 2070（Source metadata） | Constants participating in declaration classification; reduction branch not split. |
| E03 | statement mode for ordinary theorems/axioms | 1029 / 1029（Artifact structure） | Final presentation product. |
| E04 | Embedded proof extraction | 244 / 244（Source metadata） | Self source IR with obligations; not equal to the root of all inherited unproven conditions. |
| E05 | Local proof application preservation | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E06 | Retry preserving proof structure | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E07 | Neutral proof projection preservation | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E08 | Transparent computational definitions | 934 / 934（Artifact structure） | The final def product coverage. |
| E09 | Opaque data definitions | 107 / 107（Artifact structure） | The final opaque product coverage includes quality and family. |
| E10 | Opaque interface policy | 0 / 0（Result report fields） | The original root ended up being opaque_interface. |
| E11 | Sealed implementation preparation | 7 / 7（Source metadata） | Source preparation sealed_implementation=true. |
| E12 | Polymorphic prerequisites and state | 331 / 331（Artifact structure） | Finally there are explicit conditions; internal times of conditional merging/elimination are not listed separately. |
| E13 | Deferred guard handling | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E14 | Prerequisite assembly | 0 / 0（Not enabled in this run） | No external proofs are assembled in this census; 0 describes the configuration, not prerequisite-assembly invocation counts. |
| T01 | Variables and bindings | 1982 / 1982（Artifact structure） | Ultimately AST contains bvar; not rel conversion call count. |
| T02 | Π, λ, let, and application | 2155 / 2155（Artifact structure） | Final AST with binding/application structure. |
| T03 | References to constants, inductive types, and constructors | 2090 / 2097（Artifact structure） | Finally, AST contains constant references and auxiliary references. |
| T04 | cast | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| T05 | SP：SProp → Prop | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| T06 | Old Bootstrap nat/eq (disabled) | 0 / 0（Not enabled in this run） | Disabled: bootstrapRules=#[], with 0 reported bootstrap/ roots. Source nat/eq use T07. |
| T07 | Ordinary single inductive blocks | 110 / 110（Artifact structure） | The final coverage of the inductive block is generated. |
| T08 | Native records and projections | 0 / 0（Result report fields） | final report primitive_record is nonempty/nonzero. |
| T09 | Non-uniform parameters | 1 / 1（Source metadata） | Non-uniform blocks of native npars>nparams_rec. |
| T10 | T: non-recursive coinductive types | 4 / 4（Result report fields） | final report coinductive_as_inductive is nonempty/nonzero. |
| T11 | Restricted nested and conditional inductive types | 0 / 0（Partial submechanisms） | Only the sub-items of conditional induction are confirmed; nested induction is not listed separately. |
| M01 | M3b: dependent match | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M02 | Non-uniform match | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M03 | Single-function structural recursion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M04 | Generalization of changing leading parameters | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M05 | Indices and function-valued recursive fields | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M06 | ι-generalized recursion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M07 | Structural mutual recursion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M08 | Exposing recursion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M09 | Course-of-values | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M10 | Accessibility conversion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M11 | Explicit well-founded fallback | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M12 | Constructor-shaped indices | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M13 | Recursive cast repair | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U01 | R0: Native universe facts | 2180 / 2180（Processing scope） | Native universe context check override; not every root has non-trivial constraints. |
| U02 | R1: Basic sort mapping | 1782 / 1782（Artifact structure） | The final AST contains Sort, without distinguishing between normal reading and R8. |
| U03 | R2/R2T: Universe parameterization | 1031 / 1031（Artifact structure） | Finally, the u_ level parameter coverage is disclosed, excluding explicit v_i. |
| U04 | R2S: Public level solving | 129 / 129（Result report fields） | final report solved_levels is nonempty/nonzero. The public and body local solutions are not separated independently. |
| U05 | R2B: Body-local levels | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U06 | R3: Reference coherence and no raising | 867 / 867（Result report fields） | final report universe_checks is nonempty/nonzero. |
| U07 | R3′/R3″: Residual instances | 1 / 1（Result report fields） | final report universe_residuals is nonempty/nonzero. |
| U08 | R4: Level checks for internal Lean Eq | 6 / 6（Artifact structure） | The final AST directly contains the native Lean Eq (including internal auxiliary proof); it is not the number of native mappings of the source eq. |
| U09 | R5/R5S: Template levels | 27 / 27（Result report fields） | final report template is nonempty/nonzero. The statistics template block itself, downstream instantiation is a separate reference. |
| U10 | R6: Explicitly polymorphic constants | 194 / 194（Artifact structure） | The corresponding declaration has explicit polymorphic universe parameters. |
| U11 | Polymorphic inductive blocks | 6 / 6（Artifact structure） | The corresponding declaration has explicit polymorphic universe parameters. |
| U12 | R2⁺: Fact reduction | 1 / 1（Result report fields） | final report sort_fact_reduced is nonempty/nonzero. |
| U13 | R2F/R2F-c: Constraint interpretation | 1 / 1（Result report fields） | final report level_interp is nonempty/nonzero. |
| U14 | R3-P: Joint local/global entailment | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U15 | R3G: Implicit level discovery | 227 / 227（Result report fields） | final report implicit_levels is nonempty/nonzero. |
| U16 | R3G-F: Result-sort levels | 0 / 0（Result report fields） | final report result_sort_implicit_levels is nonempty/nonzero. |
| U17 | R8: Generalization to Sort | 598 / 598（Result report fields） | final report admitting_levels is nonempty/nonzero. |
| U18 | R-CARRIER P1 | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U19 | R-CARRIER P2 | 66 / 66（Result report fields） | final report level_copies is nonempty/nonzero. |
| U20 | R-CARRIER P3 | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U21 | R-SPLIT | 0 / 0（Result report fields） | final report level_split is nonempty/nonzero. |
| U22 | Rule R: Semantic coherence | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U23 | Rule H: Prerequisite instances | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U24 | Per-occurrence levels / unify | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U25 | sort_interp | 5 / 5（Result report fields） | final report sort_interp is nonempty/nonzero. |
| U26 | Solver P2 / joint | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U27 | Solver P3 / hypExact | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U28 | R3↑／R3↓ | 22 / 22（Policy flag） | lowered or cumulativity flag; the strategy flag cannot be broken down into the actual number of lifts. |
| U29 | R2B-P | 1 / 1（Result report fields） | final report r2bp_levels is nonempty/nonzero. |
| U30 | R2B-S | 1 / 1（Result report fields） | final report sort_lowered_levels is nonempty/nonzero. |
| U31 | R2B-V | 1 / 1（Result report fields） | final report result_sort_inherited is nonempty/nonzero. |
| U32 | Local polymorphic constraint interpretation / polyUniverseInterpretation | 26 / 33（Result report fields） | final report poly_level_interp is nonempty/nonzero. |
| U33 | Fragment with global upper bounds | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U34 | Exact R6 fallback and equal-level merging | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U35 | Minimal defaults and bounded max solving | 1 / 1（Partial submechanisms） | Only the reported Default/residual submechanism is confirmed; the max solution is not listed separately. |
| U36 | Q-a：phantom sort | 0 / 0（Result report fields） | final report phantom_lowered is nonempty/nonzero. |
| C01 | Alias prefixes | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C02 | Transparent reference aliases | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C03 | Pure bound-variable combinators | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C04 | Type abbreviation closure | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C05 | Exact instance substitution | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C06 | Known-constructor-driven computation | 8 / 8（Result report fields） | final report source_computed is nonempty/nonzero. |
| C07 | Set-motive unfolding | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L01 | Rule P: Proposition payload lifting | 1 / 1（Result report fields） | prop_lift is not null; depth 0 is also a hit. |
| L02 | Prop up／down | 2 / 2（Result report fields） | final report prop_lift_coercions is nonempty/nonzero. |
| L03 | Type up／down | 46 / 53（Result report fields） | type_lift is not null or type_lift_coercions>0. |
| L04 | Function η-conversion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L05 | Unpacking in type positions | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L06 | Wrapper function application | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L07 | Fieldwise conversion within the same record | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L08 | Composed conversions | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L09 | Deferring unresolved template conversions | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L10 | Statement view of lifted propositions | 0 / 0（Result report fields） | final report prop_lift_unfold is nonempty/nonzero. |
| Q01 | Native quality bindings | 50 / 50（Source metadata） | Native template_info or quality_family override. |
| Q02 | Template Sort parameters | 22 / 22（Result report fields） | final report template_sort is nonempty/nonzero. |
| Q03 | Shared-quality template families | 5 / 5（Result report fields） | final report quality_prop is nonempty/nonzero. |
| Q04 | Dispatch by source annotation | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| Q05 | Native finite quality families | 23 / 23（Source metadata） | Native quality_family root; all branches of the same root are fully checked. |
| Q06 | Native rechecking and implementation preservation | 23 / 23（Source metadata） | Native quality_family root; all branches of the same root are fully checked. |
| Q07 | Closed quality references | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| N01 | Int63 | 31 / 31（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N02 | Array | 7 / 7（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N03 | String | 7 / 7（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N04 | Float | 20 / 20（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N05 | Structural result adaptation | 22 / 22（Source metadata） | The primitive operation root that needs to be adapted by the source constructor. |
| N06 | Literals, identity, and primitive axioms | 65 / 65（Partial submechanisms） | Only the primitive identity sub-mechanism is confirmed; the literal and axiom sub-mechanisms are not listed separately. |
| V01 | Source kernel checking | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| V02 | Bootstrap signature checking | 0 / 0（Not enabled in this run） | The current bootstrap table is empty, and there is no bootstrap signature adaptation object this time. |
| V03 | Lean kernel checking | 2180 / 2180（Processing scope） | Generate declared kernel check coverage; bootstrap reuses an existing target. |
| V04 | P0 and statement generality | 2056 / 2056（Processing scope） | protected or statement inspection range. |
| V05 | Universe fact and reference checking | 867 / 867（Result report fields） | final report universe_checks is nonempty/nonzero. |
| V06 | Dependency and prerequisite completeness | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| V07 | Independent consumer | 2180 / 2180（Module validation results） | Belonging module consumer=OK root coverage. |
| V08 | Independent structural audit | 2180 / 2180（Module validation results） | Belonging module audit=OK root coverage. |
| V09 | Coverage and resource failures | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| S01 | Fixed declaration dispatch | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| S02 | Gated tier ladder | 2175 / 2175（Attempt records） | Has root coverage of tier_times. |
| S03 | Early conversion and generality retries | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| S04 | Inductive-specific tier ladder | 105 / 105（Attempt records） | Root coverage with inductive block tier_times. |
| S05 | Failure rollback and budgets | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |

**Independent fields and report counters**

These are report sums of the main representation of existing counters, not new per-rule execution event auditing.

| Field | Number of hits | Main represents counter sum |
|---|---:|---:|
| admitting_levels | 598 | — |
| pending_hypotheses | 331 | — |
| universe_lowered | 22 | — |
| type_lift_coercions | 36 | 274 |
| delta_inlined | 156 | — |
| level_copies | 66 | — |
| prop_lift_coercions | 2 | 2 |
| poly_level_interp | 26 | — |
| source_computed | 8 | — |
| level_interp | 1 | — |
| result_sort_inherited | 1 | — |

**Retry switch activations**

This is the number of switch enablements, not the number of internal rule executions. Successful candidates may also be replaced by subsequent candidates. c:pl is Prop lift, i:pl is plain levels; ul is Type lift, un is unified by appearance.

| switch | Roots | number of attempts | successful candidate | discover | failed |
|---|---:|---:|---:|---:|---:|
| c:ad | 879 | 879 | 598 | 0 | 281 |
| c:cu | 166 | 900 | 17 | 0 | 883 |
| c:de | 144 | 288 | 0 | 0 | 288 |
| c:di | 1 | 1 | 0 | 1 | 0 |
| c:extraOwn | 495 | 1303 | 494 | 0 | 809 |
| c:fr | 145 | 145 | 1 | 0 | 144 |
| c:it | 166 | 820 | 5 | 0 | 815 |
| c:lo | 166 | 579 | 17 | 0 | 562 |
| c:p3 | 1 | 1 | 0 | 0 | 1 |
| c:pl | 45 | 127 | 3 | 0 | 124 |
| c:rv | 1 | 1 | 1 | 0 | 0 |
| c:ul | 62 | 77 | 52 | 0 | 25 |
| c:un | 102 | 264 | 0 | 0 | 264 |
| i:di | 24 | 24 | 0 | 24 | 0 |
| i:extraOwn | 1 | 4 | 0 | 0 | 4 |
| i:lo | 5 | 5 | 5 | 0 | 0 |
| i:pl | 105 | 117 | 104 | 0 | 13 |
| i:un | 6 | 17 | 5 | 0 | 12 |

**Reproduction**

Run at the repository root:

    python3 scripts/catalog_rule_usage.py

Read submitted compact evidence rule-usage-evidence.json; do not run translator. The remote full report can be re-extracted by adding --extract when present.The evidence class definition is stored in measurement_definitions in RULE_USAGE.json. The complete hit list and evidence of structural association is at RULE_USAGE.json. Unrecorded mechanisms require additional execution-event instrumentation; their usage cannot be inferred from current evidence.
