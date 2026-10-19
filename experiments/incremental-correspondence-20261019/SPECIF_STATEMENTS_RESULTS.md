# Specif 陈述转换结果

49 个候选全部经过 kernel 检查；其中 49 个目标表达式均已无源符号（包括展开 NativeBridge 别名）。新增的是陈述 iff，未在此批另证原定理。原始机械翻译未修改。

新增规则覆盖完整 Sort 下的 Subtype、PSigma、PSigma + PProd 的量词、函数族搬运、等式和投影，以及源存在量词/inhabited 的原生对应。

| 源声明 | 完整原生 |
|---|---|
| eq_existT2_curried | 是 |
| eq_existT2_l | 是 |
| eq_existT2_r | 是 |
| eq_existT2_uncurried | 是 |
| eq_existT_curried | 是 |
| eq_existT_l | 是 |
| eq_existT_r | 是 |
| eq_existT_uncurried | 是 |
| eq_sigT | 是 |
| eq_sigT2 | 是 |
| eq_sigT2_hprop | 是 |
| eq_sigT2_hprop_iff | 是 |
| eq_sigT2_nondep | 是 |
| eq_sigT2_uncurried | 是 |
| eq_sigT2_uncurried_iff | 是 |
| eq_sigT_hprop | 是 |
| eq_sigT_hprop_iff | 是 |
| eq_sigT_nondep | 是 |
| eq_sigT_uncurried | 是 |
| eq_sigT_uncurried_iff | 是 |
| eq_sig_hprop | 是 |
| eq_sig_hprop_iff | 是 |
| ex2_of_sig2 | 是 |
| ex2_of_sigT2 | 是 |
| ex_of_sig | 是 |
| ex_of_sigT | 是 |
| exists_to_inhabited_sig | 是 |
| inhabited_sig_to_exists | 是 |
| prod_sigT_prod | 是 |
| proj1_sig_eq | 是 |
| proj2_sig | 是 |
| projT1_eq | 是 |
| projT1_of_sigT2_eq | 是 |
| sig2_ind | 是 |
| sig2_sind | 是 |
| sigT2_eta | 是 |
| sigT2_ind | 是 |
| sigT2_sind | 是 |
| sigT_eta | 是 |
| sigT_ind | 是 |
| sigT_of_sigT2_eq | 是 |
| sigT_prod_sigT | 是 |
| sigT_sind | 是 |
| sig_ind | 是 |
| sig_sind | 是 |
| sumbool_ind | 是 |
| sumbool_sind | 是 |
| sumor_ind | 是 |
| sumor_sind | 是 |

普通 Subtype、依赖对、双依赖对、sumbool 和 sumor 的归纳陈述，以及依赖对等式的 curried/uncurried 陈述均已转换。sumor 的既有 Type-only Iso 扩展到完整 Sort，不重复计源根。qualityProp 版本对应原生存在量词，仍保留其 Prop 语义。

转换分两阶段：先用已证明的量词、函数族和操作等式进行重写，再约简具体转换器和投影。simp 默认不处理证明参数；最后只对明确识别的等式证明往返、证明 cast 做清理，每次替换检查 isDefEq，整体再次检查定义相等，最终 iff 经 kernel 验证。这不是忽略残留符号：输出中的实际表达式已替换，再检查其源符号。

新证书为 49 个 iff 和 1 个既有类型的范围扩展；没有新增原陈述证明。详细类型、公理和目标体见 reports/CERTIFICATES.md、specif-statement-candidates.json。全部 49 项都是无条件原声明，本批未处理剩余显式条件。

P7 已纳入本批全部新增证书；以 reports/interop/all/import-all-validation.json 的实际记录为准。
