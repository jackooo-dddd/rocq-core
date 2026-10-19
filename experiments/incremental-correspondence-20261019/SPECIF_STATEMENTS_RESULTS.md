# Specif 陈述转换结果

49 个候选全部经过 kernel 检查；其中 23 个目标表达式已无源符号（包括展开 NativeBridge 别名），26 个仍为部分转换。新增的是陈述 iff，未在此批另证原定理。原始机械翻译未修改。

新增规则覆盖完整 Sort 下的 Subtype、PSigma、PSigma + PProd 的量词、函数族搬运、等式和投影，以及源存在量词/inhabited 的原生对应。

| 源声明 | 完整原生 | 剩余源符号 |
|---|---|---|
| eq_existT2_curried | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec |
| eq_existT2_l | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.projT2, Rocq.Corelib.Init.Specif.sigT, Rocq.Corelib.Init.Specif.sigT.existT, Rocq.Corelib.Init.Specif.sigT2.existT2, Rocq.Corelib.Init.Specif.sigT_of_sigT2 |
| eq_existT2_r | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.projT2, Rocq.Corelib.Init.Specif.sigT, Rocq.Corelib.Init.Specif.sigT.existT, Rocq.Corelib.Init.Specif.sigT2.existT2, Rocq.Corelib.Init.Specif.sigT_of_sigT2 |
| eq_existT2_uncurried | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.sigT2.qualityProp |
| eq_existT_curried | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec |
| eq_existT_l | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.sigT.existT |
| eq_existT_r | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.sigT.existT |
| eq_existT_uncurried | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.sigT.qualityProp |
| eq_sigT | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.sigT.existT |
| eq_sigT2 | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.projT2, Rocq.Corelib.Init.Specif.sigT, Rocq.Corelib.Init.Specif.sigT.existT, Rocq.Corelib.Init.Specif.sigT2.existT2, Rocq.Corelib.Init.Specif.sigT_of_sigT2 |
| eq_sigT2_hprop | 是 |  |
| eq_sigT2_hprop_iff | 是 |  |
| eq_sigT2_nondep | 是 |  |
| eq_sigT2_uncurried | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.projT2, Rocq.Corelib.Init.Specif.sigT2.existT2, Rocq.Corelib.Init.Specif.sigT2.qualityProp, Rocq.Corelib.Init.Specif.sigT_of_sigT2 |
| eq_sigT2_uncurried_iff | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.projT2, Rocq.Corelib.Init.Specif.sigT2.existT2, Rocq.Corelib.Init.Specif.sigT2.qualityProp, Rocq.Corelib.Init.Specif.sigT_of_sigT2 |
| eq_sigT_hprop | 是 |  |
| eq_sigT_hprop_iff | 是 |  |
| eq_sigT_nondep | 是 |  |
| eq_sigT_uncurried | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.sigT.existT, Rocq.Corelib.Init.Specif.sigT.qualityProp |
| eq_sigT_uncurried_iff | 否 | Rocq.Corelib.Init.Logic.eq, Rocq.Corelib.Init.Logic.eq.rec, Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.sigT.existT, Rocq.Corelib.Init.Specif.sigT.qualityProp |
| eq_sig_hprop | 是 |  |
| eq_sig_hprop_iff | 是 |  |
| ex2_of_sig2 | 是 |  |
| ex2_of_sigT2 | 是 |  |
| ex_of_sig | 是 |  |
| ex_of_sigT | 是 |  |
| exists_to_inhabited_sig | 是 |  |
| inhabited_sig_to_exists | 是 |  |
| prod_sigT_prod | 否 | Rocq.Corelib.Init.Datatypes.prod, Rocq.Corelib.Init.Specif.prod_of_sigT, Rocq.Corelib.Init.Specif.sigT_of_prod |
| proj1_sig_eq | 是 |  |
| proj2_sig | 是 |  |
| projT1_eq | 是 |  |
| projT1_of_sigT2_eq | 是 |  |
| sig2_ind | 否 | Rocq.Corelib.Init.Specif.sig2, Rocq.Corelib.Init.Specif.sig2.exist2, Rocq.Corelib.Init.Specif.sig2.rec |
| sig2_sind | 否 | Rocq.Corelib.Init.Specif.sig2, Rocq.Corelib.Init.Specif.sig2.exist2, Rocq.Corelib.Init.Specif.sig2.rec |
| sigT2_eta | 否 | Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.projT2, Rocq.Corelib.Init.Specif.sigT2.existT2, Rocq.Corelib.Init.Specif.sigT_of_sigT2 |
| sigT2_ind | 是 |  |
| sigT2_sind | 是 |  |
| sigT_eta | 否 | Rocq.Corelib.Init.Specif.projT1, Rocq.Corelib.Init.Specif.sigT.existT |
| sigT_ind | 是 |  |
| sigT_of_sigT2_eq | 是 |  |
| sigT_prod_sigT | 否 | Rocq.Corelib.Init.Specif.prod_of_sigT, Rocq.Corelib.Init.Specif.sigT, Rocq.Corelib.Init.Specif.sigT.existT, Rocq.Corelib.Init.Specif.sigT.rec, Rocq.Corelib.Init.Specif.sigT_of_prod |
| sigT_sind | 是 |  |
| sig_ind | 否 | Rocq.Corelib.Init.Specif.sig, Rocq.Corelib.Init.Specif.sig.exist, Rocq.Corelib.Init.Specif.sig.rec |
| sig_sind | 否 | Rocq.Corelib.Init.Specif.sig, Rocq.Corelib.Init.Specif.sig.exist, Rocq.Corelib.Init.Specif.sig.rec |
| sumbool_ind | 否 | Rocq.Corelib.Init.Specif.sumbool, Rocq.Corelib.Init.Specif.sumbool.left, Rocq.Corelib.Init.Specif.sumbool.right |
| sumbool_sind | 否 | Rocq.Corelib.Init.Specif.sumbool, Rocq.Corelib.Init.Specif.sumbool.left, Rocq.Corelib.Init.Specif.sumbool.right |
| sumor_ind | 否 | Rocq.Corelib.Init.Specif.sumor, Rocq.Corelib.Init.Specif.sumor.inleft, Rocq.Corelib.Init.Specif.sumor.inright |
| sumor_sind | 否 | Rocq.Corelib.Init.Specif.sumor, Rocq.Corelib.Init.Specif.sumor.inleft, Rocq.Corelib.Init.Specif.sumor.inright |

详细原生陈述与 iff 类型见 reports/CERTIFICATES.md；全部候选见 reports/specif-statement-candidates.json。31 个 profile 均有当前源码的成功验证记录。P7 共同导入快照仍是先前 535 份证书，本批新增 23 份尚未加入该快照。
