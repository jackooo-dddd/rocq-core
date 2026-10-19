# 统计范围：709 → 839 → 2180

依据：仓库原 Corelib/*/inventory.json 清单，与当前 results/corelib-complete/summary.json 的模块 root 数交叉核对。

| 范围 | 根数 |
|---|---:|
| Init + Lists | 699 + 10 = 709 |
| 再加 BinNums 三个模块及 Numbers.BinNums | +101 |
| 再加 Program.Basics、Relations.Relation_Definitions | +6 +23 |
| 原基础扩充范围 | 839 |
| 后续扩展 | +1341 |
| 当前全部固定 Corelib 范围 | 2180 |

后续1341项：Corelib.ssr 646、Classes 400、Floats 134、Numbers.Cyclic.Int63 94、Strings 29、Array 19、Program.Wf/Tactics 13、Setoids 6。

这是 Rocq 9.3.0 固定安装中的67个源模块；51个含内核根，另16个主要为 notation/tactic/配置。MathComp和Prosa自己的声明不在2180分母中。Corelib.ssr 是该 Corelib 安装自带模块。

一个互归纳块计一个 root。构造器、额外 quality 分支、依赖闭包重复项和新生成辅助条件不额外计入2180。定理/公理陈述也计入，但不等于这些定理已经得到目标端证明。
