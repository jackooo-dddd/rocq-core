# Corelib.Setoids.Setoid

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Setoids.Setoid.Build_Setoid_Theory

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Build_Setoid_Theory.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
      Rocq.Corelib.Classes.RelationClasses.Transitive A R → Rocq.Corelib.Classes.RelationClasses.Equivalence A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.RelationClasses.Equivalence

## Corelib.Setoids.Setoid.Seq_refl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Setoids.Setoid.Seq_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Seq_refl.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (Aeq : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Setoids.Setoid.Setoid_Theory A Aeq → ∀ (x : A), Aeq x x
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Setoids.Setoid.Setoid_Theory

## Corelib.Setoids.Setoid.Seq_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Setoids.Setoid.Seq_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Seq_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (Aeq : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Setoids.Setoid.Setoid_Theory A Aeq → ∀ (x y : A), Aeq x y → Aeq y x
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Setoids.Setoid.Setoid_Theory

## Corelib.Setoids.Setoid.Seq_trans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Setoids.Setoid.Seq_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.Seq_trans.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (Aeq : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Setoids.Setoid.Setoid_Theory A Aeq → ∀ (x y z : A), Aeq x y → Aeq y z → Aeq x z
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Setoids.Setoid.Setoid_Theory

## Corelib.Setoids.Setoid.Setoid_Theory

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Setoids.Setoid.Setoid_Theory

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Setoids.Setoid.Setoid_Theory.roundtrip

## Corelib.Setoids.Setoid.gen_st

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Setoids.Setoid.gen_st.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Setoids.Setoid.gen_st.statement.correspondence

```lean
∀ (A : Type), Rocq.Corelib.Setoids.Setoid.Setoid_Theory A (Rocq.Corelib.Init.Logic.eq A)
```

残留源符号：Rocq.Corelib.Setoids.Setoid.Setoid_Theory;Rocq.Corelib.Init.Logic.eq