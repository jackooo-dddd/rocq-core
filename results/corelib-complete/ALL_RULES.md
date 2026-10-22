Mechanical nat/eq Baseline: Complete Review Checklist of Current Rules and Mechanisms

Basis: frozen source code of experiments/mechanical-nat-eq-20261019/translator. Scope: The translation, source preparation, representation conversion, solving, inspection, and scheduling mechanisms in the current implementation are independently accountable; each program branch is not copied one by one.

This list retains 118 review entries (T06 is a deactivated historical number, and the remaining 117 entries currently still contain verification and scheduling mechanisms), and 61 primitive operation mappings automatically extracted from Translate.lean are attached. E/T/M/U/C/L/Q/N/V/S is the number of this arrangement, not the number of new rules in the original code, nor the count of the formal minimum rule set. The original R…, P… names are retained. Different ladder switch combinations are not counted repeatedly as rules; the mechanisms retained in the code are not guaranteed to be hit in this Corelib root statement.

Corresponding results: 67 source modules, 2180 original root declarations, the current fixed range 0 is blocked. Success here includes statements and conditional definitions; ordinary theorem statements are not theorem proofs. This scope does not mean that any Rocq program can be translated.

| group | content | Number of entries |
|---|---|---:|
| E | Declaration, derivation and proof conditions | 14 |
| T | Basic items and data types | 11 |
| M | Matching, recursion and calculation transformations | 13 |
| U | Universe explanation and solution | 36 |
| C | Source-side convertible expansion | 7 |
| L | explicit conversion | 10 |
| Q | Sort quality polymorphic | 7 |
| N | Primitive representation and adaptation | 6 |
| V | Acceptance conditions and independent verification (not rewriting rules that produce translations) | 9 |
| S | Try scheduling and state management (not counting semantic rules) | 5 |

<!-- usage-method-start -->

**Number of times used**

The population is 2180 original roots. The left count selects roots by their primary representation; the right includes quality branches and deduplicates by root. Neither measures invocations. Evidence is classified as source metadata, artifact structure, processing scope, module validation, attempt records, policy flags, or result report fields. A nonempty field does not automatically show a rewrite. Partial-submechanism counts cover only the part specified in basis; total entry usage remains unknown. Missing independent records are null, not 0. T06 is disabled and retained for historical comparison. JSON/CSV records give units, limitations, shared predicates, and full name lists. Shared evidence such as Q05/Q06 and U06/V05 cannot be added together.

For the meaning of each evidence category, how to understand the number and examples, please see the [explanation table at the beginning of RULE_USAGE.md](RULE_USAGE.md). The switch enable for failed retries is also listed there separately and is not mixed in with the final hit. See [RULE_USAGE.json](RULE_USAGE.json) for the full declaration list, and see [RULE_USAGE.csv](RULE_USAGE.csv) for the screening list.

<!-- usage-method-end -->

**E: Declaration, Export and Proof Conditions**

