# Independent Corelib rule extensions

The scope is all 2,180 kernel declarations inventoried from 67 installed Corelib modules.
The earlier 839-declaration / 24-module census is a strict subset. The baseline
has 189 blocked declarations inside that subset and 465 outside it.

## Local hypothesis applications

Statement preparation retains a proof-valued application whose head is a local
variable. The head is an input hypothesis, not an imported proof implementation.
Arguments are recursively prepared: a constructed proof passed to that hypothesis
still becomes an explicit proof prerequisite. Proof-valued constants still have
their implementations removed.

This preserves functional recursive fields such as the child-accessibility
argument in Acc_rect. The original source guard check, source roundtrip, Lean
kernel, and structural audit remain mandatory. Actual newly accepted declarations
include Acc_rec, Acc_rect, well_founded_induction, and well_founded_induction_type.
The proof-spine fixture tests a hypothesis application, a constructed witness, and
a hypothesis application with a constructed argument.

## Reduced proof-type classification

Retyping a type alias from its declared type may give a cumulative Type upper
bound although the instantiated alias reduces to a proposition. Statement
preparation now weak-head reduces the type, recursively beneath products, before
deciding whether its codomain is Prop or SProp. The source type itself is preserved;
only the proof/data classification changes. The consumer's rejection of imported
proof implementations is unchanged.

This fixes the classification of CRelationClasses.iff_Reflexive and related
declarations. The alias fixture retains a separate, known unsupported polymorphic
cumulativity example; passing proof classification is not reported as passing that
example.

## Explicit universes on inductives (R6-I)

Inductive declarations use the same explicit universe-variable mapping as
polymorphic constants: explicit v_i parameters precede generalized global levels.
References supply the complete explicit instance. The independent auditor checks
parameter counts and each instance level, including negative controls for wrong
or missing instances. Rocq universe inequalities are not discarded. General
cumulativity remains unresolved; the box/large examples stay in the regression
ledger.

## Complete native universe facts

Global levels in a declaration's abstract polymorphic context are collected along
with levels occurring in its terms. They are checked against the actual source
UGraph, including a fresh-process check of every emitted ordered pair. This repairs
missing facts for Corelib.Init.Logic.31 and .45 in CRelationClasses.

## Structural audit of definition expansion

The auditor reconstructs the authorized source expansion with arguments expanded
before the enclosing definition, using one fixed source environment for all rows.
Previously it used a top-down rewrite; nested flip applications could leave a
different arrangement of beta redexes and fail exact comparison.

The target comparison remains structural, including binder domains and argument
order. No general beta/eta equivalence exemption or module/name-specific bypass
was added.

## Deferred recursion dispatch

A source declaration with deferred guard checking may attempt the existing
checked recursion lowerings. Acceptance still requires a kernel-checked target
and the usual independent audit; termination obligations remain explicit. Removing
the early refusal alone did not improve the measured Wf coverage. Remaining
unsupported recursion is not counted as accepted.


## Polymorphic prerequisites

Accepted proof-task statements and pending definitions register their explicit
universe-parameter count. Each use supplies the source instance before generalized
global levels. Hypotheses are still keyed by their statement and instance.
The independent audit records each hypothesis's instance and compares it with
the source occurrence; wrong and missing instances are rejected.

The synthetic two-universe example passes source roundtrip, Lean checking and
audit, with two separate hypotheses for one prerequisite at different instances.
In the Classes probe this removes the early unsupported-instance refusal, but
eq_equivalence and iff_equivalence still fail a later cumulative-type check.
They remain blocked.

## Primitive integer literal reconstruction

The independent source decoder reconstructs an int63 literal only from an ASCII
decimal encoding in [0, 2^63). Its MetaRocq structural comparison uses the native
integer equality operation. Tests cover 0, 1, 2^62 and 2^63-1; changing a literal
from 0 to 1 fails fresh-source comparison. Invalid and out-of-range encodings fail
decoding.

Primitive operators cannot be quoted by MetaRocq's tmQuoteConstant. The source
checker now re-reads their native operator identity, complete type, universes and
relevance in a fresh Rocq process, comparing every field with the export. It also
requires the unsupported-primitive body state and absence of a fabricated body.
Operator, type, universe, relevance, body, body-state and coherent signature
mutations are rejected. This verifies the source; it does not implement an operator.

## Primitive literal reconstruction

Float literals use the source hexadecimal encoding and PrimFloat.Leibniz.eqb,
which distinguishes positive and negative zero and accepts the same NaN.
Strings are serialized as explicit octets, preserving NUL and non-UTF-8 bytes.
Arrays retain the universe, element type, elements and default value. Fresh-source
tests reject changes to zero sign, string bytes, array elements and array defaults.
Malformed primitive encodings are rejected before Gallina generation.

## Native int63 representation (experimental)

Only a constant registered by Rocq's kernel as the int63 type is represented by
Lean BitVec 63. The registration is exported and independently recomputed; a
source assumption with the same spelling is insufficient. The original declared
type is retained and checked by Lean. The independent audit requires the exact
BitVec 63 representation with no hypotheses or universe parameters.

Each integer literal in [0, 2^63) becomes BitVec.ofNat 63 with the identical integer.
No masking of an out-of-range source literal is allowed. The consumer retains
its axiom and dependency checks; the permitted construction constants include
BitVec, BitVec.ofNat and Lean's natural-number literal dependencies. Separate
Lean examples check the boundary values and use a translated value with Lean's
own modular addition. Overloaded notation may require a BitVec 63 type annotation,
because the translated source type remains a named definition.

