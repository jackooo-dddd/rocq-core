# Success path statistics of M class rules

Result: Original 34 rules + 10 M rules hit by actual measurement, a total of 44 entries with evidence. M08, M10, and M13 have zero hits. After closing, 67 modules and 2180 roots pass through independent consumer/audit again, and the target statement remains unchanged.

[Itemized statistics ](M_RULE_USAGE.json) · [Disabled rerun ](M_PRUNING_VALIDATION.json) · [Attribution test ](INSTRUMENTATION_TESTS.json) · [Non-M range ](NON_M_SCOPE.md)

Taking the 34 existing evidence entries of the original USED_RULES.md as a starting point, complete the independent records of M01–M13. Entries without hit evidence are not added to USED_RULES; the complete rule directory can still save candidate mechanism descriptions.

Measurement distinction:
- The transformation branch produces results that are recorded in the final preserved translation environment.
- Attempts that have been rolled back: are not counted in the retention record.
- Zero hit: Remove from USED_RULES, disable the corresponding path and rerun, check that all 2180 roots and original types, texts, and conditions remain unchanged.

The record is saved in the Lean environment extension. Normally saveState / restore will be rolled back at the same time; if the retry of constant and induction declarations returns a failure status normally, the record before the attempt will also be explicitly restored. M01 is logged after the construction of recursor, which depends on match, is completed; M02 is logged after the convoy or known constructor reduction of non-uniform match is completed. M03–M13 are recorded according to their respective effective conditions. Entering transFix or trying to call the repair function cannot be regarded as a hit.

M08 makes a structural equality comparison of IR before and after recursive exposure, and only actual changes are recorded. M13 excludes direct returns that are originally defined as equal and do not require repair.

In the original 34 article, C-aggregate, L03, U04, etc. still contain sub-mechanisms that combine statistics; this work does not automatically add these sub-mechanisms as independent rules, nor does it declare a priori that "34 + M has covered all code paths".

The original export, compiled files and logs are located in remote .work/used-rule-coverage-20261019/ and are not published to Git.

Reappearance entrance:

    python3 experiments/used-rule-coverage-20261019/prepare.py
    LEAN_NUM_THREADS=1 ~/.elan/bin/lake -d .work/used-rule-coverage-20261019/translator build Rocq2Lean Rocq2Lean:shared
    python3 scripts/corelib_lab.py --translator .work/used-rule-coverage-20261019/translator --out .work/used-rule-coverage-20261019/full
    python3 experiments/used-rule-coverage-20261019/analyze.py

When full already exists, corelib_lab will continue to run; the old directory must be saved for re-measurement. analyze.py makes a statement-by-statement comparison with the original mechanical baseline saved remotely.

M subset translation entry after measurement is completed:

    python3 experiments/used-rule-coverage-20261019/translate.py --input /path/source.ndjson --out /path/output

This entry only closes the zero-hit M path verified by a complete rerun; other mechanisms follow the original implementation and do not claim to have excluded non-M paths one by one.

The attribution test also covers retries that normally return KERNEL_REJECTED: the conversion record that has been generated must be cleared; the accepted Nat.add retains M03, and the closed M03 rejects the statement. It can be reproduced by running check_instrumentation.py.
