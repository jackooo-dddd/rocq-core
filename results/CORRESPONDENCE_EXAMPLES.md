# Mechanical Rocq → correspondence instance of Lean

These are general proofs that have passed the Lean kernel check, not just testing a few inputs. The long namespace is omitted for reading below: R represents mechanical functions, toNat/toInt represents certified round-trip numeric type conversion. Specific numerical examples, if not separately noted, are practical illustrations of general theorems and are not #eval claiming to have executed mechanical code.

## 1. gcd: Prove the condition first, and then get the native operation

    toNat (gcdClosed a b) = Nat.gcd (toNat a) (toNat b)

gcdClosed instantiates the primitive machine gcd with proven termination conditions. Prove using the remainder correspondence and Nat.mod_lt; the final equation covers all natural number inputs. Therefore the properties of the mechanical results can be derived using the gcd theorem of Lean.

Certificate: gcd_agrees; [Proof source code ](../experiments/incremental-correspondence-20261019/proofs/NatGcd.lean).

## 2. sqrt: Internal iteration is not a simple rename

    toNat (R.Nat.sqrt n) = Nat.sqrt (toNat n)

It is proved through the interval characterization of iterative state invariants and square roots. For example, the result of inputting 15 is 3. Internally, sqrt_iter first corresponds to an independent native state recursive function for any state; only states that satisfy invariants can be interpreted as square roots. The top-level initialization satisfies the invariants, so the top-level theorem has no additional input conditions.

Certificate: sqrt_agrees; [Proof source code ](../experiments/incremental-correspondence-20261019/proofs/NatIterators.lean).

## 3. positive and N have different subtraction boundaries.

    positiveTo (R.Pos.sub p q) = max 1 (positiveTo p - positiveTo q)
    binaryNatTo (R.N.sub n m) = binaryNatTo n - binaryNatTo m

positive does not contain zeros, so its 3−5 yields 1; N contains zeros, and 3−5 yields 0. Both can correspond to native expressions, but cannot be replaced by the same operation without adaptation.

[positive subtraction proof ](../experiments/incremental-correspondence-20261019/proofs/BinaryMask.lean);
[N Subtraction proof ](../experiments/incremental-correspondence-20261019/proofs/BinaryNatSub.lean).

## 4. mask and Option Nat: Preserve source information losslessly

| mechanical constructor | native value |
|---|---|
| IsNeg | none |
| IsNul | some 0 |
| IsPos p | some (positiveTo p) |

maskIso contains two round trip theorems. There are also corresponding operations:

    maskTo (R.Pos.sub_mask p q)
      = if positiveTo q ≤ positiveTo p
        then some (positiveTo p - positiveTo q)
        else none

IsNeg itself does not carry the absolute value of the negative difference, so none here does not lose the data stored in the original type. It is not about pretending that numerical interpretation with information loss is a bijection.

[Type and operation proof ](../experiments/incremental-correspondence-20261019/proofs/BinaryMask.lean).

## 5. Signed exponentiation and shifting: conventions must be preserved

    toInt (R.Z.pow x y)
      = if toInt y < 0 then 0 else (toInt x) ^ (toInt y).toNat

    shiftLeftNative x n
      = if n < 0 then x / 2 ^ (-n).toNat else 2 ^ n.toNat * x

    toInt (R.Z.shiftr x n)
      = shiftLeftNative (toInt x) (-toInt n)

Z.pow_pos directly corresponds to the natural power of the original Int; Z.pow also has the convention of returning zero for negative exponents. The shifted divisor is always a positive power of 2, and the negative dividend is rounded down.

The following four examples have been additionally verified:

| Numerical input for mechanical operations | Conversion result | Instance theorem |
|---|---:|---|
| Z.pow (-2) (-3) | 0 | example_negative_exponent |
| Z.pow_pos (-2) 3 | -8 | example_negative_base |
| Z.shiftr (-3) 1 | -2 | example_negative_right_shift |
| Z.shiftl 3 (-1) | 1 | example_negative_shift_count |

[General proof with four examples ](../experiments/incremental-correspondence-20261019/proofs/BinaryPower.lean).

## 6. if_spec: Corresponds to the information in the dependent index

