# SSR Bool 不透明证明结果的对应：第二十七批

本批新增 **36 个运算根**，累计完成类别 **1526 / 2180**：92 个类型、565 个运算/谓词、869 个完整原生陈述。ssrbool 完成 **420 / 451**。

本模块 128 个原带条件根的 **275 个不同前置声明现已全部证明**；其中 119 根已经完成对应，另 9 根还没有。全部 318 个闭合证明由 275 个前置声明和 43 个新增原陈述组成；227 个空公理闭包，其余 91 个仅使用允许的 Lean 标准公理。

## 新对应的 36 根

| 分组 | 数量 | 指定原生目标 |
|---|---:|---|
| addbP、andP/and3P/and4P/and5P、idP/idPn、implyP、nandP、negP/negPf/negPn、norP、orP/or3P/or4P | 16 | 独立构造的原生 Bool 逻辑性质证明 |
| andPP、orPP、negPP、implyPP、iffP、equivP、introP | 7 | 接收原生 iff/蕴含证明，组合出原生反射性质的证明 |
| all_and2/3/4/5 | 4 | 原生合取的逐项投影函数 |
| unlessL、unlessR、unless_sym、bind_unless、unless_contra | 5 | Nonempty / Or 上的原生构造与组合 |
| keyed_mem、keyed_mem_simpl、keyed_qualifier_keyed | 3 | 固定外部谓词/键后的 Unit 恒等函数 |
| decP | 1 | 根据 Bool 及其反射 iff 构造的 Lean Decidable P |

反射函数使用已有 reflect Iso 把机械结果转换成原生命题的证明，再证明等于一个**独立构造的原生证明**。输出是证明对象时可使用证明无关性；Decidable P 则使用其单值性质。没有展开 opaque 源函数，也没有生成其定义体方程。

这解决的是证明对象/逻辑函数的语义对应，不是任意数据算法的计算方程。原生目标和独立原生证明均检查类型与定义体，递归展开 NativeBridge 中透明定义、定理及 opaque 辅助声明，拒绝残留源符号。23 个反射目标由同一受检查适配器构建；参数转换不匹配即失败。

## 四个前置条件

bind_unless、keyed_mem、keyed_mem_simpl、keyed_qualifier_keyed 的前置条件在 SSRBoolFinalWitnesses.lean 中手工证明，均无公理依赖。键包装按构造器内等式消去，bind_unless 用既有 Nonempty / Or 对应组合。

三个 keyed 函数的原始输入包装具有两个独立 universe；结果包装在原始翻译中使用元素 universe 的对角实例。证明保留该签名，未把输入两个 universe 强行合并。

## 验证与文件

- SSRBoolFinalWitnesses.lean：四个闭合前置证明。
- SSRBoolReflection.lean、ssrbool-reflection-selection.json：23 个反射运算的原生目标、输入/输出转换和等式。
- SSRBoolProofFunctions.lean、ssrbool-proof-function-selection.json：13 个逻辑/判定/包装运算。
- reports/ssrbool-condition-dag.json：128 根的精确依赖和当前状态。
- reports/certificates.json、condition-discharges.json：逐根证据。

83 个 profile 的当前源码及依赖指纹验证通过。74 个覆盖 profile、1264 份覆盖证书共同导入，1722 个入口、11260 个依赖副本。未重新运行整个机械翻译、旧基线或 Mathlib 消费例。编译和探索中间产物只在远程 .work。

## 剩余

ssrbool 剩余 31 根：9 个尚未完成对应的条件根、20 个尚无对应根、2 个仅有接口根。

9 个条件根为 all_sig2_cond、all_sig_cond、all_sig_cond_dep、all_tag_cond、all_tag_cond_dep、altP、boolP、ifP、ifPn。前五个返回任意选择数据，当前 opaque 结果还缺少计算/等式证据；后四个依赖 alt_spec / if_spec 的索引类型对应，下一批继续处理。这里的剩余条件类别表示桥接尚未完成，**不是前置证明仍缺失**。
