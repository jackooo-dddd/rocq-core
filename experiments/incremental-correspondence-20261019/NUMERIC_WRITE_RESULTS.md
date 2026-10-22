# Number writing corresponds to carry

Added 11 operation roots and 1 type roots, all checked by Lean kernel. The total completion category of this batch is 875 / 2180. See also NUMERIC_WF_RESULTS.md for old results of digital reading and normalization.

| source statement | Proven native target |
|---|---|
| Decimal.Little.succ / Hexadecimal.Little.succ | Native carry function increment on List (Fin 10/16) |
| Nat.to_little_uint / to_little_hex_uint | Nat.rec Iteration of the carry function above, retaining any input accumulator |
| Nat.to_uint / to_hex_uint | List of big-endian numbers printDigits obtained by inverting iterations from [0] |
| Nat.to_int / to_hex_int | The product of the positive label and printDigits |
| Nat.to_num_uint / to_num_hex_uint / to_num_int | Sum packaging that retains decimal/hex labels |
| Number.signed_int | The bidirectional inverse of Sum (Bool × List (Fin 10)) (Bool × List (Fin 16)) |

These are specified expressions composed entirely of native data and functions, not wrappers for mechanical functions. Seven of the top-level printing functions have additionally been certified to correspond to Mathlib off-the-shelf Nat.digits, with the new certificate target_class being existing_api, and explicitly preserving reverse order, sign/base labeling, and zero value adaptation. The original recursive expression certificate is still native_expression; the source root will not be merged or duplicated. The zero of Mathlib is [], the zero printed by Rocq is [0], the corresponding formula is clearly used if n = 0 then [0] else (Nat.digits b n).reverse.

In addition, it is proved that the general carry numerical property value(increment ds) = value(ds) + 1, and the iterative numerical property value(iterate n ds) = value(ds) + n, and the values printed by the two machines Nat are exactly natTo n. Here value is the native little-endian weight folding, and the printed result is used after inversion; it is not just checked with a limited sample.

Symbols, base labels, and leading zeros are all representation information, and the representation Iso of signed_int is not masqueraded as a bijection of the native Int. The auxiliary Iso of decimal/hexadecimal signed_int is rechecked in the export closure of Nat, and the existing source root is not registered repeatedly.

Proof: proofs/NumericWrite.lean. Verification and axiom closure: reports/NumericWrite-audit.json. Newly added native type root 1 and operational root 11; the proof number of the original statement remains unchanged. This batch has been included in the latest P7 co-import snapshot.

## Mathlib Ready-made API corresponding

proofs/NumericMathlib.lean proves that the carry keeps the last bit non-zero and the printed value is correct. Then call Nat.digits_ofDigits to get the unique Mathlib digital sequence. Each of the seven top-level prints has its own independent equation certificate. The total completion root is still 875; incremental certificates 604 copies, 33 profile copies have been verified. Mathlib was submitted and Digits/Defs.olean fingerprint was recorded on reports/validation.json.
