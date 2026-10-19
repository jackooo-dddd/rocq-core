# Corelib.Init.Specif

每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。



## Corelib.Init.Specif.Choice

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.Choice

## Corelib.Init.Specif.Choice2

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.Choice2

接口未覆盖原因：No registered type bijection for (x : S) → Rocq.Corelib.Init.Specif.sigT S' fun y => R' x y

## Corelib.Init.Specif.Exc

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Specif.Exc

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.Exc.roundtrip

## Corelib.Init.Specif.absurd_set

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.absurd_set

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Specif.bool_choice

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.bool_choice

## Corelib.Init.Specif.dependent_choice

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.dependent_choice

## Corelib.Init.Specif.eq_exist2_curried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist2_curried.statement

## Corelib.Init.Specif.eq_exist2_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist2_l.statement

## Corelib.Init.Specif.eq_exist2_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist2_r.statement

## Corelib.Init.Specif.eq_exist2_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist2_uncurried.statement

## Corelib.Init.Specif.eq_existT2_curried

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT2_curried.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_curried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_813) (P : A → Sort u_Corelib_Init_Specif_814) (Q : A → Sort u_Corelib_Init_Specif_815)
  (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1) (p : u1 = v1),
  Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 p = v2 →
    Rocq.Corelib.Init.Logic.eq_rect A u1 Q u3 v1 p = v3 →
      Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q u1 u2 u3 = Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q v1 v2 v3
```

残留源符号：Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT2_l

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT2_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_l.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_847) (P : A → Sort u_Corelib_Init_Specif_848) (Q : A → Sort u_Corelib_Init_Specif_849)
  (u1 : A) (u2 : P u1) (u3 : Q u1) (v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a)
  (p :
    u1 =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)),
  Rocq.Corelib.Init.Logic.eq_rect A u1 (fun a => P a) u2
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
        p =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v) →
    Rocq.Corelib.Init.Logic.eq_rect A u1 (fun a => Q a) u3
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          p =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v →
      Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q u1 u2 u3 = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT2_r

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT2_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_865) (P : A → Sort u_Corelib_Init_Specif_866) (Q : A → Sort u_Corelib_Init_Specif_867)
  (u : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a) (v1 : A) (v2 : P v1) (v3 : Q v1)
  (p :
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
      v1),
  Rocq.Corelib.Init.Logic.eq_rect A
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        v1 p =
      v2 →
    Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u) v1 p =
        v3 →
      u = Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q v1 v2 v3
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT2_uncurried

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT2_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_776) (P : A → Sort u_Corelib_Init_Specif_777) (Q : A → Sort u_Corelib_Init_Specif_778)
  (u1 v1 : A) (u2 : P u1) (v2 : P v1) (u3 : Q u1) (v3 : Q v1),
  (Rocq.Corelib.Init.Specif.sigT2.qualityProp (u1 = v1) (fun p => Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 p = v2)
      fun p => Rocq.Corelib.Init.Logic.eq_rect A u1 Q u3 v1 p = v3) →
    Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q u1 u2 u3 = Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q v1 v2 v3
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2.qualityProp;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.eq_existT_curried

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT_curried.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_curried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_257) (P : A → Sort u_Corelib_Init_Specif_258) (u1 v1 : A) (u2 : P u1) (v2 : P v1)
  (p : u1 = v1),
  Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 p = v2 →
    Rocq.Corelib.Init.Specif.sigT.existT A P u1 u2 = Rocq.Corelib.Init.Specif.sigT.existT A P v1 v2
```

残留源符号：Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_existT_curried_congr

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_existT_curried_congr.statement

## Corelib.Init.Specif.eq_existT_curried_map

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_existT_curried_map.statement

## Corelib.Init.Specif.eq_existT_curried_trans

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_existT_curried_trans.statement

