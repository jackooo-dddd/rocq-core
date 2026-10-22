# Rules with confirmed usage in the current Corelib translation

The current inventory contains **44 translation/universe processing entries with evidence of use = 34 original entries + 10 measured M entries**. Also listed are **4 primitive type mappings and 61 primitive operation mappings**; mapping instances and mechanism entries have different granularities and are counted separately.

Scope: **67 modules, 2180 distinct root declarations** in the current Corelib scope. The original entries use export artifacts, accepted translations, and reports from the mechanical nat/eq baseline mechanical-nat-eq-20261019/full-v1. M entries use accepted-path traces and a same-scope rerun in used-rule-coverage-20261019. Target declarations in the rerun match the original baseline. This file does not summarize hits from historical runs, nor does it contain subsequent correspondence proof rules.

Sources nat, eq each generate independent mechanical inductive types, counting towards T07; the old T06 bootstrap that directly replaces these two roots with Lean Nat, Eq is not enabled.

**How to read quantities and evidence**

Only entries confirmed by current artifacts or final retained paths are included. An implementation, an enabled switch, or source syntax is insufficient on its own. A branch reached only by a failed attempt is also insufficient.

| Count column | Unit and meaning |
|---|---|
| Primary roots | The main translation of each root is checked; roots that meet the evidence conditions of the row are deduplicated by source name. |
| Roots including quality branches | Check both the main translation and the quality branch of that root; a hit in either representation counts that root once. |
| M direct roots | Distinct requested roots with retained events attributed to the root itself; dependency-only hits are not attributed to that root. |
| M total declarations | All source declarations in retained events, including roots, dependencies, and auxiliaries; repeated names across modules count once. |
| Mapping roots | Distinct source roots using the primitive mapping, verified against the target AST of each root itself. |

None of these columns measures invocations or success rates. A declaration may use several rules, so rows cannot be added together. M total declarations and roots including quality branches count different populations and are not interchangeable. The M JSON also records retained events with repeated dependencies; this file does not treat that count as distinct declarations or total attempts.

| Evidence category | What exactly was checked? |
|---|---|
| Artifact structure | Find corresponding structures such as variables, binding structures, references, or Sort in the target AST that finally passes the check. |
| Export artifacts | Named obligations actually occur in the exported IR and the corresponding root translation passes checking; source proof syntax alone is insufficient. |
| Result report fields | The accepted result records fields and values such as unfolded names, solved levels, or lift information. Each row states its criterion. |
| Branch cross-check | The number of source quality family members is consistent with all translation branches that have passed the check. |
| Accepted-path trace | The M transformation takes effect and its record remains in the accepted environment. Rolled-back attempts and attempts returning failure are excluded. |
| Primitive target reference | The final AST of the mapping root itself actually references the specified target representation or operation. |

**Translation, export, and universe processing: 34**

Original identifiers are retained for traceability. Gaps identify catalog entries excluded from this confirmed inventory. Entries such as U06 check acceptance conditions; therefore these are processing entries, not all semantic rewrites.

