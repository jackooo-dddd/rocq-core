# Corelib.Classes.RelationClasses

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Classes.RelationClasses.Antisymmetric

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.Antisymmetric

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA

## Corelib.Classes.RelationClasses.Asymmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.Asymmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Asymmetric.roundtrip

## Corelib.Classes.RelationClasses.Equivalence

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.Equivalence

## Corelib.Classes.RelationClasses.Equivalence_PER

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PER.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.PER A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.RelationClasses.Equivalence_PreOrder

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_PreOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.PreOrder A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder

## Corelib.Classes.RelationClasses.Equivalence_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.Reflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Reflexive

## Corelib.Classes.RelationClasses.Equivalence_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.Symmetric A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.Equivalence_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Equivalence_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.Irreflexive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.Irreflexive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Irreflexive.roundtrip

## Corelib.Classes.RelationClasses.PER

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.PER

## Corelib.Classes.RelationClasses.PER_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R → Rocq.Corelib.Classes.RelationClasses.Symmetric A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.PER_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PER_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.PartialOrder

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.PartialOrder

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA

## Corelib.Classes.RelationClasses.PartialOrder_inverse

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Classes.RelationClasses.PartialOrder_inverse.statement

## Corelib.Classes.RelationClasses.PreOrder

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.PreOrder

## Corelib.Classes.RelationClasses.PreOrder_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PreOrder A R → Rocq.Corelib.Classes.RelationClasses.Reflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.Reflexive

## Corelib.Classes.RelationClasses.PreOrder_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.PreOrder_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PreOrder A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.Reflexive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.Reflexive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Reflexive.roundtrip

## Corelib.Classes.RelationClasses.RewriteRelation

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.RewriteRelation

## Corelib.Classes.RelationClasses.StrictOrder

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.StrictOrder

## Corelib.Classes.RelationClasses.StrictOrder_Asymmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Asymmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R → Rocq.Corelib.Classes.RelationClasses.Asymmetric A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.Asymmetric

## Corelib.Classes.RelationClasses.StrictOrder_Irreflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Irreflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R → Rocq.Corelib.Classes.RelationClasses.Irreflexive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.Irreflexive

## Corelib.Classes.RelationClasses.StrictOrder_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.StrictOrder_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R → Rocq.Corelib.Classes.RelationClasses.Transitive A R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.Symmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.Symmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Symmetric.roundtrip

## Corelib.Classes.RelationClasses.Tlist

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.Tlist