## Corelib.Init.Specif.eq_existT_l

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT_l.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_l.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_337) (P : A → Sort u_Corelib_Init_Specif_338) (u1 : A) (u2 : P u1)
  (v : Rocq.Corelib.Init.Specif.sigT A fun a => P a) (p : u1 = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v),
  Rocq.Corelib.Init.Logic.eq_rect A u1 (fun a => P a) u2 (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) p =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v →
    Rocq.Corelib.Init.Specif.sigT.existT A (fun a => P a) u1 u2 = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_existT_r

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT_r.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_r.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_349) (P : A → Sort u_Corelib_Init_Specif_350)
  (u : Rocq.Corelib.Init.Specif.sigT A fun a => P a) (v1 : A) (v2 : P v1)
  (p : Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = v1),
  Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) v1 p =
      v2 →
    u = Rocq.Corelib.Init.Specif.sigT.existT A (fun a => P a) v1 v2
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_existT_uncurried

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_existT_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_232) (P : A → Sort u_Corelib_Init_Specif_233) (u1 v1 : A) (u2 : P u1) (v2 : P v1),
  (Rocq.Corelib.Init.Specif.sigT.qualityProp (u1 = v1) fun p => Rocq.Corelib.Init.Logic.eq_rect A u1 P u2 v1 p = v2) →
    Rocq.Corelib.Init.Specif.sigT.existT A P u1 u2 = Rocq.Corelib.Init.Specif.sigT.existT A P v1 v2