Source code location (relatively frozen translator): rocq/exporter/src/r2l_export.ml; Rocq2Lean/Emit.lean; Rocq2Lean/Assemble.lean.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| E01 | Dependency closure export | Export declarations and dependencies, record native universe facts, instances, transparency, quality, relevance and body_state; processed in dependency order. | 2180 / 2180（Processing scope） | Export override of original root; non-function call count. |
| E02 | Classification after reduction | The product and transparent reduction along the types identify the final Prop/SProp; the unreduced surface Type cannot be classified alone. | 2070 / 2070（Source metadata） | Constants participating in declaration classification; reduction branch not split. |
| E03 | statement mode for ordinary theorems/axioms | Translate the proposition as a Prop-valued definition; do not turn source axioms into Lean axioms or transfer ordinary theorem proofs by default. | 1029 / 1029（Artifact structure） | Final presentation product. |
| E04 | Embedded proof extraction | The proof fragment in the calculation definition is named obligation; if necessary, add explicit assumption parameters before the target statement. | 244 / 244（Source metadata） | Self source IR with obligations; not equal to the root of all inherited unproven conditions. |
| E05 | Local proof application preservation | Proofs starting with local assumptions should be retained; the proof parameters constructed therein are still processed according to the source preparation rules. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E06 | Retry preserving proof structure | When preparation fails, the constructor-shaped proof and the referenced proof application structure may be retained; the required global proof remains as an explicit prerequisite. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E07 | Neutral proof projection preservation | The projection/getting field match of the single constructor proof can be retained; the transparent header is only expanded when it conforms to the defined shape. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E08 | Transparent computational definitions | The type and body of the source definition are translated and registered as Lean def. | 934 / 934（Artifact structure） | The final def product coverage. |
| E09 | Opaque data definitions | The prepared body of opaque_data is still checked and registered as Lean opaque, maintaining opacity. | 107 / 107（Artifact structure） | The final opaque product coverage includes quality and family. |
| E10 | Opaque interface policy | The opaque_interface policy exports only the type interface and data tasks; it cannot be confused with the implementation-preserving opaque_data. | 0 / 0（Result report fields） | The original root ended up being opaque_interface. |
| E11 | Sealed implementation preparation | Preparation sealed module/Lock implementation preserves source-side rechecking and cannot treat decapsulation as an unchecked override. | 7 / 7（Source metadata） | Source preparation sealed_implementation=true. |
| E12 | Polymorphic prerequisites and state | Conditions are used as required for the universe instance; the final pending state is based on realistic residual assumptions, and unused conditions can be eliminated after source conversion. | 331 / 331（Artifact structure） | Finally there are explicit conditions; internal times of conditional merging/elimination are not listed separately. |
| E13 | Deferred guard handling | Source preparation can defer certain guard problems to subsequent structure/base transformations; deferral does not in itself amount to finality proof. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| E14 | Prerequisite assembly | Assemble can populate tasks with checked external proofs, retranslate dependencies, and preserve opaque; not an automatic prover. | 0 / 0（Not enabled in this run） | No external proofs are assembled in this census; 0 describes the configuration, not prerequisite-assembly invocation counts. |

**T: Basic items and data types**

Source code location (relatively frozen translator): Rocq2Lean/Translate.lean; Rocq2Lean/Emit.lean; Rocq2Lean/Bootstrap.lean.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| T01 | Variables and bindings | rel is mapped to the corresponding bind variable, keeping the scope corresponding to de Bruijn. | 1982 / 1982（Artifact structure） | Ultimately AST contains bvar; not rel conversion call count. |
| T02 | Π, λ, let, and application | Generate forall, lambda, let and application respectively; retain type annotations and perform type checking. | 2155 / 2155（Artifact structure） | Final AST with binding/application structure. |
| T03 | References to constants, inductive types, and constructors | Reference the registered target and attach the corresponding universe instance; do not guess the correspondence based on the similarity of the names. | 2090 / 2097（Artifact structure） | Finally, AST contains constant references and auxiliary references. |
| T04 | cast | Source convertible cast can be eliminated; when not directly convertible, a checked repair or explicit representation of the conversion must be performed. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| T05 | SP：SProp → Prop | The target uses Lean Prop; retain source elimination and relevance inspection, and do not relax the SProp constraint arbitrarily. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| T06 | Old Bootstrap nat/eq (disabled) | Empty bootstrap table; sources nat and eq are all generated independent inductive types by T07. Numbers reserved for historical comparison, current hit 0; correspondence independently proven after translation. | 0 / 0（Not enabled in this run） | Disabled: bootstrapRules=#[], with 0 reported bootstrap/ roots. Source nat/eq use T07. |
| T07 | Ordinary single inductive blocks | Preserve parameters, indices, and constructor order; check the inductive declaration in the Lean kernel. | 110 / 110（Artifact structure） | The final coverage of the inductive block is generated. |
| T08 | Native records and projections | A primitive record with a single constructor, no indices, and no recursion can use a structure representation and Expr.proj. | 0 / 0（Result report fields） | final report primitive_record is nonempty/nonzero. |
| T09 | Non-uniform parameters | Parameters that do not remain uniform after source nparams_rec are indexed to Lean. | 1 / 1（Source metadata） | Non-uniform blocks of native npars>nparams_rec. |
| T10 | T: non-recursive coinductive types | Qualified non-recursive monomer coinductive is converted into ordinary inductive; recursive cofix is not supported for this reason. | 4 / 4（Result report fields） | final report coinductive_as_inductive is nonempty/nonzero. |
| T11 | Restricted nested and conditional inductive types | Supports limited monomer nested matching/structural recursion; the induction target has pre-proof conditions when necessary, which does not equal arbitrary mutual induction support. | 0 / 0（Partial submechanisms） | Only the sub-items of conditional induction are confirmed; nested induction is not listed separately. |

**M: Matching, recursive and computational transformations**

