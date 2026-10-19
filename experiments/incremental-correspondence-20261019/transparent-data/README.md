# 计算透明变体的 correspondence

当前新增 **37/80 个候选根**的对应证明：CRelationClasses 11、CMorphisms 26。原冻结基线仍为 **2100/2180**；本目录的证明不增加原 opaque 常量的覆盖数。

## 导出策略

TransparentPack 从各模块已检查的 Lean 环境复制依赖闭包，统一添加 Computational.<模块> 前缀。唯一计算策略变化是：源 Rocq / RocqPending 命名空间的非 Prop opaque 数据声明，以同一类型、同一 universe 参数、同一正文改为 def。声明逐一重新交给 kernel 检查；导出报告再次检查改名前后的类型和正文表达式一致。

原声明未改写，原机械 nat/eq 仍是独立归纳数据。没有添加计算等式公理。新定义和原 opaque 常量的值等式并未证明；这是一种可独立验证的导出变体。

## 已完成

| 模块 | 候选根 | 已证明变体对应 |
|---|---:|---:|
| CRelationClasses | 11 | 11 |
| CMorphisms | 54 | 26 |
| ssrbool | 6 | 0 |
| ssrfun | 4 | 0 |
| ssreflect_rw | 3 | 0 |
| Program.Wf | 2 | 0 |
| 合计 | 80 | 37 |

CRelation 包括关系翻转、偏序取逆、反对称性提取，以及“关系的蕴含形成预序／双向映射形成等价结构”。后两者还证明整个关系记录的双向转换，不只对应某个投影。

CMorphism 已完成投影、参数翻转、逐点／依赖函数的关系转换、函数组合及对称关系运算。所有关系仍允许 Type 值，不限于 Prop，也没有把关系证据的计算数据抹去。

## 验证

全部 37 份证书通过 kernel 检查，保留源根所有 universe 参数，递归检查原生目标没有源符号，公理依赖仅允许标准 Lean 公理。两组证明共同导入成功，不依赖原 profile 的搜索路径。

六个候选模块的 80 根已经全部完成变体导出和 kernel 重检。曝光清单包含依赖项，因此曝光声明数量与候选根数量不是同一个指标。只完成重导出不计作 correspondence。

- [证书注册表](certificates.json)、[逐根结果](reports/ROOT_LEDGER.json)、[摘要](reports/summary.json)。
- [CRelation 证明](CRelation.lean)、[CMorphism 证明](CMorphism.lean)。
- [导出器](TransparentPack.lean)、[审计器](Audit.lean)、[计划与 DAG](PLAN.md)。

复现：先运行 python3 build.py，再运行 python3 verify.py，最后 python3 make_report.py。编译产物及临时生成文件均在父工作区 .work/transparent-data，仅留远程。
