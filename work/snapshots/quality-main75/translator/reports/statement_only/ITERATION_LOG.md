## 2026-10-18 — isolated core-by-file candidate (not merged)

Scope: previously measured 24 Corelib files / 839 declarations, baseline 3c79203.
All outputs live in ~/research/rocq-core-by-file-20261018; original project unchanged.
Exporter Prod/Lambda descent now pushes rewritten domains, matching LetIn handling.
Source recheck diagnostics include the exact stage and Rocq type error.
ROCQ2LEAN_LEAN_THREADS optionally bounds workers. Auditor/protected roots unchanged.

Six experiments: ../experiments/trial-summary.json. Final counts:
574/75/190 -> 569/81/189 (unconditional/conditional/blocked).
eq_existT_curried_congr is newly conditional; five statements acquire obligations.
Two blocked rows change failure stage. No datatype/function newly accepted.

Validation: whole core scope and 20 per-file measured entries pass source roundtrip,
kernel consumer, unchanged audit and entry compilation. scripts/test-statement passes,
including proof-insensitivity, determinism and negative controls.
Full 4,474-root Prosa corpus not rerun. No commit or push.

Additional observation: six already-conditional core statements change their obligation lists (four grow, one shrinks, one changes at the same length). See ../experiments/root-obligation-delta.json.