Source code location (relatively frozen translator): Rocq2Lean/Translate.lean: transCase, transCaseNU, transFix, transFix1, transFixAcc, transFixWf, transFixMutual.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| M01 | M3b: dependent match | Use real Lean recursor; construct motive from source predicate and lay out branches by kernel fields and IH. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M02 | Non-uniform match | Restricted non-uniform parameter fragments use convoy/Eq.rec; match with a known constructor is reduced to ι first. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M03 | Single-function structural recursion | The decrementing parameter is rewritten as recursor; the actual parameter after the decrementing parameter can be changed. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M04 | Generalization of changing leading parameters | Move the changed preparameter into motive while retaining the type of the parameter and not relying on its change. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M05 | Indices and function-valued recursive fields | Generalization index; a functional recursive field produces an inductive hypothesis with corresponding parameters. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M06 | ι-generalized recursion | When the outer layer match is not on the decreasing parameter, the entire function body is substituted into the decreasing constructor and then reduced; match is not rearranged arbitrarily. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M07 | Structural mutual recursion | For functions of the same inductive type, the same decrement position and compatible prefix types, construct the union PProd and reproject the recursive result. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M08 | Exposing recursion | ζ Unfolds recursive let, which unwinds transparent auxiliary calls in a limited manner so that recursive usage is exposed. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M09 | Course-of-values | Cache with below/PProd after specific non-direct recursive field call fails; subject to index, non-uniform and nested shape limitations. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M10 | Accessibility conversion | In the specific case of recursively generating data from Prop, construct the calling relationship and the good foundation certificate supported by the source guard. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M11 | Explicit well-founded fallback | Acc.rec is available in statement mode and lists the unsolved well-foundedness/expanded equation proofs as an explicit task. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M12 | Constructor-shaped indices | Support qualified non-recursive single constructor record index, restore different early arguments with field projection; reject duplicate leaves, etc. Shapes are not supported. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| M13 | Recursive cast repair | Handle conversions that require expansion of fix through case analysis and equation transport; not arbitrary coercion. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |

**U: Universe Explanation and Solution**