```

残留源符号：Rocq.Corelib.Init.Specif.sigT.qualityProp;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.eq_exist_curried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist_curried.statement

## Corelib.Init.Specif.eq_exist_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist_l.statement

## Corelib.Init.Specif.eq_exist_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist_r.statement

## Corelib.Init.Specif.eq_exist_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_exist_uncurried.statement

## Corelib.Init.Specif.eq_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig.statement

## Corelib.Init.Specif.eq_sig2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2.statement

## Corelib.Init.Specif.eq_sig2_hprop

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_hprop.statement

## Corelib.Init.Specif.eq_sig2_hprop_iff

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_hprop_iff.statement

## Corelib.Init.Specif.eq_sig2_ind

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_ind.statement

## Corelib.Init.Specif.eq_sig2_ind_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_ind_uncurried.statement

## Corelib.Init.Specif.eq_sig2_nondep

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_nondep.statement

## Corelib.Init.Specif.eq_sig2_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rec

## Corelib.Init.Specif.eq_sig2_rec_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rec_uncurried

## Corelib.Init.Specif.eq_sig2_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rect

## Corelib.Init.Specif.eq_sig2_rect_exist2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2

## Corelib.Init.Specif.eq_sig2_rect_exist2_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_l

## Corelib.Init.Specif.eq_sig2_rect_exist2_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_r

## Corelib.Init.Specif.eq_sig2_rect_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_rect_uncurried

## Corelib.Init.Specif.eq_sig2_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_uncurried.statement

## Corelib.Init.Specif.eq_sig2_uncurried_iff

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig2_uncurried_iff.statement

## Corelib.Init.Specif.eq_sigT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_326) (P : A → Sort u_Corelib_Init_Specif_327)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a)
  (p : Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v),
  Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) p =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v →
    u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sigT2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_831) (P : A → Sort u_Corelib_Init_Specif_832) (Q : A → Sort u_Corelib_Init_Specif_833)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a)
  (p :
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)),
  Rocq.Corelib.Init.Logic.eq_rect A
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (fun a => P a)
        (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
        (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
        p =
      Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v) →
    Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u)
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          p =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v →
      u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT2_hprop

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_884) (P : A → Sort u_Corelib_Init_Specif_890)
  (Q : A → Sort u_Corelib_Init_Specif_887),
  (∀ (x : A) (p q : Q x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
      Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u =
          Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v →
        u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.eq_sigT2_hprop_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_hprop_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1072) (P : A → Sort u_Corelib_Init_Specif_1078)
  (Q : A → Sort u_Corelib_Init_Specif_1075),
  (∀ (x : A) (p q : Q x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
      u = v ↔
        Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u =
          Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.eq_sigT2_ind

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_ind.statement

## Corelib.Init.Specif.eq_sigT2_ind_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_ind_uncurried.statement

## Corelib.Init.Specif.eq_sigT2_nondep

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_nondep.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1093) (B : Sort u_Corelib_Init_Specif_1094) (C : Sort u_Corelib_Init_Specif_1095)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => B) fun a => C),
  Rocq.Corelib.Init.Specif.projT1 A (fun a => B)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) u) =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => B)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) v) →
    Rocq.Corelib.Init.Specif.projT2 A (fun a => B)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) u) =
        Rocq.Corelib.Init.Specif.projT2 A (fun a => B)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => B) (fun a => C) v) →
      Rocq.Corelib.Init.Specif.projT3 A (fun a => B) (fun a => C) u =
          Rocq.Corelib.Init.Specif.projT3 A (fun a => B) (fun a => C) v →
        u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT2_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rec

## Corelib.Init.Specif.eq_sigT2_rec_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rec_uncurried

## Corelib.Init.Specif.eq_sigT2_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rect

## Corelib.Init.Specif.eq_sigT2_rect_existT2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2

## Corelib.Init.Specif.eq_sigT2_rect_existT2_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_l

## Corelib.Init.Specif.eq_sigT2_rect_existT2_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_r

## Corelib.Init.Specif.eq_sigT2_rect_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT2_rect_uncurried

## Corelib.Init.Specif.eq_sigT2_uncurried

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_797) (P : A → Sort u_Corelib_Init_Specif_798) (Q : A → Sort u_Corelib_Init_Specif_799)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  (Rocq.Corelib.Init.Specif.sigT2.qualityProp
      (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
        Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
      (fun p =>
        Rocq.Corelib.Init.Logic.eq_rect A
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (fun a => P a)
            (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
            p =
          Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
      fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u)
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          p =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v) →
    u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.qualityProp;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT2_uncurried_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT2_uncurried_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_904) (P : A → Sort u_Corelib_Init_Specif_905) (Q : A → Sort u_Corelib_Init_Specif_908)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  u = v ↔
    Rocq.Corelib.Init.Specif.sigT2.qualityProp
      (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
        Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
          (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
      (fun p =>
        Rocq.Corelib.Init.Logic.eq_rect A
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (fun a => P a)
            (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
            (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
              (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
            p =
          Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
      fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u))
          (fun a => Q a) (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) u)
          (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
            (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v))
          p =
        Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.qualityProp;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.eq_sigT_hprop

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_362) (P : A → Sort u_Corelib_Init_Specif_365),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v → u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1

## Corelib.Init.Specif.eq_sigT_hprop_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_hprop_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_492) (P : A → Sort u_Corelib_Init_Specif_495),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
      u = v ↔ Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1

## Corelib.Init.Specif.eq_sigT_ind

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_ind.statement

## Corelib.Init.Specif.eq_sigT_ind_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_ind_uncurried.statement

## Corelib.Init.Specif.eq_sigT_nondep

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_nondep.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_507) (B : Sort u_Corelib_Init_Specif_508)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => B),
  Rocq.Corelib.Init.Specif.projT1 A (fun a => B) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => B) v →
    Rocq.Corelib.Init.Specif.projT2 A (fun a => B) u = Rocq.Corelib.Init.Specif.projT2 A (fun a => B) v → u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sigT_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rec

## Corelib.Init.Specif.eq_sigT_rec_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rec_uncurried

## Corelib.Init.Specif.eq_sigT_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rect

## Corelib.Init.Specif.eq_sigT_rect_existT

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT

## Corelib.Init.Specif.eq_sigT_rect_existT_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_l

## Corelib.Init.Specif.eq_sigT_rect_existT_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_r

## Corelib.Init.Specif.eq_sigT_rect_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sigT_rect_uncurried

## Corelib.Init.Specif.eq_sigT_uncurried

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_246) (P : A → Sort u_Corelib_Init_Specif_247)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  (Rocq.Corelib.Init.Specif.sigT.qualityProp
      (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
          (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) p =
        Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v) →
    u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.qualityProp;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sigT_uncurried_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sigT_uncurried_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_375) (P : A → Sort u_Corelib_Init_Specif_376)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  u = v ↔
    Rocq.Corelib.Init.Specif.sigT.qualityProp
      (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) fun p =>
      Rocq.Corelib.Init.Logic.eq_rect A (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u) (fun a => P a)
          (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) u) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v) p =
        Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.qualityProp;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Logic.eq_rect;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.eq_sig_hprop

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sig_hprop.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_684) (P : A → Prop),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sig A fun a => P a),
      Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) u = Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) v →
        u = v
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.eq_sig_hprop_iff

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.eq_sig_hprop_iff.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_702) (P : A → Prop),
  (∀ (x : A) (p q : P x), p = q) →
    ∀ (u v : Rocq.Corelib.Init.Specif.sig A fun a => P a),
      u = v ↔
        Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) u = Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.eq_sig_ind

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_ind.statement

## Corelib.Init.Specif.eq_sig_ind_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_ind_uncurried.statement

## Corelib.Init.Specif.eq_sig_rec

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rec

## Corelib.Init.Specif.eq_sig_rec_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rec_uncurried

## Corelib.Init.Specif.eq_sig_rect

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rect

## Corelib.Init.Specif.eq_sig_rect_exist

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rect_exist

## Corelib.Init.Specif.eq_sig_rect_exist_l

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_l

## Corelib.Init.Specif.eq_sig_rect_exist_r

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_r

## Corelib.Init.Specif.eq_sig_rect_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_rect_uncurried

## Corelib.Init.Specif.eq_sig_uncurried

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_uncurried.statement

## Corelib.Init.Specif.eq_sig_uncurried_iff

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.eq_sig_uncurried_iff.statement

## Corelib.Init.Specif.error

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Specif.error

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.error.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Specif.ex2_of_sig2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.ex2_of_sig2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex2_of_sig2.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_123) (P Q : A → Prop) (X : Rocq.Corelib.Init.Specif.sig2 A P Q), ∃ x, P x ∧ Q x
```

