# Corelib.ssr.ssrbool

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.ssr.ssrbool.ApplicativePred

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.ApplicativePred

## Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

## Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

## Corelib.ssr.ssrbool.KeyedPred

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.KeyedPred

## Corelib.ssr.ssrbool.KeyedQualifier

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.KeyedQualifier

## Corelib.ssr.ssrbool.PredOfSimpl.coerce

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.SimplPred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.SimplPred

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.SimplRel

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.SimplRel

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.addFb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addFb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addFb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addIb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addIb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addIb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_injective Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_injective;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addKb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addKb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addKb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_loop Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool (fun x => x)
  Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_loop;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addNb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addNb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addNb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb (Rocq.Corelib.Init.Datatypes.negb a) b =
    Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.ssr.ssrbool.addb a b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addTb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addTb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addTb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb Rocq.Corelib.Init.Datatypes.bool.true b = Rocq.Corelib.Init.Datatypes.negb b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addb

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.addb

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.addb.roundtrip

## Corelib.ssr.ssrbool.addbA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.associative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.associative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbAC

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbAC.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbAC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbACA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbACA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbACA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.interchange Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
  Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.interchange;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbC

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbC.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbCA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbCA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbCA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbF.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbI

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbI.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbI.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_injective Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_injective;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbK

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbK.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbK.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_loop Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool (fun x => x)
  Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_loop;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbN.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb a (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.ssr.ssrbool.addb a b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addbP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.addbP

## Corelib.ssr.ssrbool.addbT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb b Rocq.Corelib.Init.Datatypes.bool.true = Rocq.Corelib.Init.Datatypes.negb b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addbb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.addbb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.self_inverse Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.self_inverse;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.all_and2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_and2

## Corelib.ssr.ssrbool.all_and3

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_and3

## Corelib.ssr.ssrbool.all_and4

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_and4

## Corelib.ssr.ssrbool.all_and5

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_and5

## Corelib.ssr.ssrbool.all_sig2_cond

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_sig2_cond

## Corelib.ssr.ssrbool.all_sig_cond

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_sig_cond

## Corelib.ssr.ssrbool.all_sig_cond_dep

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_sig_cond_dep

## Corelib.ssr.ssrbool.all_tag_cond

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_tag_cond

## Corelib.ssr.ssrbool.all_tag_cond_dep

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep

## Corelib.ssr.ssrbool.altP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.altP

## Corelib.ssr.ssrbool.alt_spec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.alt_spec

## Corelib.ssr.ssrbool.and3

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and3

## Corelib.ssr.ssrbool.and3P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.and3P

## Corelib.ssr.ssrbool.and3_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.and3_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and3_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P2 → P3 → P) → Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.and3

## Corelib.ssr.ssrbool.and3_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and3_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3

## Corelib.ssr.ssrbool.and3_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and3_rect

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3

## Corelib.ssr.ssrbool.and3_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.and3_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and3_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P2 → P3 → P) → Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.and3

## Corelib.ssr.ssrbool.and4

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and4

## Corelib.ssr.ssrbool.and4P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.and4P

## Corelib.ssr.ssrbool.and4_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.and4_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and4_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P2 → P3 → P4 → P) → Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.and4

## Corelib.ssr.ssrbool.and4_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and4_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4

## Corelib.ssr.ssrbool.and4_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and4_rect

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4

## Corelib.ssr.ssrbool.and4_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.and4_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and4_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P2 → P3 → P4 → P) → Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.and4

## Corelib.ssr.ssrbool.and5

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and5

## Corelib.ssr.ssrbool.and5P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.and5P

## Corelib.ssr.ssrbool.and5_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.and5_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and5_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P5 P : Prop), (P1 → P2 → P3 → P4 → P5 → P) → Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.and5

## Corelib.ssr.ssrbool.and5_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and5_rec

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5

## Corelib.ssr.ssrbool.and5_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.and5_rect

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5

## Corelib.ssr.ssrbool.and5_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.and5_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and5_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P5 P : Prop), (P1 → P2 → P3 → P4 → P5 → P) → Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.and5

## Corelib.ssr.ssrbool.andFb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andFb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andFb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_zero Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_zero;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andKb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andKb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andKb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.orb a (Rocq.Corelib.Init.Datatypes.andb b a) = a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andNb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andNb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andNb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.negb b) b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.andP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.andP

## Corelib.ssr.ssrbool.andPP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.andPP

## Corelib.ssr.ssrbool.andTb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andTb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andTb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.associative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.associative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbAC

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbAC.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbAC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbACA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbACA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbACA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.interchange Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.andb
  Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.interchange;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbC

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbC.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbCA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbCA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbCA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbF.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_zero Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_zero;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbK

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbK.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbK.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.andb a b) a = a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbN.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.andb b (Rocq.Corelib.Init.Datatypes.negb b) = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.andbT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbT.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_addl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_addl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_addl.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.andb_addr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_addr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_addr.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.ssr.ssrbool.addb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.andb_id2l

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_id2l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2l.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → b = c) →
    Rocq.Corelib.Init.Datatypes.andb a b = Rocq.Corelib.Init.Datatypes.andb a c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_id2r

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_id2r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2r.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → a = c) →
    Rocq.Corelib.Init.Datatypes.andb a b = Rocq.Corelib.Init.Datatypes.andb c b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_idl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_idl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_idl.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true a) →
    Rocq.Corelib.Init.Datatypes.andb a b = b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_idr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_idr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_idr.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.andb a b = a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_orl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_orl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_orl.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.andb_orr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andb_orr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_orr.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.andbb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.andbb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.idempotent_op Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.idempotent_op;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.antisymmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.antisymmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.antisymmetric.roundtrip

## Corelib.ssr.ssrbool.appP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.appP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.appP.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b)
  (a : Rocq.Corelib.Init.Datatypes.reflect Q b), P → Q
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect

## Corelib.ssr.ssrbool.app_predE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.app_predE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.app_predE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (ap : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred T p),
  Rocq.Corelib.ssr.ssrbool.applicative_pred_value T p ap x =
    Rocq.Corelib.ssr.ssrbool.in_mem T x (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) p)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.registered_applicative_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.applicative_pred_value;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType

## Corelib.ssr.ssrbool.applicative_mem_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.applicative_mem_pred

## Corelib.ssr.ssrbool.applicative_mem_pred_value

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T p → Rocq.Corelib.ssr.ssrbool.manifest_mem_pred T p

## Corelib.ssr.ssrbool.applicative_pred

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.applicative_pred

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.applicative_pred.roundtrip

## Corelib.ssr.ssrbool.applicative_pred_applicative

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative

## Corelib.ssr.ssrbool.applicative_pred_of_simpl

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.applicative_pred_value

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.applicative_pred_value

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.registered_applicative_pred T p → Rocq.Corelib.ssr.ssrbool.pred T

## Corelib.ssr.ssrbool.bijective_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.bijective_in

## Corelib.ssr.ssrbool.bijective_on

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.bijective_on

