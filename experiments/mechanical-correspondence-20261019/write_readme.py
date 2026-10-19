from pathlib import Path
import json
W=Path(__file__).resolve().parent
s=json.loads((W/'reports/summary.json').read_text());r=json.loads((W/'reports/REGRESSION.json').read_text())
tick=chr(96); fence=tick*3
text='''# 机械 nat / eq 的对应证明与旧证明迁移审计

本实验只在此目录工作，使用 ../mechanical-nat-eq-20261019/translator 与其 full-v1 翻译结果。旧 correspondence 实验和机械翻译器均未修改。验证在 CityU WSL 的 Lean 4.33.1 完成。

## 新 nat、eq 已证明什么

- natTo : MechanicalNat → Nat，natOf : Nat → MechanicalNat；两个往返恒等组成 natIso。源类型确实是独立归纳类型，不是 Nat 的别名。
- eq_correspondence : MechanicalEq A x y ↔ x = y，覆盖 A : Sort u。
- eqIso 包含证明对象的双向转换和两个往返恒等；等式证明属于 Prop，往返使用 Lean 的证明无关性。
- eq_transport_agrees：通过机械 eq 消去得到的依赖 transport，与通过 Lean Eq 的 transport 一致，结果族 P : A → Sort v。
- nat_eq_correspondence：MechanicalEq MechanicalNat a b ↔ natTo a = natTo b。
- Nat 的普通/依赖递归对应，以及加减乘、幂、比较、奇偶、除法、取模、移位和位运算对应，均在新机械结构上重证。
- IdentityCheck.lean 确认源 nat、eq 与原生类型不定义相等，主要 nat/eq 对应证明的公理闭包为空。

这不是使用公理认定两个类型相等。旧 nat_type_agrees 的 RN = Nat 不再成立；现在这个名字给出显式 Iso。nat 和 eq 的旧恒等对应没有被沿用。

## 旧证明的检查结果

旧 98 个文件原样换用新机械输出：86 个通过，12 个失败；记录在 legacy/results.json。
失败文件及原因见 reports/REGRESSION.json 和 legacy/logs/。主要问题是旧函数参数直接使用 Nat、输出直接与 Nat 数值比较、is_true 的机械 eq 证明被当作 Lean Eq。

迁移后，MANUAL_COUNT 个手写 profile、36 个陈述 profile、45 个接口 profile 全部通过。
旧 TYPE_COUNT 份类型 Iso、OP_COUNT 份运算对应证书均已在新基线上重新检查；具体陈述改变的部分见逐项 old_type/new_type 对比。这不是声称旧源文件原封不动仍然正确。
旧 845 份陈述 iff 全部重新生成并检查；其中 FULL_COUNT 份无直接源端符号，其余仍部分保留源端表达式。iff 证明不等于证明源业务定理。
原翻译 331 项显式待证明条件保持不变。

## 自动接口与手写消去器证明的区别

当前自动生成 INTERFACE_COUNT 个接口往返证书：保留旧接口 RETAINED_COUNT 个，新增 NEW_COUNT 个。
旧接口中下面 5 个未由通用接口生成器恢复，原因是其类型依赖被转换的 motive 或 equality proof：

| 原声明 | 单独已检查的运算对应 |
|---|---|
| Init.Datatypes.nat_rec | source_nat_rec_agrees |
| Init.Datatypes.nat_rect | source_nat_rect_agrees |
| Init.Logic.eq_rew_dep | source_eq_rew_dep_agrees |
| Init.Logic.eq_rew_fwd_dep | source_eq_rew_fwd_dep_agrees |
| Init.Logic.eq_rew_fwd_r_dep | source_eq_rew_fwd_r_dep_agrees |

这些手写证明把原生索引的 motive 显式带回机械类型，再证明结果一致；不是通用依赖函数空间的自动往返包装。两种证书分开统计，不把手写结果冒充已恢复自动接口。见 DependentNat.lean、DependentEq.lean 和 reports/interface-regression.csv。

通用接口仅证明转换后的函数能够往返，不自动等于 Lean 同名库函数。具体原生操作一致性见 reports/OPERATIONS.md。
部分容器接口仍只覆盖 Type 实例，不自动覆盖源 Sort 的 Prop 分支。Mathlib 集成未在本实验测试。

## 已验证的统一使用入口

Unified.lean / UnifiedInterfaces.lean 在同一份 141-root 导出中工作，已通过源端 roundtrip、独立 Lean consumer、Python audit，以及桥接证明编译。
UseNative.lean 展示原生 Nat 加法、机械 eq 下的加法交换律、嵌套 Nat List 往返、长度、Z 乘法。

每个单独 profile 的 Rocq2LeanOut 绑定不同模块，不能把所有 profile 的 .olean 随意同时 import。需要共同使用时使用 Unified / UnifiedInterfaces 入口。
验证在远程运行；同步到 Mac 的文件用于阅读和复现，脚本中的 Linux 路径需要相应环境。

## 文件与复现

- NatEq.lean：新的 nat/eq 主对应。
- Nat.lean：源 Nat 运算的对应。
- DependentNat.lean / DependentEq.lean：源消去器对应。
- reports/CORELIB_LEDGER.csv：2180 个 root 的最新逐项覆盖。
- reports/type-regression.csv、operation-regression.csv、statement-regression.csv、interface-regression.csv：旧证书逐项检查。
- reports/ISOMORPHISMS.md、OPERATIONS.md：完整证书类型与公理闭包。
- reports/summary.json、REGRESSION.json：机器可读统计。
- final-validation.json、logs/：验证命令、退出码和日志。
- legacy/：不通过的新旧兼容性反例与历史源文件，仅用于审计，不作为已通过的新证明发布。

在远程此目录运行：

REPRO_COMMANDS

所有已接受的证明都拒绝 sorryAx 或新增源端公理；辅助库证明允许 Lean 标准公理 propext、Quot.sound、Classical.choice。nat/eq 主对应不需要这三项。
完整 Corelib 的 correspondence 覆盖仍是部分完成；该结论与 2180 项机械翻译均通过是两件事。
'''
repl={'MANUAL_COUNT':s['passing_manual_profiles'],'TYPE_COUNT':r['old_type_certificates']['total'],'OP_COUNT':r['old_operation_certificates']['total'],'FULL_COUNT':s['fully_native_statement_iffs'],'INTERFACE_COUNT':s['native_interface_roundtrips'],'RETAINED_COUNT':r['old_automatic_interfaces']['retained'],'NEW_COUNT':len(r['old_automatic_interfaces']['newly_generated'])}
for k,v in repl.items(): text=text.replace(k,str(v))
text=text.replace('REPRO_COMMANDS',fence+'bash\npython3 final_validate.py\npython3 make_report.py\npython3 make_regression_report.py\npython3 write_readme.py\n'+fence)
(W/'README.md').write_text(text)