## Corelib.Classes.RelationClasses.Tlist_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Tlist_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Tlist_ind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Classes.RelationClasses.Tlist → Prop),
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    (∀ (T : Type u_Corelib_Classes_RelationClasses_72) (t : Rocq.Corelib.Classes.RelationClasses.Tlist),
        P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      ∀ (t : Rocq.Corelib.Classes.RelationClasses.Tlist), P t
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil;Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons

## Corelib.Classes.RelationClasses.Tlist_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.Tlist_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Classes.RelationClasses.Tlist → Type) →
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    ((T : Type u_Corelib_Classes_RelationClasses_72) →
        (t : Rocq.Corelib.Classes.RelationClasses.Tlist) →
          P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      (t : Rocq.Corelib.Classes.RelationClasses.Tlist) → P t

## Corelib.Classes.RelationClasses.Tlist_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.Tlist_rect

接口未覆盖原因：No registered type bijection for (P :
    Rocq.Corelib.Classes.RelationClasses.Tlist → Type u_Corelib_Classes_RelationClasses_73) →
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    ((T : Type u_Corelib_Classes_RelationClasses_72) →
        (t : Rocq.Corelib.Classes.RelationClasses.Tlist) →
          P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      (t : Rocq.Corelib.Classes.RelationClasses.Tlist) → P t

## Corelib.Classes.RelationClasses.Tlist_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.Tlist_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.Tlist_sind.statement.correspondence

```lean
∀ (P : Rocq.Corelib.Classes.RelationClasses.Tlist → Prop),
  P Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil →
    (∀ (T : Type u_Corelib_Classes_RelationClasses_72) (t : Rocq.Corelib.Classes.RelationClasses.Tlist),
        P t → P (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons T t)) →
      ∀ (t : Rocq.Corelib.Classes.RelationClasses.Tlist), P t
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil;Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons

## Corelib.Classes.RelationClasses.Transitive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.Transitive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.Transitive.roundtrip

## Corelib.Classes.RelationClasses.antisymmetry

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.antisymmetry.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ R → ∀ (x y : A), R x y → R y x → eqA x y
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Antisymmetric

## Corelib.Classes.RelationClasses.arrows

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.arrows

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Tlist

## Corelib.Classes.RelationClasses.asymmetry

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.asymmetry.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.asymmetry.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Asymmetric A R → ∀ (x y : A), R x y → R y x → False
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Asymmetric

## Corelib.Classes.RelationClasses.binary_operation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.binary_operation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.binary_operation.roundtrip

## Corelib.Classes.RelationClasses.binary_relation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.binary_relation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.binary_relation.roundtrip

## Corelib.Classes.RelationClasses.complement

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.complement

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.complement.roundtrip

## Corelib.Classes.RelationClasses.complement_Irreflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Irreflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Irreflexive A (Rocq.Corelib.Classes.RelationClasses.complement A R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.Irreflexive;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.RelationClasses.complement_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.complement_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Classes.RelationClasses.complement A R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.RelationClasses.complement_inverse

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.complement_inverse.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : A → A → Prop),
  Rocq.Corelib.Init.Logic.eq (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.complement A (Rocq.Corelib.Program.Basics.flip A A Prop R))
    (Rocq.Corelib.Program.Basics.flip A A Prop (Rocq.Corelib.Classes.RelationClasses.complement A R))
```

残留源符号：Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.complement;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.eq_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Init.Logic.eq A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.eq_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Init.Logic.eq A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.eq_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Transitive A (Rocq.Corelib.Init.Logic.eq A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.eq_equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.eq_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A (Rocq.Corelib.Init.Logic.eq A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Logic.eq

## Corelib.Classes.RelationClasses.equivalence_rewrite_relation

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.equivalence_rewrite_relation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA → Rocq.Corelib.Classes.RelationClasses.RewriteRelation A eqA
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.RewriteRelation

## Corelib.Classes.RelationClasses.false_predicate

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.false_predicate

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)

## Corelib.Classes.RelationClasses.flip_Antisymmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Antisymmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ R →
    Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Antisymmetric;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Asymmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Asymmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Asymmetric A R →
    Rocq.Corelib.Classes.RelationClasses.Asymmetric A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Asymmetric;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    Rocq.Corelib.Classes.RelationClasses.Equivalence A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Irreflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Irreflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Irreflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Irreflexive A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Irreflexive;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_PER

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_PER.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PER.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PER A R →
    Rocq.Corelib.Classes.RelationClasses.PER A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PER;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_PreOrder

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_PreOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.PreOrder A R →
    Rocq.Corelib.Classes.RelationClasses.PreOrder A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_StrictOrder

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_StrictOrder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.StrictOrder A R →
    Rocq.Corelib.Classes.RelationClasses.StrictOrder A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.StrictOrder;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.flip_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.flip_Transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Transitive A R →
    Rocq.Corelib.Classes.RelationClasses.Transitive A (Rocq.Corelib.Program.Basics.flip A A Prop R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.iff_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Reflexive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Reflexive Prop Rocq.Corelib.Init.Logic.iff
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Symmetric.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Symmetric Prop Rocq.Corelib.Init.Logic.iff
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_Transitive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Transitive Prop Rocq.Corelib.Init.Logic.iff
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_equivalence.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Equivalence Prop Rocq.Corelib.Init.Logic.iff
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.iff_rewrite_relation

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.iff_rewrite_relation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.RewriteRelation Prop Rocq.Corelib.Init.Logic.iff
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Init.Logic.iff

## Corelib.Classes.RelationClasses.impl_Reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Reflexive Prop Rocq.Corelib.Program.Basics.impl
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Reflexive_obligation_1.statement.correspondence

```lean
∀ (x : Prop), Rocq.Corelib.Program.Basics.impl x x
```

残留源符号：Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_Transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.Transitive Prop Rocq.Corelib.Program.Basics.impl
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_Transitive_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_Transitive_obligation_1.statement.correspondence

```lean
∀ (x y z : Prop),
  Rocq.Corelib.Program.Basics.impl x y → Rocq.Corelib.Program.Basics.impl y z → Rocq.Corelib.Program.Basics.impl x z
```

残留源符号：Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.impl_rewrite_relation

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.impl_rewrite_relation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.RewriteRelation Prop Rocq.Corelib.Program.Basics.impl
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.inverse_impl_rewrite_relation.statement.correspondence

```lean
Rocq.Corelib.Classes.RelationClasses.RewriteRelation Prop
  (Rocq.Corelib.Program.Basics.flip Prop Prop Prop Rocq.Corelib.Program.Basics.impl)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Program.Basics.flip;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.irreflexivity

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.irreflexivity.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Irreflexive A R →
    Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Classes.RelationClasses.complement A R)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Irreflexive;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.RelationClasses.complement

## Corelib.Classes.RelationClasses.is_subrelation

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.is_subrelation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21)
  (R R' : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.subrelation A R R' → ∀ (x y : A), R x y → R' x y
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation

## Corelib.Classes.RelationClasses.neq_Symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.neq_Symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A fun x y => ¬x = y
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.partial_order_antisym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_antisym.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (preo : Rocq.Corelib.Classes.RelationClasses.PreOrder A R),
  Rocq.Corelib.Classes.RelationClasses.PartialOrder A eqA equ R preo →
    Rocq.Corelib.Classes.RelationClasses.Antisymmetric A eqA equ R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.PartialOrder;Rocq.Corelib.Classes.RelationClasses.Antisymmetric

## Corelib.Classes.RelationClasses.partial_order_equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.partial_order_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98) (eqA : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (equ : Rocq.Corelib.Classes.RelationClasses.Equivalence A eqA)
  (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (preo : Rocq.Corelib.Classes.RelationClasses.PreOrder A R),
  Rocq.Corelib.Classes.RelationClasses.PartialOrder A eqA equ R preo →
    Rocq.Corelib.Classes.RelationClasses.relation_equivalence A eqA
      (Rocq.Corelib.Classes.RelationClasses.relation_conjunction A R (Rocq.Corelib.Program.Basics.flip A A Prop R))
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.PartialOrder;Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Classes.RelationClasses.relation_conjunction;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.pointwise_extension

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.pointwise_extension

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.binary_operation (Rocq.Corelib.Classes.RelationClasses.arrows l T)

## Corelib.Classes.RelationClasses.pointwise_lifting

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (PULift Prop)

## Corelib.Classes.RelationClasses.predicate_all

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_all

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop) → Prop

## Corelib.Classes.RelationClasses.predicate_equivalence

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_equivalence

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (PULift Prop)

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist),
  Rocq.Corelib.Classes.RelationClasses.Equivalence (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
    fun a a_1 =>
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_2 => { down := a.down ↔ a_2.down }) l a a_1).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_1.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist) (x : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x x).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_2.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist) (x y : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x y).down →
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l y x).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_equivalence_equivalence_obligation_3.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (x y z : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x y).down →
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l y z).down →
      (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting (fun a a_1 => { down := a.down ↔ a_1.down }) l x z).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting

## Corelib.Classes.RelationClasses.predicate_exists

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_exists

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop) → Prop

## Corelib.Classes.RelationClasses.predicate_implication

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_implication

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (PULift Prop)

## Corelib.Classes.RelationClasses.predicate_implication_preorder

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist),
  Rocq.Corelib.Classes.RelationClasses.PreOrder (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
    fun a a_1 =>
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
        (fun a a_2 => { down := Rocq.Corelib.Program.Basics.impl a.down a_2.down }) l a a_1).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_1.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist) (x : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
      (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l x x).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.predicate_implication_preorder_obligation_2.statement.correspondence

```lean
∀ (l : Rocq.Corelib.Classes.RelationClasses.Tlist)
  (x y z : Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)),
  (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
        (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l x y).down →
    (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
          (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l y z).down →
      (Rocq.Corelib.Classes.RelationClasses.pointwise_lifting
          (fun a a_1 => { down := Rocq.Corelib.Program.Basics.impl a.down a_1.down }) l x z).down
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Tlist;Rocq.Corelib.Classes.RelationClasses.arrows;Rocq.Corelib.Classes.RelationClasses.pointwise_lifting;Rocq.Corelib.Program.Basics.impl

## Corelib.Classes.RelationClasses.predicate_intersection

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_intersection

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))

## Corelib.Classes.RelationClasses.predicate_union

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.predicate_union

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows
    (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
      (Rocq.Corelib.Classes.RelationClasses.Tlist.Tcons (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))
        Rocq.Corelib.Classes.RelationClasses.Tlist.Tnil))
    (Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop))

## Corelib.Classes.RelationClasses.reflexivity

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.reflexivity.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.reflexivity.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A R → ∀ (x : A), R x x
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive

## Corelib.Classes.RelationClasses.relation_conjunction

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.relation_conjunction

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.relation_conjunction.roundtrip

## Corelib.Classes.RelationClasses.relation_disjunction

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.relation_disjunction

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.relation_disjunction.roundtrip

## Corelib.Classes.RelationClasses.relation_equivalence

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.relation_equivalence

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.relation_equivalence.roundtrip

## Corelib.Classes.RelationClasses.relation_equivalence_equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98),
  Rocq.Corelib.Classes.RelationClasses.Equivalence (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_equivalence

## Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.relation_equivalence_rewrite_relation.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98),
  Rocq.Corelib.Classes.RelationClasses.RewriteRelation (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.RewriteRelation;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_equivalence

## Corelib.Classes.RelationClasses.relation_implication_preorder

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.relation_implication_preorder.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_21),
  Rocq.Corelib.Classes.RelationClasses.PreOrder (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.subrelation A)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.PreOrder;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.subrelation

## Corelib.Classes.RelationClasses.subrelation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.subrelation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.subrelation.roundtrip

## Corelib.Classes.RelationClasses.subrelation_partial_order

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Classes.RelationClasses.subrelation_partial_order.statement

## Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_partial_order_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_RelationClasses_98),
  Rocq.Corelib.Classes.RelationClasses.relation_equivalence (Rocq.Corelib.Relations.Relation_Definitions.relation A)
    (Rocq.Corelib.Classes.RelationClasses.relation_equivalence A)
    (Rocq.Corelib.Classes.RelationClasses.relation_conjunction (Rocq.Corelib.Relations.Relation_Definitions.relation A)
      (Rocq.Corelib.Classes.RelationClasses.subrelation A)
      (Rocq.Corelib.Program.Basics.flip (Rocq.Corelib.Relations.Relation_Definitions.relation A)
        (Rocq.Corelib.Relations.Relation_Definitions.relation A) Prop
        (Rocq.Corelib.Classes.RelationClasses.subrelation A)))
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.relation_equivalence;Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.relation_conjunction;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.subrelation_symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.subrelation_symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R →
    Rocq.Corelib.Classes.RelationClasses.subrelation A (Rocq.Corelib.Program.Basics.flip A A Prop R) R
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.RelationClasses.subrelation;Rocq.Corelib.Program.Basics.flip

## Corelib.Classes.RelationClasses.symmetry

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.symmetry.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.symmetry.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A R → ∀ (x y : A), R x y → R y x
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric

## Corelib.Classes.RelationClasses.ternary_operation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.ternary_operation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.ternary_operation.roundtrip

## Corelib.Classes.RelationClasses.transitivity

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.RelationClasses.transitivity.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.RelationClasses.transitivity.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A),
  Rocq.Corelib.Classes.RelationClasses.Transitive A R → ∀ (x y z : A), R x y → R y z → R x z
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Transitive

## Corelib.Classes.RelationClasses.true_predicate

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.RelationClasses.true_predicate

接口未覆盖原因：No registered type bijection for (l : Rocq.Corelib.Classes.RelationClasses.Tlist) →
  Rocq.Corelib.Classes.RelationClasses.arrows l (PULift Prop)

## Corelib.Classes.RelationClasses.unary_operation

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.unary_operation

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.unary_operation.roundtrip

## Corelib.Classes.RelationClasses.unary_predicate

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Classes.RelationClasses.unary_predicate

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Classes.RelationClasses.unary_predicate.roundtrip