残留源符号：Rocq.Corelib.Init.Specif.sig2

## Corelib.Init.Specif.ex2_of_sigT2

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex2_of_sigT2.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_127) (P Q : A → Prop) (X : Rocq.Corelib.Init.Specif.sigT2 A P Q), ∃ x, P x ∧ Q x
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2

## Corelib.Init.Specif.ex_of_sig

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.ex_of_sig.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex_of_sig.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_115) (P : A → Prop) (X : Rocq.Corelib.Init.Specif.sig A P), ∃ x, P x
```

残留源符号：Rocq.Corelib.Init.Specif.sig

## Corelib.Init.Specif.ex_of_sigT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.ex_of_sigT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.ex_of_sigT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_119) (P : A → Prop) (X : Rocq.Corelib.Init.Specif.sigT A P), ∃ x, P x
```

残留源符号：Rocq.Corelib.Init.Specif.sigT

## Corelib.Init.Specif.except

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.except

接口未覆盖原因：No registered type bijection for Rocq.Corelib.Init.Logic.False

## Corelib.Init.Specif.exists_to_inhabited_sig

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.exists_to_inhabited_sig.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_179) (P : A → Prop),
  (∃ x, P x) → Nonempty (Rocq.Corelib.Init.Specif.sig A fun x => P x)
```

残留源符号：Rocq.Corelib.Init.Specif.sig

## Corelib.Init.Specif.inhabited_sig_to_exists

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.inhabited_sig_to_exists.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_189) (P : A → Prop), Nonempty (Rocq.Corelib.Init.Specif.sig A fun x => P x) → ∃ x, P x
```

残留源符号：Rocq.Corelib.Init.Specif.sig

