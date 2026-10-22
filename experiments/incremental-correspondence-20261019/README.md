# Increment correspondence workspace

The original frozen mechanical version has completed **2100 / 2180 deduplicated source roots**, after ninety batches of incremental work; [calculation of the transparent variant ](transparent-data/README.md) has been completed **2180 / 2180**, and passed full regression and co-import. The following table counts the original frozen versions. Plan: [PLAN.md](PLAN.md); Dependency graph: [DAG.md](DAG.md); [Specific example ](../../results/CORRESPONDENCE_EXAMPLES.md).

"Complete" means that the bidirectional inverse of the type in the explicit scope, the specified native operation correspondence, or the native statement iff has been proved. Only interfaces, partial native statements, or correspondences that have not yet been closed are not counted.

| Main category | freeze baseline | current |
|---|---:|---:|
| Type correspondence | 29 | 164 |
| Operation/predicate correspondence | 114 | 908 |
| completely native statement | 143 | 1028 |
| only interface | 375 | 6 |
| Partial native statement | 702 | 0 |
| No certificate yet | 485 | 57 |
| The conditional root has not yet completed its correspondence | 331 | 17 |
| Non-Prop special statements have not been processed yet | 1 | 0 |

The type count measures source roots, including type aliases, type constructors, and bridged Type-valued statements; it is not the number of distinct datatype. Native targets are classified as existing API, composed native expressions, and native representations; see certificate field target_class. A statement iff does not automatically prove the original theorem; 318 separate Prop proofs establish original statements.

Mechanically derived, there are still 331 with explicit conditional roots; the correspondence layer has instantiated 314 of them with closed proofs and completed the correspondence. The remaining 17 condition categories are incomplete and lack prerequisite proofs: for example, the 5 data selection functions of ssrbool have proven preconditions, but still lack corresponding results.

## New in this round

[The 90th batch of ](BATCH90_RESULTS.md) completed 5 transparent SSR predicate package. After clear bidirectional conversion of the bearer type, the predicate field of boolfunPredType, predPredType, memPredType, and simplPredType is equal to the native (A → Bool, id); clone_pred corresponds to the native Sigma packaging. There is no requirement that different bearer types be directly equal.

Currently **2100 / 2180**, 80 roots remain. Root-by-root inspection found 69 opaque roots and 11 transparent packages that depended on opaque, all of which were non-Prop values; the actual calculation body still remained in the Lean environment. See [Text review ](reports/REMAINING_BODY_AUDIT.json). This in itself is not proof that these constants cannot correspond, but it provides specific directions for the next step.

[Independent computational transparency experiment ](transparent-data/PLAN.md) exports the retained mechanical body as an expandable definition in the new namespace, and then proves the correspondence. 80/80 candidate roots have been completed, and six groups of proofs have been jointly imported; the existing 2100 roots have also passed the regression of 173 profile, and were jointly imported successfully with 6 new profile. The results are counted separately without overwriting the old opaque constant and not mixing into the original baseline coverage.

## Validation scope

166 increments Lean profile have successful verification records matching the current source code and dependent products. 1848 incremental coverage certificates have been co-imported for inspection, see [Co-import record ](reports/interop/all/import-all-validation.json).

New proof checks axiom closure. Specifies the native target recursion check type, body, and NativeBridge auxiliary definition, and does not allow hidden source symbols. Restricted scope or function correspondence is assumed to be preserved in certificate scope and the complete type.

Mechanical nat/eq remains unchanged. The old baseline proof uses the existing verification results; this round does not rerun all mechanical translations or all old proofs. The new Mathlib bit operations correspond to actual compilation; the old digital printing and Nat/SSR/Setoid consumption examples follow the existing verification. For details, see [Cross-module consumption ](INTEROP_RESULTS.md).

## product

- [Cover the ledger ](reports/CORELIB_LEDGER.csv), [Abstract ](reports/summary.json), [Task list ](tasks.csv)] root by root.
- [Complete certificate type and axiom closure ](reports/CERTIFICATES.md), [Machine-readable certificate ](reports/certificates.json).
- certificates.json: Clear source root → certificate registry; make_report.py only counts registration items that pass the check.
- proofs/: Complete Lean corresponding certificate; [CMorphisms module ledger ](reports/cmorphisms-module-coverage.json).
- [Conditional closure evidence ](reports/condition-discharges.json), [Verify ](reports/validation.json) one by one profile.
- Compile files, detection scripts and temporary output are only in remote .work and are not synchronized to Git or Mac.

## Recurrence

Execute in this directory:

    python3 verify.py
    python3 make_report.py
    python3 interop/pack_all.py
    python3 interop/check_all.py
    python3 make_report.py

Mathlib profile uses the same Lean toolchain and libraries that are already installed remotely. The above command will be completely rechecked; batches 86 to 89 will incrementally compile four files covering profile and three dependencies to support profile, and perform all common import checks.
