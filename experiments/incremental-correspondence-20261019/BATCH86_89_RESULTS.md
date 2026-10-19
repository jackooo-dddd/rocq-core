# 第八十六至八十九批：浮点转换与规格陈述

新增 41 个去重根，覆盖 **2095/2180**：164 类型、903 运算、1028 完整原生陈述。原陈述独立 Prop 证明仍为 318，本批没有把规格陈述等价计入原定理证明。

| 批次 | profile | 新根 | 内容 |
|---|---|---:|---|
| 86 | FloatOperations | 7 | precision、emax、shift、Z.ldexp、Z.frexp、SF2Prim、Prim2SF |
| 87 | Float64Operations | 9 | 8 个固定精度符号运算包装与 flatten_cmp_opt |
| 88 | FloatStatements | 24 | FloatAxioms 全部规格的源陈述 ↔ 完整原生陈述 |
| 89 | FloatUlp | 1 | 在 FloatOps 本模块闭包检查 ulp |

FloatOps 已完成 8/8，FloatAxioms 33/33。SpecFloat 55/55、PrimFloat 37/37 保持通过。

## 已证明什么

两个表示转换函数的精确算法已证明对应；这不自动证明它们互为逆。roundtrip、injectivity、validity 及算术规格在 FloatStatements 中都有完整原生陈述和 iff 证明，其中原始 valid_binary 假设全部保留。没有独立原陈述证明的规格仍需证明，不能由 iff 获得其真实性。

原生目标由规范 binary64 字段和 SpecValue、Bool/Nat/Int/BitVec 构成，不残留源符号；没有宣称等于运行时 Float API。

## 验证与依赖

FloatClosureSupport 在 FloatAxioms 的实际导出闭包中重检符号和原语浮点证明；FloatWordSupport 重检 Uint63 的整数转换。ulp 不在该闭包，因此 FloatUlpSupport 在 FloatOps 闭包重新检查必要子集。未混合不同闭包的同名声明，也未重新导出或修改机械基线。

165 个 profile 当前源码与依赖验证通过。144 个覆盖 profile、1843 份增量证书共同导入，2467 个入口、26442 个依赖副本。公理闭包、原生目标递归审计、注册表与共同导入一致性检查均通过。

剩余 85 根：尚无证书 62、仅接口 6、显式条件 17；部分原生陈述 0。下一步审查 SSR 的透明 predicate package 值是否可用承载类型双向逆加谓词运算对应描述，并继续排查 opaque Type 值计算。
