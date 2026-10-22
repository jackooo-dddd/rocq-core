> Historical snapshot: main75 bootstrap baseline, not current implementation. Here T06 = 2 / 2 only describes the old run; the current T06 is discontinued and is 0 / 0. Please use [Current Full Rule List ](../corelib-complete/ALL_RULES.md) and [Current Statistics ](../corelib-complete/RULE_USAGE.md)]. Historical data is retained for comparison.

main75 Rule-by-rule usage statistics

[Full listing ](ALL_RULES.md). The original root of 2180 is deduplicated; the left number is the main representation, and the right number contains the root quality branch.

The statistical accuracy of 118 items: {'Coverage': 23, 'Report evidence': 46, 'Not separately recorded': 46, 'Lower bound': 3}. Not recorded separately is not equal to zero, and coverage is not equal to the number of internal calls.

| ID | Rule | Main item / including number of branches | Basis |
|---|---|---|---|
| E01 | Dependency closure export | 2180 / 2180 (covered) | Export override of original root; non-function call count. |
| E02 | Classification after reduction | 2070 / 2070 (covered) | Constants participating in declaration classification; reduction branch not split. |
| E03 | statement mode for ordinary theorems/axioms | 1029/1029 (report hit) | Final presentation product. |
| E04 | Embedded proof extraction | 244/244 (report hit) | Self source IR with obligations; not equal to the root of all inherited unproven conditions. |
| E05 | Local proof application preservation | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E06 | Retry preserving proof structure | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E07 | Neutral proof projection preservation | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E08 | Transparent computational definitions | 934 / 934 (covered) | The final def product coverage. |
| E09 | Opaque data definitions | 107 / 107 (covered) | The final opaque product coverage includes quality and family. |
| E10 | Opaque interface policy | 0/0 (report hit) | The original root ended up being opaque_interface. |
| E11 | Sealed implementation preparation | 7/7 (report hit) | Source preparation sealed_implementation=true. |
| E12 | Polymorphic prerequisites and state | 331/331 (report hit) | Finally there are explicit conditions; internal times of conditional merging/elimination are not listed separately. |
| E13 | Deferred guard handling | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E14 | Prerequisite assembly | 0/0 (report hit) | This census is not assembled with externally provided certificates. |
| T01 | Variables and bindings | 1981 / 1981 (covered) | Ultimately AST contains bvar; not rel conversion call count. |
| T02 | Π, λ, let, and application | 2153 / 2153 (covered) | Final AST with binding/application structure. |
| T03 | References to constants, inductive types, and constructors | 2088 / 2095 (covered) | Finally, AST contains constant references and auxiliary references. |
| T04 | cast | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| T05 | SP：SProp → Prop | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| T06 | Bootstrap：nat、eq | 2/2 (report hit) | Native root mapping of nat, eq; downstream references are not repeatedly counted. |
| T07 | Ordinary single inductive blocks | 108 / 108 (covered) | The final coverage of the inductive block is generated. |
| T08 | Native records and projections | 0/0 (report hit) | The final report field primitive_record is nonempty/nonzero. |
| T09 | Non-uniform parameters | 1/1 (report hit) | Non-uniform blocks of native npars>nparams_rec. |
| T10 | T: non-recursive coinductive types | 4/4 (report hit) | The final report field coinductive_as_inductive is nonempty/nonzero. |
| T11 | Restricted nested and conditional inductive types | ≥0 / ≥0 (lower bound) | Only the sub-items of conditional induction are confirmed; nested induction is not listed separately. |
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
| U01 | R0: Native universe facts | 2180 / 2180 (covered) | Native universe context check override; not every root has non-trivial constraints. |
| U02 | R1: Basic sort mapping | 1780 / 1780 (covered) | The final AST contains Sort, without distinguishing between normal reading and R8. |
| U03 | R2/R2T: Universe parameterization | 1030 / 1030 (covered) | Finally, the u_ level parameter coverage is disclosed, excluding explicit v_i. |
| U04 | R2S: Public level solving | 129/129 (report hit) | Final report solved_levels is non-null/non-zero. The public and body local solutions are not separated independently. |
| U05 | R2B: Body-local levels | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U06 | R3: Reference coherence and no raising | 867/867 (report hit) | The final report field universe_checks is nonempty/nonzero. |
| U07 | R3′/R3″: Residual instances | 1/1 (report hit) | The final report field universe_residuals is nonempty/nonzero. |
| U08 | R4: Eq level | 596 / 596 (covered) | Finally AST directly contains Lean Eq. |
| U09 | R5/R5S: Template levels | 26/26 (report hit) | Final report template is non-null/non-zero. The statistics template block itself, downstream instantiation is a separate reference. |
| U10 | R6: Explicitly polymorphic constants | 194/194 (report hit) | The corresponding declaration has explicit polymorphic universe parameters. |
| U11 | Polymorphic inductive blocks | 6/6 (report hit) | The corresponding declaration has explicit polymorphic universe parameters. |
| U12 | R2⁺: Fact reduction | 1/1 (report hit) | The final report field sort_fact_reduced is nonempty/nonzero. |
| U13 | R2F/R2F-c: Constraint interpretation | 1/1 (report hit) | The final report field level_interp is nonempty/nonzero. |
| U14 | R3-P: Joint local/global entailment | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U15 | R3G: Implicit level discovery | 227/227 (report hit) | The final report field implicit_levels is nonempty/nonzero. |
| U16 | R3G-F: Result-sort levels | 0/0 (report hit) | The final report field result_sort_implicit_levels is nonempty/nonzero. |
| U17 | R8: Generalization to Sort | 598/598 (report hit) | The final report field admitting_levels is nonempty/nonzero. |
| U18 | R-CARRIER P1 | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U19 | R-CARRIER P2 | 66/66 (report hit) | The final report field level_copies is nonempty/nonzero. |
| U20 | R-CARRIER P3 | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U21 | R-SPLIT | 0/0 (report hit) | The final report field level_split is nonempty/nonzero. |
| U22 | Rule R: Semantic coherence | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U23 | Rule H: Prerequisite instances | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U24 | Per-occurrence levels / unify | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U25 | sort_interp | 5/5 (report hit) | The final report field sort_interp is nonempty/nonzero. |
| U26 | Solver P2 / joint | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U27 | Solver P3 / hypExact | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U28 | R3↑／R3↓ | 22/22 (report hit) | lowered or cumulativity flag; the strategy flag cannot be broken down into the actual number of lifts. |
| U29 | R2B-P | 1/1 (report hit) | The final report field r2bp_levels is nonempty/nonzero. |
| U30 | R2B-S | 1/1 (report hit) | The final report field sort_lowered_levels is nonempty/nonzero. |
| U31 | R2B-V | 1/1 (report hit) | The final report field result_sort_inherited is nonempty/nonzero. |
| U32 | Local polymorphic constraint interpretation / polyUniverseInterpretation | 26/33 (report hit) | The final report field poly_level_interp is nonempty/nonzero. |
| U33 | Fragment with global upper bounds | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U34 | Exact R6 fallback and equal-level merging | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U35 | Minimal defaults and bounded max solving | ≥1 / ≥1 (lower bound) | Only the reported Default/residual submechanism is confirmed; the max solution is not listed separately. |
| U36 | Q-a：phantom sort | 0/0 (report hit) | The final report field phantom_lowered is nonempty/nonzero. |
| C01 | Alias prefixes | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C02 | Transparent reference aliases | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C03 | Pure bound-variable combinators | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C04 | Type abbreviation closure | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C05 | Exact instance substitution | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C06 | Known-constructor-driven computation | 8/8 (report hit) | The final report field source_computed is nonempty/nonzero. |
| C07 | Set-motive unfolding | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L01 | Rule P: Proposition payload lifting | 1/1 (report hit) | prop_lift is not null; depth 0 is also a hit. |
| L02 | Prop up／down | 2/2 (report hit) | The final report field prop_lift_coercions is nonempty/nonzero. |
| L03 | Type up／down | 46/53 (report hit) | type_lift is not null or type_lift_coercions>0. |
| L04 | Function η-conversion | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L05 | Unpacking in type positions | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L06 | Wrapper function application | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L07 | Fieldwise conversion within the same record | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L08 | Composed conversions | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L09 | Deferring unresolved template conversions | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L10 | Statement view of lifted propositions | 0/0 (report hit) | The final report field prop_lift_unfold is nonempty/nonzero. |
| Q01 | Native quality bindings | 50 / 50 (covered) | Native template_info or quality_family override. |
| Q02 | Template Sort parameters | 21/21 (report hit) | The final report field template_sort is nonempty/nonzero. |
| Q03 | Shared-quality template families | 5/5 (report hit) | The final report field quality_prop is nonempty/nonzero. |
| Q04 | Dispatch by source annotation | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| Q05 | Native finite quality families | 23/23 (report hit) | Native quality_family root; all branches of the same root are fully checked. |
| Q06 | Native rechecking and implementation preservation | 23/23 (report hit) | Native quality_family root; all branches of the same root are fully checked. |
| Q07 | Closed quality references | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| N01 | Int63 | 31/31 (report hit) | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N02 | Array | 7/7 (report hit) | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N03 | String | 7/7 (report hit) | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N04 | Float | 20/20 (report hit) | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N05 | Structural result adaptation | 22/22 (report hit) | The primitive operation root that needs to be adapted by the source constructor. |
| N06 | Literals, identity, and primitive axioms | ≥65 / ≥65 (lower bound) | Only the primitive identity sub-mechanism is confirmed; the literal and axiom sub-mechanisms are not listed separately. |
| V01 | Source kernel checking | 2180 / 2180 (covered) | This processing/verification covers all original roots; not internal execution times. |
| V02 | Bootstrap signature checking | 2/2 (report hit) | Bootstrap signature check coverage. |
| V03 | Lean kernel checking | 2178 / 2178 (covered) | Generate declared kernel check coverage; bootstrap reuses an existing target. |
| V04 | P0 and statement generality | 2056 / 2056 (covered) | protected or statement inspection range. |
| V05 | Universe fact and reference checking | 867/867 (report hit) | The final report field universe_checks is nonempty/nonzero. |
| V06 | Dependency and prerequisite completeness | 2180 / 2180 (covered) | This processing/verification covers all original roots; not internal execution times. |
| V07 | Independent consumer | 2180 / 2180 (covered) | The root coverage of the corresponding module consumer=OK. |
| V08 | Independent structural audit | 2180 / 2180 (covered) | The root coverage of the corresponding module audit=OK. |
| V09 | Coverage and resource failures | 2180 / 2180 (covered) | This processing/verification covers all original roots; not internal execution times. |
| S01 | Fixed declaration dispatch | 2180 / 2180 (covered) | This processing/verification covers all original roots; not internal execution times. |
| S02 | Gated tier ladder | 2175 / 2175 (covered) | Has root coverage of tier_times. |
| S03 | Early conversion and generality retries | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| S04 | Inductive-specific tier ladder | 105 / 105 (covered) | Root coverage with inductive block tier_times. |
| S05 | Failure rollback and budgets | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |

