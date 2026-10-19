# Corelib.Strings.PrimStringAxioms

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Strings.PrimStringAxioms.cat_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.cat_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.cat_spec.statement.correspondence

```lean
∀ (s1 s2 : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimStringAxioms.to_list (Rocq.Corelib.Strings.PrimString.cat s1 s2) =
    Rocq.Corelib.Lists.ListDef.firstn Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length))
      (Rocq.Corelib.Init.Datatypes.app Rocq.Corelib.Strings.PrimString.char63
        (Rocq.Corelib.Strings.PrimStringAxioms.to_list s1) (Rocq.Corelib.Strings.PrimStringAxioms.to_list s2))
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.Strings.PrimString.cat;Rocq.Corelib.Lists.ListDef.firstn;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.max_length;Rocq.Corelib.Init.Datatypes.app

## Corelib.Strings.PrimStringAxioms.char63_valid

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.char63_valid

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Strings.PrimStringAxioms.char63_valid.roundtrip

## Corelib.Strings.PrimStringAxioms.compare_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.compare_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.compare_spec.statement.correspondence

```lean
∀ (s1 s2 : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimString.compare s1 s2 =
    Rocq.Corelib.Lists.ListDef.list_compare Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
      Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare (Rocq.Corelib.Strings.PrimStringAxioms.to_list s1)
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list s2)
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Strings.PrimString.compare;Rocq.Corelib.Lists.ListDef.list_compare;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.get_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.get_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.get_spec.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Strings.PrimString.get s i =
    Rocq.Corelib.Lists.ListDef.nth Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) 0#63
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimString.get;Rocq.Corelib.Lists.ListDef.nth;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.length_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.length_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.length_spec.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.BinNums.IntDef.Z.to_nat
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Strings.PrimString.length s)) =
    Rocq.Corelib.Init.Datatypes.length Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.length;Rocq.Corelib.Init.Datatypes.length;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.make_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.make_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.make_spec.statement.correspondence

```lean
∀ (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int) (c : Rocq.Corelib.Strings.PrimString.char63),
  Rocq.Corelib.Strings.PrimStringAxioms.to_list (Rocq.Corelib.Strings.PrimString.make i c) =
    Rocq.Corelib.Lists.ListDef.repeat Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land c 255#63)
      (min (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
        (Rocq.Corelib.BinNums.IntDef.Z.to_nat
          (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length)))
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.Strings.PrimString.make;Rocq.Corelib.Lists.ListDef.repeat;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.max_length

## Corelib.Strings.PrimStringAxioms.of_list

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.of_list

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Strings.PrimStringAxioms.of_list.roundtrip

## Corelib.Strings.PrimStringAxioms.of_to_list

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.of_to_list.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.of_to_list.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimStringAxioms.of_list (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) = s
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Strings.PrimStringAxioms.of_list;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.sub_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.sub_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.sub_spec.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (off len : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Strings.PrimStringAxioms.to_list (Rocq.Corelib.Strings.PrimString.sub s off len) =
    Rocq.Corelib.Lists.ListDef.firstn Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z len))
      (Rocq.Corelib.Lists.ListDef.skipn Rocq.Corelib.Strings.PrimString.char63
        (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z off))
        (Rocq.Corelib.Strings.PrimStringAxioms.to_list s))
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.Strings.PrimString.sub;Rocq.Corelib.Lists.ListDef.firstn;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Lists.ListDef.skipn

## Corelib.Strings.PrimStringAxioms.to_list

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.to_list

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Strings.PrimStringAxioms.to_list.roundtrip

## Corelib.Strings.PrimStringAxioms.to_list_char63_valid

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.to_list_char63_valid.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.to_list_char63_valid.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Lists.ListDef.Forall Rocq.Corelib.Strings.PrimString.char63
    Rocq.Corelib.Strings.PrimStringAxioms.char63_valid (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Lists.ListDef.Forall;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.char63_valid;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.to_list_length

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Strings.PrimStringAxioms.to_list_length.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.to_list_length.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Init.Datatypes.length Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) ≤
    Rocq.Corelib.BinNums.IntDef.Z.to_nat
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length)
```

残留源符号：Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Init.Datatypes.length;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.max_length