Eight native operations are implemented: add, sub, mul, div, rem, l_and, l_or and
l_xor. Addition/subtraction/multiplication use the axiom-free Lean BitVec definitions.
The other operations use Rocq2Lean.PrimInt63: natural division/modulo followed by
BitVec.ofNat, and a shared structurally recursive low-bit traversal. This avoids
the propext/Quot.sound dependencies of some built-in BitVec operations. Division
by zero is zero and remainder by zero is the dividend, matching Rocq's native
implementation. Exact operator and width are independently audited; the consumer
still requires an empty axiom closure. Differential kernel tests cover 384 cases.

## Declaration-local universe bounds (R3-P, under validation)

When a reference's generalized universe is instantiated by an explicit variable
v_i of the referring declaration, R3 checks that i is in that declaration's
polymorphic parameter list. It derives the required upper bound from the full
source-checked abstract constraint context plus native global facts. Equality,
signed integer offsets and transitive chains are retained. Constraints are local;
the shared global facts and the public universe telescope are unchanged.

The translator computes single-source maximum offsets; the Python auditor
independently computes weighted transitive closure. Missing bounds, out-of-scope
variables, excessive offsets, malformed contexts and positive cycles are refused.
Existing coherence, motive-level conventions and no-raising requirements remain.
All produced definitions still pass Lean's unrestricted universe kernel checking.

## Signed int63 arithmetic and shifts (under validation)

Signed division/remainder use Int.tdiv/tmod and an explicit, axiom-free
two's-complement conversion to BitVec 63. The conversion handles the full Int
range by reduction modulo 2^w, including the minimum signed value divided by -1.
Logical shifts yield zero for amounts at least 63. Arithmetic shifts preserve
Rocq's special rule that a shift amount with the sign bit set yields zero;
nonnegative large amounts saturate to the sign bit. Shifts are guarded or clamped
before computing, so a large int63 shift amount does not allocate gigantic values.
All five operations use the existing exact native-operator/width audit rule.

## Native predicate results (under validation)

Equality and unsigned/signed comparisons compute an axiom-free Lean Bool.
A single Bool.rec conversion returns the source's registered true/false constructors,
whose identities are read from Rocq's retroknowledge, exported with the primitive
signature, and recomputed in a fresh source process. The target retains the original
translated Boolean type. The independent audit checks the complete conversion,
operator identity, width and argument order; it does not infer true/false from
constructor spelling or order. Native registration mutations and target branch
swaps must be rejected separately.

## Native bounded arrays and byte strings

Primitive registration is re-read from the source kernel. Arrays use a
universe-polymorphic bounded size, a function on valid indices, and a separate
default. Source max_length=4194303 is exported from Parray.max_length and checked
against the model before accepting either the type or a primitive operation.
make clips the requested length; get returns the default out of bounds; set
preserves the old value at every other valid index and preserves the default.
copy is extensionally the identity. None of these definitions requires axioms.
Array literals preserve their exact universe, element type, ordered payload and
default through ofList; both literal components and constructor shape are audited.
The representation supports ordinary Lean use at arbitrary element universes.

Strings use bounded byte functions with max_length=16777211, independently read
from Pstring.max_length. Character inputs are reduced to their low eight bits.
Reads beyond the length return zero; sub clips offset and length; cat retains
only the longest allowed prefix. This is a byte-string model, including NUL and
bytes 128..255. Literal bytes are preserved exactly. These definitions do not use
Lean's Unicode String or add an axiom.

Three-way native comparisons return Ordering internally, then rebuild the exact
source-kernel-registered Eq/Lt/Gt constructors with Ordering.rec. The same rule
handles signed and unsigned int63 comparisons and lexical byte-string comparison.
Fresh source checking binds the registered constructor roles. The structural audit
checks all three roles, argument order, helper, domain and width. Source axioms
remain checked statement definitions; they are never installed as Lean axioms.

Evidence: scripts/test_native_array.py (118 computation cases and polymorphic
client), scripts/test_array_literals.py (empty, nested, distinct defaults and
polymorphic elements), scripts/test_native_string.py (212 source/target kernel
cases and 6 byte-literal uses). These include source/target mutation controls.
Full-run status is recorded separately in WORK_STATE.json.

## Remaining native int63 arithmetic

Leading/trailing zero counts inspect at most the word width; zero returns the
width. addmuldiv reproduces the source's two bounded shifts and modular shift
subtraction, including values outside0..63. The 302-case fixture covers all single
set bits, low-bit masks, zero and oversized shifts.

Carry and pair-valued primitives use helpers parameterized by the exact source
constructors. Native retroknowledge provides C0/C1 and pair; fresh source checks
bind them. The target keeps source carry/prod types rather than substituting an
unrelated Lean result type. The audit reconstructs the helper, width, type
parameters, result type and constructor arguments independently.
addc/addcarryc/subc/subcarryc preserve overflow or borrow; mulc returns high/low
words; diveucl returns quotient/remainder; div21 returns zero/zero when upper >=
divisor, otherwise divides upper*2^63+lower. All helpers are axiom-free.
The 363-case differential fixture includes failed preconditions, zero divisors,
sign-bit boundaries and deterministic random inputs. Coverage is counted only
after the frozen full regression succeeds; see WORK_STATE.json.

## Native binary64 floats

The kernel-registered float type maps to a canonical finite/infinite/NaN Lean
inductive. Finite values retain sign, eleven exponent bits and 52 fraction bits;
all NaNs have one representation and positive/negative zero remain distinct.
The 19 native operations use exact integer arithmetic with nearest-even rounding.
Square root uses structurally recursive base-four integer square root, so its
closed computations reduce in the Lean kernel. No machine floating evaluator,
axiom, sorry or unchecked opaque bridge participates in target acceptance.

