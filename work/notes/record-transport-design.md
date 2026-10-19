# Candidate: fieldwise record representation transport
Only the same nonrecursive, nonnested, single-constructor, zero-index inductive
is eligible. Eliminate the original value with its REAL recursor. Rebuild its
sole constructor in the expected universe/parameter instance, converting every
field through the existing PULift up/down and function eta correspondence.
Preserve field order, multiplicity and all dependent fields. Source and target
parameters must agree after the independently checked representation changes.
The motive is constant (the expected record type); no value is discarded,
invented, projected away, or replaced by an axiom.

Producer: transactionally restore Meta state and coercion count on failure.
Require the complete recursor term to typecheck and infer exactly expected type.
Auditor: independent source nonrecursion test, kernel recursor binder metadata,
same constructor and parameter/universe spine, each field exactly its incoming
bound variable after up/down/eta (or recursively audited record adaptation).
Required negatives: swap/drop/replace field, wrong constructor/parameter, hide
transport metadata; all kernel-valid mutations must still fail semantic audit.
Required source clients: sigT Prop-to-Type family and back, beta on constructors,
both round trips, arbitrary independent universes; preserve obligation binders.
main64/65 are compile-failed drafts, main66 producer-only experiment, main67
adds candidate independent audit. No record transport gain certified yet.
