# Verified type bijection

Each Iso also contains to, of, of_to, and to_of; not only one-way conversion. The specific universe range is limited by the full type below.



## Corelib.Array.PrimArray.array

`NativeBridge.arrayIso`

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Array.PrimArray.array A) (NativeBridge.NativeArray A)
```

Axiom closure: propext, Classical.choice, Quot.sound



## Corelib.Floats.FloatClass.float_class

`NativeBridge.floatClassIso`

```lean
NativeBridge.Iso Rocq.Corelib.Floats.FloatClass.float_class (Fin 9)
```

Axiom closure: propext



## Corelib.Init.Byte.byte

`NativeBridge.byteIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Byte.byte (Fin 256)
```

Axiom closure: propext



## Corelib.Init.Datatypes.Empty_set

`NativeBridge.emptyIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Datatypes.Empty_set Empty
```

Axiom closure: empty



## Corelib.Init.Datatypes.bool

`NativeBridge.boolIso`

```lean
NativeBridge.Iso NativeBridge.RBool Bool
```

Axiom closure: empty



## Corelib.Init.Datatypes.comparison

`NativeBridge.comparisonIso`

```lean
NativeBridge.Iso NativeBridge.RComparison Ordering
```

Axiom closure: empty



## Corelib.Init.Datatypes.list

`NativeBridge.listIso`

```lean
(A : Type u) → NativeBridge.Iso (NativeBridge.RList A) (List A)
```

Axiom closure: empty



## Corelib.Init.Datatypes.nat

`NativeBridge.natIso`

```lean
NativeBridge.Iso NativeBridge.MN Nat
```

Axiom closure: empty



## Corelib.Init.Datatypes.option

`NativeBridge.optionIso`

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.option A) (Option A)
```

Axiom closure: empty



## Corelib.Init.Datatypes.prod

`NativeBridge.prodIso`

```lean
(A : Type u) → (B : Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B)
```

Axiom closure: empty



## Corelib.Init.Datatypes.result

`NativeBridge.resultIso`

```lean
(A : Type u) → (E : Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.result A E) (Except E A)
```

Axiom closure: empty



## Corelib.Init.Datatypes.sum

`NativeBridge.sumIso`

```lean
(A : Type u) → (B : Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.sum A B) (A ⊕ B)
```

Axiom closure: empty



## Corelib.Init.Datatypes.unit

`NativeBridge.unitIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Datatypes.unit Unit
```

Axiom closure: empty



## Corelib.Init.Decimal.uint

`NativeBridge.decimalDigitsIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Decimal.uint (List (Fin 10))
```

Axiom closure: propext



## Corelib.Init.Hexadecimal.uint

`NativeBridge.hexadecimalDigitsIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Hexadecimal.uint (List (Fin 16))
```

Axiom closure: propext



## Corelib.Init.Logic.eq

`NativeBridge.eqIso`

```lean
{A : Sort u} → (a b : A) → NativeBridge.Iso (NativeBridge.ME A a b) (a = b)
```

Axiom closure: empty



## Corelib.Init.Nat.t

`NativeBridge.nat_type_agrees`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Nat.t Nat
```

Axiom closure: empty



## Corelib.Init.Specif.sig

`NativeBridge.sigIso`

```lean
(A : Type u) → (P : A → Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sig A P) (Subtype P)
```

Axiom closure: empty



## Corelib.Init.Specif.sig2

`NativeBridge.sig2Iso`

```lean
(A : Type u) → (P Q : A → Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sig2 A P Q) { x // P x ∧ Q x }
```

Axiom closure: empty



## Corelib.Init.Specif.sigT

`NativeBridge.sigmaIso`

```lean
(A : Type u) → (P : A → Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sigT A P) (Sigma P)
```

Axiom closure: empty



## Corelib.Init.Specif.sigT2

`NativeBridge.sigma2Iso`

```lean
(A : Type u) →
  (P : A → Type v) → (Q : A → Type w) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sigT2 A P Q) ((x : A) × P x × Q x)
```

Axiom closure: empty



## Corelib.Init.Specif.sumbool

`NativeBridge.sumboolIso`

```lean
(P Q : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumbool P Q) (P ⊕' Q)
```

Axiom closure: empty



## Corelib.Init.Specif.sumbool

`NativeBridge.decidableIso`

```lean
(P : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumbool P ¬P) (Decidable P)
```

Axiom closure: empty



## Corelib.Init.Specif.sumor

`NativeBridge.sumorIso`

```lean
(A : Type u) → (P : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumor A P) (A ⊕' P)
```

Axiom closure: empty



## Corelib.Numbers.BinNums.N

`NativeBridge.binaryNatIso`

```lean
NativeBridge.Iso NativeBridge.RNatBinary Nat
```

Axiom closure: propext, Classical.choice, Quot.sound



## Corelib.Numbers.BinNums.Z

`NativeBridge.binaryIntIso`

```lean
NativeBridge.Iso NativeBridge.RIntBinary Int
```

Axiom closure: propext, Classical.choice, Quot.sound



## Corelib.Numbers.BinNums.positive

`NativeBridge.positiveIso`

```lean
NativeBridge.Iso NativeBridge.RPositive { n // 0 < n }
```

Axiom closure: propext, Classical.choice, Quot.sound



## Corelib.Numbers.Cyclic.Int63.PrimInt63.int

`NativeBridge.int63Iso`

```lean
NativeBridge.Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int (BitVec 63)
```

Axiom closure: empty



## Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper

`NativeBridge.int63WrapperIso`

```lean
NativeBridge.Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper (BitVec 63)
```

Axiom closure: empty



## Corelib.Strings.PrimString.string

`NativeBridge.byteStringIso`

```lean
NativeBridge.Iso Rocq.Corelib.Strings.PrimString.string NativeBridge.NativeByteString
```

Axiom closure: propext, Classical.choice, Quot.sound