Boolean, comparison, classification and pair results rebuild the registered
source constructors, independently re-read from Rocq retroknowledge. IEEE
equality differs from Leibniz equality on NaN and signed zero. Literal audit
independently decodes hexadecimal source bits. Helpers' transitive axiom closures
remain empty. The 2199 source/target kernel cases cover edge values, special values,
rounding and random inputs. Mutations of source roles, target roles, operator
identity, equality semantics and negative zero are rejected.

The frozen native-float2 campaign checks all2180 roots:65 newly checked,
363 blocked,1817 checked good,zero regressions; statement regression passes.
Checked statements are not proofs of those statements.

## Instantiated polymorphic type abbreviations

A transparent polymorphic type abbreviation may be expanded by substituting its
actual source universe instance into its complete body before beta reduction.
Substitution visits sorts, constant/inductive/constructor instances, case motives,
recursive bodies and native payloads. Term de Bruijn indices and named term
variables are untouched. Missing instance entries fail; caller universe variables
are substituted simultaneously, not recursively treated as callee variables.

The independent auditor repeats the source substitution and exact expansion.
This composes with the existing proposition lift after aliases are expanded.
It does not identify distinct public universes or introduce general Type-to-Type
cumulativity. The four protected fixture roots retain all explicit universes;
wrong output/domain universes, missing expansion metadata and wrong call instances
are rejected. The arbitrary-universe complement fixture has axiom-free up/down
inverse laws. Full Corelib certification is tracked in WORK_STATE.json.

## Fixed-Prop template parameters and type aliases

For a template inductive whose quoted and source-native conclusions are both
fixed Prop, its template parameter universe can be the full Lean Sort level.
The source-native parameter binding is unchanged. The consumer and independent
auditor recompute each reference's level directly from the argument sort rather
than adding a successor. Data-valued or mixed-quality conclusions are outside
this rule and an attempted mode change is rejected. This permits ex/ex2 instances
whose carrier is a proposition, with no axioms or substituted proof body.

A template may pass that carrier through a transparent monomorphic type alias.
The existing source delta/beta expansion now admits these aliases too; the actual
source body is expanded, and every argument, binder and universe is audited.
The initial Sort experiment exposed three SetoidTactics regressions; expanding
the relation alias restored them. Its DefaultRelation accepts Lean's own Eq at
arbitrary Sort, checked by a separate axiom-free client.

## Proposition-as-type casts

Under the existing proposition-lift tier, an explicit source cast of a
proposition to a Type sort becomes PULift of that proposition at exactly the
cast annotation's universe. The audit accepts this wrapper only at that source
cast, with a Prop input and the source sort's exact image; its payload is compared
structurally. This composes with type abbreviation expansion. The protected
Asymmetric declaration retains all three public universe parameters and has
axiom-free forward/backward inverse laws. Wrong output universes, non-Prop lifts,
missing expansion and missing coercion metadata are rejected.

## Constructor-shaped proofs in dependent computations

The original statement preparation remains the first attempt. If Rocq's kernel
rejects it, a second preparation keeps proof constructors visible to conversion.
Arguments are recursively prepared as before; local hypotheses remain local,
global theorem bodies are still omitted, and arbitrary proof lambdas, matches,
fixpoints and applications are still extracted. Both attempts use the same
source typing, universe, relevance and termination checks. A failed retry does
not turn a refused declaration into an accepted one.

This preserves reflexivity and eq_true constructors needed by dependent
rewriting functions. Five formerly refused functions pass fresh source checking,
Lean checking and structural audit, with no prerequisites; twenty closed
computations and three arbitrary-universe beta laws are kernel-checked. Remaining
dependent-extraction failures remain in the ledger. Full certification of these
combined changes is recorded separately in WORK_STATE.json.

## Dependent proof references (validation in progress)

Source statement preparation originally replaced each proof-valued application
by a fresh prerequisite. In dependent types this can break conversion: repeated
applications of the same theorem become different local proof functions.
The fallback preparation now retains constructor-shaped proofs and applications
headed by a global reference, recursively preparing the arguments. It runs only
when the original preparation fails, and the same Rocq kernel checks are
required. A referenced theorem still exports its statement without its proof
implementation; the translated data function explicitly binds that prerequisite.

The protected eq_rew_r_dep, eq_sigT_rect and eq_sig_rect fixture checks the source
round trip, fresh Lean kernel consumer and independent structural audit.
Supplying Lean equality proofs produces an axiom-free dependent transport client
and its beta law. Hiding prerequisites or changing the retained reference is
rejected. The three-Init-module probe gains 19 checked pending definitions.
Full-scope certification is recorded separately in WORK_STATE.json.

## Carrier and statement sort generalization (experimental)

R8 previously recognized only an arity binder with one or more arguments,
such as P : A -> Type@{u}. A zero-argument arity A : Type@{u} can use the
same Sort interpretation, provided u has no other occurrence in the source
interface. No new declaration-specific mapping is required. The original
Type instance remains available by taking the target Sort level to be its
successor; Prop instances become possible when the target kernel accepts them.

For statement artifacts, the relevant interface is the original proposition,
which is the body of the emitted statement definition, rather than the
statement definition's own type Prop. The independent auditor recognizes the
same source positions independently and continues to verify all reference
universe arguments and public quantification. Generalization is tried first,
with the old form as fallback; targeted and full regressions determine whether
its dependants remain valid. This section is a design record, not a success claim.


## Native result universes after template Sort generalization

