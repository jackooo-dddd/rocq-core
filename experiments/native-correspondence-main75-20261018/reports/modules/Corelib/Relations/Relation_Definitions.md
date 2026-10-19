# Corelib.Relations.Relation_Definitions

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Relations.Relation_Definitions.PER

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.PER

## Corelib.Relations.Relation_Definitions.antisymmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.antisymmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.antisymmetric.roundtrip

## Corelib.Relations.Relation_Definitions.commut

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.commut

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.commut.roundtrip

## Corelib.Relations.Relation_Definitions.equiv

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.equiv

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.equiv.roundtrip

## Corelib.Relations.Relation_Definitions.equiv_refl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.equiv_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.equivalence A R →
    Rocq.Corelib.Relations.Relation_Definitions.reflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.equivalence;Rocq.Corelib.Relations.Relation_Definitions.reflexive

## Corelib.Relations.Relation_Definitions.equiv_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.equiv_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.equivalence A R →
    Rocq.Corelib.Relations.Relation_Definitions.symmetric A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.equivalence;Rocq.Corelib.Relations.Relation_Definitions.symmetric

## Corelib.Relations.Relation_Definitions.equiv_trans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.equiv_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.equivalence A R →
    Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.equivalence;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.equivalence

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.equivalence

## Corelib.Relations.Relation_Definitions.inclusion

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.inclusion

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.inclusion.roundtrip

## Corelib.Relations.Relation_Definitions.ord_antisym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.ord_antisym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.order A R → Rocq.Corelib.Relations.Relation_Definitions.antisymmetric A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.order;Rocq.Corelib.Relations.Relation_Definitions.antisymmetric

## Corelib.Relations.Relation_Definitions.ord_refl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.ord_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.order A R → Rocq.Corelib.Relations.Relation_Definitions.reflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.order;Rocq.Corelib.Relations.Relation_Definitions.reflexive

## Corelib.Relations.Relation_Definitions.ord_trans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.ord_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.order A R → Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.order;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.order

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.order

## Corelib.Relations.Relation_Definitions.per_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.per_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.PER A R → Rocq.Corelib.Relations.Relation_Definitions.symmetric A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.PER;Rocq.Corelib.Relations.Relation_Definitions.symmetric

## Corelib.Relations.Relation_Definitions.per_trans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.per_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.PER A R → Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.PER;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.preord_refl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.preord_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.preorder A R → Rocq.Corelib.Relations.Relation_Definitions.reflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.preorder;Rocq.Corelib.Relations.Relation_Definitions.reflexive

## Corelib.Relations.Relation_Definitions.preord_trans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Relations.Relation_Definitions.preord_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Relations.Relation_Definitions.preorder A R → Rocq.Corelib.Relations.Relation_Definitions.transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Relations.Relation_Definitions.preorder;Rocq.Corelib.Relations.Relation_Definitions.transitive

## Corelib.Relations.Relation_Definitions.preorder

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.preorder

## Corelib.Relations.Relation_Definitions.reflexive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.reflexive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.reflexive.roundtrip

## Corelib.Relations.Relation_Definitions.relation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.relation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.relation.roundtrip

## Corelib.Relations.Relation_Definitions.same_relation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.same_relation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.same_relation.roundtrip

## Corelib.Relations.Relation_Definitions.symmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.symmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.symmetric.roundtrip

## Corelib.Relations.Relation_Definitions.transitive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Relations.Relation_Definitions.transitive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Relations.Relation_Definitions.transitive.roundtrip