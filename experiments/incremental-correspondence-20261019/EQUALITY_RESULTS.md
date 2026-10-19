# Eq transport 与布尔等式（第七批）

本批新增 19 个完成根：1 个类型、14 个运算、4 个完全原生陈述。累计完成类别为 580 / 2180（38 类型、241 运算、301 陈述）。仍有 550 个部分陈述、308 个仅接口、423 个尚无证书、318 个尚带条件、1 个特殊 Type 值陈述。

## 实际证明

| 源声明组 | 原生目标 | 本批根数 |
|---|---|---:|
| Logic.eq_rec、eq_rew、eq_rew_r | Eq.ndrec（反向使用 Eq.symm） | 3 |
| Logic.eq_rec_r、eq_rect_r | 证明并传入对称性义务后，等于 Eq.ndrec | 2 |
| Logic.eq_rew_r_dep | 原生等式的依赖右消去，保留证明参数的 motive | 1 |
| Logic.eq_sym_involutive | 原生等式双重对称性；源端与原生端均有证明 | 1 |
| Datatypes.eq_true | 对每个机械布尔值 b，与 boolTo b = true 的证明类型互为逆 | 1 |
| Datatypes.eq_true 的 8 个计算消去器 | 6 个 Eq.ndrec、2 个原生等式依赖消去组合 | 8 |
| Datatypes.eq_true_ind、eq_true_sind、eq_true_ind_r | 原生 Bool 谓词的消去陈述；另有原陈述证明 | 3 |

依赖消去组合的实现只使用原生 Eq；不是现成 API 的直接别名，已标记 native_expression。普通消去目标标记 existing_api。eq_true 的对应是索引命题的双向证明，不将它冒充 Bool 数据本身。

## 条件与证明边界

本批实际实例化 4 个条件根：eq_rec_r、eq_rect_r、eq_rew_r_dep、eq_sym_involutive。累计 13 个条件根已经闭合（7 定义、6 陈述），原始机械产物仍有 331 个条件根。本层剩余 318。

新增 5 个不同见证：两个反向消去的对称性义务、eq_sym 原陈述、eq_sym_involutive 的恒等义务及其原陈述。均经公理闭包检查为空；累计不同见证 10 个。eq_rew_r_dep 显式使用其中后三个。不能把其所有下游用户自动记为完成。

eq_sym_involutive 两边都是等式证明之间的等式，证明使用 Lean 的证明无关性；这不是数据运算的运行时双射。其义务实例化后源陈述的证明与原生陈述证明都保留，未假定抽取义务。

Eq 载体覆盖 Sort u；eq_rec/eq_rec_r 和 eq_true_rec/eq_true_rec_r 的返回族按源签名为 Type，其余覆盖 Sort。eq_rew_across_iso 另证任意载体 Iso 下的 transport，可用于机械 Nat 转原生 Nat；此辅助例不额外计根。

## 证据与检查

- proofs/EqualityTransport.lean、proofs/BooleanEquality.lean。
- 两个新 profile 均通过 pinned Lean 4.33.1 的 kernel 检查和公理审计。17 个累计 profile 的源码哈希与成功记录一致。
- reports/condition-discharges.json：每项原始条件集合、闭合见证和实例化证书。
- condition-obligations.json：新增 Logic 原始报告路径与哈希；Specif 的原始来源继续保留。
- reports/dependent-native-targets.json：三项新的原生目标经递归展开 NativeBridge 别名检查，无源符号；两条前向 Bool 陈述共享同一目标。
- reports/original-statement-proofs.json：累计 17 个新增原陈述证明。计数与 iff 覆盖区分。
- reports/summary.json、CORELIB_LEDGER.csv、CERTIFICATES.md：更新后的去重账本和完整证书类型。

沿用旧 profile 的成功记录，没有重新运行全部机械翻译、全部旧 correspondence 或 Mathlib 集成。整个计划继续执行。
