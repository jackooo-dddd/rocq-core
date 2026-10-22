# Corelib.Numbers.Cyclic.Int63.Uint63Axioms

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc x y = Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement.correspondence

```lean
∀ (p x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv p x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def p x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y) =
    Rocq.Corelib.BinNums.IntDef.Z.div (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div;Rocq.Corelib.BinNums.IntDef.Z.div

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement.correspondence

```lean
∀ (a1 a2 b : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.BinNums.IntDef.Z.lt (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z a1)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z b) →
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 a1 a2 b).1 =
        (Rocq.Corelib.BinNums.IntDef.Z.div_eucl
            (Rocq.Corelib.BinNums.IntDef.Z.add
              (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z a1)
                Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
              (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z a2))
            (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z b)).1 ∧
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
          (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21 a1 a2 b).2 =
        (Rocq.Corelib.BinNums.IntDef.Z.div_eucl
            (Rocq.Corelib.BinNums.IntDef.Z.add
              (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z a1)
                Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
              (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z a2))
            (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z b)).2
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21;Rocq.Corelib.BinNums.IntDef.Z.div_eucl;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement.correspondence

```lean
∀ (i j : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb i j = Rocq.Corelib.Init.Datatypes.bool.true → i = j
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x x = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.BinNums.IntDef.Z.lt Rocq.Corelib.Numbers.BinNums.Z.Z0
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) →
    Rocq.Corelib.BinNums.IntDef.Z.le
        (Rocq.Corelib.BinNums.IntDef.Z.div Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
          (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO))
        (Rocq.Corelib.BinNums.IntDef.Z.mul
          (Rocq.Corelib.BinNums.IntDef.Z.pow
            (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
            (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x)))
          (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)) ∧
      Rocq.Corelib.BinNums.IntDef.Z.lt
        (Rocq.Corelib.BinNums.IntDef.Z.mul
          (Rocq.Corelib.BinNums.IntDef.Z.pow
            (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
            (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0 x)))
          (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x))
        Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.BinNums.IntDef.Z.le;Rocq.Corelib.BinNums.IntDef.Z.div;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement.correspondence

```lean
∀ (x y i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y) i =
    Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land;Rocq.Corelib.Init.Datatypes.andb

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    Rocq.Corelib.BinNums.IntDef.Z.le (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.BinNums.IntDef.Z.le;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement.correspondence

```lean
∀ (x y i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y) i =
    Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor;Rocq.Corelib.Init.Datatypes.orb

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement.correspondence

```lean
∀ (x p : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x p) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.BinNums.IntDef.Z.pow
          (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
          (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p)))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement.correspondence

```lean
∀ (x p : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) =
    Rocq.Corelib.BinNums.IntDef.Z.div (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.BinNums.IntDef.Z.pow
        (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p))
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr;Rocq.Corelib.BinNums.IntDef.Z.div;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    Rocq.Corelib.BinNums.IntDef.Z.lt (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement.correspondence

```lean
∀ (x y i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y) i =
    Rocq.Corelib.Init.Datatypes.xorb (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor;Rocq.Corelib.Init.Datatypes.xorb

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod;Rocq.Corelib.BinNums.IntDef.Z.modulo

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y) =
    Rocq.Corelib.BinNums.IntDef.Z.add
      (Rocq.Corelib.BinNums.IntDef.Z.mul
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
          (Rocq.Corelib.Init.Datatypes.fst Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
            Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc x y)))
        Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
        (Rocq.Corelib.Init.Datatypes.snd Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
          Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc x y)))
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.Init.Datatypes.fst;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB;Rocq.Corelib.Init.Datatypes.snd

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = x
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.sub;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc x y = Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def x y
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.BinNums.IntDef.Z.lt Rocq.Corelib.Numbers.BinNums.Z.Z0
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) →
    ∃ y,
      Rocq.Corelib.BinNums.IntDef.Z.le Rocq.Corelib.Numbers.BinNums.Z.Z0 y ∧
        Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x =
          Rocq.Corelib.BinNums.IntDef.Z.mul
            (Rocq.Corelib.BinNums.IntDef.Z.add
              (Rocq.Corelib.BinNums.IntDef.Z.mul
                (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO) y)
              (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH))
            (Rocq.Corelib.BinNums.IntDef.Z.pow
              (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
              (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z
                (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0 x)))
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.BinNums.IntDef.Z.le;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z