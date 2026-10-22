Corelib.Init.Sumbool

Original file: /home/shunqwang4/.opam/rocq930-mc/lib/coq/theories/Init/Sumbool.v
Frozen run: /home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/Init/Sumbool
Original root declarations: 7; currently blocked: 0; checks: {'roundtrip_exit': 0, 'roundtrip': 'OK', 'translate_exit': 0, 'consumer_exit': 0, 'audit_exit': 0, 'consumer': 'OK', 'audit': 'OK'}.

[Rocq source](Sumbool.v) · [Lean entry point](Sumbool.lean) · [Lean printed output](Sumbool.txt) · [Complete per-declaration records](Sumbool.json)

---

Corelib.Init.Sumbool.bool_eq_ind

- Result: theorem/axiom statement with no proof parameters to discharge; not a proved theorem.
- Lean name: Rocq.Corelib.Init.Sumbool.bool_eq_ind.statement; target declaration kind: statement.
- Source kind: constant / statement_only.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: STATEMENT_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Init.Sumbool.bool_eq_rec

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Init.Sumbool.bool_eq_rec; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {"type_lift_coercions": 4}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Init.Sumbool.32 solved as (some 0): native fact Set lt Corelib.Init.Sumbool.32 does not hold for the solution"], ["c[it]", 1, "UNIVERSE_REJECTED | proof-local level Corelib.Init.Sumbool.32 solved as (some 0): native fact Set lt Corelib.Init.Sumbool.32 does not hold for the solution"], ["c[un]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Init.Sumbool.32 solved as (some 0): native fact Set lt Corelib.Init.Sumbool.32 does not hold for the solution"], ["c[it,un]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Init.Sumbool.32 solved as (some 0): native fact Set lt Corelib.Init.Sumbool.32 does not hold for the solution"], ["c[cu]", 1, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Init.Sumbool.32] on a pending artifact: the source instance is not checkable"], ["c[it,cu]", 0, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Init.Sumbool.32] on a pending artifact: the source instance is not checkable"], ["c[cu,lo]", 0, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Init.Sumbool.32] on a pending artifact: the source instance is not checkable"], ["c[it,cu,lo]", 1, "UNIVERSE_REJECTED | R2B-P levels #[Corelib.Init.Sumbool.32] on a pending artifact: the source instance is not checkable"], ["c[de]", 0, "UNSUPPORTED_FEATURE"], ["c[fr,it,cu,lo,de]", 0, "UNSUPPORTED_FEATURE"], ["c[ul]", 0, "UNIVERSE_REJECTED | proof-local level Corelib.Init.Sumbool.32 solved as (some 0): native fact Set lt Corelib.Init.Sumbool.32 does not hold for the solution"], ["c[it,ul]", 1, "PENDING_KERNEL_CHECKED"]]。
- Proof parameters to discharge (2): Corelib.Init.Sumbool.bool_eq_rec__rocq2lean_obligation_1, Corelib.Init.Sumbool.bool_eq_rec__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Init.Sumbool.bool_of_sumbool

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Init.Sumbool.bool_of_sumbool; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Init.Sumbool.sumbool_and

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Init.Sumbool.sumbool_and; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 1, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_1, Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_2, Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_3, Corelib.Init.Sumbool.sumbool_and__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Init.Sumbool.sumbool_not

- Result: complete definition/data type, with no proof parameters to discharge.
- Lean name: Rocq.Corelib.Init.Sumbool.sumbool_not; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "TRANSLATED_AND_CHECKED"]].
- Proof parameters to discharge (0): none.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: TRANSLATED_AND_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Init.Sumbool.sumbool_of_bool

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Init.Sumbool.sumbool_of_bool; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (2): Corelib.Init.Sumbool.sumbool_of_bool__rocq2lean_obligation_1, Corelib.Init.Sumbool.sumbool_of_bool__rocq2lean_obligation_2.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.

---

Corelib.Init.Sumbool.sumbool_or

- Result: definition with explicit proof parameters to discharge.
- Lean name: RocqPending.Corelib.Init.Sumbool.sumbool_or; target declaration kind: def.
- Source kind: constant / transparent.
- Dispatch rule: constant/transparent; mechanisms actually enabled: {}.
- Attempt sequence (label, milliseconds, result): [["c[]", 0, "PENDING_KERNEL_CHECKED"]].
- Proof parameters to discharge (4): Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_1, Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_2, Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_3, Corelib.Init.Sumbool.sumbool_or__rocq2lean_obligation_4.
- Additional Sort quality branches: 0 (1 representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.
- Baseline status: PENDING_KERNEL_CHECKED; stage: result already present in the baseline.
- Baseline reason: no blocking issue.
- Baseline failure path: not recorded / no failure.
