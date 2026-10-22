# Document Reading Guide

All copied files and their repository sources can be found at [FILES.json](FILES.json). See also [EXPORT_FILES.md](EXPORT_FILES.md) for each file of the original run.

| path | Purpose |
|---|---|
| README.md | Entry, Scope, Reading Order and Limitations. |
| SCOPE.md | The accurate source of 709/839/2180. |
| lean/KernelExample.lean | Mechanical constructor and additive reduction example, using existing output environment. |
| TRANSLATION_FLOW.md | Stage-by-stage explanation of nat and add, distinguishing between actual recording and explanation. |
| DECLARATIONS.md / .csv | Browsable/filterable index of 99 topic roots. |
| declarations/< source name>.md / .json | Each translation, source IR, target AST, attempt, conditions and corresponding certificate. |
| source/*.v | Three complete Rocq source modules, including original annotations and non-thematic content. |
| lean/*.txt | Lean is the actual printing result, not an independent module. |
| lean/*.lean | Import/print entry, referencing the remote freeze path. |
| records/*.json | Item-by-item documentation of three complete modules. |
| exports/< module>/ | Key export/translation/validation files; with dependency closures. |
| correspondence/*.lean | Complete proof profile, dependent on the production environment. |
| correspondence/fragments/ | Proof snippets for constructors, recursion, arithmetic/comparisons/bit operations, etc. |
| correspondence/audits/ and logs/ | Existing certificate types, axiom dependencies, and check logs. |
| correspondence/DECLARATIONS.csv | Corresponding coverage and gaps of item 99. |
| CORRESPONDENCE.md | Corresponding explanations of types, constructors, operations, and eliminators. |
| CORELIB_NAT_REFERENCES.csv | The target AST in the entire 2180 root range directly refers to the index of the mechanical Nat/ operation, non-transitive closure. |
| summary.json | Scope, status and roots to be proven. |
| verify.py / VALIDATION.json | Document review and major proof revalidation scripts/results. |
| build.py | Deterministic reconstruction from existing results without re-translation. |
| .work/ | Only the remote verification cache/log is left, which is gitignore. |
