# Corelib.Floats.FloatAxioms

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Floats.FloatAxioms.Leibniz.eqb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.Leibniz.eqb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Leibniz.eqb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.Leibniz.eqb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔ x = y
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.Leibniz.eqb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.SpecFloat.spec_float),
  Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x =
      Rocq.Corelib.Init.Datatypes.bool.true →
    Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.FloatOps.SF2Prim x) = x
```

Residual source symbols: Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.SpecFloat.valid_binary;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.FloatOps.SF2Prim

## Corelib.Floats.FloatAxioms.Prim2SF_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.Prim2SF_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Prim2SF_inj.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF x = Rocq.Corelib.Floats.FloatOps.Prim2SF y → x = y
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.Prim2SF_valid

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.Prim2SF_valid.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Prim2SF_valid.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Floats.FloatOps.Prim2SF x) =
    Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.SpecFloat.valid_binary;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.SF2Prim (Rocq.Corelib.Floats.FloatOps.Prim2SF x) = x
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.FloatOps.SF2Prim;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.SF2Prim_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF2Prim_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.SF2Prim_inj.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.SpecFloat.spec_float),
  Rocq.Corelib.Floats.FloatOps.SF2Prim x = Rocq.Corelib.Floats.FloatOps.SF2Prim y →
    Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x =
        Rocq.Corelib.Init.Datatypes.bool.true →
      Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax y =
          Rocq.Corelib.Init.Datatypes.bool.true →
        x = y
```

