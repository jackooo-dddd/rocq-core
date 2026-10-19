# Corelib.Numbers.Cyclic.Int63.Sint63Axioms

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.asr_spec.statement.correspondence

```lean
∀ (x p : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr x p) =
    Rocq.Corelib.BinNums.IntDef.Z.div (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.BinNums.IntDef.Z.pow
        (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z p))
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.asr;Rocq.Corelib.BinNums.IntDef.Z.div;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.compare_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares x y =
    Rocq.Corelib.BinNums.IntDef.Z.compare (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares;Rocq.Corelib.BinNums.IntDef.Z.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.div_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int;Rocq.Corelib.Numbers.BinNums.Z.Zneg;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.divs;Rocq.Corelib.BinNums.IntDef.Z.quot

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.leb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    ¬Rocq.Corelib.BinNums.IntDef.Z.compare (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
          (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y) =
        Rocq.Corelib.Init.Datatypes.comparison.Gt
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.BinNums.IntDef.Z.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Init.Datatypes.comparison.Gt

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.ltb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    Rocq.Corelib.BinNums.IntDef.Z.compare (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y) =
      Rocq.Corelib.Init.Datatypes.comparison.Lt
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.BinNums.IntDef.Z.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Init.Datatypes.comparison.Lt

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.min_int.roundtrip

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.mod_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods x y) =
    Rocq.Corelib.BinNums.IntDef.Z.rem (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z y)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mods;Rocq.Corelib.BinNums.IntDef.Z.rem

## Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Sint63Axioms.to_Z.roundtrip