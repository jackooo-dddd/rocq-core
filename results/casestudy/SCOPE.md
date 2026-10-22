# Statistical range: 709 → 839 → 2180

Basis: The original Corelib/*/inventory.json list in the warehouse is cross-checked with the current module root number of results/corelib-complete/summary.json.

| Scope | Roots |
|---|---:|
| Init + Lists | 699 + 10 = 709 |
| Add three modules BinNums and Numbers.BinNums | +101 |
| Add Program.Basics, Relations.Relation_Definitions | +6 +23 |
| Original basic expansion range | 839 |
| Subsequent expansion | +1341 |
| Currently all fixed Corelib range | 2180 |

Subsequent 1341 items: Corelib.ssr 646, Classes 400, Floats 134, Numbers.Cyclic.Int63 94, Strings 29, Array 19, Program.Wf/Tactics 13, Setoids 6.

These are the 67 source modules in the Rocq 9.3.0 fixed installation; 51 contain kernel roots, and the other 16 are mainly configured for notation/tactic/. MathComp and Prosa's own claims are not in the 2180 denominator. Corelib.ssr is the module that comes with the Corelib installation.

A mutual inductive block counts as one root. Constructors, additional quality branches, dependency closure duplications, and newly generated auxiliary conditions are not counted as additional 2180. Theorem/axiom statements are also counted, but this does not mean that these theorems have been proven by the target.