## Corelib.ssr.ssrbool.bind_unless

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.bind_unless

## Corelib.ssr.ssrbool.boolP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.boolP

## Corelib.ssr.ssrbool.boolfunPredType

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.boolfunPredType

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.canLR_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.canLR_in.statement

## Corelib.ssr.ssrbool.canLR_on

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.canLR_on.statement

## Corelib.ssr.ssrbool.canRL_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.canRL_in.statement

## Corelib.ssr.ssrbool.canRL_on

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.canRL_on.statement

## Corelib.ssr.ssrbool.can_in_comp

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement

## Corelib.ssr.ssrbool.can_in_inj

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement

## Corelib.ssr.ssrbool.can_in_pcan

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement

## Corelib.ssr.ssrbool.can_mono

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.can_mono.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.can_mono.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
        rR x y) →
      Rocq.Corelib.ssr.ssrfun.monomorphism_2 rT aT Rocq.Corelib.Init.Datatypes.bool g (fun x y => rR x y) fun x y =>
        aR x y
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.can_mono_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement

## Corelib.ssr.ssrbool.check_applicative_mem_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  (ap : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred T p) →
    Rocq.Corelib.ssr.ssrbool.manifest_mem_pred T (Rocq.Corelib.ssr.ssrbool.applicative_pred_value T p ap) →
      Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T (Rocq.Corelib.ssr.ssrbool.applicative_pred_value T p ap)

## Corelib.ssr.ssrbool.classicP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classicP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classicP.statement.correspondence

```lean
∀ (P : Prop), Rocq.Corelib.ssr.ssrbool.classically P ↔ ¬¬P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classicW

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classicW.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classicW.statement.correspondence

```lean
∀ (P : Sort u_Corelib_ssr_ssrbool_432) (a : P), Rocq.Corelib.ssr.ssrbool.classically P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_EM

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classic_EM.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_EM.statement.correspondence

```lean
∀ (P : Prop), Rocq.Corelib.ssr.ssrbool.classically (Rocq.Corelib.ssr.ssrbool.decidable P)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically;Rocq.Corelib.ssr.ssrbool.decidable

## Corelib.ssr.ssrbool.classic_bind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classic_bind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_bind.statement.correspondence

```lean
∀ (P : Sort u_Corelib_ssr_ssrbool_435) (Q : Sort u_Corelib_ssr_ssrbool_436),
  (∀ (a : P), Rocq.Corelib.ssr.ssrbool.classically Q) →
    Rocq.Corelib.ssr.ssrbool.classically P → Rocq.Corelib.ssr.ssrbool.classically Q
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_ex

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classic_ex.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_ex.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_512) (P : T → Prop),
  (¬∀ (x : T), ¬P x) → Rocq.Corelib.ssr.ssrbool.classically (∃ x, P x)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_imply

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classic_imply.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_imply.statement.correspondence

```lean
∀ (P : Type u_Corelib_ssr_ssrbool_481) (Q : Type u_Corelib_ssr_ssrbool_482),
  (∀ (a : P), Rocq.Corelib.ssr.ssrbool.classically Q) → Rocq.Corelib.ssr.ssrbool.classically (P → Q)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_pick

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classic_pick.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_pick.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_458) (P : T → Prop),
  Rocq.Corelib.ssr.ssrbool.classically
    (Rocq.Corelib.Init.Datatypes.sum (Rocq.Corelib.Init.Specif.sig T fun x => P x) (∀ (x : T), ¬P x))
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically;Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Specif.sig

## Corelib.ssr.ssrbool.classic_sigW

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.classic_sigW.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_sigW.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_498) (P : T → Prop),
  Rocq.Corelib.ssr.ssrbool.classically (∃ x, P x) ↔
    Rocq.Corelib.ssr.ssrbool.classically (Rocq.Corelib.Init.Specif.sig T fun x => P x)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.classically;Rocq.Corelib.Init.Specif.sig

## Corelib.ssr.ssrbool.classically

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.classically

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.classically.roundtrip

## Corelib.ssr.ssrbool.clone_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.clone_pred

接口未覆盖原因：No registered type bijection for (pT : Rocq.Corelib.ssr.ssrbool.predType T) →
  (Rocq.Corelib.ssr.ssrbool.pred_sort T pT → U) →
    (toP : U → Rocq.Corelib.ssr.ssrbool.pred T) →
      Rocq.Corelib.ssr.ssrfun.phant_id (Rocq.Corelib.ssr.ssrbool.predType T) (Rocq.Corelib.ssr.ssrbool.predType T)
          (Rocq.Corelib.ssr.ssrbool.predType.PredType T U toP) pT →
        Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.collective_pred

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.collective_pred

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.collective_pred.roundtrip

## Corelib.ssr.ssrbool.collective_pred_of_simpl

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.contra

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contra.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraFF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraFF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFF.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    b = Rocq.Corelib.Init.Datatypes.bool.false → c = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraFN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraFN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFN.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    b = Rocq.Corelib.Init.Datatypes.bool.false →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraFT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraFT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFT.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) → Rocq.Corelib.Init.Datatypes.is_true b) →
    b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.is_true c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraFnot

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraFnot.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFnot.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (P → Rocq.Corelib.Init.Datatypes.is_true b) → b = Rocq.Corelib.Init.Datatypes.bool.false → ¬P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraL

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraL.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraL.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraLR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraLR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraLR.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraNF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraNF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNF.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      c = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraNN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraNN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNN.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraNT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraNT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNT.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → Rocq.Corelib.Init.Datatypes.is_true c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraNnot

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraNnot.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNnot.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (P → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → ¬P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraPF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraPF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → ¬P) → P → b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraPN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraPN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → ¬P) →
    P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraPT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraPT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → ¬P) →
    P → Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraPnot

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrbool.contraPnot.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPnot.statement.correspondence

```lean
∀ (P Q : Prop), (Q → ¬P) → P → ¬Q
```

## Corelib.ssr.ssrbool.contraR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraR.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → Rocq.Corelib.Init.Datatypes.is_true c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.false) →
    Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraTF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraTF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTF.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → c = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraTN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraTN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTN.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraTT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraTT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTT.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraTnot

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contraTnot.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTnot.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool) (P : Prop),
  (P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → ¬P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contra_not

状态：STATEMENT_FULL_NATIVE。陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。

原始目标：Rocq.Corelib.ssr.ssrbool.contra_not.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_not.statement.correspondence

```lean
∀ (P Q : Prop), (Q → P) → ¬P → ¬Q
```

## Corelib.ssr.ssrbool.contra_notF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contra_notF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_notF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → P) → ¬P → b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contra_notN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contra_notN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_notN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → P) →
    ¬P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contra_notT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.contra_notT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_notT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → P) →
    ¬P → Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.decP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.decP

## Corelib.ssr.ssrbool.decPcases

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.decPcases.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.decPcases.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.bool.rec P (¬P) b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.decidable

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.decidable

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.decidable.roundtrip

## Corelib.ssr.ssrbool.elimF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  b = Rocq.Corelib.Init.Datatypes.bool.false → ¬P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.elimFn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimFn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimFn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  b' = Rocq.Corelib.Init.Datatypes.bool.false → P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.elimN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → ¬P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.elimNTF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimNTF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimNTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.negb b = c → Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.elimNf

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimNf.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimNf.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false → P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.elimT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.is_true b → P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.elimTF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimTF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  b = c → Rocq.Corelib.Init.Datatypes.bool.rec P (¬P) c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.elimTFn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimTFn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimTFn.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  b = c → Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.elimTn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.elimTn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimTn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  Rocq.Corelib.Init.Datatypes.is_true b' → ¬P
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.eq_mem

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.eq_mem

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.eqbLR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.eqbLR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.eqbLR.statement.correspondence

```lean
∀ (b1 b2 : Rocq.Corelib.Init.Datatypes.bool),
  b1 = b2 → Rocq.Corelib.Init.Datatypes.is_true b1 → Rocq.Corelib.Init.Datatypes.is_true b2
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.eqbRL

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.eqbRL.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.eqbRL.statement.correspondence

