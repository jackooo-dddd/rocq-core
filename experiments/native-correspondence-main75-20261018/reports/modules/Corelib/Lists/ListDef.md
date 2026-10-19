# Corelib.Lists.ListDef

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Lists.ListDef.Forall

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.Forall

操作/类型证书：NativeBridge.forall_list_agrees

## Corelib.Lists.ListDef.Forall_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Lists.ListDef.Forall_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Lists.ListDef.Forall_ind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Lists_ListDef_53) (P : A → Prop) (P_1 : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P_1 (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (x : A) (l : Rocq.Corelib.Init.Datatypes.list A),
        P x → Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l → P_1 (Rocq.Corelib.Init.Datatypes.list.cons A x l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l
```

残留源符号：Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Lists.ListDef.Forall;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Lists.ListDef.Forall_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Lists.ListDef.Forall_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Lists.ListDef.Forall_sind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Lists_ListDef_53) (P : A → Prop) (P_1 : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P_1 (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (x : A) (l : Rocq.Corelib.Init.Datatypes.list A),
        P x → Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l → P_1 (Rocq.Corelib.Init.Datatypes.list.cons A x l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l
```

残留源符号：Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Lists.ListDef.Forall;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Lists.ListDef.firstn

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.firstn

操作/类型证书：NativeBridge.firstn_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.firstn.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Lists.ListDef.list_compare

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Lists.ListDef.list_compare

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.list_compare.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Lists.ListDef.map

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.map

操作/类型证书：NativeBridge.map_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.map.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Lists.ListDef.nth

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.nth

操作/类型证书：NativeBridge.nth_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.nth.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Lists.ListDef.repeat

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.repeat

操作/类型证书：NativeBridge.repeat_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.repeat.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Lists.ListDef.seq

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.seq

操作/类型证书：NativeBridge.seq_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.seq.roundtrip

## Corelib.Lists.ListDef.skipn

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Lists.ListDef.skipn

操作/类型证书：NativeBridge.skipn_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.skipn.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。