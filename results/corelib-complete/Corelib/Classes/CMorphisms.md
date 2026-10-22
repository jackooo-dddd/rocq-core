Corelib.Classes.CMorphisms

Original file: /home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/Classes/CMorphisms.v
Frozen run: /home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/Classes/CMorphisms
Original root declarations: 78; currently blocked: 0; checks: {'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}.

[Rocq source](CMorphisms.v) · [Lean entry point](CMorphisms.lean) · [Lean printed output](CMorphisms.txt) · [Complete per-declaration records](CMorphisms.json)

---

Corelib.Classes.CMorphisms.Normalizes

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.Normalizes; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"k": "max", "b": {"l": {"n": "v_3", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"n": "v_3", "k": "param"}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[cu]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_2) v_3)\nbut it is expected to have type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.Normalizes' has type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type (max v_0 0 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (A → A → Type v_3) → (A → A → Type v_3) → Type v_2"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.PER_type_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.PER_type_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.PER_type_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.PER_type_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.Params

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.Params; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.PartialApplication

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.PartialApplication; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.PartialOrder_StrictOrder

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Classes.CMorphisms.PartialOrder_StrictOrder; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"n": "v_0", "k": "param"}}, {"k": "max", "b": {"l": {"n": "v_5", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_2", "k": "param"}}}, {"k": "max", "b": {"l": {"n": "v_5", "k": "param"}, "k": "succ"}, "a": {"n": "v_3", "k": "param"}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}], "type_lift_coercions": 8, "delta_inlined": ["Corelib.Classes.CRelationClasses.PartialOrder", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.complement", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_conjunction", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[it]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[un]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[it,un]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[cu,lo]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[cu,lo,un]", 6, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[pl]", 1, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 2, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[ul]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.StrictOrder A fun x y =>\n    @Rocq.Corelib.Init.Datatypes.prod (R x y) ((@fun x y => eqA x y → Rocq.Corelib.Init.Logic.False) x y)\nargument has type\n  A → A → Type (max 0 v_5)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_4 v_0)"], ["c[it,ul]", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.Classes.CMorphisms.PartialOrder_StrictOrder__rocq2lean_obligation_1, Corelib.Classes.CMorphisms.PartialOrder_StrictOrder__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.PartialOrder_proper_type

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.PartialOrder_proper_type; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.PartialOrder", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.partial_order_equivalence", "Corelib.Classes.CRelationClasses.relation_conjunction", "Corelib.Classes.CRelationClasses.relation_equivalence", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 4, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.Proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.Proper; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.ProperProxy

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.ProperProxy; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.Reflexive_partial_app_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.Reflexive_partial_app_morphism; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}], "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.ProperProxy", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | function expected\n  @H x"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.StrictOrder_PartialOrder

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Classes.CMorphisms.StrictOrder_PartialOrder; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.PartialOrder", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_conjunction", "Corelib.Classes.CRelationClasses.relation_disjunction", "Corelib.Classes.CRelationClasses.relation_equivalence", "Corelib.Classes.CRelationClasses.symmetry"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.Classes.CMorphisms.StrictOrder_PartialOrder__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.StrictOrder_PreOrder

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.StrictOrder_PreOrder; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_4", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}, {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}, {"k": "max", "b": {"l": {"n": "v_4", "k": "param"}, "k": "succ"}, "a": {"n": "v_2", "k": "param"}}, {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_3", "k": "param"}}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}, {"n": "v_6", "k": "param"}], "type_lift_coercions": 6, "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Reflexive", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.reflexivity", "Corelib.Classes.CRelationClasses.relation_disjunction", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[it]", 5, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[un]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[it,un]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[cu,lo]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[cu,lo,un]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PreOrder A fun x y => @Rocq.Corelib.Init.Datatypes.sum (R x y) (eqA x y)\nargument has type\n  A → A → Type (max (max 0 v_4) v_6)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_5 v_3)"], ["c[pl]", 2, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 2, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[ul]", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.apply_subrelation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.apply_subrelation; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {"coinductive_as_inductive": true}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.compose_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.compose_proper; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Program.Basics.compose"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu]", 3, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper ((B → C) → (A → B) → A → C)\nargument has type\n  Type (max (max v_1 v_2) (max v_0 v_1) v_0 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.compose_proper_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.compose_proper_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Program.Basics.compose"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful (B → C)\nargument has type\n  Type (max v_1 v_2)\nbut function has type\n  (A : Type v_5) →\n    (B : Type v_7) →\n      (A → A → Type v_6) → (B → B → Type v_8) → (A → B) → (A → B) → Type (max (max (max v_5 v_6) v_8) v_4)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.eq_proper_proxy

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.eq_proper_proxy.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.eq_subrelation

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Classes.CMorphisms.eq_subrelation; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.Reflexive", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation A (@Rocq.Corelib.Init.Logic.eq A)\nargument has type\n  A → A → Prop\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 0) v_1)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip2

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip2; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_3) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip_arrow

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip_arrow.type; target declaration kind: statement.
- Source kind: constant / opaque_interface.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Normalizes", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_2)\nargument has type\n  Type (v_2 + 1)\nbut function has type\n  (C : Type v_9) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip_atom

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip_atom; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Normalizes", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip_proper; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip_proper_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip_proper_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → C)\nargument has type\n  Type (max v_0 v_1 v_2)\nbut function has type\n  (A : Type v_3) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_4"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.flip_respectful

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.flip_respectful; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.forall_def

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.forall_def; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[it,cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_def' has type\n  (A : Type v_0) → (A → Type v_1) → Type (max v_0 v_1)\nbut it is expected to have type\n  (A : Type v_0) → (A → Type v_1) → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.forall_relation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.forall_relation; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation ((x : A) → P x)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.forall_relation' has type\n  (A : Type v_0) →\n    (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (P : A → Type v_1) → ((a : A) → P a → P a → Type v_2) → ((x : A) → P x) → ((x : A) → P x) → Type v_4"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.forall_subrelation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.forall_subrelation; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.forall_relation", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.iffT_arrow_subrelation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.iffT_arrow_subrelation; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_0 v_1)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.iffT_flip_arrow_subrelation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.iffT_flip_arrow_subrelation; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.subrelation (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (A : Type v_0) →\n    @Rocq.Corelib.Classes.CRelationClasses.crelation A →\n      @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max (max v_0 v_1) v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.iff_flip_impl_subrelation

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.iff_flip_impl_subrelation.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.flip", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip Prop\nargument has type\n  Type\nbut function has type\n  (A B C : Type v_0) → (A → B → C) → B → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.iff_impl_subrelation

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.iff_impl_subrelation.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.normalization_done

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.normalization_done; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {"coinductive_as_inductive": true}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.normalizes

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.normalizes; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.per_partial_app_type_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.per_partial_app_type_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.per_partial_app_type_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.per_partial_app_type_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.pointwise_pointwise

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Classes.CMorphisms.pointwise_pointwise; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.pointwise_relation", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | function expected\n  @✝ y"], ["c[ul]", 2, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1, Corelib.Classes.CMorphisms.pointwise_pointwise__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.pointwise_relation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.pointwise_relation; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  Type v_3 → Type (max v_3 (v_4 + 1))"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[it,un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[cu,lo,un]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.pointwise_relation' has type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max v_0 v_2)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_1) → (B → B → Type v_2) → (A → B) → (A → B) → Type v_4"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.pointwise_subrelation

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.pointwise_subrelation; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.pointwise_relation", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_eq

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_eq.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_flip_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_flip_proper; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.flip A A (Type v_1)\nargument has type\n  Type (v_1 + 1)\nbut function has type\n  (C : Type v_2) → (A → A → C) → A → A → C"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_normalizes_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_normalizes_proper; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"k": "max", "b": {"l": {"n": "v_3", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"n": "v_3", "k": "param"}], "delta_inlined": ["Corelib.Classes.CMorphisms.Normalizes", "Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | function expected\n  @H x"], ["c[ul]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_prf

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_prf; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_proper; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_proper_proxy

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_proper_proxy; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_proxy

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_proxy; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_subrelation_proper_arrow

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Classes.CMorphisms.proper_subrelation_proper_arrow; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_sym_arrow_iffT

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_sym_arrow_iffT; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_sym_arrow_iffT_2

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_sym_arrow_iffT_2; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_sym_flip

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_sym_flip; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}, {"n": "v_2", "k": "param"}, {"n": "v_3", "k": "param"}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}, {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"l": {"n": "v_3", "k": "param"}, "k": "succ"}}], "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | function expected\n  @Hf x'"], ["c[ul]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_sym_flip_2

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_sym_flip_2; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}}}}, {"n": "v_2", "k": "param"}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_2", "k": "param"}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"n": "v_4", "k": "param"}}}}, {"n": "v_5", "k": "param"}, {"n": "v_6", "k": "param"}, {"n": "v_7", "k": "param"}, {"n": "v_8", "k": "param"}, {"n": "v_9", "k": "param"}, {"k": "max", "b": {"l": {"n": "v_5", "k": "param"}, "k": "succ"}, "a": {"n": "v_10", "k": "param"}}], "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | function expected\n  @Hf x'"], ["c[ul]", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_sym_impl_iff

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_sym_impl_iff.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Prop)\nargument has type\n  Type (max v_3 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.proper_sym_impl_iff_2

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Classes.CMorphisms.proper_sym_impl_iff_2.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Init.Logic.iff", "Corelib.Program.Basics.impl"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → B → Prop)\nargument has type\n  Type (max v_5 v_7 0)\nbut function has type\n  (A : Type v_0) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_1"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.reflexive_eq_dom_reflexive

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Classes.CMorphisms.reflexive_eq_dom_reflexive; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Reflexive", "Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.Init.Logic.eq_rect_r__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.reflexive_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.reflexive_proper; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.reflexive_proper_proxy

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.reflexive_proper_proxy; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.respectful

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.respectful; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"n": "v_3", "k": "param"}, {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}], "delta_inlined": ["Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → B)\nargument has type\n  Type (max v_0 v_2)\nbut function has type\n  Type v_4 → Type (max v_4 (v_5 + 1))"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[it]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful' has type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type (max v_0 v_1 v_3)\nbut it is expected to have type\n  (A : Type v_0) → (B : Type v_2) → (A → A → Type v_1) → (B → B → Type v_3) → (A → B) → (A → B) → Type v_5"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.respectful_hetero

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.respectful_hetero; target declaration kind: def.
- Source kind: constant / transparent.
- Distribution rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"n": "v_2", "k": "param"}, {"n": "v_3", "k": "param"}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}, {"n": "v_6", "k": "param"}, {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}}}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) declaration type mismatch, 'Rocq.Corelib.Classes.CMorphisms.respectful_hetero' has type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) →\n            ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type (max v_1 v_2 v_5 v_6)\nbut it is expected to have type\n  (A : Type v_1) →\n    (B : Type v_2) →\n      (C : A → Type v_3) →\n        (D : B → Type v_4) →\n          (A → B → Type v_5) → ((x : A) → (y : B) → C x → D y → Type v_6) → ((x : A) → C x) → ((x : B) → D x) → Type v_7"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.respectful_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.respectful_morphism; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_15", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_11", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"l": {"n": "v_0", "k": "param"}, "k": "succ"}}}}}}}}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_12", "k": "param"}, "a": {"k": "max", "b": {"n": "v_10", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}}}}}}}}, {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_6", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_15", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_11", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"l": {"n": "v_0", "k": "param"}, "k": "succ"}}}}}}}}}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_7", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_12", "k": "param"}, "a": {"k": "max", "b": {"n": "v_10", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}}}}}}, {"n": "v_8", "k": "param"}, {"k": "max", "b": {"n": "v_9", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"n": "v_1", "k": "param"}}}, {"k": "max", "b": {"n": "v_13", "k": "param"}, "a": {"k": "max", "b": {"n": "v_10", "k": "param"}, "a": {"n": "v_1", "k": "param"}}}, {"k": "max", "b": {"l": {"n": "v_8", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"l": {"n": "v_15", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"l": {"n": "v_13", "k": "param"}, "k": "succ"}, "a": {"k": "max", "b": {"n": "v_11", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"l": {"n": "v_0", "k": "param"}, "k": "succ"}}}}}}}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"n": "v_13", "k": "param"}, "a": {"k": "max", "b": {"n": "v_12", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}}}}, {"n": "v_13", "k": "param"}, {"k": "max", "b": {"n": "v_14", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_8", "k": "param"}, "a": {"k": "max", "b": {"n": "v_15", "k": "param"}, "a": {"k": "max", "b": {"n": "v_13", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}], "type_lift_coercions": 10, "delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[un]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it,un]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[cu,lo]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[cu,lo,un]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[pl]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it,pl]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[cu,lo,pl]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[ul]", 2, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[it,ul]", 6, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.respectful_per

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.respectful_per; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; actual activation mechanism: {"poly_level_interp": [{"n": "v_0", "k": "param"}, {"n": "v_1", "k": "param"}, {"k": "max", "b": {"n": "v_2", "k": "param"}, "a": {"k": "max", "b": {"n": "v_1", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}, {"k": "max", "b": {"n": "v_5", "k": "param"}, "a": {"k": "max", "b": {"n": "v_4", "k": "param"}, "a": {"k": "max", "b": {"n": "v_3", "k": "param"}, "a": {"n": "v_0", "k": "param"}}}}, {"n": "v_4", "k": "param"}, {"n": "v_5", "k": "param"}], "type_lift_coercions": 18, "delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[un]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,un]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo,un]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.PER (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[pl]", 0, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.respectful_per_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.respectful_per_obligation_1; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Symmetric (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.respectful_per_obligation_2

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.respectful_per_obligation_2; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CRelationClasses.Transitive (A → B)\nargument has type\n  Type (max v_0 v_1)\nbut function has type\n  (A : Type v_2) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → Type (max v_2 v_3)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.subrelation_id_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.subrelation_id_proper; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation", "Corelib.Init.Datatypes.id"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A) (@Rocq.Corelib.Classes.CMorphisms.respectful A A RA RA')\nargument has type\n  (A → A) → (A → A) → Type (max (max (max v_0 v_2) v_3) v_1)\nbut function has type\n  @Rocq.Corelib.Classes.CRelationClasses.crelation (A → A) → (A → A) → Type v_1"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.subrelation_proper

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.subrelation_proper; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation", "Corelib.Classes.Init.Unconvertible"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.Init.Unconvertible (@Rocq.Corelib.Classes.CRelationClasses.crelation A)\nargument has type\n  Type (max v_0 (v_2 + 1))\nbut function has type\n  (A : Type v_1) → A → A → Type"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.subrelation_refl

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.subrelation_refl; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.subrelation_respectful

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.subrelation_respectful; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.subrelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.symmetric_equiv_flip

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.symmetric_equiv_flip; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CRelationClasses.Symmetric", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.iffT", "Corelib.Classes.CRelationClasses.relation_equivalence"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATION_FAILED | default cast annotation is not convertible in Lean"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_co_eq_inv_arrow_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_6) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_6) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_co_impl_type_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_co_impl_type_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_co_impl_type_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_co_impl_type_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_contra_co_type_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_contra_co_type_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_contra_co_type_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_contra_co_type_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (B : Type v_1) → (A → A → Type v_4) → (B → B → Type v_2) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_contra_inv_impl_type_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.Transitive", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_6)\nargument has type\n  Type (max v_0 (v_6 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_sym_co_inv_impl_type_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_6)\nargument has type\n  Type (v_6 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_6) → (B → B → Type v_5) → (A → B) → (A → B) → Type (max (max (max v_0 v_6) v_5) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.Proper", "Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[cu,lo]", 0, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.Proper (A → Type v_4)\nargument has type\n  Type (max v_0 (v_4 + 1))\nbut function has type\n  (A : Type v_1) → @Rocq.Corelib.Classes.CRelationClasses.crelation A → A → Type v_2"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism_obligation_1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Classes.CMorphisms.trans_sym_contra_arrow_morphism_obligation_1; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"delta_inlined": ["Corelib.Classes.CMorphisms.respectful", "Corelib.Classes.CRelationClasses.arrow", "Corelib.Classes.CRelationClasses.crelation", "Corelib.Classes.CRelationClasses.flip", "Corelib.Classes.CRelationClasses.symmetry", "Corelib.Classes.CRelationClasses.transitivity"]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[it,cu,lo]", 1, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.Classes.CMorphisms.respectful A (Type v_4)\nargument has type\n  Type (v_4 + 1)\nbut function has type\n  (B : Type v_3) → (A → A → Type v_4) → (B → B → Type v_4) → (A → B) → (A → B) → Type (max (max v_0 v_4) v_2)"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.
