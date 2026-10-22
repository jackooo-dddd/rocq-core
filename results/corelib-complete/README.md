Corelib full translation results

Fixed range: Rocq 9.3.0 67 source modules, 2180 constant/mutual inductive block root declarations in the installation. 16 modules have no kernel root declaration; tactic, notation, extraction instructions are not counted as translated.
Result: Check items 2180 passed and items 0 blocked. Run: /home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/runs/full-v1.

| Classification | Quantity | Usage meaning |
|---|---:|---|
| TRANSLATED_AND_CHECKED | 1003 | Complete definition/data type, with no proof parameters to discharge |
| BOOTSTRAP_RESOLVED | 0 | Already corresponds to Lean |
| STATEMENT_KERNEL_CHECKED | 846 | Theorem/axiom statement with no proof parameters to discharge; not a proved theorem |
| PENDING_KERNEL_CHECKED | 148 | Definition with explicit proof parameters to discharge |
| STATEMENT_PENDING_KERNEL_CHECKED | 183 | Statement with explicit proof parameters to discharge; not a proved theorem |

The complete definition can be used for Lean type checking, proofs, and kernel reductions. The importer registers kernel declarations but does not automatically perform Lean code generation for the generated data types; therefore it does not commit to directly #eval/compiled executables, and bridge definitions that rely on these types can be marked noncomputable to use their kernel semantics. Definitions with unvalidated parameters must first provide these parameters. A statement corresponds to the definition of a proposition, not a proof of the proposition; unproven dependence does not mean that the theorem has been proven.
There is no bootstrap mapping this time. Rocq nat and eq, like List and Bool, mechanically generate independent inductive types, constructors and eliminators under the Rocq namespace. They have been checked not to be equivalent to the Lean native Nat/Eq definition. Subsequent independent experiments have completed the two-way correspondence and dependency elimination proof of nat/eq; the latest proof and old certificate migration results can be found in the warehouse experiments/mechanical-correspondence-20261019/README.md.


File correspondence:
- Corelib/.../Name.v: A copy of the original Rocq file.
- Corelib/.../Name.lean: Executable independent translation entry, and prints all root declarations, quality branches and explicit conditions of the file.
- Corelib/.../Name.txt: Lean The actual printed type/body; does not disguise the printed body as a stand-alone compilable package.
- Corelib/.../Name.md: State the status, rules, attempt sequence, conditions, baseline failure stages and reasons one by one.
- Corelib/.../Name.json: Complete source IR, target type/body AST, quality branch, conditional statement and verification evidence path.
- declarations.csv: 2180 items can be filtered in the total list; summary.json: Fixed range, classification, and module-by-module counting.

Process: MetaRocq Export dependency closure with proof condition → Dispatch by claim and attempt universe interpretation/representation transformation → Lean Register claim → Rocq Source roundtrip, standalone Lean consumer with standalone structural audit. All root-declared modules pass these three checks; addendum campaign completes.
The mechanisms in JSON are records of actual use; not every mechanism is claimed to be the minimum set essential to that claim. If the baseline fails, the original error report is retained; the missing rules are not fabricated based on the error text.
Each Lean entry contains its own dependency closure. They are the product of file-by-file research and are not a unified Lean library that guarantees simultaneous import; the entry refers to the absolute path in remote freeze operation and must be used on a workstation that retains the warehouse path.

Run a single entry: python3 /home/shunqwang4/research/rocq-core/experiments/mechanical-nat-eq-20261019/results/run_lean_entry.py Corelib/Init/Nat.lean. The freezing tool chain is already installed and no new framework is required.

