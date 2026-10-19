# 已验证的类型双射

每个 Iso 同时包含 to、of、of_to、to_of；不是只有单向转换。具体 universe 范围由下面的完整类型限定。



## Corelib.Array.PrimArray.array

`NativeBridge.arrayIso`

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Array.PrimArray.array A) (NativeBridge.NativeArray A)
```

公理闭包：propext, Classical.choice, Quot.sound



## Corelib.Floats.FloatClass.float_class

`NativeBridge.floatClassIso`

```lean
NativeBridge.Iso Rocq.Corelib.Floats.FloatClass.float_class (Fin 9)
```

公理闭包：propext



## Corelib.Init.Byte.byte

`NativeBridge.byteIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Byte.byte (Fin 256)
```

公理闭包：propext



## Corelib.Init.Datatypes.Empty_set

`NativeBridge.emptyIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Datatypes.Empty_set Empty
```

公理闭包：空



## Corelib.Init.Datatypes.bool

`NativeBridge.boolIso`

```lean
NativeBridge.Iso NativeBridge.RBool Bool
```

公理闭包：空



## Corelib.Init.Datatypes.comparison

`NativeBridge.comparisonIso`

```lean
NativeBridge.Iso NativeBridge.RComparison Ordering
```

公理闭包：空



## Corelib.Init.Datatypes.list

`NativeBridge.listIso`

```lean
(A : Type u) → NativeBridge.Iso (NativeBridge.RList A) (List A)
```

公理闭包：空



## Corelib.Init.Datatypes.nat

`NativeBridge.natIso`

```lean
NativeBridge.Iso NativeBridge.MN Nat
```

公理闭包：空



## Corelib.Init.Datatypes.option

`NativeBridge.optionIso`

```lean
(A : Type u) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.option A) (Option A)
```

公理闭包：空



## Corelib.Init.Datatypes.prod

`NativeBridge.prodIso`

```lean
(A : Type u) → (B : Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B)
```

公理闭包：空



## Corelib.Init.Datatypes.result

`NativeBridge.resultIso`

```lean
(A : Type u) → (E : Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.result A E) (Except E A)
```

公理闭包：空



## Corelib.Init.Datatypes.sum

`NativeBridge.sumIso`

```lean
(A : Type u) → (B : Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Datatypes.sum A B) (A ⊕ B)
```

公理闭包：空



## Corelib.Init.Datatypes.unit

`NativeBridge.unitIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Datatypes.unit Unit
```

公理闭包：空



## Corelib.Init.Decimal.uint

`NativeBridge.decimalDigitsIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Decimal.uint (List (Fin 10))
```

公理闭包：propext



## Corelib.Init.Hexadecimal.uint

`NativeBridge.hexadecimalDigitsIso`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Hexadecimal.uint (List (Fin 16))
```

公理闭包：propext



## Corelib.Init.Logic.eq

`NativeBridge.eqIso`

```lean
{A : Sort u} → (a b : A) → NativeBridge.Iso (NativeBridge.ME A a b) (a = b)
```

公理闭包：空



## Corelib.Init.Nat.t

`NativeBridge.nat_type_agrees`

```lean
NativeBridge.Iso Rocq.Corelib.Init.Nat.t Nat
```

公理闭包：空



## Corelib.Init.Specif.sig

`NativeBridge.sigIso`

```lean
(A : Type u) → (P : A → Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sig A P) (Subtype P)
```

公理闭包：空



## Corelib.Init.Specif.sig2

`NativeBridge.sig2Iso`

```lean
(A : Type u) → (P Q : A → Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sig2 A P Q) { x // P x ∧ Q x }
```

公理闭包：空



## Corelib.Init.Specif.sigT

`NativeBridge.sigmaIso`

```lean
(A : Type u) → (P : A → Type v) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sigT A P) (Sigma P)
```

公理闭包：空



## Corelib.Init.Specif.sigT2

`NativeBridge.sigma2Iso`

```lean
(A : Type u) →
  (P : A → Type v) → (Q : A → Type w) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sigT2 A P Q) ((x : A) × P x × Q x)
```

公理闭包：空



## Corelib.Init.Specif.sumbool

`NativeBridge.sumboolIso`

```lean
(P Q : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumbool P Q) (P ⊕' Q)
```

公理闭包：空



## Corelib.Init.Specif.sumbool

`NativeBridge.decidableIso`

```lean
(P : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumbool P ¬P) (Decidable P)
```

公理闭包：空



## Corelib.Init.Specif.sumor

`NativeBridge.sumorIso`

```lean
(A : Type u) → (P : Prop) → NativeBridge.Iso (Rocq.Corelib.Init.Specif.sumor A P) (A ⊕' P)
```

公理闭包：空



## Corelib.Numbers.BinNums.N

`NativeBridge.binaryNatIso`

```lean
NativeBridge.Iso NativeBridge.RNatBinary Nat
```

公理闭包：propext, Classical.choice, Quot.sound



## Corelib.Numbers.BinNums.Z

`NativeBridge.binaryIntIso`

```lean
NativeBridge.Iso NativeBridge.RIntBinary Int
```

公理闭包：propext, Classical.choice, Quot.sound



## Corelib.Numbers.BinNums.positive

`NativeBridge.positiveIso`

```lean
NativeBridge.Iso NativeBridge.RPositive { n // 0 < n }
```

公理闭包：propext, Classical.choice, Quot.sound



## Corelib.Numbers.Cyclic.Int63.PrimInt63.int

`NativeBridge.int63Iso`

```lean
NativeBridge.Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int (BitVec 63)
```

公理闭包：空



## Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper

`NativeBridge.int63WrapperIso`

```lean
NativeBridge.Iso Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int_wrapper (BitVec 63)
```

公理闭包：空



## Corelib.Strings.PrimString.string

`NativeBridge.byteStringIso`

```lean
NativeBridge.Iso Rocq.Corelib.Strings.PrimString.string NativeBridge.NativeByteString
```

公理闭包：propext, Classical.choice, Quot.sound

