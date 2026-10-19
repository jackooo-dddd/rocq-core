# Corelib.Floats.FloatAxioms

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Floats.FloatAxioms.Leibniz.eqb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.Leibniz.eqb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Leibniz.eqb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.Leibniz.eqb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔ x = y
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.Leibniz.eqb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Prim2SF_SF2Prim.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.SpecFloat.spec_float),
  Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x =
      Rocq.Corelib.Init.Datatypes.bool.true →
    Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.FloatOps.SF2Prim x) = x
```

残留源符号：Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.SpecFloat.valid_binary;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.FloatOps.SF2Prim

## Corelib.Floats.FloatAxioms.Prim2SF_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.Prim2SF_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Prim2SF_inj.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF x = Rocq.Corelib.Floats.FloatOps.Prim2SF y → x = y
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.Prim2SF_valid

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.Prim2SF_valid.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.Prim2SF_valid.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Floats.FloatOps.Prim2SF x) =
    Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.SpecFloat.valid_binary;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.SF2Prim_Prim2SF.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.SF2Prim (Rocq.Corelib.Floats.FloatOps.Prim2SF x) = x
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.FloatOps.SF2Prim;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.SF2Prim_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF2Prim_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.SF2Prim_inj.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.SpecFloat.spec_float),
  Rocq.Corelib.Floats.FloatOps.SF2Prim x = Rocq.Corelib.Floats.FloatOps.SF2Prim y →
    Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax x =
        Rocq.Corelib.Init.Datatypes.bool.true →
      Rocq.Corelib.Floats.SpecFloat.valid_binary Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax y =
          Rocq.Corelib.Init.Datatypes.bool.true →
        x = y
```

残留源符号：Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.FloatOps.SF2Prim;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.SpecFloat.valid_binary;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Floats.FloatAxioms.SF64add

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64add

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64classify

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64classify

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64div

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64div

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64mul

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64mul

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64pred

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64sqrt

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64sqrt

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64sub

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64sub

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.SF64succ

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.SF64succ

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.SpecFloat.spec_float

