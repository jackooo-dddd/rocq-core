# Current Corelib mechanical translation and correspondence proofs

Mechanical translation snapshot: experiments/mechanical-nat-eq-20261019/runs/full-v1. It covers 67 source modules and 2180 distinct roots, with 0 blocked roots and 0 validation failures. nat/eq use separate inductive structures; correspondence is proved afterward.

The mechanical outputs contain 1003 definitions/data types, 846 unconditional statements, 148 conditional definitions, and 183 conditional statements. Explicit conditions remain in 331 outputs. An ordinary theorem statement is not a proof of that theorem.

## Correspondence results

| Version | Type correspondences | Operation correspondences | Native statement iff | Completed roots | Remaining |
|---|---:|---:|---:|---:|---:|
| Original frozen mechanical version | 164 | 908 | 1028 | 2100 / 2180 | 80 |
| Computationally transparent variant | 164 | 988 | 1028 | 2180 / 2180 | 0 |

The variant re-exports non-Prop opaque data declarations whose bodies are retained as def in separate namespaces. It preserves their types, universes, and bodies modulo renaming and checks them again in the kernel. It does not claim a proved value equality between an old opaque constant and the new definition. The production translator/ and the original frozen mechanical outputs retain their existing semantics.

All original 2100 roots are rechecked through 173 profiles, and the 80 new roots are proved through 6 profiles. Combined imports, standard-axiom checks, and Mathlib consumer examples all pass. The count of 2180 measures per-root coverage; see each certificate for its parameter and quality-branch scope. The 1028 statement iff proofs are not 1028 proofs of source theorems; another 318 Prop proofs establish original statements separately.

## Entry points

- [Variant description, proofs, and reproduction](experiments/incremental-correspondence-20261019/transparent-data/README.md)
- [Full-variant per-root ledger](experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_LEDGER.json)
- [Full-variant validation summary](experiments/incremental-correspondence-20261019/transparent-data/reports/FULL_VARIANT_SUMMARY.json)
- [Original frozen correspondence ledger](experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)
- [Concrete correspondences and consumer examples](results/CORRESPONDENCE_EXAMPLES.md)
- [Per-module mechanical translations, target ASTs, and conditions](results/corelib-complete/README.md)
- [All 2180 mechanical translation results](results/corelib-complete/declarations.csv)
- [Used rules](results/USED_RULES.md), [all rules](results/corelib-complete/ALL_RULES.md), and [usage counts](results/corelib-complete/RULE_USAGE.md)
- [Universe statistics](results/corelib-complete/UNIVERSES.md)
- [Correspondence scope](results/corelib-complete/CORRESPONDENCE.md)

Native targets include existing APIs, composed expressions, and representation models. Correspondence for a symbolic floating-point algorithm does not establish correspondence with the runtime Float API. Certificates for every Corelib root do not imply automatic interoperability for all of MathComp or Prosa.

Build caches, full compiler logs, and temporary inputs remain only in the remote .work directory. The original mechanical nat/eq migration and individual batch results are retained as historical records.
