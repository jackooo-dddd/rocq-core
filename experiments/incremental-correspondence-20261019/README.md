# 增量 correspondence 工作区

先写计划与 DAG，再按步骤推进。入口：[PLAN.md](PLAN.md)、[DAG.md](DAG.md)、[逐根任务表](tasks.csv)。

## 已验证进展（二十四批）

74 个 Lean profile 均有与当前源码及依赖产物匹配的成功验证记录。二十四批累计登记 1093 份新增覆盖证书，覆盖 55 个新类型根、390 个新运算根、624 个新完整原生陈述（522 个原部分陈述、102 个已闭合条件陈述）。已有类型根的补充证书不重复计根；139 份新增原陈述证明也不重复计根。

- Program.Basics：apply、arrow、compose、const、flip、impl。
- SSR Option：apply、default、lift、map、bind。
- SSR 函数：comp、catcomp、idfun、fun_of_simpl；simpl_fun 与普通函数的 Iso。
- SSR 谓词：cancel、commutative、associative、involutive、injective、eqfun、eqrel、left_id。
- 第二批：pred/rel Iso、reflect Iso 及到 Decidable P 的转换；SSR 布尔运算与关系谓词 12 项；216 项陈述复查中 141 项完全原生化。
- 第三、四批：[数字表示与良基递归](NUMERIC_WF_RESULTS.md)：4 个类型、36 个运算、8 个完全原生陈述；8 个原陈述经原生 BEq 定理证明。
- 第五批：[依赖消去与条件实例化](DEPENDENT_RESULTS.md)：16 个运算根，包括 4 个带条件根的闭合实例化；5 个既有类型根扩展到完整 Sort。
- 第六批：[二元递归、依赖陈述与基本消去器](RECURSION_STATEMENTS_RESULTS.md)：25 个新运算、5 个完整原生陈述；同一义务证明复用到 5 个下游根。
- 第七批：[Eq transport 与布尔等式](EQUALITY_RESULTS.md)：1 类型、14 运算、4 完整原生陈述；4 个条件根已闭合。
- 第八、九批：[关系、Classes 与可变参数谓词](RELATIONS_RESULTS.md)：两个模块的 126 根均有对应；包括实际 Setoid/Quotient 使用例和两个闭合条件根。
- 第十批：[Morphisms](MORPHISMS_RESULTS.md)：新增 68 根；该模块的 87 根均有对应；55 个部分陈述全部自动原生化。
- 第十一批：[Equivalence / Morphisms_Prop / Setoid](EQUIVALENCE_SETOID_RESULTS.md)：新增 40 根；三个模块共 52 根均有对应。
- Nat.iter：原生 Nat.rec 迭代表达式；另证带载体 Iso 和显式步函数对应假设的版本。

| 主分类 | 基线 | 当前 |
|---|---:|---:|
| 类型对应 | 29 | 84 |
| 运算/谓词对应 | 114 | 504 |
| 只有接口 | 375 | 173 |
| 尚无证书 | 485 | 304 |
| 完全原生陈述 | 143 | 767 |
| 部分原生陈述 | 702 | 180 |
| 本层尚带条件 | 331 | 167 |
| 非 Prop 特殊陈述 | 1 | 1 |

原始机械产物仍有 331 个带条件根；本层已用闭合证明实例化其中 164 个（62 定义、102 陈述），剩余 167。逐项条件证据见 reports/condition-discharges.json，最新批次见 SPECIF_COMPLETION_RESULTS.md。

根计数表示已有明示范围内的对应证明，不保证所有 universe 实例均已覆盖；例如 List/Option/Except 本批操作覆盖 Type 参数，PProd/PSum 覆盖 Sort 参数。

计数是去重源根；Nat.iter 的两份证书只算一个根。原生目标包括现成 API 和指定的原生组合表达式，两者在证书表的 target 字段中逐项说明。谓词 iff 不证明任意函数具有该性质。
旧基线证明沿用其既有验证结果，本轮没有重跑全部 2180 项机械翻译或全部旧证明。

## 已开始的自动复用

Registry.lean 将 simplFunIso 接入接口生成器，并组合已有函数、Bool Iso：
- 恢复 fun_of_simpl 的自动接口往返证明（未启用 Type 特化）；源根接口证书总数 478 → 479。
- 一个额外探测函数自动得到 (Bool → Bool) → Bool 接口，并证明其结果等于 f true。探测函数不是 Corelib 根，不计入覆盖数。
- 修正了本工作区生成器的别名处理：先查已登记的类型桥接，再展开未识别的类型别名，最后才判断 identityIso。旧逻辑可能将 RBool 等别名误当成已经原生的类型。
- native_correspondence 组合 SSR Option/函数规则，自动完成两个复合表达式的对应证明；错误的加一/加二对应被拒绝。

当前 27 个指定透明谓词可以自动归一化出原生目标；一般计算函数仍需显式目标，尚未实现任意函数的原生目标自动合成。新生成器仍局限于本实验，并未全面替换旧接口流水线。
原 profile 的 Rocq2LeanOut 仍按闭包单独编译；P7 已将 1093 份增量证书重新封装并共同导入，见 [跨模块与 Mathlib 结果](INTEROP_RESULTS.md)。当前全部 1093 份覆盖证书均已计入，68 个包含覆盖证书的模块共同导入通过。
机械导出类型没有全部原生代码生成，本轮检查 Lean kernel 的定义/证明，不承诺运行时 #eval 性能。Mathlib Nat.prime_two 消费已通过；测试范围详见 INTEROP_RESULTS.md。

## 文件