Source code location (relatively frozen translator): Rocq2Lean/Translate.lean; Rocq2Lean/Emit.lean; Rocq2Lean/Split.lean.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| U01 | R0: Native universe facts | Obtain and review universe constraints in global and polymorphic contexts from the source kernel. | 2180 / 2180（Processing scope） | Native universe context check override; not every root has non-trivial constraints. |
| U02 | R1: Basic sort mapping | Map Prop to Sort 0 and general Type(l+n) to Sort(I(l)+n+1), interpreting max components individually; R8 provides a specific exception. | 1782 / 1782（Artifact structure） | The final AST contains Sort, without distinguishing between normal reading and R8. |
| U03 | R2/R2T: Universe parameterization | Parameterize the relevant global levels in constant interfaces and inductive arities/constructors. | 1031 / 1031（Artifact structure） | Finally, the u_ level parameter coverage is disclosed, excluding explicit v_i. |
| U04 | R2S: Public level solving | Represent own levels as metavariables, solve them by type unification, then check native constraints; generalize free public levels. | 129 / 129（Result report fields） | final report solved_levels is nonempty/nonzero. The public and body local solutions are not separated independently. |
| U05 | R2B: Body-local levels | Only local levels appearing in the body can be solved or constrained minimum models can be taken. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U06 | R3: Reference coherence and no raising | Reuse shared levels or reinstantiate them under checks; every reference instance must satisfy source bounds and coherence requirements. | 867 / 867（Result report fields） | final report universe_checks is nonempty/nonzero. |
| U07 | R3′/R3″: Residual instances | Unsolved levels are not wildcards; generalization and defaulting to zero have applicability conditions and subsequent checks. | 1 / 1（Result report fields） | final report universe_residuals is nonempty/nonzero. |
| U08 | R4: Level checks for internal Lean Eq | The parameter hierarchy of the native Lean Eq in the auxiliary conversion proof is determined by the argument type and rechecked; this is not a direct mapping of the source eq→Lean Eq. Source eq now uses normal template inductive block rules. | 6 / 6（Artifact structure） | The final AST directly contains the native Lean Eq (including internal auxiliary proof); it is not the number of native mappings of the source eq. |
| U09 | R5/R5S: Template levels | Instantiate template levels from native template bindings and argument types; solve extra nontemplate levels using constructor and other constraints. | 27 / 27（Result report fields） | final report template is nonempty/nonzero. The statistics template block itself, downstream instantiation is a separate reference. |
| U10 | R6: Explicitly polymorphic constants | Preserve explicit source universe parameters and the original instance at every reference; constraints cannot be silently discarded. | 194 / 194（Artifact structure） | The corresponding declaration has explicit polymorphic universe parameters. |
| U11 | Polymorphic inductive blocks | Explicit universe parameters and instances are also retained; the R6-I tag in the source code/document is reused and must be read in conjunction with the mechanism. | 6 / 6（Artifact structure） | The corresponding declaration has explicit polymorphic universe parameters. |
| U12 | R2⁺: Fact reduction | Delete the dominated items in max using natively provable size relationships. | 1 / 1（Result report fields） | final report sort_fact_reduced is nonempty/nonzero. |
| U13 | R2F/R2F-c: Constraint interpretation | Interpret each level as max(u_l, interpreted lower bound + offset), so supported constraints hold for the interpreted parameters. | 1 / 1（Result report fields） | final report level_interp is nonempty/nonzero. |
| U14 | R3-P: Joint local/global entailment | Reference checking uses both local polymorphic constraints and the native global graph. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U15 | R3G: Implicit level discovery | Discover required public parameters from free level classes in actual references; retain reference evidence and remove unused discoveries. | 227 / 227（Result report fields） | final report implicit_levels is nonempty/nonzero. |
| U16 | R3G-F: Result-sort levels | Use restricted reads on fields/results that match the source condition - sort implicit level; carrier cannot be altered thereby. | 0 / 0（Result report fields） | final report result_sort_implicit_levels is nonempty/nonzero. |
| U17 | R8: Generalization to Sort | At restricted arity/motive positions, replace Type levels with Sort parameters that can include Prop; handle the corresponding +1 offset across references. | 598 / 598（Result report fields） | final report admitting_levels is nonempty/nonzero. |
| U18 | R-CARRIER P1 | Within R2F, prevent carrier from being raised by certain other levels in the same block. This uses identified level pairs; it does not remove all lower bounds. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U19 | R-CARRIER P2 | Create separate copies of genuinely independent implicit operand level classes in the type; do not split classes that type unification requires to coincide. | 66 / 66（Result report fields） | final report level_copies is nonempty/nonzero. |
| U20 | R-CARRIER P3 | Show that local hierarchies cannot serve as representatives of public operand universe classes. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U21 | R-SPLIT | Only the parameter copies are split at the shared source level that meets the occurrence position conditions; the result is max, and the diagonal instances and reference boundaries are retained; it can be rolled back without splitting. | 0 / 0（Result report fields） | final report level_split is nonempty/nonzero. |
| U22 | Rule R: Semantic coherence | Compares hierarchical interpretations across all models of the source fact, rather than just expression strings; each component still passes R3. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U23 | Rule H: Prerequisite instances | The proposition to be proved can be used in lower-required instances to avoid early locking of the public carrier; it is still checked and not raised. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U24 | Per-occurrence levels / unify | First allocate new metavariable where the reference occurs, rebind the shared free level after solving and check the consistency. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U25 | sort_interp | The inductive block parameters remain a normal read and only the result sort is interpreted using constraints. | 5 / 5（Result report fields） | final report sort_interp is nonempty/nonzero. |
| U26 | Solver P2 / joint | Limited attempts to jointly occur max level variables; subsequent retries defined are selected by conditions such as fewer unnecessary defaults. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U27 | Solver P3 / hypExact | The exact condition instance will be retained for each use; after the universe is solved, only conditions with the same leaf and the same type will be merged. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U28 | R3↑／R3↓ | Use cumulative elevation or lower reference instances in fragments subject to native fact checking; not unlimited leveling. | 22 / 22（Policy flag） | lowered or cumulativity flag; the strategy flag cannot be broken down into the actual number of lifts. |
| U29 | R2B-P | Restricted Prop-related local interpretations require source CheckInstance. The current statement path rejects this specialization, preventing theorem narrowing. | 1 / 1（Result report fields） | final report r2bp_levels is nonempty/nonzero. |
| U30 | R2B-S | Lower only eligible result sorts, never binder levels; protected-interface and statement checks constrain this rule. | 1 / 1（Result report fields） | final report sort_lowered_levels is nonempty/nonzero. |
| U31 | R2B-V | Inherit the actual result sort from a Type-valued body only at the result position; do not change public binders or generalize arbitrarily from Prop. | 1 / 1（Result report fields） | final report result_sort_inherited is nonempty/nonzero. |
| U32 | Local polymorphic constraint interpretation / polyUniverseInterpretation | Build max interpretations for supported offset-constraint closures, preserving original explicit parameters and source-allowed instances; reject unsupported cases such as positive cycles. | 26 / 33（Result report fields） | final report poly_level_interp is nonempty/nonzero. |
| U33 | Fragment with global upper bounds | Only processed outbound local/Set→global constraints are checked; native conditions are checked individually and no global bounds are claimed for any target parameters. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U34 | Exact R6 fallback and equal-level merging | Preserve exact instances when local interpretation is not available; natively equal global hierarchies can be merged before Type transport. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| U35 | Minimal defaults and bounded max solving | Only in limited interpretation/Type conversion paths are closed body local levels advanced by default; candidates are subject to unified, native fact, R3 and kernel checks. | 1 / 1（Partial submechanisms） | Only the reported Default/residual submechanism is confirmed; the max solution is not listed separately. |
| U36 | Q-a：phantom sort | Only handles recognized phantom shapes, rewriting corresponding sort arguments to paired value/type representations and cleaning up missing proprietary hierarchies; generally Q-b is not implemented. | 0 / 0（Result report fields） | final report phantom_lowered is nonempty/nonzero. |

**C: The source end can be converted and expanded**

Source code location (relatively frozen translator): Rocq2Lean/Emit.lean; Rocq2Lean/Translate.lean; rocq/exporter/src/r2l_export.ml.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| C01 | Alias prefixes | Handles ζ conversions in qualified let/lambda prefixes. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C02 | Transparent reference aliases | Expand qualifying constant header references, partial applications, and transparent aliases without lambda. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C03 | Pure bound-variable combinators | After the lambda prefix, only transparent combinators consisting of bind variables and applications can be expanded; they cannot be expanded to any items. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C04 | Type abbreviation closure | Transparent polymorphism/type aliasing and the availability of computed types make joint closures, and only known convertible items participate. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C05 | Exact instance substitution | When expanding, accurately substitute the source universe instances at sort, case, fix, primitives, etc., and keep the binding. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| C06 | Known-constructor-driven computation | Bounded βδιζ computation for a single fixpoint with a known decreasing constructor; opaque/deferred-guard bodies are not unfolded arbitrarily. | 8 / 8（Result report fields） | final report source_computed is nonempty/nonzero. |
| C07 | Set-motive unfolding | Unwrap eligible transparent constants to recover motive available for Prop; record conversion is applied on a per-app basis, bare references do not have to be unwound. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |

**L: Explicit representation of conversion**

Source code location (relatively frozen translator): Rocq2Lean/Translate.lean: liftCoerce, liftCoerceValue, transportBranchResult, transportTypePosition, tryLiftConversion.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| L01 | Rule P: Proposition payload lifting | Use Prop-capable PULift to wrap proposition/proof payloads at the declared Type representation. | 1 / 1（Result report fields） | prop_lift is not null; depth 0 is also a hit. |
| L02 | Prop up／down | Use construction/projection as required on arguments, results, and cast positions; maintain declared upper bounds on let and cast. | 2 / 2（Result report fields） | final report prop_lift_coercions is nonempty/nonzero. |
| L03 | Type up／down | Reach the public upper bound with PULift for the lower supported Type payloads, preserving the required public parameters. | 46 / 53（Result report fields） | type_lift is not null or type_lift_coercions>0. |
| L04 | Function η-conversion | Recursively convert parameters and results; input reverse adaptation and output forward adaptation without changing the order of source parameters. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L05 | Unpacking in type positions | When a wrapped value is used as a type, the actual type is restored first. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L06 | Wrapper function application | After unlocking the outer layer PULift for a limited number of times, perform the application on the adapted actual parameters. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L07 | Fieldwise conversion within the same record | Only the same non-recursive, single constructor, no index record; use real recursor to preserve field order and dependent types. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L08 | Composed conversions | The outer layer PULift can be combined with the inner function/record conversion; the direct Type up/down in main75 is the basic case of this recursive mechanism. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L09 | Deferring unresolved template conversions | When the template Sort may also be Prop, first unify it normally, and then decide whether to apply Type lift. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| L10 | Statement view of lifted propositions | A qualified and unprotected lifted Prop header restores the proposition view along the transparent chain; the interface is still checked to correspond to up. | 0 / 0（Result report fields） | final report prop_lift_unfold is nonempty/nonzero. |