## Corelib.Init.Specif.prod_of_sigT

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Specif.prod_of_sigT

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.prod_of_sigT.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Specif.prod_sigT_prod

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.prod_sigT_prod.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.prod_sigT_prod.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_194) (B : Sort u_Corelib_Init_Specif_195) (s : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Specif.prod_of_sigT A B (Rocq.Corelib.Init.Specif.sigT_of_prod A B s) = s
```

残留源符号：Rocq.Corelib.Init.Datatypes.prod;Rocq.Corelib.Init.Specif.prod_of_sigT;Rocq.Corelib.Init.Specif.sigT_of_prod

## Corelib.Init.Specif.proj1_sig

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Specif.proj1_sig

操作/类型证书：NativeBridge.proj1_sig_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.proj1_sig.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Specif.proj1_sig_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.proj1_sig_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.proj1_sig_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_534) (P : A → Prop) (u v : Rocq.Corelib.Init.Specif.sig A fun a => P a),
  u = v → Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) u = Rocq.Corelib.Init.Specif.proj1_sig A (fun a => P a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.proj1_sig_of_sig2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.proj1_sig_of_sig2_eq.statement

## Corelib.Init.Specif.proj2_sig

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.proj2_sig.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.proj2_sig.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_54) (P : A → Prop) (e : Rocq.Corelib.Init.Specif.sig A P),
  P (Rocq.Corelib.Init.Specif.proj1_sig A P e)
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.Init.Specif.proj2_sig_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.proj2_sig_eq.statement

## Corelib.Init.Specif.proj2_sig_of_sig2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.proj2_sig_of_sig2_eq.statement

## Corelib.Init.Specif.proj3_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.proj3_sig.statement

## Corelib.Init.Specif.proj3_sig_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.proj3_sig_eq.statement

## Corelib.Init.Specif.projT1

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Specif.projT1

操作/类型证书：NativeBridge.projT1_agrees;NativeBridge.projT2_agrees

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.projT1.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Specif.projT1_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.projT1_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.projT1_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_211) (P : A → Sort u_Corelib_Init_Specif_212)
  (u v : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  u = v → Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) u = Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.projT1

## Corelib.Init.Specif.projT1_of_sigT2_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.projT1_of_sigT2_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_739) (P : A → Sort u_Corelib_Init_Specif_740) (Q : A → Sort u_Corelib_Init_Specif_741)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  u = v →
    Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u) =
      Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v)
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.projT2

状态：OPERATION_CORRESPONDENCE。已证明与指定原生运算/谓词一致；前提以证书类型为准。

原始目标：Rocq.Corelib.Init.Specif.projT2

操作/类型证书：NativeBridge.projT2_agrees

接口未覆盖原因：No registered type bijection for (x : Rocq.Corelib.Init.Specif.sigT A P) → P (Rocq.Corelib.Init.Specif.projT1 A P x)

## Corelib.Init.Specif.projT2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.projT2_eq.statement

## Corelib.Init.Specif.projT2_of_sigT2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.projT2_of_sigT2_eq.statement

## Corelib.Init.Specif.projT3

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.projT3

接口未覆盖原因：No registered type bijection for (e : Rocq.Corelib.Init.Specif.sigT2 A P Q) →
  Q (Rocq.Corelib.Init.Specif.projT1 A P (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A P Q e))

## Corelib.Init.Specif.projT3_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.projT3_eq.statement

## Corelib.Init.Specif.rew_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.rew_sig.statement

## Corelib.Init.Specif.rew_sig2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.rew_sig2.statement

## Corelib.Init.Specif.rew_sigT

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.rew_sigT.statement

## Corelib.Init.Specif.rew_sigT2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.rew_sigT2.statement

## Corelib.Init.Specif.sig

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Specif.sig

操作/类型证书：NativeBridge.sigIso

## Corelib.Init.Specif.sig2

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Specif.sig2

操作/类型证书：NativeBridge.sig2Iso

## Corelib.Init.Specif.sig2_eta

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sig2_eta.statement

## Corelib.Init.Specif.sig2_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sig2_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig2_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_22) (P Q : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig2 A P Q), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.Init.Specif.sig2.exist2

## Corelib.Init.Specif.sig2_of_sigT2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sig2_of_sigT2

## Corelib.Init.Specif.sig2_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sig2_rec

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Type) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) → P0 s

## Corelib.Init.Specif.sig2_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sig2_rect

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Type u_Corelib_Init_Specif_20) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sig2 A P Q) → P0 s

## Corelib.Init.Specif.sig2_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sig2_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig2_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_24) (P Q : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig2 A P Q), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.Init.Specif.sig2.exist2

## Corelib.Init.Specif.sigT

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Specif.sigT

操作/类型证书：NativeBridge.sigmaIso

## Corelib.Init.Specif.sigT2

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Specif.sigT2

操作/类型证书：NativeBridge.sigma2Iso

## Corelib.Init.Specif.sigT2_eta

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT2_eta.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT2_eta.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_153) (P : A → Sort u_Corelib_Init_Specif_154) (Q : A → Sort u_Corelib_Init_Specif_157)
  (p : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  p =
    Rocq.Corelib.Init.Specif.sigT2.existT2 A (fun a => P a) (fun a => Q a)
      (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) p))
      (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a)
        (Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) p))
      (Rocq.Corelib.Init.Specif.projT3 A (fun a => P a) (fun a => Q a) p)
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.sigT_of_sigT2;Rocq.Corelib.Init.Specif.projT2;Rocq.Corelib.Init.Specif.projT3

## Corelib.Init.Specif.sigT2_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT2_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT2_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_45) (P : A → Sort u_Corelib_Init_Specif_46) (Q : A → Sort u_Corelib_Init_Specif_47)
  (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT2 A P Q), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.sigT2_of_sig2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sigT2_of_sig2

## Corelib.Init.Specif.sigT2_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sigT2_rec

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Type) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) → P0 s

## Corelib.Init.Specif.sigT2_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sigT2_rect

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Type u_Corelib_Init_Specif_41) →
  ((x : A) → (p : P x) → (q : Q x) → P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    (s : Rocq.Corelib.Init.Specif.sigT2 A P Q) → P0 s

## Corelib.Init.Specif.sigT2_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT2_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT2_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_51) (P : A → Sort u_Corelib_Init_Specif_52) (Q : A → Sort u_Corelib_Init_Specif_53)
  (P0 : Rocq.Corelib.Init.Specif.sigT2 A P Q → Prop),
  (∀ (x : A) (p : P x) (q : Q x), P0 (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q x p q)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT2 A P Q), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT2.existT2

## Corelib.Init.Specif.sigT_eta

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT_eta.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_eta.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_134) (P : A → Sort u_Corelib_Init_Specif_135)
  (p : Rocq.Corelib.Init.Specif.sigT A fun a => P a),
  p =
    Rocq.Corelib.Init.Specif.sigT.existT A (fun a => P a) (Rocq.Corelib.Init.Specif.projT1 A (fun a => P a) p)
      (Rocq.Corelib.Init.Specif.projT2 A (fun a => P a) p)
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT;Rocq.Corelib.Init.Specif.projT1;Rocq.Corelib.Init.Specif.projT2

## Corelib.Init.Specif.sigT_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_31) (P : A → Sort u_Corelib_Init_Specif_32)
  (P0 : Rocq.Corelib.Init.Specif.sigT A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT A P), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.sigT_of_prod

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Specif.sigT_of_prod

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.sigT_of_prod.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Specif.sigT_of_sig

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sigT_of_sig

## Corelib.Init.Specif.sigT_of_sigT2

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Specif.sigT_of_sigT2

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.sigT_of_sigT2.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。

## Corelib.Init.Specif.sigT_of_sigT2_eq

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_of_sigT2_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_725) (P : A → Sort u_Corelib_Init_Specif_726) (Q : A → Sort u_Corelib_Init_Specif_727)
  (u v : Rocq.Corelib.Init.Specif.sigT2 A (fun a => P a) fun a => Q a),
  u = v →
    Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) u =
      Rocq.Corelib.Init.Specif.sigT_of_sigT2 A (fun a => P a) (fun a => Q a) v
```

残留源符号：Rocq.Corelib.Init.Specif.sigT2;Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_sigT2

## Corelib.Init.Specif.sigT_prod_sigT

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_prod_sigT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_194) (B : Sort u_Corelib_Init_Specif_195)
  (p : Rocq.Corelib.Init.Specif.sigT A fun a => B),
  Rocq.Corelib.Init.Specif.sigT_of_prod A B (Rocq.Corelib.Init.Specif.prod_of_sigT A B p) = p
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT_of_prod;Rocq.Corelib.Init.Specif.prod_of_sigT