- [证书完整类型、公理闭包](reports/CERTIFICATES.md)
- [当前 2180 项覆盖](reports/CORELIB_LEDGER.csv)、[摘要](reports/summary.json)
- [验证记录](reports/validation.json)、reports/*-audit.json、reports/*.log
- proofs/：Basics、SSR、Bool 陈述、NumericRead、Decimal/HexadecimalOperations、WellFounded 等；新增证明详情见 NUMERIC_WF_RESULTS.md。
- certificates.json：显式 source → certificate 清单；make_report.py 只按此清单更新覆盖。
- source-dependencies.csv：9457 条带类别的 IR 依赖；dependency-graph.json：根级 DAG。
- .work/：编译缓存与临时检查，仅远程保留。

## 远程复现

在本目录执行：

    python3 build_dag.py
    python3 build_registry.py
    python3 build_statements.py
    python3 build_relation_statements.py
    python3 build_morphism_statements.py
    python3 build_equivalence_statements.py
    python3 build_morphisms_prop.py
    python3 build_digit_operations.py
    python3 verify.py
    python3 make_report.py

使用已有 pinned Lean 4.33.1 和 full-v1、旧 correspondence 的已编译模块；首次从源码复现需先按旧实验 README 构建这些依赖。verify.py 的 profile 顺序先构建 SSR，再构建依赖它的 Registry 和 SSRProperties。
只复查修改过的 profile 可以传参数，例如 python3 verify.py Registry；之后 make_report.py 会检查每份当前源码与成功验证记录一致。
build_dag.py 重新生成基线任务表后，运行 make_report.py 恢复本轮进度字段。

## 下一步

P2/P3/P4/P5/P6 已有二十四批进展，整个计划未完成。Eq transport 已推进；接下来处理依赖陈述、剩余条件义务、数字写出及统一导入的后续覆盖。最终覆盖的主观预估见 [ESTIMATE.md](ESTIMATE.md)，不作为已证结果。

## 第二批检查

SSRBoolStatements 使用转换证书自动生成原生目标和 iff，不依赖源定理证明。检查会展开 NativeBridge 别名，避免把隐藏源类型误计成原生；包括一个源别名反例和原生 Bool 正例。

接口别名回归可用 python3 check_alias_regression.py 重跑；45 个旧 profile 全部通过，无旧接口丢失、无新增包装；结果在 reports/alias-regression.json。完整生成文件与详细回归日志仅在远程 .work/，保留脚本与紧凑结果。回归仅比较接口生成，不将新包装数当作运算 correspondence。

第十七批：[Specif 陈述转换](SPECIF_STATEMENTS_RESULTS.md)，49 候选全部完全原生化；sumor Iso 扩展到完整 Sort。完成类别总计 863 / 2180。

第十七批：[数字写出](NUMERIC_WRITE_RESULTS.md)，新增 1 类型根、11 运算根，并证明打印数值正确。当前完成类别 875 / 2180。原生目标表达式与现成 Mathlib API 仍分别标记。

第十七批加强：七个顶层数字打印均已证明与 Mathlib Nat.digits 的显式适配表达式相等。它们是已有源根的更强证书，完成根仍为 875。

第十四批：[有符号读取](SIGNED_READ_RESULTS.md)，新增 3 个运算根。第十七批：[Nat 完成范围](NAT_COMPLETION_RESULTS.md)，新增 gcd、divmod、sqrt/log2 及内部迭代器 6 根。当前完成类别 884 / 2180，Init.Nat 的 58 根均有明示范围内证书。

第十六批：[Peano 与旧原生目标复查](PEANO_RESULTS.md)。Init.Peano 的 36 根全部有范围明确的对应；累计完成类别 890 根。旧账本选用的 143 个原生陈述目标体已按实际模块展开别名复查，未发现源端符号。

第十七批：[List 与二进制数](LIST_BINARY_RESULTS.md) 新增 32 根，当前完成类别 922 / 2180。

第十八批：[mask 与二进制算术](BINARY_MASK_RESULTS.md) 新增 15 根；当前完成类别 937 / 2180。全体 47 个增量 profile 已按依赖顺序重编译，报告检查当前依赖指纹。

第十九批：[Datatypes 完成范围](DATATYPE_COMPLETION_RESULTS.md)，该模块 110 根均有明示范围内对应，累计完成类别 985。完整 Sort 类型桥接与原有 Type 专用桥接的兼容性也已证明。

第二十批：[Init.Logic 完成结果](LOGIC_COMPLETION_RESULTS.md)：新增 94 根，模块 176 根均有范围明确的对应。总完成类别 1079 / 2180，812 份覆盖证书共同导入通过。

第二十一批：[Init.Specif 完成结果](SPECIF_COMPLETION_RESULTS.md)，新增 80 根，模块 159 根均有明示范围内证书。当前完成类别 1159 / 2180；70 个条件根已闭合并完成对应。

第二十四批：[SSR 函数谓词与陈述](SSR_FUN_RESULTS.md)，新增 79 个完成根、84 份证书，累计 1238 / 2180。50 个原部分陈述全部原生化；Option 的五项运算补充完整 Sort 证明，旧根不重复计数。

最新批次：[SSR 数据与条件声明](SSR_DATA_RESULTS.md)，新增 23 根，ssrfun 124 / 128。剩余四项的 opaque 计算等式缺口由单独 kernel 诊断确认；不计作已完成对应。

最新批次：[SSR Bool 数据与陈述](SSR_BOOL_DATA_RESULTS.md)，新增 94 根；总完成类别 1355 / 2180。
