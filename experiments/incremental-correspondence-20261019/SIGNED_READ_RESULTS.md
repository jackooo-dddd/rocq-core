# Signed number reading

The three roots Nat.of_int, of_hex_int, and of_num_int have all been proven to correspond to the numerical functions of the native Int:

    if z < 0 then none else some z.toNat

z is calculated from a native numeric representation that preserves sign and base. The proof covers the empty list, leading zeros, positive zeros, negative zeros, and negative non-zero numbers; negative zeros produce some 0, and negative non-zero numbers produce none. It is not an unconditional replacement with Int.toNat.

proofs/NumericSigned.lean first proves that the source normalization corresponds to the native List.dropWhile, and then proves that removing the leading zeros maintains the value, and that the value being zero is exactly equivalent to being empty after removing zeros, thus obtaining the above native Int interface. All three entrances have independent certificates; there are also boundary certificates for negative zero and negative one.

Added 3 operational roots. The numerical interpretation of the type representation to Int is many-to-one, and there is no claim that signed_int has a bijection with Int. For specific axiom closures, see reports/NumericSigned-audit.json.
