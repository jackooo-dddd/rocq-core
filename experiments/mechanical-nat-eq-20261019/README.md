# nat / eq 全机械翻译基线

本版本将 Rocq 的 nat、eq 也作为普通归纳类型机械翻译。
它们的源声明、构造器、引用和消去均走现有通用规则，源类型不再映射到 Lean 原生 Nat/Eq。

工作目录：`experiments/mechanical-nat-eq-20261019`。
新版本翻译器：`translator/`；完整逐文件结果：`results/`。
本目录是独立实验版本。运行本版本时须明确使用这里的 translator 路径。

## 结果

67 个 Corelib 源文件、2180 个 root 声明，0 项受阻，0 项验证失败。
其中 51 个文件含 kernel roots；16 个只涉及 notation/tactic/配置等，不算成 kernel 翻译声明。

| 分类 | 数量 |
|---|---:|
| 完整定义／数据类型，无待证参数 | 1003 |
| 定理／公理陈述，无待证参数 | 846 |
| 带显式待证参数的定义 | 148 |
| 带显式待证参数的陈述 | 183 |
| 原生 bootstrap 映射 | 0 |
| 受阻 | 0 |

“陈述通过检查”不是证明业务定理成立；331 项原有待证参数仍明确保留。
本轮完成的是新的机械翻译基线，没有消去这些既有证明条件。

与 quality-main75 相比，只有两个源声明的状态变化：

- Corelib.Init.Datatypes.nat：BOOTSTRAP_RESOLVED → TRANSLATED_AND_CHECKED。
- Corelib.Init.Logic.eq：BOOTSTRAP_RESOLVED → TRANSLATED_AND_CHECKED。

另外 2178 项的状态保持一致；完整范围未增删。
原来 1001 项完整定义／数据类型，加上这两个普通归纳类型，成为 1003 项。

## nat 和 eq 现在是什么

实际生成目标：

- `Rocq.Corelib.Init.Datatypes.nat`，构造器 `nat.O`、`nat.S`，自己的 `nat.rec`。
- `Rocq.Corelib.Init.Logic.eq`，类型为 `(A : Sort u) → A → A → Prop`，
  构造器 `eq.eq_refl`，自己的 `eq.rec`。

它们是新生成的 inductive，不是原生类型的 abbrev。
测试已检查两者分别不与 Lean Nat、Eq 定义相等。
机械 Nat 的加法和乘法可以在内核中归约；机械 eq 的依赖消去和 refl 归约也已检查。

翻译器内部仍可使用 Lean Nat/Eq 处理元数据、原语模型和辅助证明。
这与把 Rocq 源声明映射成原生类型不同。审计要求所有源 nat/eq 引用对应到生成声明。

## 改动与证据

三个实现文件：

- `translator/Rocq2Lean/Bootstrap.lean`：bootstrap 表为空。
- `translator/tools/audit.py`：独立审计的 bootstrap 表为空。
- `translator/tools/preflight.py`：预检查的 bootstrap 表为空。

没有增加新的翻译规则；复用了已有的归纳类型、递归、依赖消去及 universe 处理。
`mechanical-nat-eq.patch` 是相对于冻结 quality-main75 翻译器的这三个文件的补丁。

验证包括：

1. 每个有 kernel roots 的模块：Rocq 源端 roundtrip、独立 Lean consumer、独立结构审计。
2. 全范围与旧基线比较：2180 个 roots 完全一致，没有状态或验证回归。
3. 检查所有输出中出现的源 nat/eq 均为生成归纳类型，不允许 BOOTSTRAP_RESOLVED。
4. `tests/MechanicalIdentity.lean`：类型身份、构造器、recursor、机械 eq 依赖消去。
5. `tests/NatCompute.lean`：使用机械 O/S 构造器检查实际加法、乘法归约。
6. 故意恢复旧 nat/Eq bootstrap 报告：Python 审计与独立 Lean consumer 均拒绝。
7. 完整 statement suite，包括 Prosa FinishTime、陈述篡改、证明无关性、
   确定性，以及 sorry／伪造公理／错误陈述等负例。
8. 67 个逐文件 Lean 展示入口重新编译，并保存实际打印结果。

主要汇总：`VALIDATION.json`、`baseline-delta.json`、`results/summary.json`。
测试日志：`logs/MechanicalIdentity.log`、`logs/NatCompute.log`、`logs/statement-suite.log`。

## 每个源文件对应的结果

`results/Corelib/.../Name.v`：原 Rocq 源文件。
`Name.lean`：该文件的机械翻译入口和打印命令。
`Name.txt`：Lean 实际打印的类型与正文。
`Name.md` / `Name.json`：每项声明的结果、证明参数、规则和验证记录。
`results/declarations.csv`：全部 2180 项清单。

逐文件入口包含自己的依赖闭包，不保证所有入口能放在同一个环境中一起 import。
完整原始运行保存在 `runs/full-v1/`。

## 运行

在远程工作站本目录执行：

```sh
python3 test_mechanical.py
python3 test_no_bootstrap.py
python3 results/run_lean_entry.py Corelib/Init/Nat.lean
```

全量测量的命令见 `run_probe.py` 和 `finish.py`；新测量应使用新的输出目录，
因为测量器会复用已有 result.json。

## 已完成的后续 correspondence

机械翻译阶段完成后，已在独立 mechanical-correspondence-20261019 实验建立机械 nat/eq 与 Lean 原生 Nat/Eq 的对应。
下一阶段可以基于这两个真实机械类型，分别证明双向转换、操作一致性和命题搬运。

`native-correspondence-main75-20261018` 属于旧 bootstrap 基线。
旧版 Nat identity bridge 和此前的 correspondence 数量不能直接作为本版本的证明结果。