Native carry/pair results now reconstruct template universe instances from the
source parameter binding and the independently checked template Sort mode.
A Type-0 field receives universe 1 for a Sort parameter and 0 for the original
Type parameter. The audit still reconstructs the exact helper, width, result
type, constructor roles and fields. Wrong coherent result/constructor levels
and an isolated wrong constructor level are rejected. The frozen native-template
campaign records full validation separately in WORK_STATE.json.

## Local constrained universes and Type-valued result lifting

See TYPE_LIFT.md for the source constraint interpretation, explicit PULift
transport, independent audit and evidence. The frozen poly-lift snapshot
unblocks 44 roots in a 159-root Classes probe without regressions. This is
experimental until its complete Corelib campaign and statement suite pass.

## Candidate failure recovery (certified)

An ordinary candidate typing exception now rejects that attempt, restores its
saved environment/metavariable state, and allows the existing later rules to run.
Runtime/resource exceptions still escape to the declaration budget handler.
Four CMorphisms opaque-data definitions recover through the existing local-universe
and transparent-alias rules. Their source, Lean and structural checks pass;
four axiom closures are empty and twelve target/metadata mutations are rejected.
The frozen cast-retry full campaign covers all2180 roots:1992 checked,188 blocked,
zero regressions and a passing statement suite. This changes rule dispatch,
not the permitted semantic transformations.

## Shared template quality bindings (checked metadata; representation pending)

Native template metadata now includes default_qualities, parameter_qualities
and conclusion_quality, preserving each shared quality-variable index.
NativeMeta recomputes the complete record in a fresh Rocq process. Eight real
template records pass; missing bindings, changed parameter indices, changed
conclusion/default qualities and splitting a shared variable are rejected.

For prod, sig, sig2, sigT and sigT2, one q0 is shared by the quality-sensitive
parameters and conclusion. Separate Prop and Type representations are necessary:
an unconditional Type0 floor would lose the all-Prop instance. Standalone prod
and dependent-sigma prototypes pass eight source and target parameter combinations,
two source computation equalities and two arbitrary-Sort Lean beta laws without
axioms. Family dispatch is not integrated; no blocked declaration is counted as
resolved by these prototypes.

## Type abbreviations whose result type uses another abbreviation (certified)

Eligibility is the least closure of the previous transparent type-abbreviation
criterion: expand only previously eligible source bodies in a candidate's type,
then apply the same criterion again. Keep the original body, actual universe
substitution and exact source structural comparison. The independent auditor
derives its own closure from the checked source environment. An opaque or missing
implementation cannot enter the closure.

This recognizes relation_equivalence through its crelation result type.
Six protected roots newly pass: five implementations and flip_arrow's statement.
Twelve payload/expansion mutations and four eligibility controls pass.
The reduced alias-closure2 snapshot uses the original certified term transports;
the two unsuccessful nested-cast experiments are not part of this version.
Full2180 validation and complete statement suite pass:1998 checked,182 blocked,
zero status/validation regressions and zero good-unvalidated artifacts.


## Complete shared-quality representations (integration under test)

For an eligible single, nonrecursive template inductive whose parameter and
conclusion qualities share one Type-default q0, derive a pair of representations.
The Type representation retains the canonical source target name, permits Sort
parameters and preserves the non-Prop result floor. The auxiliary Prop
representation specializes precisely the native shared-quality sorts to Prop.
Both signatures must pass their existing universe, interface and kernel checks
before either is registered. Indices, primitive projections, nonuniform or
let-bound parameters, mixed quality bindings and unsupported constructor
computations are outside the current pair-construction fragment.

Reference dispatch uses the original source annotations, including declared
constant result types and local let types. All quality-sensitive arguments of
Prop arity select Prop; any Type arity selects Type. Missing contexts or unknown
source analysis are rejected. This is independent of the target term's inferred
sort. Match predicate/branch annotations are reconstructed from the source
inductive arity and constructor telescopes, instantiated at the source parameters
and universe instance; recursor-only hypotheses are not source variables.

One original result row contains an optional quality_prop representation record.
Auxiliary representations never enlarge the source roots or dependency closure.
Replay rebuilds both declarations. The fresh consumer checks both imports,
constructors, recursors, dependencies, universe instances and empty axiom closures.
It reports source declarations and auxiliary representations separately.
The independent Python audit first checks coverage/prerequisites against the
original export, then independently derives both signatures and source-context
reference choices. Auxiliary verdicts have a separate quality_representations
list and are absent from the source coverage counts.

A local let explicitly declaring a proposition at a Type sort uses the existing
Prop lift rule: its value becomes PULift at that exact declared universe. The
original source annotation remains in the source context. The structural audit
checks the unchanged binder annotation and the entire proposition payload, using
the same exact-universe checks as a cumulative source cast.

This integration is not certified by the prior 2180-root baseline. The production
54-root source fixture, real Corelib probes, corrupted-report controls and full
regression campaign are recorded separately under work/.

### Experimental proof projections and non-uniform structural recursion

Statement extraction retains a neutral, single-constructor proof match whose
branch returns its own field (possibly applied to neutral variables). Transparent
reference applications may be expanded only when source weak-head reduction and
beta normalization reveal exactly this shape. Opaque proofs, multiple branches,
outer-variable returns and arbitrary proof lambdas remain proof tasks. Prepared
declarations retain the native Rocq type/guard checks and fresh round-trip replay.

The existing iota-generalized structural recursion lowering can use non-uniform
parameters as Lean indices, as its direct-match lowering already does. In each
minor the source parameter is the constructor's own index; source branch binders
receive only the actual fields, excluding the added Lean index field. A match on
that known constructor reduces before the general non-uniform equality convoy.
The independent auditor reconstructs the same constructor/index environment from
source metadata and checks every recursive field selection and application
argument. These experiments are not certified until the fixed-scope regression
and statement suite pass.

