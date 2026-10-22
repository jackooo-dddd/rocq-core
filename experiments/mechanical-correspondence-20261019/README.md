# Mechanical nat / eq corresponding certificate and old certificate migration audit

This experiment only works in this directory, using ../mechanical-nat-eq-20261019/translator and its full-v1 translation results. Both the old correspondence experiment and the mechanical translator are unmodified. Verification is done on CityU WSL Lean 4.33.1.

## What have the new nat, eq proven?

- natTo: MechanicalNat → Nat, natOf: Nat → MechanicalNat; two round trips constitute natIso. The source type is indeed an independent inductive type, not an alias of Nat.
- eq_correspondence : MechanicalEq A x y ↔ x = y, covering A : Sort u.
- eqIso contains a bidirectional transformation of the proof object and two round-trip identities; the equality proof belongs to Prop, and the round-trip uses the proof independence of Lean.
- eq_transport_agrees: The dependency transport obtained by mechanical eq elimination is consistent with transport by Lean Eq. The result family P: A → Sort v.
- nat_eq_correspondence：MechanicalEq MechanicalNat a b ↔ natTo a = natTo b。
- The ordinary/dependent recursive correspondences of Nat, as well as the correspondences of addition, subtraction, multiplication, power, comparison, parity, division, modulo, shift and bit operations, are all reaffirmed on the new mechanical structure.
- IdentityCheck.lean confirms that sources nat and eq are not defined equal to native types. Mainly, the axiom closure corresponding to nat/eq's proof is empty.

This is not using an axiom to declare two types equal. RN = Nat for the old nat_type_agrees no longer holds; this name now gives the explicit Iso. The old identity correspondences of nat and eq are not carried over.

## Inspection results of old certificates

The old 98 files are replaced with the new mechanical output as they are: 86 passed, 12 failed; recorded in legacy/results.json.
See reports/REGRESSION.json and legacy/logs/ for failure files and reasons. The main problem is that the old function parameters directly use Nat, the output is directly compared with the Nat value, and the mechanical eq proof of is_true is treated as Lean Eq.

After migration, 20 handwritten profile, 36 statements profile, 45 interfaces profile all passed.
The operation corresponding certificates of the old 28 types Iso and 109 have been re-checked on the new baseline; see the item-by-item old_type/new_type comparison for specific statements of changes. This is not a claim that the old source files are still correct intact.
The old 845 statements iff are all regenerated and checked; among them, 143 copies have no direct source symbols, and the rest still partially retain source expressions. iff Proving is not equivalent to proving the source original theorem.
Original translation 331 The explicit condition to be proved remains unchanged.

## The difference between automatic interface and handwriting eraser proof

Currently, 478 interface round-trip certificates are automatically generated: the old interfaces 475 are retained, and 3 are added.
The following 5 of the old interfaces were not restored by the generic interface generator because their types depended on the converted motive or equality proof:

| Original statement | Individually checked operation correspondences |
|---|---|
| Init.Datatypes.nat_rec | source_nat_rec_agrees |
| Init.Datatypes.nat_rect | source_nat_rect_agrees |
| Init.Logic.eq_rew_dep | source_eq_rew_dep_agrees |
| Init.Logic.eq_rew_fwd_dep | source_eq_rew_fwd_dep_agrees |
| Init.Logic.eq_rew_fwd_r_dep | source_eq_rew_fwd_r_dep_agrees |

These handwritten proofs explicitly bring the native index motive back to the mechanical type, and then prove that the results are consistent; they are not automatic round-trip wrappers for universal dependent function spaces. The two certificates are counted separately, and the handwriting results are not used to pretend that the automatic interface has been restored. See DependentNat.lean, DependentEq.lean and reports/interface-regression.csv.

The general interface only proves that the converted function can round-trip and does not automatically equal the Lean library function with the same name. For specific native operation consistency, see reports/OPERATIONS.md.
Some container interfaces still only cover the Type instance and do not automatically cover the Prop branch of the source Sort. Mathlib integration was not tested in this experiment.

## Verified unified use entrance

Unified.lean / UnifiedInterfaces.lean work in the same 141-root export, compiled with source roundtrip, standalone Lean consumer, Python audit, and bridge proofs.
UseNative.lean shows native Nat addition, commutative addition under mechanical eq, nested Nat List round trip, length, Z multiplication.

Each Rocq2LeanOut of profile is bound to different modules, and .olean of all profile cannot be arbitrarily combined with import at the same time. Use Unified / UnifiedInterfaces entrance when joint use is required.
The verification is run remotely; the files synchronized to Mac are used for reading and reproduction, and the Linux path in the script requires a corresponding environment.

## Documentation and reproduction

- NatEq.lean: New nat/eq master counterpart.
- Nat.lean: Correspondence of source Nat operation.
- DependentNat.lean / DependentEq.lean: Corresponding to source eliminator.
- reports/CORELIB_LEDGER.csv: Latest itemized coverage of 2180 root.
- reports/type-regression.csv, operation-regression.csv, statement-regression.csv, interface-regression.csv: Check the old certificates item by item.
- reports/ISOMORPHISMS.md, OPERATIONS.md: complete certificate type and axiom closure.
- reports/summary.json, REGRESSION.json: machine-readable statistics.
- final-validation.json, logs/: Verify commands, exit codes and logs.
- legacy/: The old and new compatibility counterexamples and historical source files that failed are only used for auditing and will not be released as new proofs that have passed.

Run in this remote directory:

```bash
python3 final_validate.py
python3 make_report.py
python3 make_regression_report.py
python3 write_readme.py
```

All accepted proofs reject sorryAx or new source axioms; auxiliary library proofs allow Lean standard axioms propext, Quot.sound, Classical.choice. nat/eq main correspondence does not require these three items.
The complete correspondence coverage of Corelib is still partially complete; this conclusion is two different things from the fact that the 2180 mechanical translation has passed.