```lean
∀ (b1 b2 : Rocq.Corelib.Init.Datatypes.bool),
  b1 = b2 → Rocq.Corelib.Init.Datatypes.is_true b2 → Rocq.Corelib.Init.Datatypes.is_true b1
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.equivP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.equivP

## Corelib.ssr.ssrbool.equivPif

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.equivPif.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.equivPif.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  (Q → P) → (P → Q) → Rocq.Corelib.Init.Datatypes.bool.rec Q (¬Q) b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.equivPifn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.equivPifn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.equivPifn.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  (Q → P) → (P → Q) → Rocq.Corelib.Init.Datatypes.bool.rec (¬Q) Q b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.equivalence_rel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.equivalence_rel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.equivalence_rel.roundtrip

## Corelib.ssr.ssrbool.equivalence_relP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1473) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.equivalence_rel T R ↔
    Rocq.Corelib.ssr.ssrbool.reflexive T R ∧ Rocq.Corelib.ssr.ssrbool.left_transitive T R
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.equivalence_rel;Rocq.Corelib.ssr.ssrbool.reflexive;Rocq.Corelib.ssr.ssrbool.left_transitive

## Corelib.ssr.ssrbool.equivalence_relP_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement

## Corelib.ssr.ssrbool.expose_mem_pred

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.expose_mem_pred

## Corelib.ssr.ssrbool.expose_simpl_pred

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred

## Corelib.ssr.ssrbool.forE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.forE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.forE.statement.correspondence

```lean
∀ (T1 : Sort u_Corelib_ssr_ssrbool_1531) (x : T1) (P : T1 → Prop)
  (phP : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P x)),
  Rocq.Corelib.ssr.ssrbool.prop_for T1 x P phP = P x
```

残留源符号：Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_for

## Corelib.ssr.ssrbool.fun_if

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.fun_if.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.fun_if.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (B : Sort u_Corelib_ssr_ssrbool_179) (f : A → B)
  (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  f (Rocq.Corelib.Init.Datatypes.bool.rec vT vF b) = Rocq.Corelib.Init.Datatypes.bool.rec (f vT) (f vF) b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.fun_of_pred

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.fun_of_pred

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.fun_of_pred.roundtrip

## Corelib.ssr.ssrbool.fun_of_rel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.fun_of_rel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.fun_of_rel.roundtrip

## Corelib.ssr.ssrbool.has_quality

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.has_quality

接口未覆盖原因：No registered type bijection for (n : Rocq.Corelib.Init.Datatypes.nat) →
  (T : Type u_Corelib_ssr_ssrbool_1121) →
    Rocq.Corelib.ssr.ssrbool.qualifier n T →
      Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)

## Corelib.ssr.ssrbool.homoLR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.homoLR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homoLR.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
        Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
      ∀ (x : aT) (y : rT),
        Rocq.Corelib.Init.Datatypes.is_true (aR x (g y)) → Rocq.Corelib.Init.Datatypes.is_true (rR (f x) y)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.homoLR_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement

## Corelib.ssr.ssrbool.homoRL

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.homoRL.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homoRL.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
        Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
      ∀ (x : rT) (y : aT),
        Rocq.Corelib.Init.Datatypes.is_true (aR (g x) y) → Rocq.Corelib.Init.Datatypes.is_true (rR x (f y))
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.homoRL_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement

## Corelib.ssr.ssrbool.homo_mono

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.homo_mono.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homo_mono.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
        Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
      (Rocq.Corelib.ssr.ssrfun.homomorphism_2 rT aT g (fun x y => Rocq.Corelib.Init.Datatypes.is_true (rR x y))
          fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) →
        Rocq.Corelib.ssr.ssrfun.monomorphism_2 rT aT Rocq.Corelib.Init.Datatypes.bool g (fun x y => rR x y) fun x y =>
          aR x y
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.homo_mono_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement

## Corelib.ssr.ssrbool.homo_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.homo_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homo_sym.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (aR : Rocq.Corelib.ssr.ssrbool.rel aT)
  (rR : Rocq.Corelib.ssr.ssrbool.rel rT) (f : aT → rT),
  (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
      Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
    Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun y x => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun y x =>
      Rocq.Corelib.Init.Datatypes.is_true (rR x y)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.homo_sym_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement

## Corelib.ssr.ssrbool.homo_sym_in11

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement

## Corelib.ssr.ssrbool.idP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.idP

## Corelib.ssr.ssrbool.idPn

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.idPn

## Corelib.ssr.ssrbool.ifE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.ifE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifE.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = Rocq.Corelib.ssr.ssrbool.if_expr A b vT vF
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.ssr.ssrbool.if_expr

## Corelib.ssr.ssrbool.ifF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.ifF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifF.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = vF
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.ifN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.ifN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifN.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
    Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = vF
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.ifP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.ifP

## Corelib.ssr.ssrbool.ifPn

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.ifPn

## Corelib.ssr.ssrbool.ifT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.ifT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = vT
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.if_arg

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.if_arg.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.if_arg.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (B : Sort u_Corelib_ssr_ssrbool_179) (x : A)
  (b : Rocq.Corelib.Init.Datatypes.bool) (fT fF : A → B),
  Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun t => A → B) fT fF b x =
    Rocq.Corelib.Init.Datatypes.bool.rec (fT x) (fF x) b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.if_expr

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.if_expr

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.if_expr.roundtrip

## Corelib.ssr.ssrbool.if_neg

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.if_neg.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.if_neg.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.bool.rec vT vF (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.bool.rec vF vT b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.if_same

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.if_same.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.if_same.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT : A),
  Rocq.Corelib.Init.Datatypes.bool.rec vT vT b = vT
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.if_spec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.if_spec

## Corelib.ssr.ssrbool.iffP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.iffP

## Corelib.ssr.ssrbool.implies

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.implies

## Corelib.ssr.ssrbool.impliesP

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.impliesP

## Corelib.ssr.ssrbool.impliesPn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.impliesPn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.impliesPn.statement.correspondence

```lean
∀ (P Q : Prop) (a : Rocq.Corelib.ssr.ssrbool.implies P Q), ¬Q → ¬P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.implies