After fixing A, b, vTrue, vFalse, notB, the mechanical if_spec corresponds to the index c, x:

    PLift (if c then b = true ∧ x = vTrue
                else notB ∧ x = vFalse)

b, c have been converted to native Bool; A retains any exported Type universe. This representation holds the branch evidence and the resulting value equation. ifIso proves a two-way round trip; ifP_agrees and ifPn_agrees prove that the source function output is equivalent to the original evidence of independent construction after conversion. Prove that the source function opaque remains.

[Index type and function proof ](../experiments/incremental-correspondence-20261019/proofs/SSRBoolIndexed.lean).

## 7. Type Value relationship: retain data instead of just a proposition

For R : A → A → Type v, the native representation of mechanical CRelationClasses.Equivalence is:

    ((x : A) → R x x)
      × (((x y : A) → R x y → R y x)
          × ((x y z : A) → R x y → R y z → R x z))

EquivalenceIso gives the two-way inverse, and the three field projections also have corresponding equations. The functions here may have different calculation behaviors and cannot be reduced to the reflexive/symmetric/transitive assertions of ordinary Prop.

iffT A B of the same module corresponds to:

    (A → B) × (B → A)

It does not require that the two functions be inverses of each other, so it is not Equiv A B. What corresponds to is a combination of native functions and products, not a ready-made type class with the same name.

[Type value relationship proves ](../experiments/incremental-correspondence-20261019/proofs/CRelationData.lean).


## 8. Equivalence relationship record of Eq / Iff: corresponding to the ready-made Lean proposition

The related value of mechanical CRelationClasses.eq_equivalence is PULift (mechanical eq x y). Through the certified machinery Eq ↔ Lean Eq, we get:

    equalityEquivalenceIso.to (eqEquivalenceClosed A)
      = equalityEquivalenceNative A

The type on the right is Equivalence (@Eq A) of Lean, and the three fields are Eq.refl, Eq.symm, and Eq.trans. equalityEquivalenceIso also proves that the two transformations, positive and negative, are inverse to each other. The three source-side preconditions have been proven and are not used as additional assumptions by the user.

In the same way, there are two inverse laws when iff_equivalence is converted from mechanical iff on PULift Prop to Equivalence Iff on Prop. The values ​​of these two specific relationships are for proof only; this is why they can be converted into native records in Prop, while any Type-valued relationship in the previous section needs to retain the calculated data.

[Proof ](../experiments/incremental-correspondence-20261019/proofs/CRelationOrder.lean) of Eq / Iff and PartialOrder.


## 9. Bitwise operation: directly corresponds to Mathlib, and pushes the native theorem back to the mechanical object

    binaryIntTo (R.Z.land x y) = Int.land (binaryIntTo x) (binaryIntTo y)
    binaryIntTo (R.Z.lor x y)  = Int.lor  (binaryIntTo x) (binaryIntTo y)
    binaryIntTo (R.Z.lxor x y) = Int.xor  (binaryIntTo x) (binaryIntTo y)

The target here is the existing Int operation of Mathlib, covering any positive and negative integers without selecting the machine word length. Four examples of additional checks are:

| mechanical input | Conversion result |
|---|---:|
| Z.land (-3) 6 | 4 |
| Z.lor (-3) (-6) | -1 |
| Z.lxor (-3) 6 | -5 |
| Z.lxor (-3) (-6) | 7 |

The correspondence of positive / N is first proved inductively through the binary constructor; Z reuses these result processing symbols. Pos.ldiff, N.ldiff have also been proven to be equal to Nat.ldiff of Mathlib.

In the same document, binaryNat_land_comm pushes back Nat.and_comm through the corresponding equations and the injectivity of binaryNatIso, proving:

    R.N.land m n = R.N.land n m

This shows that it is already possible to prove the properties of mechanical objects using the Lean native theorem. For a general proof, four examples and the commutative law see [BinaryIntBitwise.lean](../experiments/incremental-correspondence-20261019/proofs/BinaryIntBitwise.lean).

