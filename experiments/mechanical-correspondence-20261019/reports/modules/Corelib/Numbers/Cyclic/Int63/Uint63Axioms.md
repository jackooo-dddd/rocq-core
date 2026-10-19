# Corelib.Numbers.Cyclic.Int63.Uint63Axioms

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.add_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.add (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc x y = Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarry.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addcarryc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addcarryc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def_spec.statement.correspondence

```lean
∀ (p x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv p x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def p x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.addmuldiv;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.addmuldiv_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.compare_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.digits.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.div_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y) =
    Rocq.Corelib.BinNums.IntDef.Z.div (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div;Rocq.Corelib.BinNums.IntDef.Z.div

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_21_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl_21;Rocq.Corelib.BinNums.IntDef.Z.div_eucl;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.diveucl;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.diveucl_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_correct.statement.correspondence

```lean
∀ (i j : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb i j = Rocq.Corelib.Init.Datatypes.bool.true → i = j
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.eqb_refl.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x x = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.get_digit.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.head0_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.BinNums.IntDef.Z.le;Rocq.Corelib.BinNums.IntDef.Z.div;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.head0

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_even.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.is_zero.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.land_spec.statement.correspondence

```lean
∀ (x y i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y) i =
    Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land;Rocq.Corelib.Init.Datatypes.andb

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    Rocq.Corelib.BinNums.IntDef.Z.le (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.BinNums.IntDef.Z.le;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lor_spec.statement.correspondence

```lean
∀ (x y i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y) i =
    Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor;Rocq.Corelib.Init.Datatypes.orb

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsl_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lsr_spec.statement.correspondence

```lean
∀ (x p : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x p) =
    Rocq.Corelib.BinNums.IntDef.Z.div (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.BinNums.IntDef.Z.pow
        (Rocq.Corelib.Numbers.BinNums.Z.Zpos Rocq.Corelib.Numbers.BinNums.positive.xH.xO)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z p))
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr;Rocq.Corelib.BinNums.IntDef.Z.div;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y = Rocq.Corelib.Init.Datatypes.bool.true ↔
    Rocq.Corelib.BinNums.IntDef.Z.lt (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.lxor_spec.statement.correspondence

```lean
∀ (x y i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y) i =
    Rocq.Corelib.Init.Datatypes.xorb (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit x i)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit y i)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.bit;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor;Rocq.Corelib.Init.Datatypes.xorb

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.max_int.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mod_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y)
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod;Rocq.Corelib.BinNums.IntDef.Z.modulo

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mul_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.mul (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.mulc_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.Init.Datatypes.fst;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mulc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB;Rocq.Corelib.Init.Datatypes.snd

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_pos_rec.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_to_Z.statement.correspondence

```lean
∀ (x : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x) = x
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.of_Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.set_digit.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.size.roundtrip

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.sub_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y) =
    Rocq.Corelib.BinNums.IntDef.Z.modulo
      (Rocq.Corelib.BinNums.IntDef.Z.sub (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y))
      Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub;Rocq.Corelib.BinNums.IntDef.Z.modulo;Rocq.Corelib.BinNums.IntDef.Z.sub;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc x y = Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def_spec.statement.correspondence

```lean
∀ (x y : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc x y =
    Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def x y
```

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.CarryType.carry;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.subcarryc;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.subcarryc_def

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.tail0_spec.statement.correspondence

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

残留源符号：Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.BinNums.IntDef.Z.lt;Rocq.Corelib.Numbers.BinNums.Z.Z0;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Numbers.BinNums.Z;Rocq.Corelib.BinNums.IntDef.Z.le;Rocq.Corelib.BinNums.IntDef.Z.mul;Rocq.Corelib.BinNums.IntDef.Z.add;Rocq.Corelib.Numbers.BinNums.Z.Zpos;Rocq.Corelib.Numbers.BinNums.positive.xO;Rocq.Corelib.Numbers.BinNums.positive.xH;Rocq.Corelib.BinNums.IntDef.Z.pow;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.tail0

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z

## Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.wB

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Numbers.BinNums.Z