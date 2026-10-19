> Historical bootstrap baseline. Its identity nat/eq bridges are superseded by [mechanical-correspondence-20261019](../mechanical-correspondence-20261019/README.md). Original measurements below are retained for comparison, not claimed as current proofs.

# Rocq 机械翻译与 Lean 原生对象的桥接

工作目录：`/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018`。
基线：`quality-main75`，Lean 4.33.1。全部证明以真实机械翻译产物为输入，未用手写替代数据类型冒充源类型。

**状态：已完成这一批桥接和全量清单，尚未完成整个 Corelib 的全部原生对应。**
没有把无法匹配或未证明的项称为“不可能”；剩余项保留在清单里。

## 怎么使用

首选 `Unified.lean`：141 个选定原始 roots 在同一个新导出中翻译，并核验源端 roundtrip、独立 Lean consumer、结构审计和桥接证明。`UnifiedInterfaces.lean` 在此环境中额外提供 109 个自动包装接口。`UseNative.lean` 是独立导入使用者，5 个例子均通过。

运行现成例子：

```sh
cd /home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018
python3 run.py UseNative unified
```

```lean
import UnifiedInterfaces
open NativeBridge

-- 翻译后的加法，直接借用 Lean 原生交换律。
example (n m : Nat) :
    Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
  rw [nat_add_agrees, nat_add_agrees, Nat.add_comm]

-- 实际机械翻译的 map，通过接口接受和返回原生 Lean List。
example :
    Interfaces.Rocq.Corelib.Lists.ListDef.map.native
      Nat Nat (fun n => n + 1) [1, 2, 3] = [2, 3, 4] := rfl
```

原始逐文件产物都使用模块名 `Rocq2LeanOut`，对应不同环境，不能把所有逐文件 profile 直接混在一个 import 路径里。`run.py` 为每个 profile 选择正确环境；统一库解决了当前 141 个 roots 的共同使用，未声称所有 480 个逐文件接口都已合并到统一库。

## 三种不同强度的证书

1. **类型双射**：`Iso A B` 包含 `to : A → B`、`of : B → A` 以及两个方向的逆律。可以来回传值，借用原生函数和转移性质。这里使用本地小结构 Iso，具有双射所需的完整逆律；未安装 Mathlib。
2. **指定操作的一致性**：如 `nat_add_agrees`、`nat_land_agrees`、`map_agrees`、`int_mul_agrees`。证明实际机械翻译的操作与指定 Lean 原生操作构成交换图。
3. **自动原生接口**：`Interfaces.…native` 通过已证明的类型双射包装源函数；`…roundtrip` 证明转换回原表示得到原函数。它提供原生参数和结果接口，但不自动证明它等于 Lean 库里另一个同名实现。

`Iso.functions`、`lists`、`options`、`products`、`sums`、`subtypes` 支持组合；`call`、`call₂` 用原生函数处理源表示；`exportFunction` 朝相反方向包装源函数；`forall_iff`、`exists_iff`、`transfer`、`transferBack` 支持搬运定理。

## 核验统计

| 项目 | 数量 |
|---|---:|
| 基线源文件 | 67（51 个含 kernel roots） |
| 逐项保留的源声明 | 2180 |
| 有双射的不同源类型 | 27 |
| 类型双射证书 | 28（sumbool 的一般形式和 Decidable 特例分别证明） |
| 指定原生操作／谓词对应 | 108 项源声明，109 个证书 |
| 自动原生类型接口及往返证明 | 480 / 839 个候选定义 |
| 其中仅覆盖 Type 实例的接口 | 36 |
| 定理陈述 iff 证书 | 845 |
| 已无源端符号的陈述 | 143 |
| 仍残留源端符号的陈述 | 702 |
| 原始 profile 检查 | 17 / 17 |
| 陈述 profile 检查 | 36 / 36 |
| 接口 profile 检查 | 45 / 45 |

这些计数有交集，不能相加作为不同源声明总数。`reports/CORELIB_LEDGER.csv` 另给出互斥状态，正好覆盖全部 2180 项。

## 已建立的主要类型对应