The proof-projection/non-uniform recursion extension above is now certified in frozen quality-main15: all2180 requested declarations compared against main10;17 newly checked,0 status/validation regressions,0 successful artifacts lacking validation; full statement regression passes. Remaining133 blockers stay in scope. The constructor-shaped index prototype is separate and not yet integrated.

### Constructor-shaped structural indices (candidate main18)

A decreasing argument may have an index built from nested nonrecursive,
single-constructor records whose leaves are distinct earlier function arguments.
The translator abstracts the complete index, recovers these arguments by record
projections, and uses those projections in the recursor motive and minors.
Recursive calls must pass the corresponding projections of their recursive
field's index. This check reduces literal constructor projections only; it never
asks meta-level unification to interpret unopened bound variables.

The independent auditor derives every path from the source constructor metadata,
not from target annotations. It checks the motive, constructor parameter/index
mapping, minor bodies and functional recursive-call arguments. Repeated variables,
multiple constructors, recursive record carriers, and record parameters depending
on the varying arguments are rejected. Ordinary variable indices use empty paths.

Evidence: work/tests/wf-index-patterns2 contains pair, nested triple, custom-record
and computational clients plus eligibility controls. The generated pair beta
equation holds at arbitrary universes with no axioms; three generated generic
functions have empty axiom closures. In work/tests/wf-index-patterns-negatives2,
wrong-field, constant-minor and discarded-recursion mutations all remain
kernel-valid and are rejected by the source audit. Full coverage certification
is pending; the certified baseline remains main15.

Constructor-shaped indices are certified in frozen quality-main18: all2180 roots and complete statement suite, +2 checked versus main15, zero status/validation regressions and zero good-unvalidated. Both Wf modules now have all33 requested declarations checked. Subsequent cumulative branch-transport experiments are separate and uncertified.

### Cumulative type arguments (main26 certified)

Actual source universe facts equate RelationClasses.72, .74 and .75. The
translator shares those equality classes before inserting type-branch transports.
At a type argument with a concrete numerical sort, a general callee domain is
preserved with an explicit PULift of the entire translated source argument.
Function arguments are adapted using the existing up/down and eta rules.
Parametric sorts retain their existing translation path; a blanket lift caused
CRelationClasses regressions in main21.

The independent auditor checks a type argument's upper universe against the
instantiated, source-audited callee signature, and checks the complete source
argument against the payload. The fresh Lean kernel checks its lower sort.
Unused discovery-only universe parameters are removed; implicit parameters must
have an actual reference witness, matching the independent R3G check.

The three-module,262-root main26 probe adds predicate_all, predicate_exists,
predicate_intersection, predicate_union, relation_conjunction and
relation_disjunction without status or validation regressions. Actual-core
clients check four arbitrary-universe computation equations and ten empty axiom
closures. Four negative controls include three kernel-valid wrong translations
rejected independently (wrong payload, hidden transport, swapped operands) and a
wrong upper universe rejected by both checks. Full2180/67 certification passed:2055 checked,125 blocked,no status or validation
regressions,zero good-unvalidated,and complete statement suite PASS. Evidence: work/quality-main26-targeted-delta.json and
work/tests/tlist-arguments26/result.json.

The local 400000-heartbeat option on processConstantCore is for compiling that
large Lean definition only; runtime declaration/tier budgets are unchanged.


### Type positions, higher-order functions and equality (main31 candidate)

At a source type position, a computed proposition represented as a PULift value
is projected back before constructing the binder. Existing source-structural
checks validate the complete payload. Function coercion recursively adapts
function arguments, and the independent eta check verifies every nested argument
is the same source variable in the same order; dropping a quantifier or swapping
nested operands is rejected even when the resulting declaration is kernel-valid.

The same explicit transports are available in theorem statements. This preserves
their quantification ranges instead of accepting a universe-zero specialization.
Unapplied bootstrap equality receives a fresh level solved by its surrounding
source-annotated type. R3G applies to source-indexed level parameters, not a native
Lean parameter such as Eq.u_1 merely sharing the textual prefix. An explicit-
instance Rocq fixture verifies all five definitions/proofs and interoperates with
Lean Eq at arbitrary universes. Kernel-valid substitution of Ne or a narrowed
universe is rejected independently.

The349-root/four-module main31 probe gives49 gains over certifiedmain26 with
zero status regressions and all module validations passing. Full2180 regression
is running; no main31 certification yet. The original implicit-instance Eq
fixture remains recorded: Rocq inferred a local-to-global upper bound there,
which is a separate unsupported universe case, not evidence of full support.

### Function results and mixed alias use (main34 candidate)

The numerical-sort lift now applies uniformly to a type argument and to the
result of a function used as an argument. Independent audit reconstructs the
callee domain, traverses the function binders, checks their domains, checks the
exact upper result universe, and retains the complete payload for source
comparison. The native Eq domain uses an independent bootstrap signature.
Local universe constraint closure is also independently checked for statements.

main33 adds RewriteRelation_instance_0/1, complement_inverse and the conditional
iff_equivalence artifact. Three kernel-valid payload/operand/constraint mutations
are independently rejected. A fresh Lean client proves the translated complement
statement at arbitrary universe parameters without axioms; this client proof is
not claimed as an assembled source proof.

main31 full regression exposed an overly strong alias-audit postcondition:
a name could be expanded at applications while retained as a bare higher-order
reference. main34's replay records exactly which source applications were
expanded and compares that set with the report. Bare references are preserved
and structurally checked, not ignored. The five-module probe has66 gains over
certifiedmain26; full2180 validation is pending. main31 was not certified.


