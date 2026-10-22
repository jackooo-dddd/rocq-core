# Init.Logic Complete results

This batch adds 94 completion roots: 27 operations/predicates, and 67 complete native statements. 176 roots of Init.Logic now have explicit range correspondences: 1 type, 48 operation/predicate, 127 fully native statement. Mechanical products and machinery Nat/Eq unchanged.

## shared proof dependencies

Originally there were 72 conditional roots left, using a total of 112 different pre-declarations. The predeclaration is not all obligation of exporter, but also includes the statement of the source theorem. After merging the pre-statement and the original statement required this time, select 151 proof targets.

LogicWitnesses.lean first proves a version that retains all preconditions for each target, and then instantiates it one by one with closed witnesses in order of dependency, generating 151 closed proofs. All axiom closures that have been proved by Lean kernel and 151 closures are empty. The conditional proof itself is not counted as correspondence completion; only if the subsequent operation equation or native statement iff passes, the source root will be upgraded.

This batch of actual closed 72 sources: 18 definition, 54 statement. There are also 13 original partial statement upgrades. Among the 67 new statements, 56 also have original statement proofs (54 conditional statements and 2 ordinary statements already in the dependency set); the rest only count statement correspondences. The number of prerequisite certificates, the number of source roots, and the number of coverage certificates are counted separately.

## native target

| source declaration group | new roots | native target |
|---|---:|---|
| unique / uniqueness / subrelation | 3 | Predicates composed of native equality, quantifiers, and implications; subrelation retains heterogeneous two-terminal types |
| rec, rect of False / True / and | 6 | False.elim, selected value, apply branch to native And projection |
| ex / ex2’s rec, rect | 4 | Call dependent branches from the proposition witness and proof of native Exists |
| rec, rect and constructor/uncurried variants of eq_ex / eq_ex2 | 14 | Branch value of native equal index; prove parameter is unique by proof irrelevance |
| Partial statements and closed conditional statements | 67 | Native proposition without Rocq / RocqPending / Rocq2Lean symbols |

This corresponds to the specified native expression. Except for False.elim and other explicit ready-made API, self-composed native elimination expressions are not described as Mathlib ready-made functions.

There is a large elimination of quantifiers and the above eq_ex eliminator requires A : Prop in the export signature; this batch maintains this range and does not claim that any data witness in Type can be eliminated to Type. rec holds the Type result, and rect holds the Sort result of the source signature. When the equality proof is used as an index, the native motive is pulled back by the transformation; all proof arguments for the branch belong to the already-dwelled proposition, proof irrelevance so that any such branch is determined by its unique branch value.

## Statement transformation mechanism

1. For conditional declarations, instantiate all explicit preceding parameters with a closing witness.
2. Transform equality, logical connectives, existential quantifiers, predicates, and transport operations using the proven iff.
3. Transform dependent quantifiers and prove parametric function families. If two objects that are equal are themselves proofs of the same proposition, use the general proof irrelevance lemma; such equations can be reduced to True, rather than replacing the arbitrary source theorem with True.
4. For proof parameters whose source terms are still hidden in the transport expression, only native proof candidates are constructed: partial proof, propositional witness of native Exists, Eq.symm / Eq.trans / congrArg. The candidate types are required to be consistent, the candidate itself has no source symbol, and the definitions before and after replacement are equal; then check that the entire proposition is defined to be equal.
5. The native target expands the NativeBridge alias and audits again. 67 / 67 passive symbols; generated iff all pass kernel.

## Documentation and verification

- proofs/LogicWitnesses.lean, logic-witness-selection.json: 151 goals, pre-dependencies and closed proofs.
- proofs/LogicNormalization.lean: Universal correspondence between logic, proof parameters and transportation.
- proofs/LogicElimination.lean, LogicExistsElimination.lean, LogicProofElimination.lean: The elimination part and closure packaging in 27 operations/predicates.
- proofs/LogicStatements.lean, logic-statement-command.lean.inc: Normalization, proof parameter cleaning of 67 statements and iff.
- reports/logic-statement-candidates.json: Native proposition and residual sign checking for each target.
- reports/logic-module-coverage.json: Classification of 176 roots.
- reports/logic-witness-dag.json: actual pre-certification DAG; condition set directly checks the frozen export report.
- reports/condition-discharges.json: The actual closing witness and certificate used by each upgraded root.

The six new profile have been compiled and audited, and the dependent source code and olean fingerprints have been checked. The complete incremental joint import covers 812 certificates; currently there are 57 verifications profile, of which 54 have independent coverage entrances. No re-running mechanical translations or entire old baselines. Compilation, heuristics and temporary files still only remain on the remote .work.

The current completion category of the entire project is 1079 / 2180; the remaining corresponding tasks continue, and the next step is the shared proof dependency of Init.Specif.