**Q: Sort quality Polymorphic**

Source code location (relatively frozen translator): Rocq2Lean/Quality.lean; Rocq2Lean/QualitySource.lean; Rocq2Lean/Emit.lean; rocq/exporter/src/r2l_export.ml.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| Q01 | Native quality bindings | Retain the shared quality variable and its native binding relationships in parameters and results. | 50 / 50（Source metadata） | Native template_info or quality_family override. |
| Q02 | Template Sort parameters | Allow fixed Prop/Type templates to generate Sort parameters while retaining the minimum level required by fixed Type; fall back to the old Type path on failure. | 22 / 22（Result report fields） | final report template_sort is nonempty/nonzero. |
| Q03 | Shared-quality template families | Generate Prop and Type representations for restricted single, nonrecursive, uniform, unindexed template families; accept only after every representation checks. | 5 / 5（Result report fields） | final report quality_prop is nonempty/nonzero. |
| Q04 | Dispatch by source annotation | Use the source argument annotation, local let, declaration result and source case context selection branch to not only guess the sort of the target item. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| Q05 | Native finite quality families | Cover all 3^q combinations of SProp/Prop/Type for supported unconstrained quality variables; this run has 23 roots and 603 branch instances. | 23 / 23（Source metadata） | Native quality_family root; all branches of the same root are fully checked. |
| Q06 | Native rechecking and implementation preservation | The original type and body of each quality branch instantiation are double-checked; this type of family with proven provenance also retains the implementation of the Prop branch, which is a special exception to the ordinary statement policy. | 23 / 23（Source metadata） | Native quality_family root; all branches of the same root are fully checked. |
| Q07 | Closed quality references | Contains naked references and partial applications, using precise instance dispatch; unresolved quality cannot default to full Type. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |

**N: Primitive representation and adaptation**

Source code location (relatively frozen translator): Rocq2Lean/Translate.lean; Rocq2Lean/PrimInt63.lean; Rocq2Lean/PrimArray.lean; Rocq2Lean/PrimString.lean; Rocq2Lean/PrimFloat.lean.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| N01 | Int63 | The type uses BitVec 63; retains unsigned/signed and modulo 2^63 semantics, and literal check range. | 31 / 31（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N02 | Array | Bounded persistent array, preserving element type, order, default, and native size upper bound. | 7 / 7（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N03 | String | Bounded byte string, retaining NUL and non-UTF bytes; not directly changed to Unicode String. | 7 / 7（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N04 | Float | Binary 64 bit model, preserving rounding, signed zero, infinity, and NaN representation policies; cannot be overridden by the unchecked host Float. | 20 / 20（Source metadata） | Native type/operation root of this family; downstream wrapper calls do not constitute remapping. |
| N05 | Structural result adaptation | Boolean, comparison, carry, pair, float classification Rebuilt by the constructor role registered by the source kernel. | 22 / 22（Source metadata） | The primitive operation root that needs to be adapted by the source constructor. |
| N06 | Literals, identity, and primitive axioms | Check the native operation identity, literal load and template instance; the source axiom of primitive nature is still processed as a proposition statement, and the Lean axiom is not added. | 65 / 65（Partial submechanisms） | Only the primitive identity sub-mechanism is confirmed; the literal and axiom sub-mechanisms are not listed separately. |

**V: Acceptance conditions and independent verification (not rewriting rules to generate translations)**

