# 增量 correspondence 工作区

先写计划与 DAG，再按步骤推进。入口：[PLAN.md](PLAN.md)、[DAG.md](DAG.md)、[逐根任务表](tasks.csv)。

## 第一批已验证结果

5 个 Lean profile 全部通过；显式登记 26 份新增证书，覆盖 1 个新类型根和 24 个新运算/谓词根。
- Program.Basics：apply、arrow、compose、const、flip、impl。
- SSR Option：apply、default、lift、map、bind。
- SSR 函数：comp、catcomp、idfun、fun_of_simpl；simpl_fun 与普通函数的 Iso。
- SSR 谓词：cancel、commutative、associative、involutive、injective、eqfun、eqrel、left_id。
- Nat.iter：原生 Nat.rec 迭代表达式；另证带载体 Iso 和显式步函数对应假设的版本。

| 主分类 | 基线 | 当前 |
|---|---:|---:|
| 类型对应 | 29 | 30 |
| 运算/谓词对应 | 114 | 138 |
| 只有接口 | 375 | 352 |
| 尚无证书 | 485 | 483 |
| 完全原生陈述 | 143 | 143 |
| 部分原生陈述 | 702 | 702 |
| 带条件 | 331 | 331 |
| 非 Prop 特殊陈述 | 1 | 1 |

计数是去重源根；Nat.iter 的两份证书只算一个根。原生目标包括现成 API 和指定的原生组合表达式，两者在证书表的 target 字段中逐项说明。谓词 iff 不证明任意函数具有该性质。
旧基线证明沿用其既有验证结果，本轮没有重跑全部 2180 项机械翻译或全部旧证明。

## 已开始的自动复用

Registry.lean 将 simplFunIso 接入接口生成器，并组合已有函数、Bool Iso：
- 恢复 fun_of_simpl 的自动接口往返证明（未启用 Type 特化）；源根接口证书总数 478 → 479。
- 一个额外探测函数自动得到 (Bool → Bool) → Bool 接口，并证明其结果等于 f true。探测函数不是 Corelib 根，不计入覆盖数。
- 修正了本工作区生成器的别名处理：先将类型头化为弱头正规形，再判断是否使用 identityIso。旧逻辑可能将 RBool 等别名误当成已经原生的类型。
- native_correspondence 组合 SSR Option/函数规则，自动完成两个复合表达式的对应证明；错误的加一/加二对应被拒绝。

当前需要显式给出原生目标表达式；尚未实现任意函数的原生目标自动合成。新生成器仍局限于本实验，并未全面替换旧接口流水线。
不同模块的 Rocq2LeanOut 仍应按 profile 分别加载，尚未完成 P7 的统一导入。
机械导出类型没有全部原生代码生成，本轮检查 Lean kernel 的定义/证明，不承诺运行时 #eval 性能。Mathlib 未在本轮测试。

## 文件

- [证书完整类型、公理闭包](reports/CERTIFICATES.md)
- [当前 2180 项覆盖](reports/CORELIB_LEDGER.csv)、[摘要](reports/summary.json)
- [验证记录](reports/validation.json)、reports/*-audit.json、reports/*.log
- proofs/Basics.lean、SSR.lean、SSRProperties.lean、Iteration.lean、Registry.lean
- certificates.json：显式 source → certificate 清单；make_report.py 只按此清单更新覆盖。
- source-dependencies.csv：9457 条带类别的 IR 依赖；dependency-graph.json：根级 DAG。
- .work/：编译缓存与临时检查，仅远程保留。

## 远程复现

在本目录执行：

    python3 build_dag.py
    python3 build_registry.py
    python3 verify.py
    python3 make_report.py

使用已有 pinned Lean 4.33.1 和 full-v1、旧 correspondence 的已编译模块；首次从源码复现需先按旧实验 README 构建这些依赖。verify.py 的 profile 顺序先构建 SSR，再构建依赖它的 Registry 和 SSRProperties。
只复查修改过的 profile 可以传参数，例如 python3 verify.py Registry；之后 make_report.py 会检查每份当前源码与成功验证记录一致。
build_dag.py 重新生成基线任务表后，运行 make_report.py 恢复本轮进度字段。

## 下一步

P2/P3a 完成第一批，不是整个计划完成。接下来检查别名正规化对其他接口的影响，扩展 SSR 布尔谓词，并处理数值/数字表示与依赖类型；每批继续更新 PLAN.md 和 tasks.csv。