**Independent fields and item-level counters**

| Field | Number of hits | Counter sum |
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

**Retry switch enabled**

This is the number of switch enablements, not the number of internal rule executions. Successful candidates may also be replaced by subsequent candidates. c:pl is Prop lift, i:pl is plain levels; ul is Type lift, un is unified by appearance.

| switch | Roots | number of attempts | successful candidate | discover | failed |
|---|---:|---:|---:|---:|---:|
| c:ad | 879 | 879 | 598 | 0 | 281 |
| c:cu | 166 | 900 | 17 | 0 | 883 |
| c:de | 144 | 288 | 0 | 0 | 288 |
| c:di | 1 | 1 | 0 | 1 | 0 |
| c:extraOwn | 494 | 1301 | 494 | 0 | 807 |
| c:fr | 145 | 145 | 1 | 0 | 144 |
| c:it | 166 | 820 | 5 | 0 | 815 |
| c:lo | 166 | 579 | 17 | 0 | 562 |
| c:p3 | 1 | 1 | 0 | 0 | 1 |
| c:pl | 45 | 127 | 3 | 0 | 124 |
| c:rv | 1 | 1 | 1 | 0 | 0 |
| c:ul | 62 | 77 | 52 | 0 | 25 |
| c:un | 102 | 264 | 0 | 0 | 264 |
| i:di | 23 | 23 | 0 | 23 | 0 |
| i:extraOwn | 1 | 4 | 0 | 0 | 4 |
| i:lo | 5 | 5 | 5 | 0 | 0 |
| i:pl | 105 | 117 | 102 | 0 | 15 |
| i:un | 6 | 17 | 5 | 0 | 12 |

**Recurrence**

Run at the repository root:

    python3 scripts/catalog_rule_usage.py

Read submitted compact evidence rule-usage-evidence.json; do not run translator. The remote full report can be re-extracted by adding --extract when present. The complete hit list and evidence of structural association is at RULE_USAGE.json. For unrecorded items, additional execution event instrumentation must be added and cannot be calculated based on current materials.
