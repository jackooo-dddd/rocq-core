universe complexity of target Lean interface

Statistics source: Machinery nat/eq full-v1 The target of full operation AST; 2180 original roots, bootstrap is zero, parameter distribution statistics all 2180 generated roots. Extra quality branches are not counted as new root repeats. Statements take their propositional body, definitions take types, and inductive types also check the constructor type.

| Number of universe parameters | Number of root declarations |
|---|---:|
| 0 | 949 |
| 1 | 626 |
| 2–3 | 519 |
| 4 and above | 86 |

2094/2180≈96.06% has at most 3 parameters; 1231 has at least one parameter and at most 16.
The 227 item interface explicitly contains max/imax; the 29 item interface explicitly contains PULift; PULift appears explicitly in the type or body of the 49 item. Entry 26 reports non-trivial local universe explanations, entry 66 reports level copies. The items will overlap and cannot be added.
Only explicit syntax is counted here, transparent aliases are not expanded, so 29 is not the number of "all declarations that may encounter PULift through dependencies".

Complex example:
- CMorphisms.compose_proper: 16 parameters, source Rocq explicit polymorphism context also has 16; the target interface does not have explicit max/PULift.
- CMorphisms.respectful_morphism: 16 parameters, the source also has 16; the target local interpretation produces nested max, and the interface contains PULift.
- CMorphisms.PartialOrder_StrictOrder: 6 parameters, the interface contains PULift; there are still two explicit conditions to be verified.
- 29 explicit PULift interfaces all appear in RelationClasses/CRelationClasses/CMorphisms of Classes. For details, see JSON filtering.

Judgment: It has passed the source-end native facts, public interfaces, independent structure audits and Lean kernel checks; "complex" cannot be called "universely illegal". But the usability is indeed not exactly the same as handwriting Lean. In particular, PULift changes the representation and requires up/down or bridging, while max parameterization increases the signature reading cost. v_0/u_Corelib_... is a stable mechanical designation, not the friendly public designation API.

Lean can infer the universe from many actual parameters, but there is no guarantee that each will not require an explicit instance: ghost parameters, complex dependencies, and boosted representations may require annotations. The existing native clients has demonstrated interoperability between several high-risk interfaces and basic Nat/List; complete manual user programs have not yet been written for the 2180 items. Zero blocking does not mean that all interfaces have an ideal interactive experience.

Suitable for subsequent API organization are semantic parameter naming, provably redundant max expression normalization, and verified representation conversion encapsulation. Do not forcibly combine independent universes into one, or use fixed Type 0 to hide problems; nor can you treat the value packaged by PULift as the original type without proof.
