# Explicit cumulative result transport

The frozen poly-lift snapshot is certified: its protected fixture, full
2180-root regression and complete statement suite pass. It adds44 checked
roots over native-template241, leaving197 blocked and1983 checked good with
no regressions or good-unvalidated artifacts.

The type-coercions2 term-transport extension is certified (+3 checked).
Source-compute is certified (+2 checked), and cast-retry is certified (+4 checked):
cast-retry-full has 1992 checked roots and 188
blocked roots, no status/validation regressions and no good-unvalidated roots.
The later alias-closure2 campaign adds six more checked roots (1998 checked,
182 blocked) by completing type-abbreviation eligibility; it retains the certified
term transports and removes the unsuccessful nested-cast experiments.
Each certified campaign also passes the complete statement suite. WORK_STATE.json records
the snapshots and evidence. Nested function-cast experiments add no coverage yet.

## Source universe interpretation

For local polymorphic constraints v_i + k <= v_j with nonnegative k,
compute the maximum path weight d(i,j) in the constraint graph. Equality
adds two zero-weight edges. Set is a distinguished zero node, with a
zero-weight edge to every variable. A positive cycle is inconsistent and
rejected. Global endpoints and negative offsets are not yet interpreted.

A variable constrained below Set is identically zero. Every other image is

    I(j) = max { residual_i + d(i,j) : i reaches j },

where the Set node and variables forced to zero contribute zero plus the
path weight. Each unconstrained residual remains an explicit target universe
parameter. Original source parameters are retained even when an image no
longer depends on them.

Every image assignment satisfies the source constraints: each path to i
extends along an edge i->j. Conversely, for every source-admissible assignment
u, choosing residual_i = u_i gives I(j)=u_j: the length-zero self path gives
at least u_j, and each incoming path gives at most u_j. Thus the interpretation
covers every valid source universe assignment rather than fixing an upper
universe to its minimum. Constraints with negative offsets require a different
construction; they are rejected, not ignored.

The Lean translator uses maximum-weight Floyd closure. The independent Python
auditor uses bounded edge relaxation from each origin and compares every image
in normalized level form. Source constraints come from the freshly checked
Rocq export.

## Result transport

After the independently audited transparent type-alias expansion, a
type-valued body X whose inferred type is Sort lower and whose declared result
is Sort upper becomes

    PULift.{upper, lower} X

under exactly the declaration's source argument telescope. The declared type
is unchanged. Lean checks max(upper,lower)=upper. The audit independently checks
the source-derived upper level, the payload's lower level, the wrapper, depth,
and the unchanged source payload. Prop-only lifting retains its previous,
separate prop_lift rule and its negative controls.

type_lift records the telescope depth; poly_level_interp records local
universe images. The auditor checks metadata against source facts instead of
accepting arbitrary report annotations. In the global-universe experiment,
the same wrapper uses the existing independently checked global interpretation;
there are no local images.

The payload and result are connected by PULift.up/down. Protected respectful
clients prove both roundtrips by rfl at arbitrary universe parameters with an
empty axiom closure. These are correspondence laws, not a claim that source
theorem proofs have been translated.

## Validation and remaining work

- Frozen poly-lift: source/Lean/audit pass for respectful, relation_equivalence,
  relation_conjunction, relation_disjunction and other protected definitions.
- Seven report mutations reject missing/wrong images, missing lift, changed
  upper/lower universe, changed depth and changed payload.
- 165 constraint contexts exercised through the actual Lean implementation and
  independent auditor; 6220 bounded image valuations satisfy constraints, and
  1400 admissible valuations are fixed points. These finite checks supplement
  the construction above; they are not an exhaustive formal proof.
- Existing Prop-lift, polymorphic abbreviation and template tests pass.
- A later, separate type_lift_coercions mode inserts exact PULift.up/down
  at arguments, let values, final values and lifted function heads. Prop-only
  mode remains unchanged without that marker. Three real protected core callers
  pass with empty axiom closures; nine missing-mode/helper/payload mutations
  are rejected. Several other callers still fail and remain blocked.
- The six-root synthetic global/local fixture is not a passing fixture:
  global raise_type exposes a pre-existing result-sort inheritance audit
  mismatch; strict roundtrip_poly translates through transparent alias
  expansion, so it does not exercise the new term transports.
- Full coverage and minimization are unfinished.
