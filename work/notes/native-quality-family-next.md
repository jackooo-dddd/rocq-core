# Native quality families: integration requirements

Authoritative baseline main39:2129/2180 checked,51 blocked. Diagnostic main41 is NOT a new certified baseline.

Evidence:23 native original roots,603 complete quality assignments,full original level arities retained. Native types are instantiated from original constant declarations,not inferred from normalized bodies. Every case passes original-type conversion,original-body conversion and native typing. Source opaque bodies remain opaque in target probe. All603 target declarations pass Lean consumer and structural audit.

Remaining integration gates:
1. Original-root family IR with source quality/level context and exact branch identity; preserve all SProp/Prop/Type tuples and every original level parameter.
2. Fresh-process native rederivation in roundtrip for every family,including original body kind,typing flags,declared type,body,qualities and constraints. Do not trust producer booleans.
3. Consumer/auditor aggregate original-root success only when every required branch is accepted and checked. No default-Type-only success.
4. Checked reference dispatch preserving source quality and level instances,including bare/partial applications; no opacity-changing delta expansion of opaque references.
5. Negative controls:missing/duplicated/swapped quality tuple,wrong level instance,narrowed public type,wrong body,hidden opacity,falsified family/branch binding. Include kernel-valid semantic mutations rejected by audit.
6. Full67-module/2180-root regression,source/target/structural checks, existing statement/protection tests. Keep original23 EXPORT_BLOCKED until gates pass.

The untyped Source.v wrapper fixture can infer a smaller result sort and is NOT a fidelity witness. The explicit typed Ltac wrapper fixture failed compilation; retain that log. Use the native original-type approach in main41 instead.
