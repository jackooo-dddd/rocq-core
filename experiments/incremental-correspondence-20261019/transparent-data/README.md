# 计算透明变体的 correspondence

本变体已达到 **2180/2180 个去重源根有对应证书**。其中，原基线剩余的 **80/80 个根**新增证明：CRelationClasses 11、CMorphisms 54、ssrbool 6、ssrfun 4、ssreflect_rw 3、Program.Wf 2。六组证明共同导入通过。

原冻结基线仍为 **2100/2180**；这里证明的是新命名空间下可展开定义的对应，不是原 opaque 常量与这些定义的值等式。此前 2100 根的证书已按同一策略全部重新检查，173 个既有 profile、6 个新 profile 与消费示例共同导入成功。

| 完整变体分类 | 根数 |
|---|---:|
| 类型双向对应 | 164 |
| 运算对应 | 988 |
| 原生陈述 iff | 1028 |
| 合计 | 2180 |

[完整账本](reports/FULL_VARIANT_LEDGER.json)逐根列出证书；[完整验证摘要](reports/FULL_VARIANT_SUMMARY.json)记录共同导入与公理检查。原生陈述 iff 不等于源业务定理已经证明；每个根沿用证书的实际参数、universe、质量分支和前提范围。

## 导出策略

TransparentPack 从各模块已检查的 Lean 环境复制依赖闭包，统一添加 Computational.<模块> 前缀。唯一计算策略变化是：源 Rocq / RocqPending 命名空间的非 Prop opaque 数据声明，以同一类型、同一 universe 参数、同一正文改为 def。声明逐一重新交给 kernel 检查；导出报告再次检查改名前后的类型和正文表达式一致。

原声明未改写，机械 nat/eq 仍是独立归纳数据。没有添加计算等式公理。原声明与新声明之间只有已核验的语法关系，不能据此宣称它们的值已被证明相等。

## 已完成

| 模块 | 候选根 | 已证明变体对应 | 证明 |
|---|---:|---:|---|
| CRelationClasses | 11 | 11 | [CRelation.lean](CRelation.lean) |
| CMorphisms | 54 | 54 | [CMorphism.lean](CMorphism.lean) |
| ssrbool | 6 | 6 | [SSRBool.lean](SSRBool.lean) |
| ssrfun | 4 | 4 | [SSRFun.lean](SSRFun.lean) |
| ssreflect_rw | 3 | 3 | [SSRRewrite.lean](SSRRewrite.lean) |
| Program.Wf | 2 | 2 | [ProgramWf.lean](ProgramWf.lean) |
| 合计 | 80 | 80 | |

CRelation 和 CMorphism 保留 Type 值关系中的计算数据，覆盖整个关系记录、偏序与严格序的转换、组合及逐点关系；6 个带条件的 CMorphism 根均用已闭合证明实例化。

SSRFun 保留依赖选择数据，将逐点 Sigma/PSigma/Subtype 证据组合为函数及其证据。SSRBool 的条件选择在谓词为真时使用提供的数据，为假时保留指定默认值；单条件、依赖条件和双性质均有对应。SSRRewrite 对应函数应用、原生相等运输及依赖上下文取值。

Program.Wf 的两个消去器对应 Lean WellFounded.fix。证明包含递归值等式、依赖返回值的运输、递归回调的双向逆及原前置条件的闭合证明；Q 允许任意 Type w 数据，不限于 Prop。

## 具体例子

以下用缩写展示定理形状，完整 universe 和参数以链接的 Lean 文件为准。

1. 条件数据选择：机械 all_tag_cond_dep 转换后得到原生 Sigma 包装的函数及其条件性质。原生函数逐点为 chooseValue (C x) (T x) (default x) (provided x)：C x = true 时选择 provided，false 时保留 default。依赖性质和两条选择分支同时证明，见 SSRBool.allTagCondDep_agrees、allSigCondDep_agrees。
2. 严格序转偏序：关系证据保留为 Sum (R x y) (E x y)，其中 R、E 可以是 Type 值；没有将其简化为只保留真假的 Or。见 CMorphism.lean 中的 strictToPartial_agrees。
3. 良基递归消去：设机械递归值与 Lean 递归值的等式为 value_agrees，使用 fromInvariant 把原生回调送入机械消去器，则

   ~~~text
   cast (congrArg (Q x) value_agrees)
     (mechanical.Fix_F_sub_rect ... (fromInvariant I) x accessibility)
     =
   WellFounded.fix wf I x
   ~~~

   fromInvariant / toInvariant 的两个复合均为恒等；因此没有通过限制回调只支持一部分函数来获得等式。Fix_sub_rect 另有同样的回调双向逆。见 ProgramWf.fixFRect_agrees、fixSubRect_agrees。

## 自动组合

[AutoCompose.lean](AutoCompose.lean) 的 native_compose 命令接收一个表达式和已证明的 correspondence，使用这些等式及定义归约生成原生定义与函数等式证明。递归检查生成目标的类型及正文，不能把源调用藏在辅助函数里。条件未满足或使用额外公理的结果会拒绝。

[AutoExample.lean](AutoExample.lean) 自动把两个机械条件选择的结果相加，生成由原生 if、Nat 加法和取模构成的函数。生成的定义可执行，selectedSum 10 的结果为 4；另一个例子保留一般 universe 参数，自动生成 Type u 上的恒等函数。两份等式证明均通过 kernel 检查。缺规则、隐藏源调用、未闭合条件和伪造等式的拒绝行为见 [验证结果](reports/auto-composition-validation.json)。该工具组合给定对应，不自动发现任意库函数的语义对应。

## 验证与范围

全部 80 份证书通过 kernel 检查，源根所有 universe 参数保留，原生目标递归闭包无源符号，公理依赖仅允许标准 Lean 公理。共同导入时不使用原 profile 的搜索路径。

“原生对应”包括 Lean 现成 API、由 Lean 类型及函数构成的表达式；不表示这 80 个根均有一个同名现成 Mathlib 定义。原生陈述 iff 也不自动证明源定理为真。

六个候选模块的 80 根全部完成变体导出和 kernel 重检。曝光清单包含依赖项，其声明数量与候选根数量不是同一个指标。只完成重导出不计作 correspondence。

- [证书注册表](certificates.json)、[逐根结果](reports/ROOT_LEDGER.json)、[摘要](reports/summary.json)。
- [导出器](TransparentPack.lean)、[审计器](Audit.lean)、[计划与 DAG](PLAN.md)。
- [既有证书回归脚本](regress_existing.py)、[合并验证](check_regression.py)。
- [消费示例](Consumer.lean)：依赖 Fin 数据和 Mathlib 素数定理；[验证结果](reports/consumer-validation.json)。

[Composition.lean](Composition.lean) 另验证跨 profile 的自动重写组合：机械 nat.iter → Lean Nat → 机械 SSR 条件选择的原生结果 → Mathlib Prime.two_le。两个机械副本不要求拥有同一个 datatype 身份；它们通过已经证明的原生接口连接。

复现：先运行 python3 build.py，再运行 python3 verify.py，最后 python3 make_report.py。既有结果回归另运行 python3 regress_existing.py；运行 python3 check_consumer.py 检查消费例，运行 python3 check_consumer.py Composition 检查跨 profile 组合，最后 python3 check_regression.py 合并验证；python3 check_auto.py 检查自动生成、执行和拒绝行为。编译产物、临时文件和日志仅留远程 .work/transparent-data。
