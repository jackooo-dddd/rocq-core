# Batch 82 to 85: Primitive floating point correspondence

PrimFloat completes **37/37**; total coverage **2054/2180**, including 164 type, 886 operation, 1004 complete native statement. This batch adds 3 type roots and 34 operation roots. The original statement independent of Prop proves to be still 318.

| batch | profile | root | Proof content |
|---|---|---:|---|
| 82 | PrimFloatRepresentation | 26 | float, wrapper, comparison bidirectional inverse; constant, comparison, classification, symbol transformation, predicate, parser/printer packaging |
| 83 | PrimFloatArithmetic | 5 | Addition, subtraction, multiplication and division, get_sign; reuse complete nearest even number rounding |
| 84 | PrimFloatExponent | 5 | uint63 conversion, decomposition/scaling with offset index, upper and lower adjacent values |
| 85 | PrimFloatSqrt | 1 | Complete square root; internal bitwise arithmetic additionally proves equal to Nat.sqrt |

## Representation and scope

The native representation is Option ((Bool × Fin 2047 × BitVec 52) ⊕ Bool). none represents the unique NaN; the left branch holds the sign, exponent and fraction fields of finite values; the right branch represents signed infinity. Limited fields include subnormal and positive and negative zero. This is the Lean native type combination and is not claimed to correspond bidirectionally to the runtime Float.

Ordinary eqb and Leibniz.eqb retain IEEE style equality and canonical bit equality respectively: the former's positive and negative zeros are equal and NaN is not equal to itself; the latter compares canonical bit representation. parser is the identity function of the parsed value at the source, and printer is the projection of wrapper. These two items are not declared as string parsing or formatting.

The arithmetic goal is an exact implementation of the source symbolic algorithm on this native representation. nearest-even, overflow and underflow, NaN, infinity, positive and negative zero and exponential truncation are retained. They are still classified as native_expression and do not pass off as existing_api. The auxiliary theorem integerSqrt_agrees of PrimFloatSqrt proves for each Nat that the source base-four algorithm is equal to the off-the-shelf Nat.sqrt; the complete floating-point square root uses this off-the-shelf API, but does not claim to be equal to Float.sqrt.

## Verify

158 profile have passing records of the current source code and dependencies. 140 incremental certificates covering profile and 1802 are imported together, 2426 entrances, and 23746 copies. Type bidirectional inverse, operational equations, axiomatic closures, and recursive native target audits all passed. No new sorry or axioms are added; the compiled product remains in remote .work.

Remaining 126 root: no certificate yet 79, partial native statement 24, interface only 6, explicit condition 17. Continue FloatOps and FloatAxioms; opaque Type value calculation remains unfinished classification.
