> Current Corelib baseline (2026-10-19): source nat/eq are generated inductives; the bootstrap table is empty. Earlier bootstrap examples and dated runs below are historical. See [MECHANICAL_NAT_EQ.md](MECHANICAL_NAT_EQ.md) and the repository RESULTS.md for current coverage and correspondence proofs.

# Source IR — `rocq2lean-ir/0.2`

NDJSON, one JSON object per line, written by `rocq/exporter` (`Rocq2Lean Export "file" roots…`).
It is a field-by-field serialization of MetaRocq Template quotations
(`Ast_quoter.quote_term_rec ~bypass:true`); **no normalization is applied**. Parsed strictly by
`Rocq2Lean/IR.lean` (unknown tags are errors).

## Line layout (fixed order)

| # | `kind` | Content |
|---|---|---|
| 1 | `header` | `ir`, `frontend` (name, MetaRocq commit, quoter, opaque access), `rocq_version`, `ocaml_version`, `global_typing_flags`, `conventions` |
| 2 | `roots` | `[{requested, name, term}]` — the qualid as written and its quoted head |
| 3 | `libraries` | `[{dirpath, vo}]` — compiled libraries the declarations come from |
| 4 | `universes` | union of the quoted environments' `levels` and `constraints` (MetaRocq) |
| 5 | `universe_facts` | native pairwise relations (`lt`/`le`) over `Set` and every level of the export, from Rocq's universe graph (`docs/UNIVERSE_TRANSLATION.md`, R0) |
| 6… | `constant` / `inductive` | declarations, **dependencies before dependents** |
| last | `footer` | `declarations`: count (an incomplete export is rejected) |

## Conventions

* **Bound variables.** `{"k":"rel","i":n}` is MetaRocq `tRel n`: `0` = innermost binder.
  This equals Lean `Expr.bvar n`. (Raw kernel `Rel 1` = IR `rel 0`; the exporter never sees
  raw `Rel`.) Confirmed by the Phase 0 probe: `fun x y => x` ↦ `rel 1`.
* **Contexts** (`params`, `indices`, `args`) are arrays **innermost-first** (MetaRocq snoc order).
* **Constructor indices** are 0-based; **inductive bodies** `i` are 0-based within the block.
  In constructor types the block's inductives are bound as `rel`s: body `k` of `n` is
  `rel (n - 1 - k + depth)`.
* **Dirpaths** in `mp` are outer-first.
* **Keys.** A global name is the string `M.ident` where `M` is the file dirpath joined by `.`,
  followed by `/field` for each module field. Identifiers contain neither `.` nor `/`, so keys
  are unambiguous. Lean names are `Rocq.` + all components.