| Rocq 机械翻译对象 | Lean 对应 |
|---|---|
| nat、eq | 基线已 bootstrap 为 Nat、Eq；Nat 的运算仍逐项证明 |
| bool、comparison | Bool、Ordering |
| list、option、prod、sum、result | List、Option、Prod、Sum、Except（注意参数次序） |
| unit、Empty_set | Unit、Empty |
| sig、sig2 | Subtype；同时满足两个谓词的 Subtype |
| sigT、sigT2 | Sigma；Sigma 内包含一对值 |
| sumbool、sumor | PSum；sumbool P (¬P) 另对应 Decidable P |
| positive、N、Z | {n : Nat // 0 < n}、Nat、Int，保留数值含义 |
| Int63.int、int_wrapper | BitVec 63 |
| byte | Fin 256 |
| Decimal.uint、Hexadecimal.uint | List (Fin 10)、List (Fin 16)，保留前导零 |
| float_class | Fin 9；这是分类枚举，不是浮点值或浮点运算 |
| PrimArray.array A | 有界长度的 Vector A 加独立默认值 |
| PrimString.string | 有界长度的 Vector (BitVec 8) |

精确类型、参数和公理闭包见 `reports/ISOMORPHISMS.md`。
没有声称 Decimal.uint 按数值解码与 Nat 双射：`decimal_numeric_decode_not_injective` 已证明 Nil 与 D0 Nil 数值相同而表示不同。
原始字节串可以包含任意字节，并非自然等于有效 UTF-8 的 String。
数组长度上限和默认值没有被丢弃。

## 语义对应覆盖

Nat：基础常量、加减乘、幂、比较、min/max、尾递归算术、奇偶、除二、移位、除法、取模、testbit、land/lor/lxor/ldiff；有界 bitwise 还给出带明确前提的通用定理。
List：长度、append、map、repeat、take/drop、nth、seq、Forall。
正数：succ、add、add_carry、mul、pred_double、数值转换；二进制整数：取反、乘法和部分转换。
Int63：加减乘除模、无符号/有符号比较、位运算和逻辑移位。
数组：长度、默认值、复制、访问、创建的长度与内容、更新。
逻辑与 Peano：基本逻辑构造、量词、序关系。

完整等式（含可能的前提）见 `reports/OPERATIONS.md`。没有用一句“这个类型有双射”替代这些操作证明。

## Universe、证明和执行边界

- 双射类型明确量化 universe，`Type u` 不是仅测试在一个具体数据类型上。
- 对裸 `Sort u` 参数的自动接口，先尝试保持原 universe；若目标容器必须是 Type，只生成并记录相应 Type 实例。36 项使用此限制，不覆盖原始 Prop 分支，不修改源声明。
- 845 个 iff 证明的是陈述对应。证明 `P ↔ Q` 不等于已经证明 P 或 Q。原基线中 331 个带显式证明参数的声明没有被当成无条件结果。
- 所有接受的桥接定义／定理检查传递公理闭包，只允许 Lean 标准 `propext`、`Quot.sound`、`Classical.choice`；没有 `sorryAx`、源定理假设公理或新的翻译公理。每项实际用到哪些公理可查 JSON。
- 这些是 Lean kernel 层的可使用定义和证明。原机械产物没有统一提供可执行代码生成，因此这里使用 noncomputable 环境；没有宣称全部包装器可直接 `#eval` 或以原生速度运行。
- 未验证 Mathlib 包集成，也未安装大型框架。

## 文件导航与剩余工作

- `reports/CORELIB_LEDGER.csv`：2180 项源声明、原目标、桥接状态、对应证书、残留符号、未匹配类型和 universe 限制。
- `reports/modules/Corelib/…md`：67 个 core 源文件各一份报告；无 kernel roots 的文件也明确说明。
- `reports/ISOMORPHISMS.md`、`OPERATIONS.md`：双射及指定 API 语义证明。
- `reports/statements.json`：845 项的具体原生／部分原生陈述。
- `reports/interfaces.json`：480 项实际接口类型和往返证书。
- `fragments/`：可编辑证明；`audits/`：Lean 环境中提取的类型、公理依赖；`logs/`：实际构建日志。
- `reports/summary.json`：机器可读汇总。尚未桥接不等于不存在对应。

仍有 488 项没有这一轮桥接证书、331 项需要显式证明参数、702 个陈述只做了部分原生化，以及 1 个 Type-valued statement 需要不同于 iff 的处理。另有 379 项目前只有已证明的接口包装，还没有指定原生 API 的语义一致性证书。它们均保留，不删分母、不算作完成。

## 复现

```sh
python3 build_all.py
python3 prepare_auto.py
python3 run_auto.py
python3 prepare_interfaces.py
python3 run_interfaces.py
python3 build_unified.py
python3 build_interfaces_unified.py
python3 run.py UseNative unified
python3 make_report.py
```

依赖原冻结 snapshot 和逐文件导出路径；未将这些大型产物复制到本目录。统一翻译命令可返回 ROOTS_NOT_TRANSLATED/exit 2，因为显式请求的 nat/eq 标为 BOOTSTRAP_RESOLVED；脚本仅在所有 roots 都是 TRANSLATED_AND_CHECKED 或 BOOTSTRAP_RESOLVED 时接受，随后独立 consumer 和审计必须通过。