## Corelib.ssr.ssrbool.implyFb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implyFb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyFb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.implb Rocq.Corelib.Init.Datatypes.bool.false b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.implyNb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implyNb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyNb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb (Rocq.Corelib.Init.Datatypes.negb a) b = Rocq.Corelib.Init.Datatypes.orb a b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.implyP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.implyP

## Corelib.ssr.ssrbool.implyPP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.implyPP

## Corelib.ssr.ssrbool.implyTb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implyTb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyTb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.implb Rocq.Corelib.Init.Datatypes.bool.true b = b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.implybE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implybE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybE.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb a b = Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.negb a) b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implybF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybF.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb b Rocq.Corelib.Init.Datatypes.bool.false = Rocq.Corelib.Init.Datatypes.negb b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implybN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybN.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb a (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.implb b (Rocq.Corelib.Init.Datatypes.negb a)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybNN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implybNN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybNN.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb (Rocq.Corelib.Init.Datatypes.negb a) (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.implb b a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implybT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.implb b Rocq.Corelib.Init.Datatypes.bool.true)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.implyb_id2l

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → b = c) →
    Rocq.Corelib.Init.Datatypes.implb a b = Rocq.Corelib.Init.Datatypes.implb a c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.implyb_idl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implyb_idl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idl.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb a) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.implb a b = b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.implyb_idr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implyb_idr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idr.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb a)) →
    Rocq.Corelib.Init.Datatypes.implb a b = Rocq.Corelib.Init.Datatypes.negb a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.implybb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.implybb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.implb b b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.in1T

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in1T.statement

## Corelib.ssr.ssrbool.in1W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in1W.statement

## Corelib.ssr.ssrbool.in1_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in1_sig.statement

## Corelib.ssr.ssrbool.in2T

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in2T.statement

## Corelib.ssr.ssrbool.in2W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in2W.statement

## Corelib.ssr.ssrbool.in2_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in2_sig.statement

## Corelib.ssr.ssrbool.in3T

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in3T.statement

## Corelib.ssr.ssrbool.in3W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in3W.statement

## Corelib.ssr.ssrbool.in3_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in3_sig.statement

## Corelib.ssr.ssrbool.inE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.inE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.inE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253),
  Rocq.Corelib.Init.Datatypes.prod.qualityProp
    (Rocq.Corelib.Init.Datatypes.prod.qualityProp
      (∀ (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T) (amp : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T p),
        Rocq.Corelib.ssr.ssrbool.in_mem T x
            (Rocq.Corelib.ssr.ssrbool.mem_pred_value T p
              (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value T p amp)) =
          p x)
      (∀ (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T) (msp : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p),
        Rocq.Corelib.ssr.ssrbool.in_mem T x
            (Rocq.Corelib.ssr.ssrbool.mem_pred.Mem T fun x =>
              Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.simpl_pred_value T p msp) x) =
          p x))
    (∀ (p : Rocq.Corelib.ssr.ssrbool.pred T),
      Rocq.Corelib.ssr.ssrfun.eqfun Rocq.Corelib.Init.Datatypes.bool T
        (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.SimplPred T p)) p)
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod.qualityProp;Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem_pred_value;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value;Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred;Rocq.Corelib.ssr.ssrbool.mem_pred.Mem;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_pred_value;Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.ssr.ssrbool.SimplPred

## Corelib.ssr.ssrbool.inPhantom

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.inPhantom.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.inPhantom.statement.correspondence

```lean
∀ (p : Prop), Rocq.Corelib.ssr.ssreflect_rw.phantom Prop p
```

残留源符号：Rocq.Corelib.ssr.ssreflect_rw.phantom

## Corelib.ssr.ssrbool.inT_bij

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.inT_bij.statement

## Corelib.ssr.ssrbool.inW_bij

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.inW_bij.statement

## Corelib.ssr.ssrbool.in_applicative

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.in_applicative.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.in_applicative.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (amp : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T p),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem_pred_value T p (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value T p amp)) =
    p x
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem_pred_value;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value

## Corelib.ssr.ssrbool.in_collective

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.in_collective.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.in_collective.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (msp : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
        (Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl T (Rocq.Corelib.ssr.ssrbool.simpl_pred_value T p msp))) =
    p x
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl;Rocq.Corelib.ssr.ssrbool.simpl_pred_value

## Corelib.ssr.ssrbool.in_inj_comp

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement

## Corelib.ssr.ssrbool.in_mem

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.in_mem

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.in_on1P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on1P.statement

## Corelib.ssr.ssrbool.in_on1S

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on1S.statement

## Corelib.ssr.ssrbool.in_on1W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on1W.statement

## Corelib.ssr.ssrbool.in_on1lP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement

## Corelib.ssr.ssrbool.in_on1lS

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement

## Corelib.ssr.ssrbool.in_on1lW

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement

## Corelib.ssr.ssrbool.in_on2P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on2P.statement

## Corelib.ssr.ssrbool.in_on2S

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on2S.statement

## Corelib.ssr.ssrbool.in_on2W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_on2W.statement

## Corelib.ssr.ssrbool.in_onS_can

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement

## Corelib.ssr.ssrbool.in_onW_can

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement

## Corelib.ssr.ssrbool.in_simpl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.in_simpl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.in_simpl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (msp : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem_pred.Mem T fun x =>
        Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.simpl_pred_value T p msp) x) =
    p x
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem_pred.Mem;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_pred_value

## Corelib.ssr.ssrbool.inj_can_sym_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement

## Corelib.ssr.ssrbool.inj_can_sym_in_on

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement

## Corelib.ssr.ssrbool.inj_can_sym_on

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement

## Corelib.ssr.ssrbool.introF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  ¬P → b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.introFn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introFn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introFn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  P → b' = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.introN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  ¬P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.introNTF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introNTF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introNTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c → Rocq.Corelib.Init.Datatypes.negb b = c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.introNf

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introNf.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introNf.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  P → Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.introP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.introP

## Corelib.ssr.ssrbool.introT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  P → Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.introTF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introTF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.bool.rec P (¬P) c → b = c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.introTFn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introTFn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introTFn.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c → b = c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.introTn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.introTn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introTn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  ¬P → Rocq.Corelib.Init.Datatypes.is_true b'
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.irreflexive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.irreflexive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.irreflexive.roundtrip

## Corelib.ssr.ssrbool.isSome

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.isSome

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.isSome.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrbool.isT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.isT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.isT.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.is_inl

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.is_inl

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.is_inl.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrbool.is_inleft

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.is_inleft

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.is_inleft.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.ssr.ssrbool.is_left

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.is_left

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.is_left.roundtrip