### main34 certified: 2121 checked / 59 blocked

Full67-module/2180-root campaign2 completed; 66 verified gains over main26, zero status/validation regressions and zero good-unvalidated. Complete statement suite ends test-statement: OK. Original839 remains816checked/23blocked; added1341 is1305checked/36blocked. Gains: RelationClasses19, CRelationClasses4, Morphisms30, Morphisms_Prop13. Accepted categories retain statement-only and explicit-prerequisite distinctions; no claim that all original proofs have been transferred. Evidence: work/quality-main34-delta.json, work/logs/quality-main34-full-campaign2.log, work/logs/quality-main34-statement-suite.log. Remaining stage counts: export23, universe13, kernel7, translation6, interface6, dependency4. main35 explores a structurally known upper bound for parameterized type transports; not certified.


### main38 and main39 certified; native quality prototype

main38 full67/2180:2126checked/54blocked (+5 vs main34), zero status or validation regressions and zero good-unvalidated; complete statement suite PASS. A parameterized type is lifted only when both levels contain no metavariables and normalized max(upper,lower)=upper already holds; the test adds no constraints. Higher-order binder adaptation checks each original target binder against the instantiated audited callee signature, then compares the full source domain and uses through the up/down correspondence. Ordinary source comparison is tried before this adaptation. Controls:3 kernel-valid parameter/semantic/report mutations rejected independently,1 incorrect domain rejected by kernel and audit, arbitrary-universe shape and translated reflexivity client,7 empty axiom closures.

main39 full67/2180:2129checked/51blocked (+3 vs main38,+8 vs main34), zero status/validation regressions and zero good-unvalidated; complete statement suite PASS. Rocq-classified proof statements whose codomain is hidden behind cumulative Type aliases receive a native codomain-spine view. Native conversion against the ORIGINAL full declared type is required under its universe context. Definitions keep annotations. Fresh source replay compares the complete rewritten type and statement_prop_view marker. New roots:asymmetry,flip_Asymmetric,StrictOrder_Asymmetric. Fresh Lean proves all3 statements at arbitrary universes without axioms;2 kernel-valid target mutations and2 source metadata/type mutations rejected. Evidence:work/quality-main39-delta.json;work/tests/statement-prop-view-full-controls39/result.json. Original839 stays816checked/23blocked;added1341 becomes1313checked/28blocked. Certified snapshot main39; active source main41 adds diagnostic-only native quality quotation.

Native quality prototype: all23 remaining exporter blockers have unconstrained quality contexts (4 with2 qualities,18 with3,1 with4). Exhaustive SProp/Prop/Type assignments total603. Initial unannotated V wrappers compile but could infer smaller result sorts; NEVER used as evidence of original interface preservation. Explicit Ltac type annotations fail on an unbound universe. main40/41 native API instead instantiates each ORIGINAL declared type, kernel-checks native type conversion, normalizes source body, kernel-checks original body conversion and its declared type, and quotes the quality-free result. All23/603 pass, with original opaque metadata preserved for ssr_have_upoly (its body is compared without treating its opaque reference as reducible). All603 diagnostic declarations also translate and pass fresh Lean consumer plus independent structural audit. No global references remain. This is NOT certified original-root coverage: production family aggregation/dispatch and fresh source roundtrip integration plus adversarial controls remain. Artifacts:work/tests/native-quality-families41;work/tests/native-quality-case-translation41. No running jobs at this checkpoint.


### main45/46 native sort-quality families (candidate, not yet certified)

The 23 previously export-blocked roots have finite unconstrained quality contexts:
4 of arity 2, 18 of arity 3, and 1 of arity 4. They are represented by all 603
SProp/Prop/Type assignments, with every original universe level retained. This is
a family representation of the original declaration, not a replacement by its
all-Type specialization. The original root is accepted only if every member is
accepted. A reference to any auxiliary member brings the complete family into
the contract's required closure.

The native exporter instantiates the original declared type and original body,
checks native conversion and body typing under the original flags and universe
context, and quotes the quality-free normal form. It retains opacity: opaque
source implementations become Lean opaque constants or theorems. These original
families are not uniformly proof-valued; their implementation is retained for
every quality case, including cases whose instantiated type is a proposition.
Ordinary proof tasks in statement mode retain their original policy. This
exception requires complete native family provenance and fresh source replay;
a forged ordinary proof family is rejected.

A fresh Rocq process reconstructs every case from the installed original source,
comparing its full type, body, context, flags, quality tuple, proof role, and
original opacity. The consumer and structural audit independently enforce the
family contract and exact public level parameters, and still check the actual
imported target type, value, kind, safety, and empty axiom closure.

Closed-quality source references are dispatched structurally by their native
quality vector, including bare references and partial applications. Their
universe arguments are preserved verbatim. Ordinary declarations are retyped
after dispatch. Opaque branches are represented as assumptions only in the
temporary quotation environment, so this retyping cannot unfold them; emitted
branches retain their independently checked implementations. No opaque source
call is delta-inlined. Fresh source roundtrip rederives the same dispatch and
checks the marker. Generic family references with unresolved quality variables
and unsupported inductive transformations remain explicit boundaries, never
default to Type.

Evidence so far:
- main45 and main46 focused Equality/ssreflect_rw modules: all 77 requested roots
  pass source roundtrip, consumer, and audit; the 23 families cover all 603 cases.
- main45 family controls: 10 source mutations rejected; 7 kernel-valid alternate
  targets rejected by both consumer and independent audit. Cases cover missing
  branches, duplicate/swapped tuples, false family identities, false ordinary
  proof provenance, narrowed types, changed bodies, removed levels, and lost opacity.