| Original ID | Rule / mechanism | Behavior | Primary roots | Roots including quality branches | Evidence category and criterion | Example root |
|---|---|---|---:|---:|---|---|
| C-aggregate | Transparent δβ unfolding | Unfold transparent definitions according to source convertibility; usage is not attributed to individual alias submechanisms. | 156 | 156 | Result report fields：The final delta_inlined field lists the names actually unfolded. | Corelib.Classes.CMorphisms.Normalizes |
| C06 | Known-constructor-driven computation | Bounded βδιζ computation for a single fixpoint with a known decreasing constructor; opaque/deferred-guard bodies are not unfolded arbitrarily. | 8 | 8 | Result report fields：Final source_computed is nonempty/nonzero. | Corelib.Classes.Morphisms.PartialOrder_proper |
| E03 | statement mode for ordinary theorems/axioms | Translate the proposition as a Prop-valued definition; do not turn source axioms into Lean axioms or transfer ordinary theorem proofs by default. | 1029 | 1029 | Result report fields：Final target_kind=statement | Corelib.Array.ArrayAxioms.array_ext |
| E04 | Embedded proof extraction | Extract proof fragments as named obligations. This confirms extraction, not proofs of those obligations. | 244 | 244 | Export artifacts：Exporting IR has generated the named obligations, and the corresponding root translation check has passed. | Corelib.Classes.CMorphisms.PartialOrder_StrictOrder |
| E08 | Transparent computational definitions | The type and body of the source definition are translated and registered as Lean def. | 934 | 934 | Result report fields：Final target_kind=def | Corelib.Array.PrimArray.array |
| E09 | Opaque data definitions | The prepared body of opaque_data is still checked and registered as Lean opaque, maintaining opacity. | 107 | 107 | Result report fields：Final target_kind=opaque | Corelib.Classes.CMorphisms.PER_type_morphism_obligation_1 |
| E12 | Explicit prerequisite parameters | Retain proof parameters awaiting assembly; this count does not measure prerequisite merging or elimination. | 331 | 331 | Result report fields：Finally pending_hypotheses is not empty. | Corelib.Classes.CMorphisms.PartialOrder_StrictOrder |
| L01 | Rule P: Proposition payload lifting | Use Prop-capable PULift to wrap proposition/proof payloads at the declared Type representation. | 1 | 1 | Result report fields：Finally prop_lift gives the boost depth (depth 0 is also valid). | Corelib.Classes.CRelationClasses.complement |
| L02 | Prop up／down | Use construction/projection as required on arguments, results, and cast positions; maintain declared upper bounds on let and cast. | 2 | 2 | Result report fields：Final prop_lift_coercions is nonempty/nonzero. | Corelib.Classes.CRelationClasses.Asymmetric |
| L03 | Type up／down | Reach the public upper bound with PULift for the lower supported Type payloads, preserving the required public parameters. | 46 | 53 | Result report fields：Eventually type_lift gives the depth, or type_lift_coercions > 0; internal conversion paths are not split. | Corelib.Classes.CMorphisms.Normalizes |
| Q02 | Template Sort parameters | Allow fixed Prop/Type templates to generate Sort parameters while retaining the minimum level required by fixed Type; fall back to the old Type path on failure. | 22 | 22 | Result report fields：Final template_sort is nonempty/nonzero. | Corelib.Classes.Morphisms.Params |
| Q03 | Shared-quality template families | Generate Prop and Type representations for restricted single, nonrecursive, uniform, unindexed template families; accept only after every representation checks. | 5 | 5 | Result report fields：Final quality_prop is nonempty/nonzero.The final product contains the quality_prop branch. | Corelib.Init.Datatypes.prod |
| Q05 | Native finite quality families | Cover all 3^q combinations of SProp/Prop/Type for supported unconstrained quality variables; this run has 23 roots and 603 branch instances. | 23 | 23 | Branch cross-check：In addition to the source quality_family metadata, the number and success status of all branches have been checked; the same root is only counted once. | Corelib.Init.Equality.Has_J |
| T01 | Variables and bindings | rel is mapped to the corresponding bind variable, keeping the scope corresponding to de Bruijn. | 1982 | 1982 | Artifact structure：Eventually AST exists bvar. | Corelib.Array.ArrayAxioms.array_ext |
| T02 | Π, λ, let, and application | Generate forall, lambda, let and application respectively; retain type annotations and perform type checking. | 2155 | 2155 | Artifact structure：Finally, AST exists forall / lam / let / app; here it is used as a structural class and does not split times. | Corelib.Array.ArrayAxioms.array_ext |
| T03 | References to constants, inductive types, and constructors | Reference the registered target and attach the corresponding universe instance; do not guess the correspondence based on the similarity of the names. | 2090 | 2097 | Artifact structure：Finally AST has a constant reference, including auxiliary declarations. | Corelib.Array.ArrayAxioms.array_ext |
| T07 | Ordinary single inductive blocks | Preserve parameters, indices, and constructor order; check the inductive declaration in the Lean kernel. | 110 | 110 | Result report fields：Final target_kind=inductive | Corelib.Init.Datatypes.nat；Corelib.Init.Logic.eq |
| T10 | T: non-recursive coinductive types | Qualified non-recursive monomer coinductive is converted into ordinary inductive; recursive cofix is not supported for this reason. | 4 | 4 | Result report fields：Final coinductive_as_inductive is nonempty/nonzero. | Corelib.Classes.CMorphisms.apply_subrelation |
| U02 | R1: Basic sort mapping | Map Prop to Sort 0 and general Type(l+n) to Sort(I(l)+n+1), interpreting max components individually; R8 provides a specific exception. | 1782 | 1782 | Artifact structure：Eventually AST exists in Sort; only the sort representation is confirmed, and this number is not assigned to each sort sub-rule. | Corelib.Array.ArrayAxioms.array_ext |
| U03 | R2/R2T: Universe parameterization | Parameterize the relevant global levels in constant interfaces and inductive arities/constructors. | 1031 | 1031 | Result report fields：The final public parameters appear at the u_ level. | Corelib.BinNums.PosDef.Pos.iter |
| U04 | R2S: Public level solving | Represent own levels as metavariables, solve them by type unification, then check native constraints; generalize free public levels. | 129 | 129 | Result report fields：Final solved_levels is nonempty/nonzero.Record specific hierarchical solutions; public and body local solutions will not be subdivided. | Corelib.Classes.Equivalence.equiv |
| U06 | R3: Reference coherence and no raising | Reuse shared levels or reinstantiate them under checks; every reference instance must satisfy source bounds and coherence requirements. | 867 | 867 | Result report fields：Final universe_checks is nonempty/nonzero.Records the reference universe check that was performed; this is an acceptance condition, not an override. | Corelib.BinNums.IntDef.Z.pow_pos |
| U07 | R3′/R3″: Residual instances | Unsolved levels are not wildcards; generalization and defaulting to zero have applicability conditions and subsequent checks. | 1 | 1 | Result report fields：Final universe_residuals is nonempty/nonzero.Only the residual instance processing is confirmed, and the two historical naming sub-rules are not counted separately. | Corelib.ssr.ssrbool.all_sig_cond_dep |
| U09 | R5/R5S: Template levels | Instantiate template levels from native template bindings and argument types; solve extra nontemplate levels using constructor and other constraints. | 27 | 27 | Result report fields：Final template is nonempty/nonzero.Only the template block itself is counted, not each downstream instantiation. | Corelib.Classes.Morphisms.Params |
| U10 | R6: Explicitly polymorphic constants | Preserve explicit source universe parameters and the original instance at every reference; constraints cannot be silently discarded. | 194 | 194 | Result report fields：The final statement has explicit polymorphic universe parameters. | Corelib.Array.ArrayAxioms.array_ext |
| U11 | Polymorphic inductive blocks | Explicit universe parameters and instances are also retained; the R6-I tag in the source code/document is reused and must be read in conjunction with the mechanism. | 6 | 6 | Result report fields：The final statement has explicit polymorphic universe parameters. | Corelib.Classes.CMorphisms.Params |
| U13 | R2F/R2F-c: Constraint interpretation | Interpret each level as max(u_l, interpreted lower bound + offset), so supported constraints hold for the interpreted parameters. | 1 | 1 | Result report fields：Final level_interp is nonempty/nonzero. | Corelib.Classes.RelationClasses.unary_predicate |
| U15 | R3G: Implicit level discovery | Discover required public parameters from free level classes in actual references; retain reference evidence and remove unused discoveries. | 227 | 227 | Result report fields：Final implicit_levels is nonempty/nonzero. | Corelib.Classes.Equivalence.equiv |
| U17 | R8: Generalization to Sort | At restricted arity/motive positions, replace Type levels with Sort parameters that can include Prop; handle the corresponding +1 offset across references. | 598 | 598 | Result report fields：Final admitting_levels is nonempty/nonzero. | Corelib.BinNums.PosDef.Pos.iter |
| U19 | R-CARRIER P2 | Create separate copies of genuinely independent implicit operand level classes in the type; do not split classes that type unification requires to coincide. | 66 | 66 | Result report fields：Final level_copies is nonempty/nonzero. | Corelib.ssr.ssrbool.canLR_in |
| U29 | R2B-P | Restricted Prop-related local interpretations require source CheckInstance. The current statement path rejects this specialization, preventing theorem narrowing. | 1 | 1 | Result report fields：Final r2bp_levels is nonempty/nonzero. | Corelib.ssr.ssreflect_rw.nary_congruence_statement |
| U30 | R2B-S | Lower only eligible result sorts, never binder levels; protected-interface and statement checks constrain this rule. | 1 | 1 | Result report fields：Final sort_lowered_levels is nonempty/nonzero. | Corelib.Init.Datatypes.CompSpecT |
| U31 | R2B-V | Inherit the actual result sort from a Type-valued body only at the result position; do not change public binders or generalize arbitrarily from Prop. | 1 | 1 | Result report fields：Final result_sort_inherited is nonempty/nonzero.Record the final adoption result sort inheritance. | Corelib.Init.Datatypes.CompSpecT |
| U32 | Local polymorphic constraint interpretation / polyUniverseInterpretation | Build max interpretations for supported offset-constraint closures, preserving original explicit parameters and source-allowed instances; reject unsupported cases such as positive cycles. | 26 | 33 | Result report fields：Final poly_level_interp is nonempty/nonzero. | Corelib.Classes.CMorphisms.Normalizes |

