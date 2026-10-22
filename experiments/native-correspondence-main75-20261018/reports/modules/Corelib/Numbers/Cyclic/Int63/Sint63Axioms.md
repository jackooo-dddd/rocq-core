# Corelib.Numbers.Cyclic.Int63.Sint63Axioms

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement.correspondence

```lean
∀ (x p : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x p) =
    Rocq.Corelib.BinNums.IntDef.Z.div (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.BinNums.IntDef.Z.pow
        (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z p))
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr;Rocq.Corelib.BinNums.IntDef.Z.div;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares x y =
    Rocq.Corelib.BinNums.IntDef.Z.compare (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares;Rocq.Corelib.BinNums.IntDef.Z.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  ¬Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x =
          Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int ∨
      ¬Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y =
          Rocq.Corelib.Numbers.BinNums.Z.Zneg Rocq.Corelib.Numbers.BinNums.positive.xH →
    Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs x y) =
      Rocq.Corelib.BinNums.IntDef.Z.quot (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int;Rocq.Corelib.Numbers.BinNums.Z.Zneg;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs;Rocq.Corelib.BinNums.IntDef.Z.quot

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    ¬Rocq.Corelib.BinNums.IntDef.Z.compare (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
          (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y) =
        Rocq.Corelib.Init.Datatypes.comparison.Gt
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.BinNums.IntDef.Z.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Init.Datatypes.comparison.Gt

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    Rocq.Corelib.BinNums.IntDef.Z.compare (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y) =
      Rocq.Corelib.Init.Datatypes.comparison.Lt
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.BinNums.IntDef.Z.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Init.Datatypes.comparison.Lt

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int.roundtrip

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y) =
    Rocq.Corelib.BinNums.IntDef.Z.rem (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods;Rocq.Corelib.BinNums.IntDef.Z.rem

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z.roundtrip