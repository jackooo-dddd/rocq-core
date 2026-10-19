# Corelib.ssr.ssrunder

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.ssr.ssrunder.Under_rel.Over_rel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel.roundtrip

## Corelib.ssr.ssrunder.Under_rel.Under_rel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel.roundtrip

## Corelib.ssr.ssrunder.Under_rel.Under_relE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.Under_relE.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop), Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA = eqA
```

残留源符号：Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

## Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel_from_rel.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop) (x y : A),
  Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x y → eqA x y
```

残留源符号：Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel

## Corelib.ssr.ssrunder.Under_rel.over_rel

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_21) (eqA : A → A → Prop) (x y : A),
  Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x y = Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A eqA x y
```

残留源符号：Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel;Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

## Corelib.ssr.ssrunder.Under_rel.over_rel_done

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.over_rel_done.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_28) (eqA : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A eqA → ∀ (x : A), Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel A eqA x x
```

残留源符号：Rocq.Corelib.ssr.ssrclasses.Reflexive;Rocq.Corelib.ssr.ssrunder.Under_rel.Over_rel

## Corelib.ssr.ssrunder.Under_rel.under_rel_done

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrunder.Under_rel.under_rel_done.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrunder_29) (eqA : A → A → Prop),
  Rocq.Corelib.ssr.ssrclasses.Reflexive A eqA → ∀ (x : A), Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel A eqA x x
```

残留源符号：Rocq.Corelib.ssr.ssrclasses.Reflexive;Rocq.Corelib.ssr.ssrunder.Under_rel.Under_rel