- main46 reference fixture: all 50 roots pass proof-mode verification and
  statement-mode validation, including 45 exhaustive bare references to Has_refl,
  Has_J and ssr_have_upoly, 4 partial applications and a nested reference.
- main46 full 2180-root regression and regression suites are running.
  The certified baseline remains main39, 2129 checked / 51 blocked.


### main46 certified: 2152 checked / 28 blocked

Full67-module/2180-root regression completed with23 gains overmain39, no status or
validation regressions, and zero good-unvalidated. All representation, parameter,
Eq, alias, quality, projection, statement-view and native-family controls passed;
the complete statement suite ends test-statement: OK. The original839 roots now
have838 checked/1 blocked; the added1341 have1314 checked/27 blocked.
All23 family roots also pass proof-mode verification and statement-mode validation.
The50-root reference fixture passes both modes. Three arbitrary-universe Lean
clients have no axioms; opaque unfolding is refused. Three source reference
mutations and three kernel-valid target reference mutations are rejected.
Evidence: work/quality-main46-delta.json; work/logs/quality-main46-full-campaign.log;
work/tests/native-quality-roots46/result.json;
work/tests/native-quality-dispatch-controls46e/result.json.

The legacy ssr_have_upoly rest/step preparation is used by zero declarations in
the fullmain46 exported IR. An additional opaque-wrapper fixture nevertheless
exposed it outside the inventory. main49 removes this obsolete special case,
preserves the full source call, and dispatches ordinary opaque bodies only for
quotation. Native retyping masks every original opaque reference; target opacity
and source body replay remain mandatory. Its77-root module probe and2-root opaque
client fixture pass both modes. Fullmain49 regression is pending.
R8 shared-reference-shift experiments47/48 produced no coverage gains over536
roots and were reverted; frozen evidence remains.


### main50 candidate: preserve implicit reference levels in late normalization

Late alias and computational-type steps previously filtered extraOwn against
explicit universe annotations of the rewritten terms. A source term can refer to
a monomorphic dependency whose generalized level is implicit: Tlist is such a
reference. Removing that level forced the target to universe0 and the unchanged
public-interface checker correctly rejected the narrower type.

The candidate retains discovered implicit levels through these steps, while
still discarding explicit levels erased by source normalization. Existing
dead-parameter pruning and independent R3G witness checks remain. Definitions
depending on a computational type can also reach the already-existing Type
transport tier; no additional term translation or validation rule is introduced.

Targeted268 roots/3 modules: true_predicate and false_predicate newly checked with
the original Tlist universe generalized. Their result uses arrows l
(PULift Prop), preserving the original proposition as payload. Four arbitrary-
universe nil/cons beta laws and6 empty axiom closures pass. Four kernel-valid
mutations (swap truth value, hide implicit level, specialize the public universe,
hide transport) are rejected by the independent audit. Fullmain50 regression
is running; these2 gains are not yet certified.

### main50 certified; main52 transport independent of optional universe model

The complete 2180-root/67-module main50 campaign and all specialized controls and
the statement suite passed:2154 checked,26 blocked,no status/validation
regressions,no good-unvalidated. Original839:838 checked/1 blocked.
Evidence:work/quality-main50-delta.json;
work/logs/quality-main50-full-campaign.log.

main52 separates the already-existing Type transport from optional R6-I local
universe interpretation. When the optional interpreter cannot handle a context
containing global bounds, ordinary exact R6 parameters remain unchanged and
poly_level_interp is empty. No source fact is removed. The original reference,
public interface, kernel and independent audit gates still apply.
Targeted750 roots/7 modules pass all module validations, with two gains:
CRelationClasses.eq_equivalence and CMorphisms.pointwise_pointwise. Both are
conditional artifacts, with three and two explicit prerequisites respectively.
They are not unconditional imported theorems.

Dedicated arbitrary-universe Lean clients discharge all five prerequisites using
native equality proofs. The first consumes the translated equivalence to prove
native equality symmetry; the second consumes the translated pointwise conversion
with an equality argument and returns the original relation's value. Six axiom
closures are empty. Seven kernel-valid changes hiding prerequisites, specializing
public universes, claiming an unsupported universe model or hiding transport are
rejected by the structural audit. Evidence:
work/tests/poly-transport-independence-controls52/result.json.
Fullmain52 is running; its gains are not yet certified.

The main53 function-cast transport experiment produced no gains over the same750
roots and has been removed. main55 extends the existing checked delta/beta
eligibility to transparent binder-only combinators, independent of monomorphic
or polymorphic metadata. After the lambda prefix, only bound variables and
applications of them qualify; no constants, recursion, sorts or eliminations
are accepted in that body fragment. The independent auditor derives eligibility
from source bodies and replays the same exact substitutions. This is not a
name-specific rewrite for id or flip. main54 failed to compile the nested IR
walker; main55 moves it to a top-level walker. Coverage remains unverified.

### main52 certified; main56 source prefix conversion

Fullmain52 and every regression suite including statement, family, opaque,
projection, universe/representation controls completed successfully:
2156 checked/24 blocked out of2180 across67 modules, no regressions and no
good-unvalidated. Two dedicated native clients and7 independent negative
controls also pass against the full-run artifacts.

main55 adds the transparent bound-variable combinator fragment to existing
delta/beta expansion; subrelation_id_proper becomes a checked statement.
A native Lean proof at arbitrary universe and3 kernel-valid mutations verify
the result and reject missing expansion provenance, semantic replacement and
universe specialization.

