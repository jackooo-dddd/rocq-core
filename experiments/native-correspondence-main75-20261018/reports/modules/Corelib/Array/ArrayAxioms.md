# Corelib.Array.ArrayAxioms

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Array.ArrayAxioms.array_ext

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.array_ext.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.array_ext.statement.correspondence

```lean
∀ (A : Type v_0) (t1 t2 : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.length A t1 = Rocq.Corelib.Array.PrimArray.length A t2 →
    (∀ (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
        Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A t1) =
            Rocq.Corelib.Init.Datatypes.bool.true →
          Rocq.Corelib.Array.PrimArray.get A t1 i = Rocq.Corelib.Array.PrimArray.get A t2 i) →
      Rocq.Corelib.Array.PrimArray.default A t1 = Rocq.Corelib.Array.PrimArray.default A t2 → t1 = t2
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.default

## Corelib.Array.ArrayAxioms.default_set

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.default_set.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.default_set.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  Rocq.Corelib.Array.PrimArray.default A (Rocq.Corelib.Array.PrimArray.set A t i a) =
    Rocq.Corelib.Array.PrimArray.default A t
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.default;Rocq.Corelib.Array.PrimArray.set

## Corelib.Array.ArrayAxioms.get_copy

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.get_copy.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_copy.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.copy A t) i = Rocq.Corelib.Array.PrimArray.get A t i
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.copy

## Corelib.Array.ArrayAxioms.get_make

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.get_make.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_make.statement.correspondence

```lean
∀ (A : Type v_0) (a : A) (size i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.make A size a) i = a
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.make

## Corelib.Array.ArrayAxioms.get_out_of_bounds

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.get_out_of_bounds.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_out_of_bounds.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A t) =
      Rocq.Corelib.Init.Datatypes.bool.false →
    Rocq.Corelib.Array.PrimArray.get A t i = Rocq.Corelib.Array.PrimArray.default A t
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.default

## Corelib.Array.ArrayAxioms.get_set_other

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.get_set_other.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_set_other.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i j : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  ¬i = j →
    Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.set A t i a) j =
      Rocq.Corelib.Array.PrimArray.get A t j
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.set

## Corelib.Array.ArrayAxioms.get_set_same

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.get_set_same.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_set_same.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A t) =
      Rocq.Corelib.Init.Datatypes.bool.true →
    Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.set A t i a) i = a
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.set

## Corelib.Array.ArrayAxioms.leb_length

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.leb_length.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.leb_length.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb (Rocq.Corelib.Array.PrimArray.length A t)
      Rocq.Corelib.Array.PrimArray.max_length =
    Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.max_length;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Array.ArrayAxioms.length_copy

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.length_copy.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.length_copy.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.length A (Rocq.Corelib.Array.PrimArray.copy A t) =
    Rocq.Corelib.Array.PrimArray.length A t
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.copy

## Corelib.Array.ArrayAxioms.length_make

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.length_make.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.length_make.statement.correspondence

```lean
∀ (A : Type v_0) (size : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int) (a : A),
  Rocq.Corelib.Array.PrimArray.length A (Rocq.Corelib.Array.PrimArray.make A size a) =
    Rocq.Corelib.Init.Datatypes.bool.rec size Rocq.Corelib.Array.PrimArray.max_length
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb size Rocq.Corelib.Array.PrimArray.max_length)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.make;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Array.PrimArray.max_length;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb

## Corelib.Array.ArrayAxioms.length_set

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Array.ArrayAxioms.length_set.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.length_set.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  Rocq.Corelib.Array.PrimArray.length A (Rocq.Corelib.Array.PrimArray.set A t i a) =
    Rocq.Corelib.Array.PrimArray.length A t
```

残留源符号：Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.set