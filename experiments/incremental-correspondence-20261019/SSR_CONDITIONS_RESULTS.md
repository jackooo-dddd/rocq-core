# SSR Bool 共享条件与原生对应：第二十六批

本批新增 **83 个完成根：73 个原生陈述、10 个运算/谓词**。累计完成类别 **1490 / 2180**；其中类型 92、运算 529、完整原生陈述 869。ssrbool 模块从 301 / 451 推进到 **384 / 451**。

## 条件闭合与对应分开统计

| 项目 | 数量 | 含义 |
|---|---:|---|
| 本批入口的带条件根 | 128 | 73 个陈述、55 个定义/opaque 函数 |
| 不同前置声明 | 275 | 精确 frozen report 的 pending_hypotheses 并集 |
| 已证明的前置声明 | 271 | 每个都有闭合 Lean 证明，另四个仍待处理 |
| 独立闭合证明总数 | 314 | 271 个前置声明，加 43 个原陈述；不算 314 个新对应 |
| 空公理闭包的证明 | 223 | 其余 91 个只使用 Lean 标准公理，逐项记录 |
| 全部前置声明已证明的根 | 124 | 其中 41 个还未建立运算对应，不能提前升级覆盖 |
| 完成对应的带条件根 | 83 | 73 陈述 + 10 运算；实际升级后的去重根 |
| 本批仍未完成对应的根 | 45 | 不是 45 个缺失的前置证明 |

73 个陈述全部经过源符号扫描，包括递归展开 NativeBridge 别名。43 个另有独立的原陈述证明；其余 30 个的 iff 证书不能视为原定理已证明。全项目新增原陈述证明累计 183 个。

原始机械产物保持不变。全项目原始 331 个带条件根中，桥接层已闭合实例化并完成对应 247 个（72 定义、175 陈述），剩余 84。

## 十个运算的目标

| 源操作 | 原生目标 | 说明 |
|---|---|---|
| bijective_in、bijective_on | Exists / And / Eq 表示的限制域双向逆谓词 | 原生 Bool 谓词确定域；证明逐点 iff |
| ApplicativePred、applicative_pred_applicative | Unit 构造器 | 固定外部谓词后，包装由已证明的单值类型 Iso 转换 |
| expose_mem_pred、expose_simpl_pred | Unit 构造器 | 同上；不是删除外部谓词 |
| KeyedPred、DefaultKeying.default_keyed_pred | Unit 构造器 | 原生 Bool 谓词，键证明转换为 True |
| KeyedQualifier、DefaultKeying.default_keyed_qualifier | Unit 构造器 | 输入使用原生 Nat 和 Bool 谓词，机械参数由已有逆转换提供 |

这些目标属于原生表达式/表示；不冒称十个现成 Mathlib API。包装输出为 Unit 是因为外部参数固定后内部载荷唯一，前一批已证明双向逆。

## 证明过程与文件

1. ssrbool-witness-selection.json 固定源目标、前置依赖、条件证明和闭合证明名。
2. proofs/SSRBoolWitnesses.lean：结构消去或已有原生 Bool/逻辑对应加 grind，成功后同步检查 Lean kernel，再按依赖顺序闭合。失败不加入正式清单；不生成新公理。
3. proofs/SSRBoolConditionalNormalization.lean：在当前 ssrbool 机械闭包内重建 Option、Subtype、双射的通用桥接。Bool 条件子类型直接对应 {x // p x = true}，不让类型中残留机械 is_true。
4. proofs/SSRBoolClosedStatements.lean：实际应用所有前置证明，生成 73 个原生陈述及 iff。
5. proofs/SSRBoolClosedOperations.lean：十个闭合函数和指定原生目标的逐点证明。
6. reports/ssrbool-condition-dag.json：每根的前置证明、未证明依赖和当前对应状态。源名斜杠到点的归一化经过碰撞检查，保留原始导出名。
7. reports/condition-discharges.json、reports/certificates.json：覆盖计数所使用的证据，和全部 314 个目标的证明数量分开。

## 验证与后续

80 个 profile 的当前源码及编译依赖指纹通过；新增四个 profile 已编译。72 个覆盖 profile、1228 份覆盖证书共同导入通过，1650 个入口，10315 个复制依赖声明。未重跑全部机械翻译、旧基线或 Mathlib 消费例。缓存、探索失败日志和编译文件继续只留远程 .work。

尚未证明的四个前置声明属于 bind_unless、keyed_mem、keyed_mem_simpl、keyed_qualifier_keyed。后续先补齐这四个，再处理 reflect 等证明性质的返回值。opaque 不自动意味着无法对应：若输出由索引确定且是单值类型，可以由已证明的单值性质建立对应；返回任意数据/选择函数的 opaque 则仍需单独的计算或等式证据。