| source module | Number of root declarations | Result |
|---|---:|---|
| Corelib.Array.ArrayAxioms | 11 | [Per-declaration results](Corelib/Array/ArrayAxioms.md) |
| Corelib.Array.PrimArray | 8 | [Per-declaration results](Corelib/Array/PrimArray.md) |
| Corelib.BinNums.IntDef | 39 | [Per-declaration results](Corelib/BinNums/IntDef.md) |
| Corelib.BinNums.NatDef | 11 | [Per-declaration results](Corelib/BinNums/NatDef.md) |
| Corelib.BinNums.PosDef | 36 | [Per-declaration results](Corelib/BinNums/PosDef.md) |
| Corelib.Classes.CMorphisms | 78 | [Per-declaration results](Corelib/Classes/CMorphisms.md) |
| Corelib.Classes.CRelationClasses | 81 | [Per-declaration results](Corelib/Classes/CRelationClasses.md) |
| Corelib.Classes.Equivalence | 17 | [Per-declaration results](Corelib/Classes/Equivalence.md) |
| Corelib.Classes.Init | 2 | [Per-declaration results](Corelib/Classes/Init.md) |
| Corelib.Classes.Morphisms | 87 | [Per-declaration results](Corelib/Classes/Morphisms.md) |
| Corelib.Classes.Morphisms_Prop | 29 | [Per-declaration results](Corelib/Classes/Morphisms_Prop.md) |
| Corelib.Classes.RelationClasses | 103 | [Per-declaration results](Corelib/Classes/RelationClasses.md) |
| Corelib.Classes.SetoidTactics | 3 | [Per-declaration results](Corelib/Classes/SetoidTactics.md) |
| Corelib.Compat.Coq818 | 0 | [Per-declaration results](Corelib/Compat/Coq818.md) |
| Corelib.Compat.Coq819 | 0 | [Per-declaration results](Corelib/Compat/Coq819.md) |
| Corelib.Compat.Coq820 | 0 | [Per-declaration results](Corelib/Compat/Coq820.md) |
| Corelib.Compat.Rocq90 | 0 | [Per-declaration results](Corelib/Compat/Rocq90.md) |
| Corelib.Compat.Rocq91 | 0 | [Per-declaration results](Corelib/Compat/Rocq91.md) |
| Corelib.Compat.Rocq92 | 0 | [Per-declaration results](Corelib/Compat/Rocq92.md) |
| Corelib.Floats.FloatAxioms | 33 | [Per-declaration results](Corelib/Floats/FloatAxioms.md) |
| Corelib.Floats.FloatClass | 1 | [Per-declaration results](Corelib/Floats/FloatClass.md) |
| Corelib.Floats.FloatOps | 8 | [Per-declaration results](Corelib/Floats/FloatOps.md) |
| Corelib.Floats.PrimFloat | 37 | [Per-declaration results](Corelib/Floats/PrimFloat.md) |
| Corelib.Floats.SpecFloat | 55 | [Per-declaration results](Corelib/Floats/SpecFloat.md) |
| Corelib.Init.Byte | 10 | [Per-declaration results](Corelib/Init/Byte.md) |
| Corelib.Init.Datatypes | 110 | [Per-declaration results](Corelib/Init/Datatypes.md) |
| Corelib.Init.Decimal | 40 | [Per-declaration results](Corelib/Init/Decimal.md) |
| Corelib.Init.Equality | 22 | [Per-declaration results](Corelib/Init/Equality.md) |
| Corelib.Init.Hexadecimal | 38 | [Per-declaration results](Corelib/Init/Hexadecimal.md) |
| Corelib.Init.Logic | 176 | [Per-declaration results](Corelib/Init/Logic.md) |
| Corelib.Init.Ltac | 0 | [Per-declaration results](Corelib/Init/Ltac.md) |
| Corelib.Init.Nat | 58 | [Per-declaration results](Corelib/Init/Nat.md) |
| Corelib.Init.Notations | 0 | [Per-declaration results](Corelib/Init/Notations.md) |
| Corelib.Init.Number | 17 | [Per-declaration results](Corelib/Init/Number.md) |
| Corelib.Init.Peano | 36 | [Per-declaration results](Corelib/Init/Peano.md) |
| Corelib.Init.Prelude | 3 | [Per-declaration results](Corelib/Init/Prelude.md) |
| Corelib.Init.Specif | 159 | [Per-declaration results](Corelib/Init/Specif.md) |
| Corelib.Init.Sumbool | 7 | [Per-declaration results](Corelib/Init/Sumbool.md) |
| Corelib.Init.Tactics | 2 | [Per-declaration results](Corelib/Init/Tactics.md) |
| Corelib.Init.Tauto | 0 | [Per-declaration results](Corelib/Init/Tauto.md) |
| Corelib.Init.Wf | 21 | [Per-declaration results](Corelib/Init/Wf.md) |
| Corelib.Lists.ListDef | 10 | [Per-declaration results](Corelib/Lists/ListDef.md) |
| Corelib.Numbers.BinNums | 15 | [Per-declaration results](Corelib/Numbers/BinNums.md) |
| Corelib.Numbers.Cyclic.Int63.CarryType | 1 | [Per-declaration results](Corelib/Numbers/Cyclic/Int63/CarryType.md) |
| Corelib.Numbers.Cyclic.Int63.PrimInt63 | 37 | [Per-declaration results](Corelib/Numbers/Cyclic/Int63/PrimInt63.md) |
| Corelib.Numbers.Cyclic.Int63.Sint63Axioms | 8 | [Per-declaration results](Corelib/Numbers/Cyclic/Int63/Sint63Axioms.md) |
| Corelib.Numbers.Cyclic.Int63.Uint63Axioms | 48 | [Per-declaration results](Corelib/Numbers/Cyclic/Int63/Uint63Axioms.md) |
| Corelib.Program.Basics | 6 | [Per-declaration results](Corelib/Program/Basics.md) |
| Corelib.Program.Tactics | 1 | [Per-declaration results](Corelib/Program/Tactics.md) |
| Corelib.Program.Utils | 0 | [Per-declaration results](Corelib/Program/Utils.md) |
| Corelib.Program.Wf | 12 | [Per-declaration results](Corelib/Program/Wf.md) |
| Corelib.Relations.Relation_Definitions | 23 | [Per-declaration results](Corelib/Relations/Relation_Definitions.md) |
| Corelib.Setoids.Setoid | 6 | [Per-declaration results](Corelib/Setoids/Setoid.md) |
| Corelib.Strings.PrimString | 17 | [Per-declaration results](Corelib/Strings/PrimString.md) |
| Corelib.Strings.PrimStringAxioms | 12 | [Per-declaration results](Corelib/Strings/PrimStringAxioms.md) |
| Corelib.derive.Derive | 0 | [Per-declaration results](Corelib/derive/Derive.md) |
| Corelib.extraction.ExtrHaskellBasic | 0 | [Per-declaration results](Corelib/extraction/ExtrHaskellBasic.md) |
| Corelib.extraction.ExtrOcamlBasic | 0 | [Per-declaration results](Corelib/extraction/ExtrOcamlBasic.md) |
| Corelib.extraction.Extraction | 0 | [Per-declaration results](Corelib/extraction/Extraction.md) |
| Corelib.ssr.ssrbool | 451 | [Per-declaration results](Corelib/ssr/ssrbool.md) |
| Corelib.ssr.ssrclasses | 4 | [Per-declaration results](Corelib/ssr/ssrclasses.md) |
| Corelib.ssr.ssreflect | 0 | [Per-declaration results](Corelib/ssr/ssreflect.md) |
| Corelib.ssr.ssreflect_rw | 55 | [Per-declaration results](Corelib/ssr/ssreflect_rw.md) |
| Corelib.ssr.ssrfun | 128 | [Per-declaration results](Corelib/ssr/ssrfun.md) |
| Corelib.ssr.ssrsetoid | 1 | [Per-declaration results](Corelib/ssr/ssrsetoid.md) |
| Corelib.ssr.ssrunder | 7 | [Per-declaration results](Corelib/ssr/ssrunder.md) |
| Corelib.ssrmatching.ssrmatching | 0 | [Per-declaration results](Corelib/ssrmatching/ssrmatching.md) |

The large JSON is saved as lossless .json.gz in Git; the original .json remains on the workstation. After cloning, run python3 scripts/restore_artifacts.py at the root of the warehouse to restore the original files; see the warehouse ARTIFACTS.json for the complete list. Compilation cache and intermediate attempts are not committed.