**Matching and recursive transformation: 10 M rules**

Each entry below has an independent accepted-path trace. Events roll back with environment saveState/restore; A retry returning failure normally also clears its events. Merely entering a lowering function or generating a discarded candidate does not count.

| ID | Rule | Behavior | Direct roots | All declarations (including dependencies/auxiliaries) | Example root |
|---|---|---|---:|---:|---|
| M01 | M3b: dependent match | Use real Lean recursor; construct motive from source predicate and lay out branches by kernel fields and IH. | 439 | 492 | Corelib.Array.ArrayAxioms.length_make |
| M02 | Non-uniform match | Restricted non-uniform parameter fragments use convoy/Eq.rec; match with a known constructor is reduced to ι first. | 8 | 9 | Corelib.Init.Wf.Fix_F |
| M03 | Single-function structural recursion | The decrementing parameter is rewritten as recursor; the actual parameter after the decrementing parameter can be changed. | 89 | 90 | Corelib.BinNums.IntDef.Z.pos_div_eucl |
| M04 | Generalization of changing leading parameters | Move the changed preparameter into motive while retaining the type of the parameter and not relying on its change. | 11 | 11 | Corelib.BinNums.IntDef.Z.pos_sub |
| M05 | Indices and function-valued recursive fields | Generalization index; a functional recursive field produces an inductive hypothesis with corresponding parameters. | 5 | 5 | Corelib.Init.Wf.Acc_rec |
| M06 | ι-generalized recursion | When the outer layer match is not on the decreasing parameter, the entire function body is substituted into the decreasing constructor and then reduced; match is not rearranged arbitrarily. | 10 | 10 | Corelib.BinNums.IntDef.Z.pos_sub |
| M07 | Structural mutual recursion | For functions of the same inductive type, the same decrement position and compatible prefix types, construct the union PProd and reproject the recursive result. | 8 | 8 | Corelib.BinNums.PosDef.Pos.add |
| M09 | Course-of-values | Cache with below/PProd after specific non-direct recursive field call fails; subject to index, non-uniform and nested shape limitations. | 3 | 3 | Corelib.BinNums.PosDef.Pos.sqrtrem |
| M11 | Explicit well-founded fallback | Acc.rec is available in statement mode and lists the unsolved well-foundedness/expanded equation proofs as an explicit task. | 1 | 1 | Corelib.Init.Nat.gcd |
| M12 | Constructor-shaped indices | Support qualified non-recursive single constructor record index, restore different early arguments with field projection; reject duplicate leaves, etc. Shapes are not supported. | 1 | 1 | Corelib.Init.Wf.Fix_F_2 |