## Corelib.ssr.ssrbool.is_true_locked_true

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.is_true
  (Rocq.Corelib.ssr.ssreflect_rw.locked Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool.true)
```

残留源符号：Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.ssr.ssreflect_rw.locked;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.is_true_true

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.is_true_true.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.is_true_true.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.keyed_mem

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.keyed_mem

## Corelib.ssr.ssrbool.keyed_mem_simpl

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl

## Corelib.ssr.ssrbool.keyed_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.keyed_pred

## Corelib.ssr.ssrbool.keyed_predE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.keyed_predE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.keyed_predE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1345)
  (p : Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T))
  (k : Rocq.Corelib.ssr.ssrbool.pred_key T p) (k_p : Rocq.Corelib.ssr.ssrbool.keyed_pred T p k),
  Rocq.Corelib.ssr.ssrbool.eq_mem T
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
      (Rocq.Corelib.ssr.ssrbool.unkey_pred T p k k_p))
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) p)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.pred_key;Rocq.Corelib.ssr.ssrbool.keyed_pred;Rocq.Corelib.ssr.ssrbool.eq_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.unkey_pred

## Corelib.ssr.ssrbool.keyed_qualifier

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.keyed_qualifier

## Corelib.ssr.ssrbool.keyed_qualifier_keyed

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed

## Corelib.ssr.ssrbool.keyed_qualifier_suproof

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1348) (n : Nat) (q : Rocq.Corelib.ssr.ssrbool.qualifier (NativeBridge.natOf n) T)
  (k : Rocq.Corelib.ssr.ssrbool.pred_key T (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T q))
  (k_q : Rocq.Corelib.ssr.ssrbool.keyed_qualifier T (NativeBridge.natOf n) q k),
  Rocq.Corelib.ssr.ssrbool.eq_mem T
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
      (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T
        (Rocq.Corelib.ssr.ssrbool.unkey_qualifier T (NativeBridge.natOf n) q k k_q)))
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
      (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T q))
```

残留源符号：Rocq.Corelib.ssr.ssrbool.qualifier;Rocq.Corelib.ssr.ssrbool.pred_key;Rocq.Corelib.ssr.ssrbool.has_quality;Rocq.Corelib.ssr.ssrbool.keyed_qualifier;Rocq.Corelib.ssr.ssrbool.eq_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.unkey_qualifier

## Corelib.ssr.ssrbool.left_transitive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.left_transitive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.left_transitive.roundtrip

## Corelib.ssr.ssrbool.manifest_mem_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.manifest_mem_pred

## Corelib.ssr.ssrbool.manifest_simpl_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred

## Corelib.ssr.ssrbool.mem

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.mem

接口未覆盖原因：No registered type bijection for (pT : Rocq.Corelib.ssr.ssrbool.predType T) →
  Rocq.Corelib.ssr.ssrbool.pred_sort T pT → Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.memE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.memE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.memE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (sp : Rocq.Corelib.ssr.ssrbool.simpl_pred T),
  Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T
      (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T
        (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.simplPredType T) sp)) =
    Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T sp
```

残留源符号：Rocq.Corelib.ssr.ssrbool.simpl_pred;Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_of_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.simplPredType

## Corelib.ssr.ssrbool.memPredType

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.memPredType

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.mem_mem

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.mem_mem.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mem_mem.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (mp : Rocq.Corelib.ssr.ssrbool.mem_pred T),
  Rocq.Corelib.Init.Datatypes.prod.qualityProp
    (Rocq.Corelib.Init.Datatypes.prod.qualityProp
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.memPredType T) mp = mp)
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.simplPredType T)
          (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T mp) =
        mp))
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
        (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T mp)) =
      mp)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.Init.Datatypes.prod.qualityProp;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.memPredType;Rocq.Corelib.ssr.ssrbool.simplPredType;Rocq.Corelib.ssr.ssrbool.simpl_of_mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce

## Corelib.ssr.ssrbool.mem_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.mem_pred

## Corelib.ssr.ssrbool.mem_pred_value

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.mem_pred_value

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.manifest_mem_pred T p → Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.mem_simpl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.mem_simpl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mem_simpl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (sp : Rocq.Corelib.ssr.ssrbool.simpl_pred T),
  Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T
      (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T
        (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.simplPredType T) sp)) =
    Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T sp
```

残留源符号：Rocq.Corelib.ssr.ssrbool.simpl_pred;Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_of_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.simplPredType

## Corelib.ssr.ssrbool.mem_topred

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.mem_topred.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mem_topred.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (pT : Rocq.Corelib.ssr.ssrbool.predType T)
  (pp : Rocq.Corelib.ssr.ssrbool.pred_sort T pT),
  Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) (Rocq.Corelib.ssr.ssrbool.topred T pT pp) =
    Rocq.Corelib.ssr.ssrbool.mem T pT pp
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predType;Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.topred

## Corelib.ssr.ssrbool.mono1W_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement

## Corelib.ssr.ssrbool.mono2W

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.mono2W.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mono2W.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
      rR x y) →
    Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
      Rocq.Corelib.Init.Datatypes.is_true (rR x y)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.monoLR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.monoLR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.monoLR.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
        rR x y) →
      ∀ (x : aT) (y : rT), rR (f x) y = aR x (g y)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.monoLR_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement

## Corelib.ssr.ssrbool.monoRL

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.monoRL.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.monoRL.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
        rR x y) →
      ∀ (x : rT) (y : aT), rR x (f y) = aR (g x) y
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.monoRL_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement

## Corelib.ssr.ssrbool.monoW

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.monoW.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.monoW.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT)
  (aP : Rocq.Corelib.ssr.ssrbool.pred aT) (rP : Rocq.Corelib.ssr.ssrbool.pred rT),
  (Rocq.Corelib.ssr.ssrfun.monomorphism_1 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x => aP x) fun x => rP x) →
    Rocq.Corelib.ssr.ssrfun.homomorphism_1 aT rT f (fun x => Rocq.Corelib.Init.Datatypes.is_true (aP x)) fun x =>
      Rocq.Corelib.Init.Datatypes.is_true (rP x)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrfun.monomorphism_1;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrfun.homomorphism_1;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.monoW_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.monoW_in.statement

## Corelib.ssr.ssrbool.mono_sym

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.mono_sym.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mono_sym.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (aR : Rocq.Corelib.ssr.ssrbool.rel aT)
  (rR : Rocq.Corelib.ssr.ssrbool.rel rT) (f : aT → rT),
  (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
      rR x y) →
    Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun y x => aR x y) fun y x =>
      rR x y
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.mono_sym_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement

## Corelib.ssr.ssrbool.mono_sym_in11

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement

## Corelib.ssr.ssrbool.nandP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.nandP

## Corelib.ssr.ssrbool.negP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.negP

## Corelib.ssr.ssrbool.negPP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.negPP

## Corelib.ssr.ssrbool.negPf

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.negPf

