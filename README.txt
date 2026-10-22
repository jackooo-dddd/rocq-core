CURRENT UPDATE 2026-10-19: This file below describes a historical 839-root/early baseline. Current 2180-root mechanical nat/eq results and correspondence proofs are indexed in README.md, RESULTS.md and results/corelib-complete/ALL_RULES.md.

Scope: 24 Corelib files, 839 declarations of previous base modules, not all installed Corelib files.
The statistical unit is an exported global constant or a mutual inductive block; the constructors are listed inside the inductive block and do not increase the number of root declarations separately. Automatically generated eliminators count as constants; modules, tokens, and strategy commands are not claims in this statistic.
The original project source code has not been modified, submitted or pushed.
Baseline: 574 without additional conditions, 75 with conditions, 190 blocked.
Isolation candidates: 569 without additional conditions, 81 with conditions, 189 blocked.
The checkable items have been increased from 649 to 650; the new addition is only the theorem statement eq_existT_curried_congr, there are still 3 explicit premises, and no theorem proof has been obtained.
There are no new success items for common data types and functions. In addition, the theorem statement 5 that originally had no additional conditions has a new condition, so it is a costly candidate and has not been integrated into the original project.

In addition, the conditional statement of item 6 has changed the list of conditions (the condition number of item 4 has increased, the number of items in 1 has decreased, and the number of items in 1 has been the same but the conditions have changed); see experiments/root-obligation-delta.json for a complete comparison before and after.

Directory:
index.html/improved/index.html: baseline/candidate file-by-file entry.
rule-improvements.html / .txt: six groups of experiments, final candidates, item-by-item changes, and subsequent missing abilities.
Corelib/.../X.v: Copy of source file.
Corelib/.../X.lean: Actual translation entry, use #rocq2lean_import to generate kernel declaration.
Corelib/.../X.kernel.txt: actual Lean #print definition.
Corelib/.../X.report.html / .txt: Each success/failure and translation process.
Corelib/.../X.json: Complete machine-readable result of the module.
Corelib/.../X/records/0000.json: Single complete source IR, target AST, all attempts and conditions.
Corelib/.../X/: export, roundtrip, consumer, audit, log and olean.
improved/Corelib/...: Candidate results with the same structure.
translator/: Baseline 3c79203 plus uncommitted candidate; candidate.patch is the exact code difference.
experiments/: Groups of trials, differences and test evidence.
source-extraction-errors.json: 52 item extraction failed with actual check phase and type error.
artifact-validation.json: product and inspection results.

Use:
Each .lean has its own dependency closure and should be used as an independent unit. 24 files cannot be directly import at the same time.
.lean is the executable entry of the translator, not the handwritten source code separated from the translator; readable definition is in kernel.txt and itemized report.
Equality.lean explicitly reports export failure. Ltac, Notations, and Tauto are not included in the kernel declaration, which does not mean that the strategy/notation has been translated.
The theorem only outputs .statement : Prop; pending is an explicit assumption and cannot be regarded as a proven proof or unconditional conclusion.
The process comes from real IR, tier attempts and kernel output; AST node mapping is a static description and does not pretend to be an instruction-by-instruction execution track.

Verification:
Lean 4.33.1 / Rocq 9.3.0. 20 modules with exportable declarations were compiled through source roundtrip, Lean consumer, unmodified standalone audit, kernel output and entry under baseline and candidate respectively.
The statement suite passed: including proof that changes do not affect the output, certainty, statement tampering negative examples, and rejecting the submitted negative examples of sorry/axiom.
This round has not re-run the complete 4, 474 and Prosa protection roots; the protection list has not been changed. Candidate code remains isolated.
The reproduction script is located in scripts/ and reads the existing frozen census input and installed tool chains; all current round output is in this directory.