## Corelib.Init.Specif.sigT_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sigT_rec

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT A P → Type) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sigT A P) → P0 s

## Corelib.Init.Specif.sigT_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sigT_rect

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sigT A P → Type u_Corelib_Init_Specif_28) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sigT A P) → P0 s

## Corelib.Init.Specif.sigT_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sigT_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sigT_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_35) (P : A → Sort u_Corelib_Init_Specif_36)
  (P0 : Rocq.Corelib.Init.Specif.sigT A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sigT.existT A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sigT A P), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sigT;Rocq.Corelib.Init.Specif.sigT.existT

## Corelib.Init.Specif.sig_eta

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sig_eta.statement

## Corelib.Init.Specif.sig_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sig_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_15) (P : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig A P), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.sig.exist

## Corelib.Init.Specif.sig_of_sig2

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sig_of_sig2

## Corelib.Init.Specif.sig_of_sig2_eq

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sig_of_sig2_eq.statement

## Corelib.Init.Specif.sig_of_sigT

状态：EXPLICIT_PROOF_PARAMETERS。原翻译仍带显式证明参数；此轮未消去或假定它们。

原始目标：RocqPending.Corelib.Init.Specif.sig_of_sigT

## Corelib.Init.Specif.sig_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sig_rec

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig A P → Type) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sig A P) → P0 s

## Corelib.Init.Specif.sig_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sig_rect