## Corelib.ssr.ssrbool.negPn

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.negPn

## Corelib.ssr.ssrbool.negbF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbF.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.negbFE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbFE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbFE.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.negbK

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbK.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbK.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.involutive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.negb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.involutive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbLR

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbLR.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbLR.statement.correspondence

```lean
∀ (b c : Rocq.Corelib.Init.Datatypes.bool),
  b = Rocq.Corelib.Init.Datatypes.negb c → Rocq.Corelib.Init.Datatypes.negb b = c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbNE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbNE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbNE.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbRL

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbRL.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbRL.statement.correspondence

```lean
∀ (b c : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb b = c → b = Rocq.Corelib.Init.Datatypes.negb c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbTE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negbTE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbTE.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → b = Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.negb_and

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negb_and.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_and.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.andb a b) =
    Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.negb a) (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.negb_imply

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negb_imply.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_imply.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.implb a b) =
    Rocq.Corelib.Init.Datatypes.andb a (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.negb_inj

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negb_inj.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_inj.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.injective Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.negb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negb_or

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.negb_or.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_or.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.orb a b) =
    Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.negb a) (Rocq.Corelib.Init.Datatypes.negb b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.norP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.norP

## Corelib.ssr.ssrbool.notF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.notF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.notF.statement.correspondence

```lean
¬Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.not_false_is_true

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement.correspondence

```lean
¬Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.false
```

残留源符号：Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.ocan_in_comp

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement

## Corelib.ssr.ssrbool.on1S

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1S.statement

## Corelib.ssr.ssrbool.on1S_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1S_in.statement

## Corelib.ssr.ssrbool.on1T

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1T.statement

## Corelib.ssr.ssrbool.on1W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1W.statement

## Corelib.ssr.ssrbool.on1W_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1W_in.statement

## Corelib.ssr.ssrbool.on1lS

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1lS.statement

## Corelib.ssr.ssrbool.on1lS_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement

## Corelib.ssr.ssrbool.on1lT

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1lT.statement

## Corelib.ssr.ssrbool.on1lW

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1lW.statement

## Corelib.ssr.ssrbool.on1lW_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement

## Corelib.ssr.ssrbool.on2S

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on2S.statement

## Corelib.ssr.ssrbool.on2S_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on2S_in.statement

## Corelib.ssr.ssrbool.on2T

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on2T.statement

## Corelib.ssr.ssrbool.on2W

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on2W.statement

## Corelib.ssr.ssrbool.on2W_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on2W_in.statement

## Corelib.ssr.ssrbool.onPhantom

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.onPhantom.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.onPhantom.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_1694) (P : T → Prop) (x : T), Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (P x)
```

残留源符号：Rocq.Corelib.ssr.ssreflect_rw.phantom

## Corelib.ssr.ssrbool.onS_can

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.onS_can.statement

## Corelib.ssr.ssrbool.onS_can_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement

## Corelib.ssr.ssrbool.onT_bij

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.onT_bij.statement

## Corelib.ssr.ssrbool.onW_bij

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.onW_bij.statement

## Corelib.ssr.ssrbool.onW_can

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.onW_can.statement

## Corelib.ssr.ssrbool.onW_can_in

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement

## Corelib.ssr.ssrbool.on_can_inj

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement

## Corelib.ssr.ssrbool.or3

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.or3

## Corelib.ssr.ssrbool.or3P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.or3P

## Corelib.ssr.ssrbool.or3_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.or3_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or3_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.or3

## Corelib.ssr.ssrbool.or3_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.or3_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or3_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.or3

## Corelib.ssr.ssrbool.or4

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.or4

## Corelib.ssr.ssrbool.or4P

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.or4P

## Corelib.ssr.ssrbool.or4_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.or4_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or4_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → (P4 → P) → Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.or4

## Corelib.ssr.ssrbool.or4_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.or4_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or4_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → (P4 → P) → Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4 → P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.or4

## Corelib.ssr.ssrbool.orFb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orFb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orFb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orKb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orKb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orKb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.andb a (Rocq.Corelib.Init.Datatypes.orb b a) = a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orNb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orNb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orNb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.negb b) b = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.orP

## Corelib.ssr.ssrbool.orPP

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.orPP

## Corelib.ssr.ssrbool.orTb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orTb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orTb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.orb Rocq.Corelib.Init.Datatypes.bool.true b)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orbA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.associative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.associative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbAC

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbAC.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbAC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbACA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbACA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbACA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.interchange Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.orb
  Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.interchange;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbC

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbC.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbCA

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbCA.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbCA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbF

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbF.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbF.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbK

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbK.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbK.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.orb a b) a = a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbN

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbN.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbN.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.orb b (Rocq.Corelib.Init.Datatypes.negb b) = Rocq.Corelib.Init.Datatypes.bool.true
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orbT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.orb b Rocq.Corelib.Init.Datatypes.bool.true)
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orb_andl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orb_andl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_andl.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.left_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.orb_andr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orb_andr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_andr.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb Rocq.Corelib.Init.Datatypes.andb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.right_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.orb_id2l

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orb_id2l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2l.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb a) → b = c) →
    Rocq.Corelib.Init.Datatypes.orb a b = Rocq.Corelib.Init.Datatypes.orb a c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orb_id2r

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orb_id2r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2r.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → a = c) →
    Rocq.Corelib.Init.Datatypes.orb a b = Rocq.Corelib.Init.Datatypes.orb c b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orb_idl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orb_idl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_idl.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.orb a b = b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orb_idr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orb_idr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_idr.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true a) →
    Rocq.Corelib.Init.Datatypes.orb a b = a
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbb

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.orbb.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.idempotent_op Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.orb
```

残留源符号：Rocq.Corelib.ssr.ssrfun.idempotent_op;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.pair_andP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.pair_andP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.pair_andP.statement.correspondence

```lean
∀ (P Q : Prop), P ∧ Q ↔ Rocq.Corelib.Init.Datatypes.prod.qualityProp P Q
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod.qualityProp

## Corelib.ssr.ssrbool.pcan_in_comp

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement

## Corelib.ssr.ssrbool.pcan_in_inj

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement

## Corelib.ssr.ssrbool.pre_symmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.pre_symmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.pre_symmetric.roundtrip

## Corelib.ssr.ssrbool.pred

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.pred

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.pred.roundtrip

## Corelib.ssr.ssrbool.pred0

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.pred0

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predArgType

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.predArgType

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.predArgType.roundtrip

## Corelib.ssr.ssrbool.predC

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predC

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predD

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predD

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predI

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predI

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predPredType

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predPredType

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.predT

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predT

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predType

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predType

## Corelib.ssr.ssrbool.predU

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.predU

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.pred_key

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.pred_key

## Corelib.ssr.ssrbool.pred_oapp

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.pred_oapp

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.pred_oapp.roundtrip

## Corelib.ssr.ssrbool.pred_of_argType

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.pred_of_argType

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.pred_of_mem

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.pred_of_mem

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.pred_sort

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.pred_sort

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.preim

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.preim

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.prop_congr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_congr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.prop_congr.statement.correspondence

