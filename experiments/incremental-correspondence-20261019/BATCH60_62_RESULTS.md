# Batch 60 to 62: Integer Arithmetic, Shifting and Zero Counting

Added 9 root, 1908 → **1917 / 2180**. Each item has both a complete original statement iff and an independent mechanical source statement.

| profile | root | original meaning |
|---|---:|---|
| [Uint63ArithmeticSpecs](proofs/Uint63ArithmeticSpecs.lean) | 5 | Addition, subtraction and multiplication modulo 2^63; unsigned division and remainder |
| [Uint63ShiftSpecs](proofs/Uint63ShiftSpecs.lean) | 2 | Left shift 2^p and then take the modulus; right shift 2^p |
| [Uint63CountSpecs](proofs/Uint63CountSpecs.lean) | 2 | Normalization bounds for clz; Odd factorization of ctz |

[Uint63ArithmeticSupport](proofs/Uint63ArithmeticSupport.lean) is a shared proof dependency and does not add a new coverage root. It selects the addition, subtraction, multiplication, power, comparison, rounding down and division proofs of the existing positive/Z, and rechecks it in the actual source dependency closure of Uint63Axioms; it does not directly import Rocq2LeanOut with the same name in another source closure.

Arithmetic proofs cover division by zero and subtraction underflow. Use Int.fdiv/fmod to preserve the rounding direction of the source Z; then wire the standard integer arithmetic of Lean on the unsigned input and positive modulus. The shift proof covers all word-valued shift amounts, including cases greater than or equal to 63.

head0_spec retains the non-zero premise and proves 2^62 ≤ 2^clz(x) * x < 2^63. tail0_spec also retains the non-zero premise, proving that there is a non-negative integer y, so that x = (2*y+1)*2^ctz(x). First prove the Nat version by the least significant bit properties of getLsbD, and then explicitly construct the mechanical Z witness to complete the source exists statement.

Currently Uint63Axioms has been audited 46/48; mulc_spec and diveucl_21_spec will be continued in the follow-up profile. The wide multiplier has been passed separately but will not be counted until this profile is fully audited.

Full library: 154 type root, 793 operation root, 970 complete native statement, totaling 1917. Remaining 27 interface only, 58 partial statement, 161 no certificate yet, 17 conditional root, total 263. Total number of independent certifications of the original statement 284.

122 incremental profile verification passed; 112 certificates covering profile and 1661 were imported together, 2251 entrances, and 17904 dependent copies. All new certificates' axiom closure and native target checks pass. There is no need to rerun all mechanical translations or freeze baselines. Only the remote .work is left in the compilation product and intermediate output.
