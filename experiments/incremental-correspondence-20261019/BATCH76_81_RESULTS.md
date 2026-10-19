# 第七十六至八十一批：符号浮点运算完成

新增 17 个去重源根，全部为运算对应。总覆盖 **2017 / 2180**：161 类型、852 运算、1004 完整原生陈述；原陈述另有 318 个独立 Prop 证明，本批未新增该类证明。

| 批次 | profile | 新根 | 对应内容 |
|---|---|---:|---|
| 76 | SpecFloatComparison | 4 | SFcompare、SFeqb、SFltb、SFleb |
| 77 | SpecFloatArithmetic | 3 | SFadd、SFsub、SFmul |
| 78 | SpecFloatExponent | 3 | SFmax、SFfrexp、SFulp |
| 79 | SpecFloatAdjacent | 3 | SFpred_pos、SFsucc、SFpred |
| 80 | SpecFloatDivision | 2 | SFdiv_core_binary、SFdiv |
| 81 | SpecFloatSqrt | 2 | SFsqrt_core_binary、SFsqrt |

## 证明范围

SpecFloat 已完成 **55 / 55**。NativeBridge.Incremental.SpecFloatRepresentation.SpecValue 保存正负零、无穷、单一 NaN、带符号正有效数字及整数指数。运算目标由 Bool/Nat/Int、Option Ordering 和该表示构成；没有残留 Rocq/Rocq2Lean 符号，尚未证明等于 Lean 运行时 Float 运算。

所有证明保留原定义的任意输入范围，不加 valid_binary 假设。比较对任意有限符号值按原算法比较指数与有效数字；未经有效性证明，不把这种比较宣称为任意表示下的数值比较。

除法使用 Int.fdiv/fmod，证明商余数以及符号规则；平方根使用 Nat.sqrt，并证明整数余数。两者复用已证明的完整最近偶数舍入。前驱、后继保留边界有效数字、无穷和正负零分支。frexp 的非有限值返回原算法规定的指数标记。

## 依赖与验证

新增 SpecFloatMaskSupport、SpecFloatDivisionSupport、SpecFloatSqrtSupport 三个支持 profile；它们不重复计根。整数证明在 SpecFloat 实际依赖闭包中重新检查。平方根的减法借位辅助项取自机械 sub_mask 的同一个互递归项第二投影，并经 Lean 内核检查。

154 个 profile 当前源码与依赖验证通过；136 个覆盖 profile、1765 份增量证书共同导入。指定原生目标递归审计、公理闭包及证书直接关联源根检查均通过。没有新增 sorry 或公理。编译产物、临时探测和日志运行目录保留在远程 .work。

剩余 163 根：尚无证书 115、部分原生陈述 24、仅接口 7、显式条件 17。下一步处理 PrimFloat / FloatOps / FloatAxioms；opaque Type 值数据不会仅凭类型包装计为运算对应。