```lean
∀ (b b' : Rocq.Corelib.Init.Datatypes.bool),
  b = b' → Rocq.Corelib.Init.Datatypes.is_true b = Rocq.Corelib.Init.Datatypes.is_true b'
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.prop_for

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_for

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P x)

## Corelib.ssr.ssrbool.prop_in1

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in1

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in11

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in11

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in111

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in111

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in12

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in12

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in2

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in21

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in21

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in3

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_in3

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_on1

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_on1

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T2

## Corelib.ssr.ssrbool.prop_on2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.prop_on2

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T2

## Corelib.ssr.ssrbool.qualifE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.qualifE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.qualifE.statement.correspondence

```lean
∀ (n : Nat) (T : Type u_Corelib_ssr_ssrbool_1343)
  (p : Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)) (x : T),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
        (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T
          (Rocq.Corelib.ssr.ssrbool.qualifier.Qualifier (NativeBridge.natOf n) T p))) =
    p x
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.has_quality;Rocq.Corelib.ssr.ssrbool.qualifier.Qualifier

## Corelib.ssr.ssrbool.qualifier

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.qualifier

## Corelib.ssr.ssrbool.reflexive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.reflexive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.reflexive.roundtrip

## Corelib.ssr.ssrbool.registered_applicative_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.registered_applicative_pred

## Corelib.ssr.ssrbool.rel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.rel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.rel.roundtrip

## Corelib.ssr.ssrbool.relU

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.relU

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.rel_of_simpl

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.rel_of_simpl

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.relpre

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.relpre

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.rev_trans

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.rev_trans.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.rev_trans.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1105) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.transitive T R → Rocq.Corelib.ssr.ssrbool.transitive T fun x y => R y x
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.transitive

## Corelib.ssr.ssrbool.right_transitive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.right_transitive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.right_transitive.roundtrip

## Corelib.ssr.ssrbool.rwP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.rwP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.rwP.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  P ↔ Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.rwP2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.rwP2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.rwP2.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b)
  (a : Rocq.Corelib.Init.Datatypes.reflect Q b), P ↔ Q
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect

## Corelib.ssr.ssrbool.sameP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sameP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sameP.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b)
  (a : Rocq.Corelib.Init.Datatypes.reflect P c), b = c
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect

## Corelib.ssr.ssrbool.simplPredType

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.simplPredType

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.simpl_of_mem

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.simpl_of_mem

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.simpl_pred

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.simpl_pred

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.simpl_pred.roundtrip

## Corelib.ssr.ssrbool.simpl_predE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.simpl_predE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.simpl_predE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (p : Rocq.Corelib.ssr.ssrbool.pred T),
  Rocq.Corelib.ssr.ssrfun.eqfun Rocq.Corelib.Init.Datatypes.bool T
    (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.SimplPred T p)) p
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.SimplPred

## Corelib.ssr.ssrbool.simpl_pred_value

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.simpl_pred_value

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p → Rocq.Corelib.ssr.ssrbool.simpl_pred T

## Corelib.ssr.ssrbool.simpl_rel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.simpl_rel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.simpl_rel.roundtrip

## Corelib.ssr.ssrbool.sort_of_predArgType

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.sort_of_predArgType

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.sort_of_predArgType.roundtrip

## Corelib.ssr.ssrbool.sub_in1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in1.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1) (P1 : T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P1 x)),
      Rocq.Corelib.ssr.ssrbool.prop_in1 T1 d1' P1 Ph → Rocq.Corelib.ssr.ssrbool.prop_in1 T1 d1 P1 Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in1

## Corelib.ssr.ssrbool.sub_in11

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in11.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in11.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1) (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (P2 : T1 → T2 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
      ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2), P2 x y)),
        Rocq.Corelib.ssr.ssrbool.prop_in11 T1 T2 d1' d2' P2 Ph → Rocq.Corelib.ssr.ssrbool.prop_in11 T1 T2 d1 d2 P2 Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in11

## Corelib.ssr.ssrbool.sub_in111

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in111.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in111.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (T3 : Rocq.Corelib.ssr.ssrbool.predArgType) (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1)
  (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (d3 d3' : Rocq.Corelib.ssr.ssrbool.mem_pred T3)
  (P3 : T1 → T2 → T3 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
      Rocq.Corelib.ssr.ssrbool.sub_mem T3 d3 d3' →
        ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2) (z : T3), P3 x y z)),
          Rocq.Corelib.ssr.ssrbool.prop_in111 T1 T2 T3 d1' d2' d3' P3 Ph →
            Rocq.Corelib.ssr.ssrbool.prop_in111 T1 T2 T3 d1 d2 d3 P3 Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in111

## Corelib.ssr.ssrbool.sub_in12

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in12.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in12.statement.correspondence

```lean
∀ (T1 : Type u_Corelib_ssr_ssrbool_2134) (T : Type u_Corelib_ssr_ssrbool_2135)
  (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1) (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (P : T1 → T → T → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
      ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y z : T), P x y z)),
        Rocq.Corelib.ssr.ssrbool.prop_in12 T1 T d1' d' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in12 T1 T d1 d P Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in12

## Corelib.ssr.ssrbool.sub_in2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in2.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_2112) (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (P : T → T → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
    ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T), P x y)),
      Rocq.Corelib.ssr.ssrbool.prop_in2 T d' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in2 T d P Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in2

## Corelib.ssr.ssrbool.sub_in21

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in21.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in21.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_2150) (T3 : Type u_Corelib_ssr_ssrbool_2151)
  (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (d3 d3' : Rocq.Corelib.ssr.ssrbool.mem_pred T3) (P : T → T → T3 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T3 d3 d3' →
      ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T) (z : T3), P x y z)),
        Rocq.Corelib.ssr.ssrbool.prop_in21 T T3 d' d3' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in21 T T3 d d3 P Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in21

## Corelib.ssr.ssrbool.sub_in3

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_in3.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in3.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_2121) (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (P : T → T → T → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
    ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y z : T), P x y z)),
      Rocq.Corelib.ssr.ssrbool.prop_in3 T d' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in3 T d P Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in3

## Corelib.ssr.ssrbool.sub_in_bij

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement

## Corelib.ssr.ssrbool.sub_mem

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_mem

接口未覆盖原因：No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.sub_refl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sub_refl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_refl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1226) (mp : Rocq.Corelib.ssr.ssrbool.mem_pred T),
  Rocq.Corelib.ssr.ssrbool.sub_mem T mp mp
```

残留源符号：Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem

## Corelib.ssr.ssrbool.subon1

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.subon1.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subon1.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (f : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
    ∀ (Phf Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), Q1 f x)),
      Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 Prop d2' f (fun f'' => ∀ (x : T1), Q1 f'' x) (Q1 f) Phf Ph →
        Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 Prop d2 f (fun f'' => ∀ (x : T1), Q1 f'' x) (Q1 f) Phf Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_on1