Source code location (relatively frozen translator): Rocq2Lean/Verify.lean; Rocq2Lean/Kernel.lean; Rocq2Lean/Emit.lean; tools/audit.py.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| V01 | Source kernel checking | Review source flags, guard, positivity, Universe, Elimination and relevance, checking the source instances by the transformation used. | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| V02 | Bootstrap signature checking | The existing target must match the source identity, type, and constructor adaptation. | 0 / 0（Not enabled in this run） | The current bootstrap table is empty, and there is no bootstrap signature adaptation object this time. |
| V03 | Lean kernel checking | Register actual target statement; must not leave metavariable unsolved; statement must be legal under public universe parameters. | 2180 / 2180（Processing scope） | Generate declared kernel check coverage; bootstrap reuses an existing target. |
| V04 | P0 and statement generality | Protect specified interfaces; freeLevelPin, binder, independence, etc. prevent success by locking exposed parameters. | 2056 / 2056（Processing scope） | protected or statement inspection range. |
| V05 | Universe fact and reference checking | Native constraints, R3 reference bounds, and consistency are independent acceptance conditions. | 867 / 867（Result report fields） | final report universe_checks is nonempty/nonzero. |
| V06 | Dependency and prerequisite completeness | If the dependency is missing, it will block; the target type, namespace, and pending status must be consistent with the actual premise. | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| V07 | Independent consumer | Re-import actual target, check kind, body, opacity, constructor, dependencies, universe and axiomatic closures. | 2180 / 2180（Module validation results） | Belonging module consumer=OK root coverage. |
| V08 | Independent structural audit | The reconstructed source expansion corresponds to the recursor/η/lift/ field; it is not enough that the kernel type is correct. | 2180 / 2180（Module validation results） | Belonging module audit=OK root coverage. |
| V09 | Coverage and resource failures | quality Branch and root declarations must be complete; timeouts, budget exhaustion, and exceptions do not count towards success. | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |

**S: Attempt scheduling and state management (not counting semantic rules)**

Source code location (relatively frozen translator): Rocq2Lean/Emit.lean.

| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |
|---|---|---|---|---|
| S01 | Fixed declaration dispatch | Select the processing path according to attributes such as inductive/constant, template, statement, Type-valued, split, and protected. | 2180 / 2180（Processing scope） | This processing/verification covers all original roots; not internal execution times. |
| S02 | Gated tier ladder | Try different switch combinations in a fixed order; previous errors and applicable conditions limit subsequent attempts and do not exhaust all combinations. | 2175 / 2175（Attempt records） | Has root coverage of tier_times. |
| S03 | Early conversion and generality retries | Some Type transport try early; there may still be fewer default candidates after the first pass of the definition, so it is not always the first pass that ends. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |
| S04 | Inductive-specific tier ladder | Ordinary parameters, fact explanation, implicit level, sort_interp, source expansion, etc. have controlled attempts respectively. | 105 / 105（Attempt records） | Root coverage with inductive block tier_times. |
| S05 | Failure rollback and budgets | Restore Meta state and transition count on failure; hierarchical and statement-level resource limits. One local budget exhaustion should not be generalized as a necessary end to the entire ladder. | Not separately recorded | Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence. |

**Full mapping of primitive operations**

The following table is directly extracted from the operation dispatch table of the frozen source code, with a total of 61 items: Int63 30 items, Array 6 items, String 6 items, Float 19 items. Source constructor adaptation of structure results is still the responsibility of N05.