The complete signature, assumptions, and axiom dependencies can be found in [Certificate Report ](../experiments/incremental-correspondence-20261019/reports/CERTIFICATES.md); the current total can be found in [Workspace Summary ](../experiments/incremental-correspondence-20261019/reports/summary.json). The native expression corresponds directly to the ready-made Lean/Mathlib API and is registered separately.

## 10. Two integer division methods cannot be confused

    toInt (R.Z.div a b) = Int.fdiv (toInt a) (toInt b)
    toInt (R.Z.quot a b) = Int.tdiv (toInt a) (toInt b)

When -7 is divided by 3, the former is -3 and the latter is -2; the corresponding remainders are 2 and -1. Negative divisors and zero divisors are both within the scope of the general proof. Internal N.pos_div_eucl(5,0) returns (3,5), internal Z.pos_div_eucl(5,0) returns (7,1), so the internal auxiliary function cannot be unconditionally replaced by ordinary division.

These specific boundary examples are compiled. [Proof ](../experiments/incremental-correspondence-20261019/proofs/BinaryDivision.lean).

## 11. Binary square root and remainder

    sqrtPairTo (R.Pos.sqrtrem p)
      = (Nat.sqrt n, some (n - Nat.sqrt n * Nat.sqrt n))
    -- n = positiveTo p

Keeping n=s*s+r, r<2*s+1 from each step proves that the result is consistent with the off-the-shelf Nat.sqrt. 12345 gets (111, some 24); negative integer input gets (0, 0). These examples have been checked by kernel and also directly proved by Nat.sqrt_le that the square of the mechanical output does not exceed the input.

[Proof ](../experiments/incremental-correspondence-20261019/proofs/BinarySqrtRem.lean).

## 12. High-order iteration: associative law determines whether it can be changed to linear fold

    R.Pos.iter_op Nat Nat.add p a = positiveTo p * a
    R.Pos.iter_op Nat Nat.mul p a = a ^ positiveTo p

Any op that satisfies the associative law also corresponds to List.foldr op a (List.replicate (positiveTo p-1) a). Without associativity only the native version of the binary bracket is guaranteed to be preserved; it has been verified that op(a,b)=a+2b gives 45 for quadruplicate 5, and linear fold gives 75.

[Proof ](../experiments/incremental-correspondence-20261019/proofs/BinaryIterOp.lean). Four certificates with the same iter_op root will not count as duplicate roots.

## 13. The return type also depends on the recursion of the value

The mapping of N_rect allows native motive P : Nat → Sort u. The checked example takes P(n)=Fin(n+1), so the return type changes when the input changes; positive_rect and Z_rect also retain dependent return types.

[Proof and example ](../experiments/incremental-correspondence-20261019/proofs/BinaryElimination.lean).

## 14. Numerical representation cannot discard negative zeros and format

Decimal.decimal corresponds to the native tuple of "signed integer number, decimal number, and optionally signed exponent". The exponent of Hexadecimal.hexadecimal is still a decimal number. Number.number retains the Sum label of Decimal/Hexadecimal on the outer layer.

So these are lossless representations of Iso, and the structural equality decision preserves the difference between negative/positive zeros, leading zeros, and the presence of exponents. 9 original conditional eq_dec functions have passed the closed prefix proof, corresponding to the complete native Decidable equality.

[Decimal proof ](../experiments/incremental-correspondence-20261019/proofs/DecimalRepresentation.lean),
[Hex proof ](../experiments/incremental-correspondence-20261019/proofs/HexadecimalRepresentation.lean),
[Format combination proof ](../experiments/incremental-correspondence-20261019/proofs/NumberRepresentation.lean).

## 15. 63 bit counting and overflow

[WordOperations.lean](../experiments/incremental-correspondence-20261019/proofs/WordOperations.lean) for any x : BitVec 63 proves mechanically head0 x = x.clz, tail0 x = x.ctz. Example: head0 1 = 62, tail0 8 = 3, both counts of zero are 63. The maximum value of addc corresponds to 1 (true, 0), while retaining the carry flag.

## 16. Byte sequence is not Unicode text

[PrimitiveStrings.lean](../experiments/incremental-correspondence-20261019/proofs/PrimitiveStrings.lean): After taking the byte modulo of mechanical make 1 256, parse gets some 0; while the character print 256 returns none. The two interfaces have different input conventions, proving that the differences are preserved. All bytes, including NUL, are preserved losslessly.

## 17. The general relational interface is instantiated as Lean Eq

[GenericEquality.lean](../experiments/incremental-correspondence-20261019/proofs/GenericEquality.lean) uses PLift (x = y) to meet the requirements of the source Type value relationship. After instantiating the machine ap, we get PLift (congrArg f h), and after instantiating sym, we get PLift h.symm, both of which are verified by kernel. The interface corresponding to any relationship is stated separately for this particular Eq instance.

## 18. Subtype recursion of Program.Wf

[ProgramWellFounded.lean](../experiments/incremental-correspondence-20261019/proofs/ProgramWellFounded.lean) Convert the mechanical sig input received by the source function into Lean Subtype {y // R y x}, and the recursive result is equal to the result of WellFounded.fix. The two callback converters prove to be inverse to each other; premises such as proj2_sig have already given closed proofs and do not need to be provided by the user.

## 19. Contractuality of any number

[SSRRewriteData.lean](../experiments/incremental-correspondence-20261019/proofs/SSRRewriteData.lean) proves that nary_congruence_statement n k is equivalent to the recursive predicate on the native Nat for all mechanical n; each layer of function parameters uses Lean Eq. Subsequently [SSRRewriteStatements.lean](../experiments/incremental-correspondence-20261019/proofs/SSRRewriteStatements.lean) proves the complete contractual representation by induction for all arity, with both corresponding certificates and proof of the original representation.

## 20. Use SSR reflexivity as a native instance

[SSRClasses.lean](../experiments/incremental-correspondence-20261019/proofs/SSRClasses.lean) Proof Source Reflexive A R ↔ Std.Refl R. The converted evidence can be used for Std.Refl.refl of Lean; the two original statements of Eq and Iff also have independent proof.

## 21. Integer conversion with digit truncation

[Uint63Conversions.lean](../experiments/incremental-correspondence-20261019/proofs/Uint63Conversions.lean) for all n and positive p prove that of_pos_rec n p corresponds to BitVec.ofNat 63 (p % 2^n). For example, for n=3 and p=13, keep the lower three bits to get 5; for complete of_pos, use n=63. The negative integer branch of of_Z corresponds to BitVec.ofInt 63, and the result of -1 is 2^63-1.

The reverse to_Z_rec n x corresponds to Int.ofNat (x.toNat % 2^n), and the complete to_Z returns an unsigned integer value. The above conclusion comes from the full domain proof, rather than just verifying the sample input.

## 22. Unified semantics of two bit tests

[Uint63Operations.lean](../experiments/incremental-correspondence-20261019/proofs/Uint63Operations.lean) proves that get_digit and bit are equal to BitVec.getLsbD, respectively, although their mechanical implementations use masks and shift/zero decisions respectively. set_digit 0 62 true sets the highest bit, set_digit 5 63 true keeps 5; out-of-bounds behavior is also retained in the corresponding proof.

## 23. From the properties of native bit operations back to mechanical theorems

[Uint63Statements.lean](../experiments/incremental-correspondence-20261019/proofs/Uint63Statements.lean) uses the AND/OR/XOR equations of BitVec.getLsbD, combined with the proven correspondence between bit and primitive operations, to construct the proof of the source land_spec/lor_spec/lxor_spec. The source conclusion still uses mechanical bool and mechanical Eq; they are converted back through correspondence and are not directly replaced with native types.

The same document proves that of_Z (to_Z x) = x, which holds for all 63 bit inputs. [Uint63OrderSpecs.lean](../experiments/incremental-correspondence-20261019/proofs/Uint63OrderSpecs.lean) transfers the source Z comparison to the native Int sequence to prove ltb_spec/leb_spec.

## 24. Prove the bit count specification back to the machine Z

[Uint63CountSpecs.lean](../experiments/incremental-correspondence-20261019/proofs/Uint63CountSpecs.lean) proves x = (2*y+1)*2^ctz(x) for non-zero x, and explicitly converts the native Nat witness y into a mechanical Z, construction source exists proof. For example, x=40 is ctz=3, y=2; the proof covers all inputs and does not rely on this example for enumeration.

The same document demonstrates that leading zeros give the normalized range 2^62 ≤ 2^clz(x)*x < 2^63. Both reuse the already completed bit counting, Z arithmetic, power and order correspondences.

## 25. Use signed division directly BitVec API

[Sint63Specs.lean](../experiments/incremental-correspondence-20261019/proofs/Sint63Specs.lean) Proof source for all 63 bits divs x y = x.sdiv y, mods x y = x.srem y. The integer value specification further preserves the original overflow exception: division must exclude min_int / -1; remainder does not have this additional condition.

Arithmetic right shift equals sshiftRight for nonnegative shift amounts, including shifts beyond the word width; if the shift amount is interpreted as a negative signed integer, the behavior of the source function returning zero is maintained.

## 26. Why can the quotient of double word division be used directly?

[Uint63WideSpecs.lean](../experiments/incremental-correspondence-20261019/proofs/Uint63WideSpecs.lean) for n = hi*2^63+lo, when hi < divisor it is proved that n/divisor < 2^63, the remainder is also less than 2^63. Therefore loading the quotient/remainder into BitVec 63 does not lose information, and the two mechanical Z values ​​returned by the source are equal to the native exact quotient and remainder respectively.

## 27. The default value of the array participates in extensionality

[ArraySpecs.lean](../experiments/incremental-correspondence-20261019/proofs/ArraySpecs.lean) Prove that the valid elements, lengths and default values are the same and the original arrays are equal. Out-of-bounds reads use default values, so you cannot just compare the contents of Vector. After updating a valid location, other locations and default values ​​remain unchanged.

## 28. Get full round trip from byte string conversion

[StringRoundtrip.lean](../experiments/incremental-correspondence-20261019/proofs/StringRoundtrip.lean) proves mechanical of_list (to_list s) = s. The native side passes Vector → List → bounded byte string, retaining every byte and length, including zero bytes. Each byte of make i 256 is 0; this low 8 bit behavior is explicitly retained in makeSpec.

## 29. Byte string comparison corresponds to ready-made List.compareLex

[primitiveCompare_agrees of StringComparison.lean](../experiments/incremental-correspondence-20261019/proofs/StringComparison.lean) directly corresponds to mechanical compare to List.compareLex, comparing the unsigned numerical values of bytes. When the lengths are different but the prefixes are equal, the shorter string is smaller. The proof holds for any bounded byte string without relying on a finite enumeration of examples or interpreting the original string as Unicode.

## 30. Rounding to the nearest even number and right shift of negative numbers

[nearestEven_agrees of SpecFloatRounding.lean](../experiments/incremental-correspondence-20261019/proofs/SpecFloatRounding.lean) proves that the original mechanical rounding function is equal to the explicit integer rule: at exactly half a unit, 3 increases to 4, and 4 remains 4; below half a unit there is no increase, above half a unit it increases.

[SpecFloatShift.lean](../experiments/incremental-correspondence-20261019/proofs/SpecFloatShift.lean) of shiftOne_agrees holds for all integer significant digits. For example, the effective digit −3 is shifted to the right once to obtain −1, and the low bit recorded is 1; Int.tdiv is used here, and it is not mistakenly written as −2 which is rounded down.

## 31. Complete floating point rounding is composed of existing corresponding combinations

[SpecFloatNormalize.lean](../experiments/incremental-correspondence-20261019/proofs/SpecFloatNormalize.lean) Complete chain of "alignment → index adjustment → nearest even rounding → overflow/zero handling" proving binary_round. The input precision and exponent still take all integer values ​​allowed by the original definition. The target is the SpecValue/Int/Nat algorithm without Rocq notation, not the Lean runtime Float.

## 32. Signed floating point division and square roots

[divisionCore_agrees of SpecFloatDivision.lean](../experiments/incremental-correspondence-20261019/proofs/SpecFloatDivision.lean) converts the mechanical quotient and remainder to Int.fdiv/fmod; division_agrees then connects to the complete roundAux. NaN, infinity, division by zero and sign branches are covered.

[sqrtCore_agrees of SpecFloatSqrt.lean](../experiments/incremental-correspondence-20261019/proofs/SpecFloatSqrt.lean) converts the integer square root to Nat.sqrt while proving the remainder and Exact/Lt/Gt rounding position; squareRoot_agrees combines the full floating point square root, including retaining negative zeros and negative numbers to return NaN. The goal is a native exact symbolic algorithm, not yet an equivalence theorem for Lean Float.sqrt.

## 33. Specify the bidirectional correspondence and integer square root of binary64

[PrimFloatRepresentation.lean](../experiments/incremental-correspondence-20261019/proofs/PrimFloatRepresentation.lean) in floatIso proves the bidirectional inverse of the mechanical primitive floating point and Option ((Bool × Fin 2047 × BitVec 52) ⊕ Bool). Positive and negative zeros can be distinguished, and all NaN are combined into one value according to the primitive representation.

[PrimFloatSqrt.lean](../experiments/incremental-correspondence-20261019/proofs/PrimFloatSqrt.lean) integerSqrt_agrees for any n prove source bit-wise square root = Nat.sqrt n. It is proved that r*r ≤ n < (r+1)*(r+1) is first established by induction according to fuel, and then log2 is used to determine enough digits; squareRoot_agrees is used to combine the complete signed floating point rounding. This is not a proof of equivalence for Float.sqrt.

## 34. Specification statement for floating-point representation conversion and retention prerequisites

[fromSpec_agrees, toSpec_agrees of FloatOperations.lean](../experiments/incremental-correspondence-20261019/proofs/FloatOperations.lean) prove that mechanical SF2Prim, Prim2SF are equal to the specific conversion algorithm on the native field representation.

[FloatStatements.lean](../experiments/incremental-correspondence-20261019/proofs/FloatStatements.lean)’s specificationRoundtrip_correspondence completely corresponds to the source statement as:
```lean
∀ x : nativeSpec, valid x = true → toSpec (fromSpec x) = x
```
What is proved here is that the source statement is equivalent to this proposition, retaining the premise valid; the truth of this round-trip proposition has not been independently proven by this certificate. primitiveRoundtrip, addition/division/square root specifications, etc. are also strictly distinguished in the same way.

## 35. SSR predicate package: Corresponding to the bearer type

The carrier of memPredType A is mechanical mem_pred; the native carrier is A → Bool. First use memIso to establish the bidirectional inverse of the carrier, and then transport the predicate field of package along the Iso to get:

~~~lean
rebase (predTypeTo A (Rocq.Corelib.ssr.ssrbool.memPredType A))
  (A → Bool) (memIso A) = predicates A
~~~

predicates A = ⟨A → Bool, id　. This proves the value equality of the converted package; two different carriers of the original package are not directly considered equal. See [Full proof ](../experiments/incremental-correspondence-20261019/proofs/SSRPredicatePackages.lean).

## Computing transparent variants: relying on the Fin and Mathlib prime number theorems

These two examples are only for the standalone transparent definition version. The complete code can be found at [Consumer.lean](../experiments/incremental-correspondence-20261019/transparent-data/Consumer.lean), the original frozen opaque statement has not been rewritten.

**Liangji recursively returns dependent data. ** countdownStep recursively calculates n; mechanical Fix_F_sub_rect returns Fin (mechanical recursive result + 1). After being transported through the corresponding equation of the recursive value, it becomes Fin (the native recursive result + 1) of Lean, and it is proved that the return value is equal to n and satisfies the native range property of being less than n+1. The value of Q is the Fin data type. This is not just the Prop proof.

**The mechanical condition selection results are directly given to Mathlib. ** all_sig_cond_dep takes the supplied prime number 2 when the input n is even, otherwise the default value 0 is retained. The converted result has native type:

~~~lean
{g : Nat → Nat // ∀ n, primeCondition n = true → Nat.Prime (g n)}
~~~

mechanicalPrimeSelection_value Show that this function is equal to if n % 2 = 0 then 2 else 0. After the prime number evidence obtained by mechanical selection is converted, the existing Prime.two_le of Mathlib is directly called to obtain 2 ≤ g n; when the condition is false, the default value 0 is not claimed to be a prime number.

Both consumption cases have passed the kernel and axiom dependency checks without increasing the source declaration coverage count.