main56 normalizes only the let/lambda prefix of eligible transparent source
aliases by exact capture-avoiding substitution. This recognizes Proper and
respectful, whose native definitions start with let U := Type. The source
reference's instance is substituted as before; original source roundtrip,
independent alias eligibility, body reconstruction and public-universe checks
remain mandatory. The independent Python implementation uses its own de Bruijn
substitution to reproduce the prefix view.

Targeted750/7:9 additional checked statements relative to main52,15 blocked,
all module validations pass. New declarations:subrelation_id_proper;
proper_sym_flip;proper_sym_flip_2;proper_sym_impl_iff_2;rewrite_relation_eq_dom;
respecting_equiv and its3 obligations. All9 have native Lean proof clients at
arbitrary universes. For the latter8, independent carrier universes are retained;
8 proof axiom closures are empty and6 kernel-valid mutations are rejected,
including merging originally independent carrier universes.
Evidence:work/tests/binder-combinator-controls55/result.json;
work/tests/alias-prefix-controls56/result.json.
The initial Equivalence client used convenience eliminators absent from the
exported dependency closure; it failed and is retained as diagnostic evidence.
The corrected client uses the actual exported recursors, exits0 and has empty
axiom closures. Only the corrected fixture is used by the test script.
Fullmain56 is running, so these9 gains are not yet certified.

main57 candidate: jointly discover transparent aliases and constructor-driven
recursive type computations. Their result sorts may be exposed by each other,
as binary_relation/pointwise_lifting illustrate. Each round uses only already
established source conversions, native recursive bodies stay unchanged, deferred
termination remains excluded, and the auditor independently derives the same
least closure. No declaration-name special case or check bypass is introduced.

### main56 certified; main57 joint source conversion; main59 recursor transport

Fullmain56 module coverage:2165 checked/15blocked,2180 roots/67 modules,no
regressions/no good-unvalidated. All regression controls and the complete
statement suite passed after updating the old contextual bare-iff test:
respectful expansion now beta-applies iff, so that occurrence may expand.
The test still checks an isolated bare iff reference stays untouched and still
rejects a kernel-valid replacement of equivalence semantics by disjunction,
as well as false claims about unused expansions. Original failure is retained.
Evidence:work/logs/quality-main56-full-campaign.log;
work/logs/quality-main56-resume-campaign.log;work/quality-main56-delta.json.

main57 targeted750/7:10blocked,5 gains overmain56,all module validations pass.
New statements:flip_arrow,flip_forall,proper_proper,Acc_rel_morphism,
well_founded_morphism. Native Lean proves all5 at arbitrary public universes,
using exported recursors for accessibility. Six empty axiom closures and6
kernel-valid wrong computation/interface/semantics mutations pass controls.
Evidence:work/tests/joint-source-controls57/result.json. Fullmain57 running.

main58/59 preserve the R8 reference convention: a shared ordinary Type level
u is passed as u+1 to an admitting Sort parameter. On the interpreted Type
transport attempt only, closed proof-local minimal R2B defaults are established
before elaboration, using the existing minimalModelLevel function. Public
parameters remain free and all native facts and R3 reference checks still run.
This enables explicit cumulative transports instead of unifying the body's
larger sort down to Set.

main58 bool_eq_rec passed kernel/consumer but was NOT a checked gain: structural
audit lacked the signature for a function-valued match. main59 uses the real
kernel recursor signature already consumed by check_rec_binders when auditing
application domains. Source case identity, motive, branches and scrutinee remain
independently compared. Targeted750/7 now9blocked,all module validations pass.
The public bool->Type family is unchanged; both prerequisites are explicit.
A native client supplies reflexivity proofs and verifies both constructor beta
laws by rfl. Four axiom closures are empty. Four kernel-valid changes hiding
transport, dropping a prerequisite, falsifying the body-level lower bound or
replacing computation by constant zero are rejected.
Evidence:work/tests/bool-rec-transport-controls59/result.json.
Fullmain59 is running; this gain is not yet certified.

main60 candidate removes two syntactic restrictions from exact source
conversion: transparent aliases whose bodies are constant references or partial
applications need not start with lambdas; constructor-driven single-fix
reduction also permits operations that become type-valued after applying
arguments. The same capture-avoiding substitutions, guarded native source,
non-deferred termination, constructor readiness and finite evaluator fuel apply.
Independent audit reconstructs eligibility and every actual reduction.

## main61 / main62 candidates
Pending status and namespace follow the actual abstracted hypothesis telescope, not early dependency discovery. Exact source conversion can remove an unused prerequisite; all original roots remain.

R6-I global-upper fragment: only nonnegative local/Set edges and outward local/Set-to-global bounds. Keep each global bound, reject inward/global equality/negative fragments, compute local max closure, and check every interpreted guard summand in the full local-plus-outward graph. Its own parameter summand and each entailed lower summand prove the image fixes every FULL source model; this is coverage of source valuations, not a claim that arbitrary target parameters satisfy native global guards. R3/native replay remain unchanged. Enable only in the existing second interpreted Type-transport attempt; identity contexts keep exact R6. Independent auditor uses bounded relaxation, not translator Floyd. Targeted evidence: poly-upper-controls62-resumed; full certification pending.

## Record representation conversions (main71 candidate)
For a nonrecursive, nonnested, single-constructor inductive with no indices, use its kernel recursor to rebuild the same constructor at the expected parameter instance. Every field is retained in order via the existing PULift/function correspondence; all dependent types and the final term are kernel checked. The independent audit validates source nonrecursion, real recursor binder signatures, the constructor/parameters/universes, and each field. This is not arbitrary data conversion. Public hypotheses remain explicit. Exact alias conversion and source-checked callee/binder signatures support the existing Type-argument checks. See work/tests/record-transports-controls71/result.json for beta/roundtrip and negative controls. Full71 certification pending.