接口未覆盖原因：No registered type bijection for (P0 : Rocq.Corelib.Init.Specif.sig A P → Type u_Corelib_Init_Specif_13) →
  ((x : A) → (p : P x) → P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    (s : Rocq.Corelib.Init.Specif.sig A P) → P0 s

## Corelib.Init.Specif.sig_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sig_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sig_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_17) (P : A → Prop) (P0 : Rocq.Corelib.Init.Specif.sig A P → Prop),
  (∀ (x : A) (p : P x), P0 (Rocq.Corelib.Init.Specif.sig.exist A P x p)) →
    ∀ (s : Rocq.Corelib.Init.Specif.sig A P), P0 s
```

残留源符号：Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.sig.exist

## Corelib.Init.Specif.sumbool

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Specif.sumbool

操作/类型证书：NativeBridge.sumboolIso;NativeBridge.decidableIso

## Corelib.Init.Specif.sumbool_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sumbool_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumbool_ind.statement.correspondence

```lean
∀ (A B : Prop) (P : Rocq.Corelib.Init.Specif.sumbool A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumbool A B), P s
```

残留源符号：Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Specif.sumbool.left;Rocq.Corelib.Init.Specif.sumbool.right

## Corelib.Init.Specif.sumbool_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sumbool_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumbool A B → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → (s : Rocq.Corelib.Init.Specif.sumbool A B) → P s

## Corelib.Init.Specif.sumbool_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sumbool_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumbool A B → Type u_Corelib_Init_Specif_1394) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → (s : Rocq.Corelib.Init.Specif.sumbool A B) → P s

## Corelib.Init.Specif.sumbool_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sumbool_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumbool_sind.statement.correspondence

```lean
∀ (A B : Prop) (P : Rocq.Corelib.Init.Specif.sumbool A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumbool.left A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumbool.right A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumbool A B), P s
```

残留源符号：Rocq.Corelib.Init.Specif.sumbool;Rocq.Corelib.Init.Specif.sumbool.left;Rocq.Corelib.Init.Specif.sumbool.right

## Corelib.Init.Specif.sumor

状态：TYPE_ISO。已证明双向逆；具体参数、Type/Sort 范围见证书类型。

原始目标：Rocq.Corelib.Init.Specif.sumor

操作/类型证书：NativeBridge.sumorIso

## Corelib.Init.Specif.sumor_ind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sumor_ind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumor_ind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1399) (B : Prop) (P : Rocq.Corelib.Init.Specif.sumor A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumor A B), P s
```

残留源符号：Rocq.Corelib.Init.Specif.sumor;Rocq.Corelib.Init.Specif.sumor.inleft;Rocq.Corelib.Init.Specif.sumor.inright

## Corelib.Init.Specif.sumor_rec

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sumor_rec

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumor A B → Type) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → (s : Rocq.Corelib.Init.Specif.sumor A B) → P s

## Corelib.Init.Specif.sumor_rect

状态：NOT_YET_BRIDGED。尚无本轮证书；不代表数学上不存在对应。

原始目标：Rocq.Corelib.Init.Specif.sumor_rect

接口未覆盖原因：No registered type bijection for (P : Rocq.Corelib.Init.Specif.sumor A B → Type u_Corelib_Init_Specif_1397) →
  ((a : A) → P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    ((b : B) → P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → (s : Rocq.Corelib.Init.Specif.sumor A B) → P s

## Corelib.Init.Specif.sumor_sind

状态：STATEMENT_PARTIAL。已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。

原始目标：Rocq.Corelib.Init.Specif.sumor_sind.statement

陈述证书：NativeBridge.Statements.Rocq.Corelib.Init.Specif.sumor_sind.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Specif_1401) (B : Prop) (P : Rocq.Corelib.Init.Specif.sumor A B → Prop),
  (∀ (a : A), P (Rocq.Corelib.Init.Specif.sumor.inleft A B a)) →
    (∀ (b : B), P (Rocq.Corelib.Init.Specif.sumor.inright A B b)) → ∀ (s : Rocq.Corelib.Init.Specif.sumor A B), P s
```

残留源符号：Rocq.Corelib.Init.Specif.sumor;Rocq.Corelib.Init.Specif.sumor.inleft;Rocq.Corelib.Init.Specif.sumor.inright

## Corelib.Init.Specif.value

状态：TRANSPORT_INTERFACE_ONLY。已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。

原始目标：Rocq.Corelib.Init.Specif.value

接口往返证书：NativeBridge.Interfaces.Rocq.Corelib.Init.Specif.value.roundtrip

接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。