For the complete name lists, see [per-rule M statistics](../experiments/used-rule-coverage-20261019/M_RULE_USAGE.json)。The M11 fallback may introduce proof obligations; a hit does not mean that well-foundedness has been proved.

**Primitive type mapping: 4 item**

The evidence category is Primitive target reference: the final AST of each mapped root has been inspected. Listed here are the representation options for the Rocq primitive; mechanical nat and eq do not belong to these four primitive mappings.

| source type root | target representation | Number of mapping roots |
|---|---|---:|
| Corelib.Array.PrimArray.array | Rocq2Lean.PrimArray.Rep | 1 |
| Corelib.Floats.PrimFloat.float | Rocq2Lean.PrimFloat.Rep | 1 |
| Corelib.Numbers.Cyclic.Int63.PrimInt63.int | BitVec | 1 |
| Corelib.Strings.PrimString.string | Rocq2Lean.PrimString.Rep | 1 |

**Primitive operation mapping: 61 item**

The evidence category is also Primitive target reference: each source root itself refers to the specified Lean target. Each operation is listed separately; primitive-family totals are not counted again. The target may be a Rocq2Lean adapter. This evidence is not a correspondence proof with an existing Lean/Mathlib operation.

| Source operation identifier | Lean Target | Number of mapping roots | source statement |
|---|---|---:|---|
| add | BitVec.add | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.add |
| sub | BitVec.sub | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.sub |
| mul | BitVec.mul | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mul |
| div | PrimInt63.udiv | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.div |
| rem | PrimInt63.umod | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mod |
| l_and | PrimInt63.land | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.land |
| l_or | PrimInt63.lor | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lor |
| l_xor | PrimInt63.lxor | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor |
| divs | PrimInt63.sdiv | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.divs |
| rems | PrimInt63.smod | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mods |
| l_sl | PrimInt63.lsl | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl |
| l_sr | PrimInt63.lsr | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr |
| a_sr | PrimInt63.asr | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.asr |
| head0 | PrimInt63.head0 | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 |
| tail0 | PrimInt63.tail0 | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 |
| addMulDiv | PrimInt63.addmuldiv | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv |
| eq | PrimInt63.eqb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb |
| lt | PrimInt63.ltb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb |
| le | PrimInt63.leb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.leb |
| lts | PrimInt63.ltsb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb |
| les | PrimInt63.lesb | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb |
| arraymake | PrimArray.make | 1 | Corelib.Array.PrimArray.make |
| arrayget | PrimArray.get | 1 | Corelib.Array.PrimArray.get |
| arrayset | PrimArray.set | 1 | Corelib.Array.PrimArray.set |
| arraylength | PrimArray.length | 1 | Corelib.Array.PrimArray.length |
| arraydefault | PrimArray.default | 1 | Corelib.Array.PrimArray.default |
| arraycopy | PrimArray.copy | 1 | Corelib.Array.PrimArray.copy |
| string_make | PrimString.make | 1 | Corelib.Strings.PrimString.make |
| string_length | PrimString.length | 1 | Corelib.Strings.PrimString.length |
| string_get | PrimString.get | 1 | Corelib.Strings.PrimString.get |
| string_sub | PrimString.sub | 1 | Corelib.Strings.PrimString.sub |
| string_cat | PrimString.cat | 1 | Corelib.Strings.PrimString.cat |
| string_compare | PrimString.compare | 1 | Corelib.Strings.PrimString.compare |
| compare | PrimInt63.compare | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.compare |
| compares | PrimInt63.compares | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.compares |
| addc | PrimInt63.addc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.addc |
| addCarryC | PrimInt63.addcarryc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc |
| subc | PrimInt63.subc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.subc |
| subCarryC | PrimInt63.subcarryc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc |
| mulc | PrimInt63.mulc | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc |
| diveucl | PrimInt63.diveucl | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl |
| div21 | PrimInt63.div21 | 1 | Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 |
| fabs | PrimFloat.abs | 1 | Corelib.Floats.PrimFloat.abs |
| fopp | PrimFloat.opp | 1 | Corelib.Floats.PrimFloat.opp |
| fadd | PrimFloat.add | 1 | Corelib.Floats.PrimFloat.add |
| fsub | PrimFloat.sub | 1 | Corelib.Floats.PrimFloat.sub |
| fmul | PrimFloat.mul | 1 | Corelib.Floats.PrimFloat.mul |
| fdiv | PrimFloat.div | 1 | Corelib.Floats.PrimFloat.div |
| fsqrt | PrimFloat.sqrt | 1 | Corelib.Floats.PrimFloat.sqrt |
| float_of_int | PrimFloat.ofUint63 | 1 | Corelib.Floats.PrimFloat.of_uint63 |
| normfr_mantissa | PrimFloat.normfrMantissa | 1 | Corelib.Floats.PrimFloat.normfr_mantissa |
| ldshiftexp | PrimFloat.ldshiftexp | 1 | Corelib.Floats.PrimFloat.ldshiftexp |
| next_up | PrimFloat.nextUp | 1 | Corelib.Floats.PrimFloat.next_up |
| next_down | PrimFloat.nextDown | 1 | Corelib.Floats.PrimFloat.next_down |
| feq | PrimFloat.eqb | 1 | Corelib.Floats.PrimFloat.eqb |
| fequal | PrimFloat.equal | 1 | Corelib.Floats.PrimFloat.Leibniz.eqb |
| flt | PrimFloat.ltb | 1 | Corelib.Floats.PrimFloat.ltb |
| fle | PrimFloat.leb | 1 | Corelib.Floats.PrimFloat.leb |
| fcompare | PrimFloat.compare | 1 | Corelib.Floats.PrimFloat.compare |
| fclassify | PrimFloat.classify | 1 | Corelib.Floats.PrimFloat.classify |
| frshiftexp | PrimFloat.frshiftexp | 1 | Corelib.Floats.PrimFloat.frshiftexp |

**Full-library validation and inventory scope**

The same range rerun covers 67 modules, of which 51 contain request roots.16 have no request roots at this level.The results for 2180 roots are as follows; modules with requested roots all pass source roundtrip, independent Lean consumer and structure audit.

| Final status | Roots | Meaning of a successful check |
|---|---:|---|
| TRANSLATED_AND_CHECKED | 1003 | The translation passes checking with no proof premises awaiting assembly. |
| STATEMENT_KERNEL_CHECKED | 846 | The statement passes kernel checking with no proof premises awaiting assembly; this does not mean that the source proof has been translated. |
| PENDING_KERNEL_CHECKED | 148 | The translation passes checking with explicit proof premises that still require proof or assembly. |
| STATEMENT_PENDING_KERNEL_CHECKED | 183 | The statement passes kernel checking with explicit proof premises; neither the source proof nor those premises is thereby completed. |

Total 2180 root; blocked 0, verification failed 0. Among them, 331 has an explicit premise to be proven.

M Zero hits in measurement M08、M10、M13 is not included in the usage list above;These paths were disabled and the same scope was rerun, preserving target types, bodies, constructors, universes, and premises. [Disable rerun recording](../experiments/used-rule-coverage-20261019/M_PRUNING_VALIDATION.json) Save module-by-module results.

This supports the current configuration to complete the mechanical translation of the above Corelib range, and the 3 M paths can be disabled in this range.**44 is the number of manifest entries under the current evidence granularity, not the number of rules that have been proven to be the smallest and exhaustive of all implementation branches. **C-aggregate, L03, and U04 still combine internal submechanisms; non-M paths have not been disabled and tested individually. Unlisted non-M submechanisms cannot therefore be classified as unused. See the [non-M scope description](../experiments/used-rule-coverage-20261019/NON_M_SCOPE.md)。

**Evidence files and reproduction**

| File | Content and purpose |
|---|---|
| [Product evidence by root ](../experiments/mechanical-nat-eq-20261019/results/rule-usage-evidence.json) | source, primary, variants and inspection results; used for filtering original entries. |
| [Hit list of original entry ](../experiments/mechanical-nat-eq-20261019/results/RULE_USAGE.json) | The names/family_names lists for original identifiers; C-aggregate filters delta_inlined directly. |
| [M Successful path statistics ](../experiments/used-rule-coverage-20261019/M_RULE_USAGE.json) | Root names, all declaration names, and retained-event counts for each M rule. |
| [M Full library verification after disabling ](../experiments/used-rule-coverage-20261019/M_PRUNING_VALIDATION.json) | Rerun within the same scope, module-by-module inspection, status counting and target unchanged results. |
| [Record reliability test ](../experiments/used-rule-coverage-20261019/INSTRUMENTATION_TESTS.json) | Verify event retention on accepted paths, rejection of disabled paths, and absence of retained hits after rollback or normal failure returns. |
| [Complete rules catalog ](../experiments/mechanical-nat-eq-20261019/results/ALL_RULES.md) | Trace historical numbers and rule descriptions; directory members are not automatically considered to have been used this time. |
| [Generator script](../scripts/used_translation_rules.py) | Generate full text from the above evidence, checking lists, counts, success statuses, primitive references, and M validation for consistency. |

Generate or check this file at the repository root:

    python3 scripts/used_translation_rules.py
    python3 scripts/used_translation_rules.py --check

These commands read saved evidence without rebuilding or retranslating Corelib. For complete measurement, compilation and re-running steps, see [M workspace description](../experiments/used-rule-coverage-20261019/README.md)。The original export, compiled files and logs are kept in the remote .work/used-rule-coverage-20261019/ and are not submitted to Git.