## Corelib.ssr.ssrbool.subon1l

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.subon1l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subon1l.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (T3 : Rocq.Corelib.ssr.ssrbool.predArgType) (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (f : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
    ∀ (Phf : Rocq.Corelib.ssr.ssreflect_rw.phantom (T3 → Prop) fun h' => ∀ (x : T1), Q1l f h' x)
      (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), Q1l f h x)),
      Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 (T3 → Prop) d2' f (fun f'' h' => ∀ (x : T1), Q1l f'' h' x) (Q1l f h) Phf
          Ph →
        Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 (T3 → Prop) d2 f (fun f'' h' => ∀ (x : T1), Q1l f'' h' x) (Q1l f h) Phf
          Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_on1

## Corelib.ssr.ssrbool.subon2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.subon2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subon2.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (f : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
    ∀ (Phf Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T1), Q2 f x y)),
      Rocq.Corelib.ssr.ssrbool.prop_on2 T1 T2 Prop d2' f (fun f'' => ∀ (x y : T1), Q2 f'' x y) (Q2 f) Phf Ph →
        Rocq.Corelib.ssr.ssrbool.prop_on2 T1 T2 Prop d2 f (fun f'' => ∀ (x y : T1), Q2 f'' x y) (Q2 f) Phf Ph
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_on2

## Corelib.ssr.ssrbool.subon_bij

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.subon_bij.statement

## Corelib.ssr.ssrbool.subpred

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.subpred

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.subpred.roundtrip

## Corelib.ssr.ssrbool.subrel

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.subrel

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.subrel.roundtrip

## Corelib.ssr.ssrbool.subrelUl

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.subrelUl.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subrelUl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1199) (r1 r2 : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.subrel T r1 (Rocq.Corelib.ssr.ssrbool.rel_of_simpl T (Rocq.Corelib.ssr.ssrbool.relU T r1 r2))
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.subrel;Rocq.Corelib.ssr.ssrbool.rel_of_simpl;Rocq.Corelib.ssr.ssrbool.relU

## Corelib.ssr.ssrbool.subrelUr

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.subrelUr.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subrelUr.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1201) (r1 r2 : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.subrel T r2 (Rocq.Corelib.ssr.ssrbool.rel_of_simpl T (Rocq.Corelib.ssr.ssrbool.relU T r1 r2))
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.subrel;Rocq.Corelib.ssr.ssrbool.rel_of_simpl;Rocq.Corelib.ssr.ssrbool.relU

## Corelib.ssr.ssrbool.sumboolP

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.sumboolP

## Corelib.ssr.ssrbool.sym_left_transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1473) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.symmetric T R →
    Rocq.Corelib.ssr.ssrbool.transitive T R → Rocq.Corelib.ssr.ssrbool.left_transitive T R
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.symmetric;Rocq.Corelib.ssr.ssrbool.transitive;Rocq.Corelib.ssr.ssrbool.left_transitive

## Corelib.ssr.ssrbool.sym_right_transitive

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1473) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.symmetric T R →
    Rocq.Corelib.ssr.ssrbool.transitive T R → Rocq.Corelib.ssr.ssrbool.right_transitive T R
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.symmetric;Rocq.Corelib.ssr.ssrbool.transitive;Rocq.Corelib.ssr.ssrbool.right_transitive

## Corelib.ssr.ssrbool.symmetric

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.symmetric

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.symmetric.roundtrip

## Corelib.ssr.ssrbool.symmetric_from_pre

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1105) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.pre_symmetric T R → Rocq.Corelib.ssr.ssrbool.symmetric T R
```

残留源符号：Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.pre_symmetric;Rocq.Corelib.ssr.ssrbool.symmetric

## Corelib.ssr.ssrbool.topred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.topred

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.predType T) →
  Rocq.Corelib.ssr.ssrbool.pred_sort T p → Rocq.Corelib.ssr.ssrbool.pred T

## Corelib.ssr.ssrbool.topredE

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.topredE.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.topredE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (pT : Rocq.Corelib.ssr.ssrbool.predType T) (x : T)
  (pp : Rocq.Corelib.ssr.ssrbool.pred_sort T pT),
  Rocq.Corelib.ssr.ssrbool.topred T pT pp x = Rocq.Corelib.ssr.ssrbool.in_mem T x (Rocq.Corelib.ssr.ssrbool.mem T pT pp)
```

残留源符号：Rocq.Corelib.ssr.ssrbool.predType;Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.topred;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem

## Corelib.ssr.ssrbool.total

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.total

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.total.roundtrip

## Corelib.ssr.ssrbool.transitive

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.transitive

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.transitive.roundtrip

## Corelib.ssr.ssrbool.unfold_in

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.unfold_in.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.unfold_in.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) fun x => p x) =
    p x
```

残留源符号：Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType

## Corelib.ssr.ssrbool.unkey_pred

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.unkey_pred

接口未覆盖原因：No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)) →
  (k : Rocq.Corelib.ssr.ssrbool.pred_key T p) →
    Rocq.Corelib.ssr.ssrbool.keyed_pred T p k →
      Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)

## Corelib.ssr.ssrbool.unkey_qualifier

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.ssr.ssrbool.unkey_qualifier

接口未覆盖原因：No registered type bijection for (n : Rocq.Corelib.Init.Datatypes.nat) →
  (q : Rocq.Corelib.ssr.ssrbool.qualifier n T) →
    (k : Rocq.Corelib.ssr.ssrbool.pred_key T (Rocq.Corelib.ssr.ssrbool.has_quality n T q)) →
      Rocq.Corelib.ssr.ssrbool.keyed_qualifier T n q k → Rocq.Corelib.ssr.ssrbool.qualifier n T

## Corelib.ssr.ssrbool.unless

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.ssr.ssrbool.unless

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.unless.roundtrip

## Corelib.ssr.ssrbool.unlessL

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.unlessL

## Corelib.ssr.ssrbool.unlessP

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.unlessP.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.unlessP.statement.correspondence

```lean
∀ (C P : Prop), Rocq.Corelib.ssr.ssrbool.unless C P ↔ C ∨ P
```

残留源符号：Rocq.Corelib.ssr.ssrbool.unless

## Corelib.ssr.ssrbool.unlessR

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.unlessR

## Corelib.ssr.ssrbool.unless_contra

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.unless_contra

## Corelib.ssr.ssrbool.unless_sym

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.ssr.ssrbool.unless_sym

## Corelib.ssr.ssrbool.wlog_neg

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.wlog_neg.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.wlog_neg.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.xorPif

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.xorPif.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.xorPif.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Q ∨ P → ¬(Q ∧ P) → Rocq.Corelib.Init.Datatypes.bool.rec (¬Q) Q b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.xorPifn

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.ssr.ssrbool.xorPifn.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.xorPifn.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  Q ∨ P → ¬(Q ∧ P) → Rocq.Corelib.Init.Datatypes.bool.rec Q (¬Q) b
```

残留源符号：Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec