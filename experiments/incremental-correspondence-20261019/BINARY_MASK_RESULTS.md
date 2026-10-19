# 二进制减法与 mask：第十八批

新增 15 个完成根：1 个类型、12 个运算、2 个完全原生陈述。累计 937 / 2180；47 个增量 profile 当前验证通过，666 份增量覆盖证书共同导入通过。

## 保留源表示信息

mask 与 Option Nat 的 Iso：IsNeg 对应 none，IsNul 对应 some 0，IsPos p 对应 some (positiveTo p)。源 mask 本来就不保存负差的绝对值；没有把一个多对一解释冒充双射。

double_mask、succ_double_mask 对应 Option.map 下的倍增和倍增加一；double_pred_mask 对应 some (2*n-2)。sub_mask 对应 if m ≤ n then some (n-m) else none，sub_mask_carry 对应检查 n-(m+1)。二者共同归纳，全部构造器分支的源递归方程以 rfl 检查。

Pos.sub 保留正整数的饱和边界，目标为 max 1 (n-m)。N.sub 对应普通 Nat 的饱和减法。Z.pos_sub、Z.add、Z.sub 对应 Int 的差、加法、减法，负数结果不截断。

## 消去与陈述

mask_rec 对应原生 Option/Nat 分支消去，覆盖 Type-valued 的拉回 motive；mask_rect 覆盖 Sort u-valued motive。mask_ind、mask_sind 的原生陈述仅含 Option Nat 和正自然数子类型，无源符号；本批未新增原业务定理证明。

IntDef 闭包没有单独导出 Pos.add_carry / sub_mask_carry。证明辅助定义从原始互递归结果的外层第一投影切换至第二投影；代码严格检查该外层结构，保留内部递归投影。所有辅助构造器方程和最终等式仍由 kernel 检查，不修改原始机械函数，不引入新公理。BinaryMask 在 PosDef 闭包检查；BinaryNatSub 在 IntDef 闭包重检相同减法不变量，不重复计这些辅助根。

## 工作区验证

验证器现在按 import 依赖顺序编译；选定模块运行时会重建过期依赖及其使用者。各记录保存依赖源码及 olean 哈希，报告生成器检查它们与当前产物匹配。完整 47 个增量 profile 已重编译通过，见 reports/incremental-rebuild.json；这不是全 Corelib 机械翻译重跑，也不是旧基线全部重编译。

主要证明：BinaryMask.lean、BinaryMaskStatements.lean、BinaryArithmetic.lean、BinaryNatSub.lean。精确证书类型及公理闭包见 reports/certificates.json。