Residual source symbols: Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.FloatOps.SF2Prim;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.SpecFloat.valid_binary;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Floats.FloatAxioms.SF64add

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64add

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64classify

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64classify

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64div

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64div

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64mul

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64mul

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64pred

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64sqrt

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64sqrt

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64sub

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64sub

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64succ

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.SF64succ

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.abs_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.abs_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.abs_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.abs x) =
    Rocq.Corelib.Floats.SpecFloat.SFabs (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.abs;Rocq.Corelib.Floats.SpecFloat.SFabs

## Corelib.Floats.FloatAxioms.add_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.add_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.add_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.add x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64add (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.add;Rocq.Corelib.Floats.FloatAxioms.SF64add

## Corelib.Floats.FloatAxioms.classify_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.classify_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.classify_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.classify x =
    Rocq.Corelib.Floats.FloatAxioms.SF64classify (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.FloatClass.float_class;Rocq.Corelib.Floats.PrimFloat.classify;Rocq.Corelib.Floats.FloatAxioms.SF64classify;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.compare_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.compare_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.compare_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.compare x y =
    Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt
      (Rocq.Corelib.Floats.SpecFloat.SFcompare (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
        (Rocq.Corelib.Floats.FloatOps.Prim2SF y))
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.PrimFloat.float_comparison;Rocq.Corelib.Floats.PrimFloat.compare;Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt;Rocq.Corelib.Floats.SpecFloat.SFcompare;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.div_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.div_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.div_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.div x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64div (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.div;Rocq.Corelib.Floats.FloatAxioms.SF64div

## Corelib.Floats.FloatAxioms.eqb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.eqb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.eqb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.eqb x y =
    Rocq.Corelib.Floats.SpecFloat.SFeqb (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.eqb;Rocq.Corelib.Floats.SpecFloat.SFeqb;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.flatten_cmp_opt

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Floats.PrimFloat.float_comparison

## Corelib.Floats.FloatAxioms.frshiftexp_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.frshiftexp_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.frshiftexp_spec.statement.correspondence

```lean
∀ (f : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Init.Datatypes.prod.pair Rocq.Corelib.Floats.SpecFloat.spec_float Rocq.Corelib.Numbers.BinNums.Z
      (Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.frshiftexp f).1)
      (Rocq.Corelib.BinNums.IntDef.Z.sub
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Floats.PrimFloat.frshiftexp f).2)
        Rocq.Corelib.Floats.FloatOps.shift) =
    Rocq.Corelib.Floats.SpecFloat.SFfrexp Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Floats.FloatOps.Prim2SF f)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Init.Datatypes.prod.pair;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.frshiftexp;Rocq.Corelib.BinNums.IntDef.Z.sub;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Floats.FloatOps.shift;Rocq.Corelib.Floats.SpecFloat.SFfrexp;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax

## Corelib.Floats.FloatAxioms.ldshiftexp_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.ldshiftexp_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.ldshiftexp_spec.statement.correspondence

```lean
∀ (f : Rocq.Corelib.Floats.PrimFloat.float) (e : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.ldshiftexp f e) =
    Rocq.Corelib.Floats.SpecFloat.SFldexp Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Floats.FloatOps.Prim2SF f)
      (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z e)
        Rocq.Corelib.Floats.FloatOps.shift)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.ldshiftexp;Rocq.Corelib.Floats.SpecFloat.SFldexp;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.BinNums.IntDef.Z.sub;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Floats.FloatOps.shift

## Corelib.Floats.FloatAxioms.leb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.leb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.leb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.leb x y =
    Rocq.Corelib.Floats.SpecFloat.SFleb (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.leb;Rocq.Corelib.Floats.SpecFloat.SFleb;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.ltb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.ltb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.ltb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.ltb x y =
    Rocq.Corelib.Floats.SpecFloat.SFltb (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.ltb;Rocq.Corelib.Floats.SpecFloat.SFltb;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.mul_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.mul_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.mul_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.mul x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64mul (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.mul;Rocq.Corelib.Floats.FloatAxioms.SF64mul

## Corelib.Floats.FloatAxioms.next_down_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.next_down_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.next_down_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.next_down x) =
    Rocq.Corelib.Floats.FloatAxioms.SF64pred (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.next_down;Rocq.Corelib.Floats.FloatAxioms.SF64pred

## Corelib.Floats.FloatAxioms.next_up_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.next_up_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.next_up_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.next_up x) =
    Rocq.Corelib.Floats.FloatAxioms.SF64succ (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.next_up;Rocq.Corelib.Floats.FloatAxioms.SF64succ

## Corelib.Floats.FloatAxioms.normfr_mantissa_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.normfr_mantissa_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.normfr_mantissa_spec.statement.correspondence

```lean
∀ (f : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa f) =
    Rocq.Corelib.BinNums.IntDef.Z.of_N
      (Rocq.Corelib.Floats.SpecFloat.SFnormfr_mantissa Rocq.Corelib.Floats.FloatOps.prec
        (Rocq.Corelib.Floats.FloatOps.Prim2SF f))
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Floats.PrimFloat.normfr_mantissa;Rocq.Corelib.BinNums.IntDef.Z.of_N;Rocq.Corelib.Floats.SpecFloat.SFnormfr_mantissa;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.of_uint63_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.of_uint63_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.of_uint63_spec.statement.correspondence

```lean
∀ (n : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.of_uint63 n) =
    Rocq.Corelib.Floats.SpecFloat.binary_normalize Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z n) Rocq.Corelib.Numbers.BinNums.Z.Z0
      Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.of_uint63;Rocq.Corelib.Floats.SpecFloat.binary_normalize;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Floats.FloatAxioms.opp_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.opp_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.opp_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.opp x) =
    Rocq.Corelib.Floats.SpecFloat.SFopp (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.opp;Rocq.Corelib.Floats.SpecFloat.SFopp

## Corelib.Floats.FloatAxioms.sqrt_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.sqrt_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.sqrt_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.sqrt x) =
    Rocq.Corelib.Floats.FloatAxioms.SF64sqrt (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.sqrt;Rocq.Corelib.Floats.FloatAxioms.SF64sqrt

## Corelib.Floats.FloatAxioms.sub_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Floats.FloatAxioms.sub_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.sub_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.sub x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64sub (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

Residual source symbols: Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.sub;Rocq.Corelib.Floats.FloatAxioms.SF64sub