| source operation | Lean Target | Number of native mapping roots | The target directly refers to the root number |
|---|---|---:|---:|
| `add` | `BitVec.add` | 1 | 1 |
| `sub` | `BitVec.sub` | 1 | 1 |
| `mul` | `BitVec.mul` | 1 | 1 |
| `div` | `PrimInt63.udiv` | 1 | 1 |
| `rem` | `PrimInt63.umod` | 1 | 1 |
| `l_and` | `PrimInt63.land` | 1 | 7 |
| `l_or` | `PrimInt63.lor` | 1 | 5 |
| `l_xor` | `PrimInt63.lxor` | 1 | 3 |
| `divs` | `PrimInt63.sdiv` | 1 | 1 |
| `rems` | `PrimInt63.smod` | 1 | 1 |
| `l_sl` | `PrimInt63.lsl` | 1 | 7 |
| `l_sr` | `PrimInt63.lsr` | 1 | 5 |
| `a_sr` | `PrimInt63.asr` | 1 | 2 |
| `head0` | `PrimInt63.head0` | 1 | 2 |
| `tail0` | `PrimInt63.tail0` | 1 | 2 |
| `addMulDiv` | `PrimInt63.addmuldiv` | 1 | 2 |
| `eq` | `PrimInt63.eqb` | 1 | 6 |
| `lt` | `PrimInt63.ltb` | 1 | 12 |
| `le` | `PrimInt63.leb` | 1 | 7 |
| `lts` | `PrimInt63.ltsb` | 1 | 2 |
| `les` | `PrimInt63.lesb` | 1 | 2 |
| `arraymake` | `PrimArray.make` | 1 | 3 |
| `arrayget` | `PrimArray.get` | 1 | 7 |
| `arrayset` | `PrimArray.set` | 1 | 5 |
| `arraylength` | `PrimArray.length` | 1 | 8 |
| `arraydefault` | `PrimArray.default` | 1 | 4 |
| `arraycopy` | `PrimArray.copy` | 1 | 3 |
| `string_make` | `PrimString.make` | 1 | 4 |
| `string_length` | `PrimString.length` | 1 | 4 |
| `string_get` | `PrimString.get` | 1 | 4 |
| `string_sub` | `PrimString.sub` | 1 | 2 |
| `string_cat` | `PrimString.cat` | 1 | 3 |
| `string_compare` | `PrimString.compare` | 1 | 3 |
| `compare` | `PrimInt63.compare` | 1 | 3 |
| `compares` | `PrimInt63.compares` | 1 | 2 |
| `addc` | `PrimInt63.addc` | 1 | 2 |
| `addCarryC` | `PrimInt63.addcarryc` | 1 | 2 |
| `subc` | `PrimInt63.subc` | 1 | 2 |
| `subCarryC` | `PrimInt63.subcarryc` | 1 | 2 |
| `mulc` | `PrimInt63.mulc` | 1 | 2 |
| `diveucl` | `PrimInt63.diveucl` | 1 | 2 |
| `div21` | `PrimInt63.div21` | 1 | 1 |
| `fabs` | `PrimFloat.abs` | 1 | 3 |
| `fopp` | `PrimFloat.opp` | 1 | 3 |
| `fadd` | `PrimFloat.add` | 1 | 2 |
| `fsub` | `PrimFloat.sub` | 1 | 2 |
| `fmul` | `PrimFloat.mul` | 1 | 2 |
| `fdiv` | `PrimFloat.div` | 1 | 3 |
| `fsqrt` | `PrimFloat.sqrt` | 1 | 2 |
| `float_of_int` | `PrimFloat.ofUint63` | 1 | 1 |
| `normfr_mantissa` | `PrimFloat.normfrMantissa` | 1 | 1 |
| `ldshiftexp` | `PrimFloat.ldshiftexp` | 1 | 3 |
| `next_up` | `PrimFloat.nextUp` | 1 | 1 |
| `next_down` | `PrimFloat.nextDown` | 1 | 1 |
| `feq` | `PrimFloat.eqb` | 1 | 5 |
| `fequal` | `PrimFloat.equal` | 1 | 1 |
| `flt` | `PrimFloat.ltb` | 1 | 3 |
| `fle` | `PrimFloat.leb` | 1 | 2 |
| `fcompare` | `PrimFloat.compare` | 1 | 2 |
| `fclassify` | `PrimFloat.classify` | 1 | 2 |
| `frshiftexp` | `PrimFloat.frshiftexp` | 1 | 3 |

**Name Ambiguity, Unimplemented Scope and History Items**

- R-CARRIER P1/P2/P3 is a carrier independent mechanism; solvers P2 (joint) and P3 (hypExact) are not of the same rule. Rule P refers to PULift related representation conversion, P0 is protection check.
- The current annotation for polyUniverseInterpretation uses R6-I; older documentation also used this tag to discuss polymorphic inductive blocks. They should be distinguished by source code mechanism and not merged by tag strings.
- main75 No independently named R-OCC or eqLower switches were found; the occurrence-by-occurrence reference processing corresponds to existing mechanisms such as unify. The previous verbal overview of the ladder cannot be taken as a current accurate switching table.
- Generally, Q-b phantom lowering, recursion cofix, and arbitrary mutual induction/nested mutual recursion are not within the current general support scope; no support is claimed because Corelib is zero blocked this time.
- The old ssr_have_upolyrest/step name special rules have been replaced by the quality family mechanism and are not listed as current rules.
- main74→main75 merges the duplicate paths in direct Type up/down and combined transformations, and unifies failure rollback; instead of deleting source checks, hiding conditions, or moving failed items out of statistics.
- RULES.md in this directory is the mechanism summary and condensed evidence; this document is the detailed review checklist. See JSON/MD of each Corelib module for statement-by-statement actual usage and attempts, and see rule-usage.json for summary hit records.

**Translated correspondence certificate**

nat, eq are no longer mapped as bootstrap. The results of its two-way correspondence, dependency elimination, operation retention and old certificate migration are shown in [CORRESPONDENCE.md](CORRESPONDENCE.md). These certifications are not new AST translation rules and do not count toward the 118 review numbers listed above. Ordinary induction rules have covered the new nat/eq, and there is no need to add translation rules.
