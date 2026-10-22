# nat / eq fully mechanical translation baseline

This version also treats nat and eq of Rocq as general inductive type mechanical translations.
Their source declaration, constructor, reference and destruction follow the existing general rules, and the source type is no longer mapped to Lean native Nat/Eq.

Working directory: `experiments/mechanical-nat-eq-20261019`.
New version of translator: `translator/`; complete file-by-file result: `results/`.
This directory is an independent experimental version. You must explicitly use the translator path here when running this version.

## Result

67 Corelib source files, 2180 root statements, 0 items were blocked, and 0 items failed to verify.
Among them, 51 files contain kernel roots; 16 files only involve notation/tactic/ configuration, etc., and are not counted as kernel translation statements.

| Classification | Quantity |
|---|---:|
| Complete definition/data type, with no proof parameters to discharge | 1003 |
| Theorem/axiom statement, no parameters to be proved | 846 |
| Definition with explicit proof parameters to discharge | 148 |
| Statements with explicit arguments to be proved | 183 |
| Native bootstrap mapping | 0 |
| Blocked | 0 |

"The statement passes the inspection" does not prove that the original theorem is established; the original parameters to be proved in 331 are still clearly retained.
What was completed in this round is a new mechanical translation baseline, without eliminating these existing proof conditions.

Compared to quality-main75, there are only two source declared state changes:

- Corelib.Init.Datatypes.nat：BOOTSTRAP_RESOLVED → TRANSLATED_AND_CHECKED。
- Corelib.Init.Logic.eq：BOOTSTRAP_RESOLVED → TRANSLATED_AND_CHECKED。

In addition, the status of the 2178 item remains consistent; the complete range has not been added or deleted.
The original complete definition/data type of the 1001 item, plus these two general inductive types, becomes the 1003 item.

## What are nat and eq now?

Actual build target:

- `Rocq.Corelib.Init.Datatypes.nat`, constructors `nat.O`, `nat.S`, own `nat.rec`.
- `Rocq.Corelib.Init.Logic.eq`, type `(A : Sort u) → A → A → Prop`,
  Constructor `eq.eq_refl`, own `eq.rec`.

They are the newly generated inductive, not the native type abbrev.
The test has checked that the two are not equal to the Lean, Nat, and Eq definitions respectively.
Addition and multiplication of mechanical Nat can be reduced in the kernel; dependency elimination of mechanical eq and reduction of refl are also checked.

Lean Nat/Eq can still be used internally by the translator to handle metadata, primitive models, and auxiliary proofs.
This is different from mapping the Rocq source declaration to a native type. The audit requires that all source nat/eq references correspond to build statements.

## Changes and Evidence

Three implementation files:

- `translator/Rocq2Lean/Bootstrap.lean`: The bootstrap table is empty.
- `translator/tools/audit.py`: The independently audited bootstrap table is empty.
- `translator/tools/preflight.py`: The prechecked bootstrap table is empty.

No new translation rules are added; existing inductive types, recursion, dependency elimination and universe processing are reused.
`mechanical-nat-eq.patch` is a patch for these three files relative to the frozen quality-main75 translator.

Verification includes:

1. Each module with kernel roots: Rocq source roundtrip, independent Lean consumer, independent structural audit.
2. Full range comparison to old baseline: 2180 exactly consistent with roots, no status or validation regressions.
3. Check that all occurrences of source nat/eq in the output are of type Generate Induction, BOOTSTRAP_RESOLVED is not allowed.
4. `tests/MechanicalIdentity.lean`: Type identity, constructor, recursor, mechanical eq dependencies eliminated.
5. `tests/NatCompute.lean`: Check for actual addition, multiplication reduction using the mechanical O/S constructor.
6. Intentional restoration of old nat/Eq bootstrap Report: Python Audit and independent Lean consumer both rejected.
7. Complete statement suite, including Prosa FinishTime, statement tampering, proving irrelevance,
   Certainty, and negative examples such as sorry/falsified axioms/misstatements.
8. 67 file-by-file Lean display entry is recompiled and the actual printing results are saved.

Main summary: `VALIDATION.json`, `baseline-delta.json`, `results/summary.json`.
Test log: `logs/MechanicalIdentity.log`, `logs/NatCompute.log`, `logs/statement-suite.log`.

## Results corresponding to each source file

`results/Corelib/.../Name.v`: Original Rocq source file.
`Name.lean`: The mechanical translation entry and print command of this file.
`Name.txt`: Lean actual printed type and body.
`Name.md` / `Name.json`: Results, proof parameters, rules and verification records for each claim.
`results/declarations.csv`: List of all 2180 items.

File-by-file entries contain their own dependency closures, and there is no guarantee that all entries can be placed together in the same environment import.
The complete original run is saved in `runs/full-v1/`.

## run

Execute in this directory of the remote workstation:

```sh
python3 test_mechanical.py
python3 test_no_bootstrap.py
python3 results/run_lean_entry.py Corelib/Init/Nat.lean
```

See `run_probe.py` and `finish.py` for full measurement commands; new measurements should use the new output directory,
Because the measuring instrument will reuse the existing result.json.

## Completed follow-up correspondence

After the mechanical translation stage is completed, the correspondence between mechanical nat/eq and Lean native Nat/Eq has been established in the independent mechanical-correspondence-20261019 experiment.
Proven bidirectional transformations, two round-trip identities, main operational consistency and dependencies transport; full certificates and bounds see [New Correspondence Experiment ](../mechanical-correspondence-20261019/README.md).

`native-correspondence-main75-20261018` belongs to the old bootstrap baseline.
The numbers of the old version Nat identity bridge and the previous correspondence cannot be directly used as the proof result of this version.
