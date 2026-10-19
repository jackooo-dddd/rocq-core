# SP: strict propositions in Lean Prop

This independent Corelib project maps the source sort SProp to Lean Prop. Rocq's source typing and elimination restrictions remain checked by the unchanged source roundtrip; the target kernel checks every generated term. No source proof body is imported, and the usual statement-only proof obligations remain explicit.

SProp has definitional proof irrelevance; Lean Prop has definitional proof irrelevance. The translation preserves binders rather than deleting arguments. Every source binder marked irrelevant must translate to a propositional domain (checked using Lean type inference); a data domain is rejected. The independent Python auditor requires the exact target universe zero for every SProp occurrence. It does not accept arbitrary sorts for strict propositions.

This is a forward representation, not an assertion that Rocq Prop and SProp are interchangeable in source code. Source relevance, allowed elimination, and source typing continue to be checked on the original IR. No new large elimination is synthesized. Supporting sort/quality polymorphism is a separate task.

Sources: https://rocq-prover.org/doc/V9.3.0/refman/addendum/sprop.html ; https://lean-lang.org/doc/reference/latest/The-Type-System/Propositions/

Validation required before accepting this rule: real Corelib SProp statements with source roundtrip, Lean consumer and independent audit; a synthetic strict-proposition fixture including proof-irrelevant dependent types; reject a non-propositional irrelevant binder and reject target-sort mutation. Existing statement and proof-insensitivity tests must remain valid.