## Corelib.Floats.FloatAxioms.abs_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.abs_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.abs_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.abs x) =
    Rocq.Corelib.Floats.SpecFloat.SFabs (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.abs;Rocq.Corelib.Floats.SpecFloat.SFabs

## Corelib.Floats.FloatAxioms.add_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.add_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.add_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.add x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64add (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.add;Rocq.Corelib.Floats.FloatAxioms.SF64add

## Corelib.Floats.FloatAxioms.classify_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.classify_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.classify_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.classify x =
    Rocq.Corelib.Floats.FloatAxioms.SF64classify (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.FloatClass.float_class;Rocq.Corelib.Floats.PrimFloat.classify;Rocq.Corelib.Floats.FloatAxioms.SF64classify;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.compare_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.compare_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.compare_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.compare x y =
    Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt
      (Rocq.Corelib.Floats.SpecFloat.SFcompare (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
        (Rocq.Corelib.Floats.FloatOps.Prim2SF y))
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.PrimFloat.float_comparison;Rocq.Corelib.Floats.PrimFloat.compare;Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt;Rocq.Corelib.Floats.SpecFloat.SFcompare;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.div_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.div_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.div_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.div x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64div (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.div;Rocq.Corelib.Floats.FloatAxioms.SF64div

## Corelib.Floats.FloatAxioms.eqb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.eqb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.eqb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.eqb x y =
    Rocq.Corelib.Floats.SpecFloat.SFeqb (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.eqb;Rocq.Corelib.Floats.SpecFloat.SFeqb;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.flatten_cmp_opt

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Floats.FloatAxioms.flatten_cmp_opt

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Floats.PrimFloat.float_comparison

## Corelib.Floats.FloatAxioms.frshiftexp_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.frshiftexp_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.frshiftexp_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Init.Datatypes.prod.pair;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.frshiftexp;Rocq.Corelib.BinNums.IntDef.Z.sub;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Floats.FloatOps.shift;Rocq.Corelib.Floats.SpecFloat.SFfrexp;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax

## Corelib.Floats.FloatAxioms.ldshiftexp_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.ldshiftexp_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.ldshiftexp_spec.statement.correspondence

```lean
∀ (f : Rocq.Corelib.Floats.PrimFloat.float) (e : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.ldshiftexp f e) =
    Rocq.Corelib.Floats.SpecFloat.SFldexp Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Floats.FloatOps.Prim2SF f)
      (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z e)
        Rocq.Corelib.Floats.FloatOps.shift)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.ldshiftexp;Rocq.Corelib.Floats.SpecFloat.SFldexp;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.BinNums.IntDef.Z.sub;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Floats.FloatOps.shift

## Corelib.Floats.FloatAxioms.leb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.leb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.leb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.leb x y =
    Rocq.Corelib.Floats.SpecFloat.SFleb (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.leb;Rocq.Corelib.Floats.SpecFloat.SFleb;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.ltb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.ltb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.ltb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.PrimFloat.ltb x y =
    Rocq.Corelib.Floats.SpecFloat.SFltb (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Floats.PrimFloat.ltb;Rocq.Corelib.Floats.SpecFloat.SFltb;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.mul_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.mul_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.mul_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.mul x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64mul (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.mul;Rocq.Corelib.Floats.FloatAxioms.SF64mul

## Corelib.Floats.FloatAxioms.next_down_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.next_down_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.next_down_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.next_down x) =
    Rocq.Corelib.Floats.FloatAxioms.SF64pred (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.next_down;Rocq.Corelib.Floats.FloatAxioms.SF64pred

## Corelib.Floats.FloatAxioms.next_up_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.next_up_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.next_up_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.next_up x) =
    Rocq.Corelib.Floats.FloatAxioms.SF64succ (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.next_up;Rocq.Corelib.Floats.FloatAxioms.SF64succ

## Corelib.Floats.FloatAxioms.normfr_mantissa_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.normfr_mantissa_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.normfr_mantissa_spec.statement.correspondence

```lean
∀ (f : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Floats.PrimFloat.normfr_mantissa f) =
    Rocq.Corelib.BinNums.IntDef.Z.of_N
      (Rocq.Corelib.Floats.SpecFloat.SFnormfr_mantissa Rocq.Corelib.Floats.FloatOps.prec
        (Rocq.Corelib.Floats.FloatOps.Prim2SF f))
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Floats.PrimFloat.normfr_mantissa;Rocq.Corelib.BinNums.IntDef.Z.of_N;Rocq.Corelib.Floats.SpecFloat.SFnormfr_mantissa;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.Prim2SF

## Corelib.Floats.FloatAxioms.of_uint63_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.of_uint63_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.of_uint63_spec.statement.correspondence

```lean
∀ (n : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.of_uint63 n) =
    Rocq.Corelib.Floats.SpecFloat.binary_normalize Rocq.Corelib.Floats.FloatOps.prec Rocq.Corelib.Floats.FloatOps.emax
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z n) Rocq.Corelib.Numbers.BinNums.Z.Z0
      Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.of_uint63;Rocq.Corelib.Floats.SpecFloat.binary_normalize;Rocq.Corelib.Floats.FloatOps.prec;Rocq.Corelib.Floats.FloatOps.emax;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.Floats.FloatAxioms.opp_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.opp_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.opp_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.opp x) =
    Rocq.Corelib.Floats.SpecFloat.SFopp (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.opp;Rocq.Corelib.Floats.SpecFloat.SFopp

## Corelib.Floats.FloatAxioms.sqrt_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.sqrt_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.sqrt_spec.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.sqrt x) =
    Rocq.Corelib.Floats.FloatAxioms.SF64sqrt (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.sqrt;Rocq.Corelib.Floats.FloatAxioms.SF64sqrt

## Corelib.Floats.FloatAxioms.sub_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Floats.FloatAxioms.sub_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Floats.FloatAxioms.sub_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Floats.PrimFloat.float),
  Rocq.Corelib.Floats.FloatOps.Prim2SF (Rocq.Corelib.Floats.PrimFloat.sub x y) =
    Rocq.Corelib.Floats.FloatAxioms.SF64sub (Rocq.Corelib.Floats.FloatOps.Prim2SF x)
      (Rocq.Corelib.Floats.FloatOps.Prim2SF y)
```

残留源符号：Rocq.Corelib.Floats.PrimFloat.float;Rocq.Corelib.Floats.SpecFloat.spec_float;Rocq.Corelib.Floats.FloatOps.Prim2SF;Rocq.Corelib.Floats.PrimFloat.sub;Rocq.Corelib.Floats.FloatAxioms.SF64sub