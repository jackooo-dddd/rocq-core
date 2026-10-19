CURRENT UPDATE 2026-10-19: This file below describes a historical 839-root/early baseline. Current 2180-root mechanical nat/eq results and correspondence proofs are indexed in README.md, RESULTS.md and results/corelib-complete/ALL_RULES.md.

范围：此前基础模块的 24 个 Corelib 文件、839 项声明，不是所有已安装 Corelib 文件。
统计单位是导出的全局常量或互归纳块；构造子列在归纳块内部，不单独增加根声明数。自动生成的消去器计为常量；模块、记号和策略命令不是这一统计中的声明。
原项目源码未修改，未提交或推送。
基线：574 无额外条件，75 带条件，190 受阻。
隔离候选：569 无额外条件，81 带条件，189 受阻。
可检查项由 649 增至 650；新增的只是定理陈述 eq_existT_curried_congr，仍有 3 个显式前提，并未得到定理证明。
普通数据类型和函数没有新增成功项。另 5 项原本无额外条件的定理陈述新增条件，因此这是有代价的候选，未集成原项目。

另有 6 项原本已经带条件的陈述改变了条件清单（4 项条件数增加、1 项减少、1 项数量相同但条件变化）；完整前后对比见 experiments/root-obligation-delta.json。

目录：
index.html / improved/index.html：基线 / 候选逐文件入口。
rule-improvements.html / .txt：六组实验、最终候选、逐项变化、后续缺失能力。
Corelib/.../X.v：源文件副本。
Corelib/.../X.lean：实际翻译入口，用 #rocq2lean_import 生成内核声明。
Corelib/.../X.kernel.txt：实际 Lean #print 定义。
Corelib/.../X.report.html / .txt：每项成功/失败与翻译过程。
Corelib/.../X.json：模块完整机器可读结果。
Corelib/.../X/records/0000.json：单项完整源 IR、目标 AST、全部尝试与条件。
Corelib/.../X/：导出、roundtrip、consumer、audit、日志和 olean。
improved/Corelib/...：同结构候选结果。
translator/：基线 3c79203 加未提交候选；candidate.patch 是精确代码差异。
experiments/：各组试验、差异和测试证据。
source-extraction-errors.json：52 项抽取失败的实际检查阶段与类型错误。
artifact-validation.json：产物和检查结果。

使用：
每个 .lean 带自己的依赖闭包，应作为独立单元使用，不可直接把 24 个文件同时 import。
.lean 是翻译器的可执行入口，不是脱离翻译器的手写源码；可读定义在 kernel.txt 和逐项报告。
Equality.lean 明确报导出失败。Ltac、Notations、Tauto 没有计入内核声明，不代表策略/记号已经翻译。
定理只输出 .statement : Prop；pending 是显式假设，不能当作已有证明或无条件结论。
过程来自真实 IR、tier 尝试与内核输出；AST 节点映射为静态说明，不冒充逐指令执行轨迹。

验证：
Lean 4.33.1 / Rocq 9.3.0。20 个有可导出声明的模块在基线与候选下分别通过源端 roundtrip、Lean consumer、未修改的独立 audit、内核输出及入口编译。
statement 套件通过：包括证明变化不影响输出、确定性、陈述篡改负例及拒绝 sorry/axiom 的提交负例。
本轮未重跑完整 4,474 个 Prosa 保护根；保护清单未改。候选代码保持隔离。
复现脚本位于 scripts/，读取现有冻结 census 输入及已安装工具链；所有本轮输出在本目录。
