# 第八十二至八十五批：原语浮点对应

PrimFloat 完成 **37/37**；总覆盖 **2054/2180**，含 164 类型、886 运算、1004 完整原生陈述。本批增加 3 类型根和 34 运算根。原陈述独立 Prop 证明仍为 318。

| 批次 | profile | 根 | 证明内容 |
|---|---|---:|---|
| 82 | PrimFloatRepresentation | 26 | float、wrapper、comparison 双向逆；常量、比较、分类、符号变换、谓词、parser/printer 包装 |
| 83 | PrimFloatArithmetic | 5 | 加减乘除、get_sign；复用完整最近偶数舍入 |
| 84 | PrimFloatExponent | 5 | uint63 转换、带偏移指数的分解/缩放、上下相邻值 |
| 85 | PrimFloatSqrt | 1 | 完整开方；内部逐位算法另外证明等于 Nat.sqrt |

## 表示和范围

原生表示为 Option ((Bool × Fin 2047 × BitVec 52) ⊕ Bool)。none 表示唯一 NaN；左支保存有限值的符号、指数和 fraction 字段；右支表示带符号无穷。有限字段包括 subnormal 和正负零。这是 Lean 原生类型组合，未声称与运行时 Float 双向对应。

普通 eqb 与 Leibniz.eqb 分别保留 IEEE 风格相等和规范位相等：前者正负零相等且 NaN 不等于自身；后者比较规范位表示。parser 是源端已解析值的恒等函数，printer 是 wrapper 的投影，不把这两项宣称为字符串解析或格式化。

算术目标是源符号算法在该原生表示上的精确实现。nearest-even、上下溢、NaN、无穷、正负零及指数截断均保留。它们仍归类 native_expression，不冒充 existing_api。PrimFloatSqrt 的辅助定理 integerSqrt_agrees 则对每个 Nat 证明源 base-four 算法等于现成 Nat.sqrt；完整浮点开方使用这个现成 API，但没有声称等于 Float.sqrt。

## 验证

158 个 profile 有当前源码及依赖的通过记录。140 个覆盖 profile、1802 份增量证书共同导入，2426 个入口、23746 个副本。类型双向逆、运算等式、公理闭包、递归原生目标审计均通过。没有新增 sorry 或公理；编译产物留在远程 .work。

剩余 126 根：尚无证书 79、部分原生陈述 24、仅接口 6、显式条件 17。继续 FloatOps 与 FloatAxioms；opaque Type 值计算保持未完成分类。
