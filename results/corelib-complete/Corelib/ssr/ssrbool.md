Corelib.ssr.ssrbool

Original file: /home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/ssr/ssrbool.v
Frozen run: /home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/ssr/ssrbool
Original root declarations: 451; currently blocked: 0; checks: {'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}.

[Rocq source](ssrbool.v) · [Lean entry point](ssrbool.lean) · [Lean printed output](ssrbool.txt) · [Complete per-declaration records](ssrbool.json)

---

Corelib.ssr.ssrbool.ApplicativePred

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.ApplicativePred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1359"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1359; the argument must be the same, not u_Corelib_ssr_ssrbool_1359"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1359"], ["c[it,cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1359; the argument must be the same, not u_Corelib_ssr_ssrbool_1359"], ["c[cu,lo]", 0, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1362"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.KeyedPred

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.KeyedPred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.statement: coherence: source level Corelib.ssr.ssrbool.1345 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu,lo]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.KeyedPred__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.KeyedQualifier

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.KeyedQualifier; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.KeyedQualifier__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.PredOfSimpl.coerce

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1163 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1163 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.SimplPred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.SimplPred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1129 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1129 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.SimplRel

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.SimplRel; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1179 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1179 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addFb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addFb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addIb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addIb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addKb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addKb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addNb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addNb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addTb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addTb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addb

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.addb; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbAC

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbAC.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbACA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbACA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbC

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbC.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbCA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbCA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbI

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbI.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbK

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbK.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.addbP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.addbP__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.addbb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.addbb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_and2

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_and2; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.535"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.all_and2__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_and3

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_and3; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.535"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.all_and3__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_and4

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_and4; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.535"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.all_and4__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_and5

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_and5; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.535"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.all_and5__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_sig2_cond

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_sig2_cond; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 3, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1449 solved as (some (u_Corelib_ssr_ssrbool_1105 + 1)): native fact Corelib.ssr.ssrbool.1449 le Corelib.ssr.ssrbool.1436 does not hold for the solution"], ["c[]", 3, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (6): Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2, Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_sig_cond

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_sig_cond; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1436 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1436 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_sig_cond_dep

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_sig_cond_dep; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"type_lift_coercions": 3, "delta_inlined": ["Corelib.Init.Datatypes.is_true", "Corelib.ssr.ssrbool.pred"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 2, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1412 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1412 does not hold for the solution"], ["c[]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[cu]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it,cu]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[cu,lo]", 4, "UNIVERSE_REJECTED | defaulted universe level(s) [u_residual_0] not justified: the declaration is not valid for every value ((kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_residual_0) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (@C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U "], ["c[it,cu,lo]", 4, "KERNEL_REJECTED | (kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_Corelib_ssr_ssrbool_1374) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (@C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U x y) →\n        @Rocq.Corelib.Init.Specif.sigT ((x : I) → T x) fun f =>\n          (x : I) →"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it]", 3, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[un]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrfun.292, not u_Corelib_ssr_ssrfun_292"], ["c[it,un]", 2, "UNIVERSE_REJECTED | reference to RocqPending.Corelib.ssr.ssrfun.tag_of_sig: coherence: source level Corelib.ssr.ssrfun.292 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292; the argument must be the same, not max u_Corelib_ssr_ssrbool_1418 u_Corelib_ssr_ssrfun_292"], ["c[cu,lo]", 4, "UNIVERSE_REJECTED | defaulted universe level(s) [u_residual_0] not justified: the declaration is not valid for every value ((kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_residual_0) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U x"], ["c[cu,lo,un]", 4, "UNIVERSE_REJECTED | defaulted universe level(s) [u_residual_0] not justified: the declaration is not valid for every value ((kernel) application type mismatch\n  @RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_1\n    h_Corelib_ssr_ssrbool_all_tag_cond_dep__rocq2lean_obligation_2 I T C fun x x_1 => (fun y => P x y) x_1\nargument has type\n  (x : I) → T x → Prop\nbut function has type\n  (U : (x : I) → T x → Type u_residual_0) →\n    ((x : I) → T x) →\n      ((x : I) → Rocq.Corelib.Init.Datatypes.is_true (C x) → @Rocq.Corelib.Init.Specif.sigT (T x) fun y => U x"], ["c[pl]", 2, "UNSUPPORTED_FEATURE"], ["c[it,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[cu,lo,pl]", 1, "UNSUPPORTED_FEATURE"], ["c[ul]", 5, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_tag_cond

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_tag_cond; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1397 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1397 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.all_tag_cond_dep

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 2, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrfun.all_tag: argument u_Corelib_ssr_ssrbool_1105 + 1: Corelib.ssr.ssrbool.1105 + 1 ≤ Corelib.ssr.ssrfun.225 is not entailed by the source universe graph, nor is Corelib.ssr.ssrfun.225 ≤ Corelib.ssr.ssrbool.1105 (with offset 0)"], ["c[]", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1, Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.altP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.altP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.alt_spec

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.alt_spec; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and3

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and3; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and3P

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.and3P; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (8): Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_5, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_6, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_7, Corelib.ssr.ssrbool.and3P__rocq2lean_obligation_8.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and3_ind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.and3_ind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and3_rec

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and3_rec; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and3_rect

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and3_rect; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.523"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and3_sind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.and3_sind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and4

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and4; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and4P

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.and4P; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (16): Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_5, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_6, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_7, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_8, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_9, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_10, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_11, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_12, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_13, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_14, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_15, Corelib.ssr.ssrbool.and4P__rocq2lean_obligation_16.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and4_ind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.and4_ind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and4_rec

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and4_rec; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and4_rect

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and4_rect; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.525"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and4_sind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.and4_sind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and5

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and5; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and5P

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.and5P; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (32): Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_5, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_6, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_7, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_8, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_9, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_10, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_11, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_12, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_13, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_14, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_15, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_16, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_17, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_18, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_19, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_20, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_21, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_22, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_23, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_24, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_25, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_26, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_27, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_28, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_29, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_30, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_31, Corelib.ssr.ssrbool.and5P__rocq2lean_obligation_32.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and5_ind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.and5_ind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and5_rec

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and5_rec; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and5_rect

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.and5_rect; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.527"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.and5_sind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.and5_sind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andFb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andFb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andKb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andKb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andNb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andNb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.andP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andPP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.andPP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (7): Corelib.ssr.ssrbool.andP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.andP__rocq2lean_obligation_4, Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.andPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andTb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andTb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbAC

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbAC.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbACA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbACA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbC

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbC.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbCA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbCA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbK

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbK.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_addl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_addl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_addr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_addr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_id2l

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_id2l.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_id2r

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_id2r.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_idl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_idl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_idr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_idr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_orl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_orl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andb_orr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andb_orr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.andbb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.andbb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.antisymmetric

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.antisymmetric; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.appP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.appP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.app_predE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.app_predE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.applicative_mem_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.applicative_mem_pred; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {"universe_lowered": true, "sort_interp": true}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 0, "KERNEL_REJECTED"], ["i[pl,un]", 1, "UNIVERSE_REJECTED"], ["i[]", 0, "KERNEL_REJECTED"], ["i[un]", 0, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.applicative_mem_pred_value

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.applicative_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.applicative_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1245"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.applicative_pred_applicative

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.statement: argument u_Corelib_ssr_ssrbool_1249 + 1: Corelib.ssr.ssrbool.1249 + 1 ≤ Corelib.ssr.ssrbool.1105 is not entailed by the source universe graph, nor is Corelib.ssr.ssrbool.1105 ≤ Corelib.ssr.ssrbool.1249 (with offset 0)"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.ApplicativePred__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.applicative_pred_of_simpl

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1249 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1249 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.applicative_pred_value

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.applicative_pred_value; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.bijective_in

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.bijective_in; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1700 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1700 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.bijective_on

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.bijective_on; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1706 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1706 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.bind_unless

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.bind_unless; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.395", "Corelib.ssr.ssrbool.396", "Corelib.ssr.ssrbool.398"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.bind_unless__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.boolP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.boolP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.altP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.altP__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.boolfunPredType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.boolfunPredType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1124"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.canLR_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.canLR_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.canLR_in__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.canLR_on

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.canLR_on.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.canLR_on__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.canRL_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.canRL_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.canRL_in__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.canRL_on

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.canRL_on.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.canRL_on__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.can_in_comp

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo3", 2, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2039 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2039 does not hold for the solution"], ["c[] eo3", 10, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.can_in_comp__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.can_in_inj

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_in_inj__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.can_in_pcan

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2006 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2006 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_in_pcan__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.can_mono

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.can_mono.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.can_mono_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 12, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.can_mono_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.check_applicative_mem_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1105", "copies": ["Corelib.ssr.ssrbool.1105__c0", "Corelib.ssr.ssrbool.1105__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classicP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classicP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classicW

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classicW.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.432"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classic_EM

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classic_EM.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classic_bind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classic_bind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.435", "Corelib.ssr.ssrbool.436"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classic_ex

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classic_ex.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.512"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classic_imply

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classic_imply.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.classically: argument imax u_Corelib_ssr_ssrbool_481 u_Corelib_ssr_ssrbool_482 for Corelib.ssr.ssrbool.417 is outside the supported level fragment"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classic_pick

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classic_pick.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.458"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classic_sigW

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.classic_sigW.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.498"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.classically

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.classically; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.417"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.clone_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.clone_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1116 solved as (some (u_Corelib_ssr_ssrbool_1110__c1 + 1)): native fact Set lt Corelib.ssr.ssrbool.1116 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1116"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max (max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1115) u_Corelib_ssr_ssrbool_1116; the argument must be the same, not u_Corelib_ssr_ssrbool_1116"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1116"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.predType: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max (max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1115) u_Corelib_ssr_ssrbool_1116; the argument must be the same, not u_Corelib_ssr_ssrbool_1116"], ["c[cu,lo]", 4, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.collective_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.collective_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1247"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.collective_pred_of_simpl

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1251 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1251 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contra

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contra.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraFF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraFF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraFN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraFN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraFT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraFT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraFnot

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraFnot.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraL

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraL.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraLR

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraLR.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraNF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraNF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraNN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraNN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraNT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraNT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraNnot

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraNnot.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraPF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraPF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraPN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraPN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraPT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraPT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraPnot

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraPnot.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraR

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraR.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraTF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraTF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraTN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraTN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraTT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraTT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contraTnot

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contraTnot.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contra_not

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contra_not.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contra_notF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contra_notF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contra_notN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contra_notN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.contra_notT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.contra_notT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.decP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.decP; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.decP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.decPcases

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.decPcases.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.decidable

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.decidable; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimFn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimFn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimNTF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimNTF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimNf

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimNf.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimTF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimTF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimTFn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimTFn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.elimTn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.elimTn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.eq_mem

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.eq_mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1221 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1221 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.eqbLR

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.eqbLR.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.eqbRL

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.eqbRL.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.equivP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.equivP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.equivP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.equivPif

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.equivPif.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.equivPifn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.equivPifn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.equivalence_rel

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.equivalence_rel; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.equivalence_relP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.left_transitive: coherence: source level Corelib.ssr.ssrbool.1473 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.equivalence_relP_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2161 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2161 does not hold for the solution"], ["c[] eo1", 5, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_3, Corelib.ssr.ssrbool.equivalence_relP_in__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.expose_mem_pred

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.expose_mem_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.expose_mem_pred__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.expose_simpl_pred

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred: coherence: source level Corelib.ssr.ssrbool.1253 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.expose_simpl_pred__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.forE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.forE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1531"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.fun_if

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.fun_if.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178", "Corelib.ssr.ssrbool.179"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.fun_of_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.fun_of_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.fun_of_rel

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.fun_of_rel; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1171"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.has_quality

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.has_quality; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1336"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homoLR

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.homoLR.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homoLR_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 12, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.homoLR_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homoRL

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.homoRL.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homoRL_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 12, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.homoRL_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homo_mono

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.homo_mono.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homo_mono_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 13, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_3, Corelib.ssr.ssrbool.homo_mono_in__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homo_sym

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.homo_sym.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homo_sym_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 3, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homo_sym_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.homo_sym_in11

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 5, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_1, Corelib.ssr.ssrbool.homo_sym_in11__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.idP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.idP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.not_false_is_true.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.idPn

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.idPn; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.is_true_true.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ifE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.ifE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ifF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.ifF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ifN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.ifN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ifP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.ifP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.if_spec: coherence: source level Corelib.ssr.ssrbool.178 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.ifP__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ifPn

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.ifPn; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.if_spec: coherence: source level Corelib.ssr.ssrbool.178 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_1, Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.ifPn__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ifT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.ifT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.if_arg

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.if_arg.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178", "Corelib.ssr.ssrbool.179"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.if_expr

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.if_expr; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.if_neg

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.if_neg.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.if_same

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.if_same.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.178"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.if_spec

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.if_spec; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.iffP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.iffP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implies

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.implies; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-template; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.impliesP

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.impliesP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.342", "Corelib.ssr.ssrbool.343"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.impliesPn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.impliesPn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyFb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implyFb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyNb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implyNb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.implyP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyPP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.implyPP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (7): Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.implyP__rocq2lean_obligation_4, Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.implyPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyTb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implyTb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implybE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implybE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implybF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implybF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implybN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implybN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implybNN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implybNN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implybT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implybT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyb_id2l

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyb_idl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implyb_idl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implyb_idr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implyb_idr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.implybb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.implybb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in1T

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in1T.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in1T__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in1W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in1W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in1W__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in1_sig

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in1_sig.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2085 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2085 does not hold for the solution"], ["c[] eo1", 2, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in1_sig__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in2T

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in2T.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in2T__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in2W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in2W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in2W__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in2_sig

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in2_sig.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2085 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2085 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in2_sig__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in3T

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in3T.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in3T__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in3W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in3W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in3W__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in3_sig

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in3_sig.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo3", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2085 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2085 does not hold for the solution"], ["c[] eo3", 6, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in3_sig__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.inE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 5, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inPhantom

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.inPhantom.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inT_bij

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.inT_bij.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inW_bij

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.inW_bij.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_applicative

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.in_applicative.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.applicative_mem_pred: coherence: source level Corelib.ssr.ssrbool.1253 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_collective

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.in_collective.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_inj_comp

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo3", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2022 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2022 does not hold for the solution"], ["c[] eo3", 9, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.in_inj_comp__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_mem

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.in_mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1215 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1215 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on1P

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on1P.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 8, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_on1P__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on1S

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on1S.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_on1S__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on1W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on1W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_on1W__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on1lP

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 8, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_on1lP__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on1lS

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_on1lS__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on1lW

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_on1lW__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on2P

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on2P.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 9, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.in_on2P__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on2S

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on2S.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_on2S__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_on2W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_on2W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_on2W__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_onS_can

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_onS_can__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_onW_can

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.in_onW_can__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.in_simpl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.in_simpl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inj_can_sym_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 10, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_3, Corelib.ssr.ssrbool.inj_can_sym_in__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inj_can_sym_in_on

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 14, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.inj_can_sym_in_on__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.inj_can_sym_on

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 8, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (5): Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_3, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_4, Corelib.ssr.ssrbool.inj_can_sym_on__rocq2lean_obligation_5.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introFn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introFn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introNTF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introNTF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introNf

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introNf.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.introP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.is_true_true.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introTF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introTF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introTFn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introTFn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.introTn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.introTn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.irreflexive

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.irreflexive; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.isSome

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.isSome; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.159"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.isT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.isT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.is_inl

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.is_inl; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.164", "Corelib.ssr.ssrbool.165"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.is_inleft

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.is_inleft; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.174"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.is_left

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.is_left; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.is_true_locked_true

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.is_true_true

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.is_true_true.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_mem

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.keyed_mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1110", "copies": ["Corelib.ssr.ssrbool.1110__c0", "Corelib.ssr.ssrbool.1110__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1345 solved as (some (u_Corelib_ssr_ssrbool_1110__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1345 does not hold for the solution"], ["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.keyed_mem__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_mem_simpl

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1110", "copies": ["Corelib.ssr.ssrbool.1110__c0", "Corelib.ssr.ssrbool.1110__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1345 solved as (some (u_Corelib_ssr_ssrbool_1110__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1345 does not hold for the solution"], ["c[]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.keyed_mem_simpl__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.keyed_pred; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {"universe_lowered": true, "sort_interp": true}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 5, "KERNEL_REJECTED"], ["i[pl,un]", 0, "UNIVERSE_REJECTED"], ["i[]", 4, "KERNEL_REJECTED"], ["i[un]", 1, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 4, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_predE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.keyed_predE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1345 solved as (some (u_Corelib_ssr_ssrbool_1110__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1345 does not hold for the solution"], ["c[] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_qualifier

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.keyed_qualifier; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 3, "KERNEL_REJECTED"], ["i[]", 3, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_qualifier_keyed

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1110", "copies": ["Corelib.ssr.ssrbool.1110__c0", "Corelib.ssr.ssrbool.1110__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.statement: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 2, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.keyed_qualifier_keyed__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.keyed_qualifier_suproof

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1348"], ["c[it] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1348; the argument must be the same, not u_Corelib_ssr_ssrbool_1348"], ["c[un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1348"], ["c[it,un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1348; the argument must be the same, not u_Corelib_ssr_ssrbool_1348"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1348"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1348; the argument must be the same, not u_Corelib_ssr_ssrbool_1348"], ["c[cu,lo] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.left_transitive

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.left_transitive; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrfun.eqfun: argument u_Corelib_ssr_ssrbool_1105 + 1: Corelib.ssr.ssrbool.1105 + 1 ≤ Corelib.ssr.ssrfun.96 is not entailed by the source universe graph, nor is Corelib.ssr.ssrfun.96 ≤ Corelib.ssr.ssrbool.1105 (with offset 0)"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.manifest_mem_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.manifest_mem_pred; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {"universe_lowered": true, "sort_interp": true}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 1, "KERNEL_REJECTED"], ["i[pl,un]", 0, "UNIVERSE_REJECTED"], ["i[]", 2, "KERNEL_REJECTED"], ["i[un]", 0, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.manifest_simpl_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {"universe_lowered": true, "sort_interp": true}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 2, "KERNEL_REJECTED"], ["i[pl,un]", 0, "UNIVERSE_REJECTED"], ["i[]", 2, "KERNEL_REJECTED"], ["i[un]", 0, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mem

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1239 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1239 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.memE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.memE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.memPredType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.memPredType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1213 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1213 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mem_mem

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.mem_mem.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 5, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mem_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.mem_pred; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-template; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mem_pred_value

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.mem_pred_value; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1105, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred: coherence: source level Corelib.ssr.ssrbool.1105 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1105 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mem_simpl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.mem_simpl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mem_topred

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.mem_topred.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | level u_Corelib_ssr_ssrbool_1110__c0 + 1 mentions u_Corelib_ssr_ssrbool_1110__c0, which is not a parameter of the declaration"], ["c[] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1253"], ["c[it] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu] eo1", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.mem: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mono1W_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.mono1W_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mono2W

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.mono2W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.monoLR

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.monoLR.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.monoLR_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 13, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.monoLR_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.monoRL

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.monoRL.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.monoRL_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 13, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.monoRL_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.monoW

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.monoW.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2175 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2175 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.monoW_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.monoW_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.monoW_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mono_sym

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.mono_sym.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mono_sym_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.mono_sym_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.mono_sym_in11

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2262 solved as (some (u_Corelib_ssr_ssrbool_1105__c0 + 1)): native fact Set lt Corelib.ssr.ssrbool.2262 does not hold for the solution"], ["c[] eo2", 6, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_1, Corelib.ssr.ssrbool.mono_sym_in11__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.nandP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.nandP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.nandP__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.negP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.not_false_is_true.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negPP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.negPP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (5): Corelib.ssr.ssrbool.negP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.not_false_is_true, Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.negPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negPf

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.negPf; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_1, Corelib.ssr.ssrbool.negPf__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negPn

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.negPn; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.is_true_true, Corelib.ssr.ssrbool.not_false_is_true.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbFE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbFE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbK

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbK.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbLR

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbLR.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbNE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbNE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbRL

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbRL.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negbTE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negbTE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negb_and

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negb_and.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negb_imply

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negb_imply.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negb_inj

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negb_inj.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.negb_or

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.negb_or.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.norP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.norP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.norP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.norP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.norP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.norP__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.notF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.notF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.not_false_is_true

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.ocan_in_comp

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo3", 2, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2052 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2052 does not hold for the solution"], ["c[] eo3", 13, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.ocan_in_comp__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1S

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1S.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1S__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1S_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1S_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 8, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1S_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1T

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1T.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1T__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1W__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1W_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1W_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1W_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1lS

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1lS.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lS__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1lS_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 8, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lS_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1lT

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1lT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lT__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1lW

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1lW.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lW__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on1lW_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on1lW_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on2S

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on2S.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2S__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on2S_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on2S_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 9, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2S_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on2T

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on2T.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2T__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on2W

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on2W.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2W__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on2W_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on2W_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 7, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on2W_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onPhantom

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.onPhantom.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1694"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onS_can

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.onS_can.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onS_can__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onS_can_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 9, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onS_can_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onT_bij

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.onT_bij.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onW_bij

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.onW_bij.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onW_can

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.onW_can.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onW_can__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.onW_can_in

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.onW_can_in__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.on_can_inj

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 6, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_1, Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_2, Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_3, Corelib.ssr.ssrbool.on_can_inj__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or3

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.or3; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or3P

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.or3P; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.or3P__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or3_ind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.or3_ind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or3_sind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.or3_sind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or4

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.or4; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[pl]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or4P

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.or4P; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (5): Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_1, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_2, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_3, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_4, Corelib.ssr.ssrbool.or4P__rocq2lean_obligation_5.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or4_ind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.or4_ind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.or4_sind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.or4_sind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orFb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orFb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orKb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orKb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orNb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orNb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.orP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orPP

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.orPP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (7): Corelib.ssr.ssrbool.orP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_3, Corelib.ssr.ssrbool.orP__rocq2lean_obligation_4, Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_1, Corelib.ssr.ssrbool.orPP__rocq2lean_obligation_2, Corelib.ssr.ssrbool.iffP__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orTb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orTb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbAC

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbAC.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbACA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbACA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbC

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbC.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbCA

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbCA.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbF

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbF.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbK

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbK.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbN

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbN.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbT

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbT.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orb_andl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orb_andl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orb_andr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orb_andr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orb_id2l

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orb_id2l.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orb_id2r

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orb_id2r.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orb_idl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orb_idl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orb_idr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orb_idr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.orbb

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.orbb.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pair_andP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.pair_andP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pcan_in_comp

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo3", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2043 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2043 does not hold for the solution"], ["c[] eo3", 12, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_1, Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_2, Corelib.ssr.ssrbool.pcan_in_comp__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pcan_in_inj

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2010 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2010 does not hold for the solution"], ["c[] eo2", 4, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_1, Corelib.ssr.ssrbool.pcan_in_inj__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pre_symmetric

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pre_symmetric; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred0

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred0; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1133 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1133 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predArgType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predArgType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predC

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predC; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1145 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1145 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predD

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predD; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1149 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1149 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predI

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predI; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1137 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1137 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predPredType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predPredType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1121 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1121 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predT

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predT; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1135 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1135 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predType; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-template; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.predU

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.predU; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1141 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1141 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred_key

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred_key; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred_oapp

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred_oapp; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2049 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2049 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred_of_argType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred_of_argType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred_of_mem

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred_of_mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1208"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.pred_sort

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.pred_sort; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1111 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1111 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.preim

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.preim; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1154 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1154 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_congr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_congr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_for

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_for; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1531"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in1; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in11

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in11; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in111

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in111; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in12

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in12; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in2

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in2; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in21

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in21; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_in3

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_in3; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1531 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1531 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_on1

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_on1; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1532 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1532 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.prop_on2

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.prop_on2; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1532 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1532 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.qualifE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.qualifE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1343 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1343 does not hold for the solution"], ["c[] eo1", 3, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.qualifier

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.qualifier; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-template; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.reflexive

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.reflexive; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.registered_applicative_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.registered_applicative_pred; target declaration kind: inductive.
- Source kind: inductive / inductive.
- Dispatch rule: inductive/generated-levels; mechanisms actually enabled: {"universe_lowered": true, "sort_interp": true}.
- Attempt sequence (label, milliseconds, result): [["i[di]", 0, "DISCOVERED"], ["i[pl]", 1, "KERNEL_REJECTED"], ["i[pl,un]", 1, "UNIVERSE_REJECTED"], ["i[]", 0, "KERNEL_REJECTED"], ["i[un]", 1, "UNIVERSE_REJECTED"], ["i[lo,pl,un]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.rel

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.rel; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.relU

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.relU; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1181 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1181 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.rel_of_simpl

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.rel_of_simpl; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1177 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1177 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.relpre

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.relpre; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1188 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1188 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.rev_trans

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.rev_trans.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1527"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.right_transitive

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.right_transitive; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrfun.eqfun: argument u_Corelib_ssr_ssrbool_1105 + 1: Corelib.ssr.ssrbool.1105 + 1 ≤ Corelib.ssr.ssrfun.96 is not entailed by the source universe graph, nor is Corelib.ssr.ssrfun.96 ≤ Corelib.ssr.ssrbool.1105 (with offset 0)"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.rwP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.rwP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.rwP2

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.rwP2.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sameP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sameP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.simplPredType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.simplPredType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1166 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1166 does not hold for the solution"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.simpl_of_mem

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.simpl_of_mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1229 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1229 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.simpl_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.simpl_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.simpl_predE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.simpl_predE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.simpl_pred_value

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.simpl_pred_value; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | level u_Corelib_ssr_ssrbool_1126__c0 + 1 mentions u_Corelib_ssr_ssrbool_1126__c0, which is not a parameter of the declaration"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1126, not u_Corelib_ssr_ssrbool_1253"], ["c[it]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1126 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1126, not u_Corelib_ssr_ssrbool_1253"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1126 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1126, not u_Corelib_ssr_ssrbool_1253"], ["c[it,cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.simpl_pred: coherence: source level Corelib.ssr.ssrbool.1126 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1126 u_Corelib_ssr_ssrbool_1253; the argument must be the same, not u_Corelib_ssr_ssrbool_1253"], ["c[cu,lo]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.simpl_rel

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.simpl_rel; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sort_of_predArgType

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.sort_of_predArgType; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in1

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in1.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 2, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in11

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in11.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in111

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in111.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in12

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in12.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2134 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2134 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in2

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in2.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2112 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2112 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in21

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in21.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo2", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2150 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2150 does not hold for the solution"], ["c[] eo2", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in3

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_in3.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.2121 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.2121 does not hold for the solution"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_in_bij

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 5, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_in__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_mem

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_mem; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1226 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1226 does not hold for the solution"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sub_refl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sub_refl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1237"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subon1

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.subon1.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subon1l

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.subon1l.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1", "Corelib.ssr.ssrbool.1169__c2"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 4, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subon2

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.subon2.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 3, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subon_bij

- Result: statement with explicit proof parameters to discharge; not a proved theorem.
- Lean name: RocqPending.Corelib.ssr.ssrbool.subon_bij.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"level_copies": [{"level": "Corelib.ssr.ssrbool.1169", "copies": ["Corelib.ssr.ssrbool.1169__c0", "Corelib.ssr.ssrbool.1169__c1"]}]}.
- Attempt sequence (label, milliseconds, result): [["c[]", 7, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (3): Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_1, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_2, Corelib.ssr.ssrbool.bijective_on__rocq2lean_obligation_3.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subpred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.subpred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1107"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subrel

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.subrel; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1173"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subrelUl

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.subrelUl.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1199 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1199 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.subrelUr

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.subrelUr.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1201 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1201 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sumboolP

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.sumboolP; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sym_left_transitive

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.left_transitive: coherence: source level Corelib.ssr.ssrbool.1473 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.sym_right_transitive

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.right_transitive: coherence: source level Corelib.ssr.ssrbool.1473 is a motive level of the referring declaration but not of the referenced one"], ["c[] eo1", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.symmetric

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.symmetric; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.symmetric_from_pre

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.topred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.topred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 2, "KERNEL_REJECTED | (kernel) application type mismatch\n  @Rocq.Corelib.ssr.ssrbool.pred_sort T\nargument has type\n  Type u_Corelib_ssr_ssrbool_1105\nbut function has type\n  (T : Type (u_Corelib_ssr_ssrbool_1105 + 1)) →\n    @Rocq.Corelib.ssr.ssrbool.predType T → Type u_Corelib_ssr_ssrbool_1110__c1"], ["c[]", 0, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.topredE

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.topredE.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 1, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.total

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.total; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.transitive

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.transitive; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.1473"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unfold_in

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.unfold_in.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad] eo1", 0, "UNIVERSE_REJECTED | proof-local level Corelib.ssr.ssrbool.1253 solved as (some 1): native fact Set lt Corelib.ssr.ssrbool.1253 does not hold for the solution"], ["c[] eo1", 2, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unkey_pred

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.unkey_pred; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"universe_lowered": true}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1121"], ["c[]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[un]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,un]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu]", 1, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is shared with the referring declaration, so its argument must be u_Corelib.ssr.ssrbool.1110, not u_Corelib_ssr_ssrbool_1345"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.pred_sort: coherence: source level Corelib.ssr.ssrbool.1110 is a proof-local level of the referring declaration, solved as max u_Corelib_ssr_ssrbool_1110 u_Corelib_ssr_ssrbool_1345; the argument must be the same, not u_Corelib_ssr_ssrbool_1345"], ["c[cu,lo]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unkey_qualifier

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.unkey_qualifier; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 2, "UNIVERSE_REJECTED | reference to Rocq.Corelib.ssr.ssrbool.keyed_qualifier: coherence: source level Corelib.ssr.ssrbool.1348 is a motive level of the referring declaration but not of the referenced one"], ["c[]", 1, "TRANSLATED_AND_CHECKED"]]。
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unless

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.ssr.ssrbool.unless; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.355", "Corelib.ssr.ssrbool.356"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unlessL

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.unlessL; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.359", "Corelib.ssr.ssrbool.361"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.unlessL__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unlessP

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.unlessP.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unlessR

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.unlessR; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.366", "Corelib.ssr.ssrbool.368"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.unlessR__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unless_contra

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.unless_contra; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.407"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.unless_contra__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.unless_sym

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.ssr.ssrbool.unless_sym; target declaration kind: opaque.
- Source kind: constant / opaque_data.
- Dispatch rule: constant/opaque_data; mechanisms actually enabled: {"admitting_levels": ["Corelib.ssr.ssrbool.374", "Corelib.ssr.ssrbool.375"]}.
- Attempt sequence (label, milliseconds, result): [["c[ad]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (1): Corelib.ssr.ssrbool.unless_sym__rocq2lean_obligation_1.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.wlog_neg

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.wlog_neg.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.xorPif

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.xorPif.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.ssr.ssrbool.xorPifn

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.ssr.ssrbool.xorPifn.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.
