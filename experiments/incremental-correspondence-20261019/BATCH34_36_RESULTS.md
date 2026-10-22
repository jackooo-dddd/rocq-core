# Batch 34 to 36: CMorphisms and binary bitwise operations

Advance from 1621 to **1651 / 2180 deduplicated source roots**. This batch adds 30 roots and 32 coverage certificates: 13 type roots, 16 operation roots, and 1 complete native statements. Pos.ldiff and N.ldiff each add one Mathlib API certificate, but each only counts one root.

## Batch 34: 19 roots of CMorphisms

| source statement | Result |
|---|---|
| Normalizes | Point-wise pairs of bidirectional functions: R x y → S x y, and S x y → R x y |
| Params | True parameterized for native Nat arity; natOf and existing Nat Iso guaranteed to cover all sources arity |
| PartialApplication、apply_subrelation、normalization_done | True; round-trip proof retaining the original proposition mark |
| Proper、ProperProxy | R x x, retain the data in the Type value relationship |
| forall_def | Native dependent function (x : A) → P x |
| forall_relation | (x : A) → R x (f x) (g x) |
| pointwise_relation | (x : A) → R (f x) (g x) |
| respectful | (x y : A) → R x y → S (f x) (g y) |
| respectful_hetero | Allows the above relation-preserving functions with different input types and output dependency families |
| normalizes、proper_prf、proper_proxy、proper_flip_proper | Equations with corresponding native projection/identity functions |
| respectful_per_obligation_1 | Use the symmetric functions of the input and output relationships to construct the symmetric function of the respectful relationship |
| iff_impl_subrelation | ∀ P Q, (P ↔ Q) → P → Q; Statement iff and original statement certification have been completed |
| flip_arrow | The original only Type-valued statement; existing type Iso, and additionally construct native and source inhabitant |

All exported universe parameters are explicitly retained. The 15 parameters of flip_arrow are still in the full certificate; it certifies the correspondence of the derived statement type and does not claim to restore the computational behavior of the original opaque function. The structural property inhabitant of this item is the data in Type and is not mixed with the original statement proof number Prop.

CMorphisms is currently **24 / 78**, with 54 roots remaining. If the transparent outer layer relies on the internal implementation of opaque_data, the operation correspondence cannot be claimed just because the outer layer is transparent.

Proof: [CMorphismData.lean](proofs/CMorphismData.lean).

## Batch 35: 8 bitwise operations of positive / N

| source operation | native target |
|---|---|
| Pos.land、N.land | Nat.land / &&& |
| Pos.lor、N.lor | Nat.lor / ||| |
| Pos.lxor、N.lxor | Nat.xor / ^^^ |
| Pos.ldiff、N.ldiff | Nat.bitwise (fun a b => a && !b) |

First use Nat.testBit to prove a general bitwise recursive equation, and then summarize it according to the three constructors of the source positive; the corresponding N reuses the proof of positive and adds zero branches. The source constructor calculation equations are all checked by rfl. Instead of copying a native wrapper function and counting the same implementation as proof.

The result of Pos.lor is still positive; the other three Pos operations may be zero and the source result is N. The conversion function is chosen based on the actual result type. No finite bit width assumption.

Proof: [BinaryBitwise.lean](proofs/BinaryBitwise.lean).

## Batch 36: Mathlib API and negative 3 roots

Z.land, Z.lor, and Z.lxor respectively prove that Int.land, Int.lor, and Int.xor are equal to Mathlib, covering positive numbers, zero, and negative numbers; in addition, Pos.ldiff / N.ldiff is clearly connected to Mathlib of Nat.ldiff. These two new API certificates do not repeatedly increase the root count.

Reuse the currently installed Mathlib to commit 0df444a360eaa60ab8c11dca51a86af692955474, without the framework installed. The verification record contains the build product fingerprint of Mathlib Int.Bitwise.

Four examples of separate checks:

| mechanical input | Conversion result |
|---|---:|
| Z.land (-3) 6 | 4 |
| Z.lor (-3) (-6) | -1 |
| Z.lxor (-3) 6 | -5 |
| Z.lxor (-3) (-6) | 7 |

The commutative law binaryNat_land_comm of the mechanical N.land is also proved by the injectivity of Nat.and_comm with the proven type Iso. This is an example of native theorem feedback to a mechanical object; the number of Corelib roots is not increased.

Proof: [BinaryIntBitwise.lean](proofs/BinaryIntBitwise.lean).

## Verification and next steps

- The Lean compilation, axiom closure, and native target scan of the three new profile all pass; no axioms or sorry are introduced.
- Currently, the source code and dependency fingerprints of 93 profile correspond to successful verification records; the new proof is actually recompiled, and all old proofs or mechanical translations are not rerun.
- 84 profile and 1392 coverage certificates containing coverage certificates were jointly imported and passed; 1877 export entries and 12493 copy dependency statements. The units of quantity are different and cannot be added.
- There are 200 independent Prop proofs of the original statement; the conditional roots are still 293 completed corresponding ones and 38 uncompleted ones.
- Remaining 529 root: interface only 121, partial native representation 134, no certificate yet 236, condition class 38.
- Next we continue with numerical division/remainders and square root remainders, as well as remainder-dependent elimination and primitive statements. The opaque_data function continues to be reserved for tasks that require source calculation equations or result characterizations.
