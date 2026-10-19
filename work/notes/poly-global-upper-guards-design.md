# Candidate design, not implemented or certified

Three direct failures still have local polymorphic lower bounds mixed with
outward bounds var_i + k <= native_global. Existing local max interpretation
rejects the entire context; main52 exact-R6 fallback is enough for two other
declarations but not these constrained carriers.

Preserve the first Type-transport attempt exactly. Only its existing second
interpreted attempt should consider an extended local interpretation; otherwise
already-general successful pointwise interfaces could be unnecessarily changed.

Potential admissible fragment:
- Keep every original native constraint, including global upper guards.
- Local nonnegative/equality edges define a max closure phi_i.
- Outward nonnegative local/Set-to-global bounds remain source-context guards.
  No global-to-local edges, global equalities or negative bounds in this fragment.
- Prove phi fixes every valuation satisfying the FULL source context:
  each local closure path v_j+k <= v_i is implied by original constraints;
  the own v_i summand gives the converse. Forced-Set components use equality to0.
- For EVERY outward bound phi_i + k <= global_g, independently check every
  summand reaches g in the full original local/global constraint graph.
  This explicitly verifies each guard after substitution; do not simply filter
  global constraints out or claim a full global model.
- Native full-context replay, R3 reference entailment, public type audit and
  kernel checks for all target parameters remain unchanged.
- Only claim a nontrivial interpreted image in this added fragment. If it is
  identity, retain existing exact-R6 mapping/empty report image.

Required evidence before certification: all actual failed contexts and source
constraints retained, independent graph algorithm in audit, arbitrary-universe
clients preserving every source-admissible carrier combination, wrong-image,
missing/changed-global-guard, universe-narrowing and wrong-transport controls,
full2180 regression and existing exact-R6 clients unchanged.
