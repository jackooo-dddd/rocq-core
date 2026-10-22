# Init.Nat corresponding completion range

The 58 deduplication source roots of Init.Nat have obtained certificates within their respective express scopes: 1 type roots and 57 operation roots. See reports/nat-module-coverage.json and CORELIB_LEDGER.csv for root-by-root data.

## Recently completed operations

| Operation | Native goals and scope |
|---|---|
| gcd | Nat.gcd; all parameters; original termination condition proved and instantiated |
| divmod | Division, modulo and explicit accumulator adaptation of Nat; four parameters are arbitrary, including u > y |
| sqrt | Nat.sqrt; all inputs including zero |
| log2 | Nat.log2; all inputs including zero |
| sqrt_iter、log2_iter | Independent native recursive state function; four parameters are arbitrary |
| Seven top-level digital prints | Mathlib Nat.digits plus sequential, zero and label adaptation |
| Three signed reads | Native Int Numerically if z < 0 then none else some z.toNat |

All states of the two internal iterators can correspond to native recursive functions; only states that satisfy algorithm invariants are interpreted as sqrt/log2. The initialization of the top-level sqrt/log2 satisfies the invariants, so the equation of the top-level with the ready-made API requires no additional premises. The two types of results are registered separately, and the internal function cannot be said to be directly equal to Nat.sqrt / Nat.log2.

sqrt proves to maintain the interval p² ≤ n < (p+1)²; log2 proves to maintain 2^p ≤ q and q+r+1 = 2^(p+1). The uniqueness of the native sqrt/log2 is then used to obtain the equation.

divmodNative explicitly handles any accumulation status: if x ≤ u, the result is (q,u-x); otherwise t=x-(u+1)+(q+1)*(y+1), the result is (t/(y+1), y-t%(y+1)). The correspondence does not only cover the common u ≤ y when called.

## gcd conditions

The original mechanical gcd still has the termination condition, and the mechanical translation is not rewritten or re-run this time. The closed package gcdClosed takes natTo as the decrease, uses the proven modulo correspondence to the native Nat.mod_lt to prove the termination, and then proves that it is equal to Nat.gcd.

The axiom closures of this witness are propext and Quot.sound, both of which are the existing standard axioms of Lean; there are no new axioms, sorry or unproven source conditions. Therefore, among the current 14 closure witnesses, the 13 axiom closure is empty, and 1 uses standard axioms. 16 conditional roots have been processed, and 315 remain in the correspondence layer; the mechanical product still retains the original 331 conditional roots.

## File

- proofs/NatGcd.lean: terminated, closed packaging and corresponds to gcd.
- proofs/NatArithmetic.lean: divmod full parameter semantics.
- proofs/NatIterators.lean: Two state iterators, loop invariants, sqrt/log2 corresponding.
- proofs/NumericWrite.lean, NumericMathlib.lean, NumericSigned.lean: digital conversion.
- reports/CERTIFICATES.md: Complete signature, scope and axiom closure.

This conclusion is only for the 58 roots Init.Nat; the theorem of Init.Peano, other binary number modules and the remaining statements of the full Corelib still need to be continued.