* **Case** is MetaRocq's compact form: `p.ctx` and branch `ctx` carry binder names only; types
  are recovered from the inductive declaration (as MetaRocq's `case_branch_context`).
* **Fix**: `defs[k] = {n, ty, body, rarg}`; bodies are under `defs.size` extra binders;
  `rarg` is the 0-based decreasing argument, taken from the source metadata.

## Terms

`rel i` · `var id` · `evar ev args` · `sort s` · `cast t kind ty` (`kind` ∈ vm/native/default) ·
`prod n ty b` · `lam n ty b` · `let n v ty b` · `app f args` · `const c u` · `ind ind u` ·
`construct ind c u` · `case ci p c brs` · `proj p t` · `fix defs idx` · `cofix defs idx` ·
`int v` · `float v` · `string bytes` · `array u elems default ty`.

Binder annotation `n = {n: name|null, r: "R"|"I"}`. Sorts: `prop`, `sprop`,
`type u` with `u = [{l, n}]` meaning `max(l₁+n₁, …)`; levels `set`, `global n`, `var i`.

## Declarations

`constant`: `name, mp, id, type, body|null, body_state, universes, relevance, deps{type,body},
native{body_kind, polymorphic, private_universes, typing_flags}`.

`body_state` is one of — and these are never interchangeable:

| state | meaning |
|---|---|
| `transparent` | transparent definition, body present |
| `opaque_present` | opaque (`Qed`) constant, body read through `opaque_access` |
| `assumption` | genuine source assumption (`Axiom`/`Parameter`) |
| `unavailable` | body expected but absent |
| `unsupported_primitive` | primitive operation or symbol |

`native.template_info` (inductives, M4): `null`, or for a template inductive
`{defaults: [level], param_arguments: [null | {k: type|quality_sort, u: [{l, bound, n}]}], concl}` from
the kernel's `template_universes` record (bound levels named by their default level).

`inductive`: `name` (key of the block = first body), `finite`, `npars`, `params`, `bodies[{name,
indices, sort, type, kelim, ctors[{name, args, indices, type, arity}], projs, r}]`, `universes`,
`variance`, `deps{type}`, `native{polymorphic, template, private, typing_flags}`.

`deps` are computed from the quoted terms (constants, inductives, constructors, case and
projection metadata), self-references removed.

## Round-trip coverage (what is independently re-checked)

| Field | Check |
|---|---|
| constant type/body, relevance, universes decl; inductive params, bodies, indices, sorts, ctors (args, indices, types, arity), projections, eliminations, variance | Python decoder → Gallina; `RtEq.v` structural equality against a fresh MetaRocq quotation |
| `body_state` | native opacity: body hidden without bypass iff `opaque_present`/`assumption` |
| `deps` | recomputed from the terms |
| `native` (body kind, polymorphic, private universes, typing flags, template, private) | recomputed natively in a fresh process (`Rocq2Lean NativeMeta`) |
| `universe_facts` | every ordered pair re-checked natively (`Rocq2Lean CheckRelation`); every level named in a term is covered |
| `universes` (MetaRocq record) | each constraint entailed by the native facts |
| `roots`, `libraries`, `mp`/`id` | roots: contract (request ↔ resolution); libraries: hashed in the snapshot; names: via the kernel names used by the round trip |

Not independently re-checked: the MetaRocq quoter itself (both quotations go through it; the
native checks above cover metadata and universes but not term structure), and primitive
literals (rejected by the decoder).

## Hashes

`source_snapshot.json` (written by `rocq2lean export`) records sha256 of the manifest, every
compiled source `.v`, every library `.vo`, the IR file, the exporter plugin and the toolchain
lock. Source hashes and the IR hash are kept separate; `verify` recomputes all of them.


Primitive string payloads use byte arrays with entries in [0,255], preserving
arbitrary bytes without interpreting them as UTF-8. The decoder also reads legacy
string payloads as Latin-1 bytes. Primitive operation metadata carries its native
operator identity, type, universe declaration and relevance for fresh-process
signature verification.

### Statement preparation without extracted obligations

A constant may carry statement_prepared: true when statement preparation changes
its type or body even if it produces no fresh proof obligations. One example is
definitional expansion of a transparent proof projection needed by structural
recursion. This flag does not authorize a new target rule or assert a proof.
The round-trip checker must rederive the prepared type, body, obligations,
termination state and preparation flag in a fresh Rocq process, including the
existing request-independence checks. Omitting the flag subjects an otherwise
unmarked declaration to the original structural quotation comparison.


### Native sort-quality families (Corelib extension)

A quality-polymorphic constant with an available uniform implementation and an
unconstrained quality context may be exported as a finite complete family.
For n quality variables the family has exactly 3^n members in lexicographic
product order over SProp, Prop, Type. All original level variables and level
constraints are retained in every member. Quality elimination constraints,
unresolved global references in the normalized family, and private universe
extensions are not silently approximated.

Each member is a constant record with complete type/body/universes and
native.quality_branch = {source, qualities, proof_valued,
implementation_policy: "uniform_source_implementation"}.
native.body_kind and body_state preserve original transparency/opacity.
The all-Type member uses the original source key; other keys append
__rocq2lean_quality_ and one S, P or T per quality.
The all-Type record also has native.quality_family containing source,
body_kind, quality_parameters, level_parameters, quality_constraints: [],
source_proof_valued: false, the implementation policy, and
members: [{qualities,name,proof_valued}, ...].
The generic root term retains its abstract q quality vector and u level vector;
that root denotes the whole family, not just the all-Type member.

The contract includes these descriptors as quality_families. The original root
can be accepted only when all members are checked. Required-closure computation
adds root-to-members and auxiliary-member-to-root edges, so selecting any branch
requires the complete family. These are representation-contract edges, separate
from the term's actual deps.type and deps.body.

An ordinary constant whose type/body contains a closed-quality reference is
renamed to the exact source-selected member, preserving all universe arguments.
It carries top-level quality_dispatch: true. Native source roundtrip recomputes
the substitution and compares both the complete terms and this marker. The
rewritten ordinary declaration must also pass native typing; opaque family
members are unavailable for unfolding during that check.

Original uniformly proof-valued declarations remain ordinary proof tasks.
A family is an implementation across qualities even when some concrete members
are proof-valued; these members retain their checked implementations. Every
member is independently regenerated from the original source before it may
receive this treatment. Target kind is def for a transparent family, and
theorem or opaque for proof/non-proof members of an opaque family. No axiom,
conditional implementation, lost public level, or missing branch is accepted.
