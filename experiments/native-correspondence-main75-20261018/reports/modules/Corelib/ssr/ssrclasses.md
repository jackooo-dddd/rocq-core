# Corelib.ssr.ssrclasses

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.ssr.ssrclasses.Reflexive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrclasses.Reflexive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrclasses.Reflexive.roundtrip

## Corelib.ssr.ssrclasses.eq_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrclasses.eq_Reflexive.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrclasses_23), Rocq.Corelib.ssr.ssrclasses.Reflexive A Eq
```

残留源符号：Rocq.Corelib.ssr.ssrclasses.Reflexive

## Corelib.ssr.ssrclasses.iff_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrclasses.iff_Reflexive.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrclasses.Reflexive Prop Rocq.Corelib.Init.Logic.iff
```

残留源符号：Rocq.Corelib.ssr.ssrclasses.Reflexive;Rocq.Corelib.Init.Logic.iff

## Corelib.ssr.ssrclasses.reflexivity

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrclasses.reflexivity.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrclasses.reflexivity.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrclasses_21) (R : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A R → ∀ (x : A), R x x
```

残留源符号：Rocq.Corelib.ssr.ssrclasses.Reflexive