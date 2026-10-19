# Corelib.Classes.Equivalence

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Classes.Equivalence.equiv

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A R

## Corelib.Classes.Equivalence.equiv_reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R),
  Rocq.Corelib.Classes.RelationClasses.Reflexive A (Rocq.Corelib.Classes.Equivalence.equiv A R sa)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_reflexive_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_reflexive_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (x : A), Rocq.Corelib.Classes.Equivalence.equiv A R sa x x
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R),
  Rocq.Corelib.Classes.RelationClasses.Symmetric A (Rocq.Corelib.Classes.Equivalence.equiv A R sa)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_symmetric_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_symmetric_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (x y : A),
  Rocq.Corelib.Classes.Equivalence.equiv A R sa x y → Rocq.Corelib.Classes.Equivalence.equiv A R sa y x
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R),
  Rocq.Corelib.Classes.RelationClasses.Transitive A (Rocq.Corelib.Classes.Equivalence.equiv A R sa)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.equiv_transitive_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.equiv_transitive_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Relations_Relation_Definitions_21) (R : Rocq.Corelib.Relations.Relation_Definitions.relation A)
  (sa : Rocq.Corelib.Classes.RelationClasses.Equivalence A R) (x y z : A),
  Rocq.Corelib.Classes.Equivalence.equiv A R sa x y →
    Rocq.Corelib.Classes.Equivalence.equiv A R sa y z → Rocq.Corelib.Classes.Equivalence.equiv A R sa x z
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Equivalence.equiv

## Corelib.Classes.Equivalence.pequiv

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.Equivalence.pequiv

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.RelationClasses.PER A R

## Corelib.Classes.Equivalence.pointwise_equivalence

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_equivalence.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Equivalence B eqB →
    Rocq.Corelib.Classes.RelationClasses.Equivalence (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.pointwise_reflexive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_reflexive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Reflexive B eqB →
    Rocq.Corelib.Classes.RelationClasses.Reflexive (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Reflexive;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.pointwise_symmetric

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_symmetric.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Symmetric B eqB →
    Rocq.Corelib.Classes.RelationClasses.Symmetric (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Symmetric;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.pointwise_transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.pointwise_transitive.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Morphisms_39) (B : Type u_Corelib_Classes_Morphisms_38)
  (eqB : Rocq.Corelib.Relations.Relation_Definitions.relation B),
  Rocq.Corelib.Classes.RelationClasses.Transitive B eqB →
    Rocq.Corelib.Classes.RelationClasses.Transitive (A → B) (Rocq.Corelib.Classes.Morphisms.pointwise_relation A B eqB)
```

残留源符号：Rocq.Corelib.Relations.Relation_Definitions.relation;Rocq.Corelib.Classes.RelationClasses.Transitive;Rocq.Corelib.Classes.Morphisms.pointwise_relation

## Corelib.Classes.Equivalence.respecting

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Classes.Equivalence.respecting

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Classes.RelationClasses.Equivalence A R

## Corelib.Classes.Equivalence.respecting_equiv

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        Rocq.Corelib.Classes.RelationClasses.Equivalence
          (Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) fun f g =>
          ∀ (x y : A),
            R x y →
              R'
                (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) f
                  x)
                (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) g
                  y)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Classes.Equivalence.respecting_equiv_obligation_1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_1.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        ∀ (x : Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
          (x_1 y : A),
          R x_1 y →
            R'
              (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) x
                x_1)
              (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) x
                y)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Classes.Equivalence.respecting_equiv_obligation_2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_2.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        ∀ (x y : Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)),
          (∀ (x_1 y_1 : A),
              R x_1 y_1 →
                R'
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    x x_1)
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    y y_1)) →
            ∀ (x_1 y_1 : A),
              R x_1 y_1 →
                R'
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    y x_1)
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    x y_1)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Classes.Equivalence.respecting_equiv_obligation_3

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Classes.Equivalence.respecting_equiv_obligation_3.statement.correspondence

```lean
∀ (A : Type u_Corelib_Classes_Equivalence_46) (R : A → A → Prop),
  Rocq.Corelib.Classes.RelationClasses.Equivalence A R →
    ∀ (B : Type u_Corelib_Classes_Equivalence_49) (R' : B → B → Prop),
      Rocq.Corelib.Classes.RelationClasses.Equivalence B R' →
        ∀ (x y z : Rocq.Corelib.Init.Specif.sig (A → B) fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)),
          (∀ (x_1 y_1 : A),
              R x_1 y_1 →
                R'
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    x x_1)
                  (Rocq.Corelib.Init.Specif.proj1_sig (A → B) (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y))
                    y y_1)) →
            (∀ (x y_1 : A),
                R x y_1 →
                  R'
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) y x)
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) z y_1)) →
              ∀ (x_1 y : A),
                R x_1 y →
                  R'
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) x x_1)
                    (Rocq.Corelib.Init.Specif.proj1_sig (A → B)
                      (fun morph => ∀ (x y : A), R x y → R' (morph x) (morph y)) z y)
```

残留源符号：Rocq.Corelib.Classes.RelationClasses.Equivalence;Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig