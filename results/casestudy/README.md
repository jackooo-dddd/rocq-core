# Nat 机械翻译案例

后续增量：Nat.iter 已新增运算对应，见 [Iteration.lean](../../experiments/incremental-correspondence-20261019/proofs/Iteration.lean)。本案例逐项表保留构建时的证明快照，最新状态以 [增量账本](../../experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv) 为准。

本案例收录 Rocq Corelib 中 Nat 的源定义、函数、翻译过程证据、Lean 实际输出及现有 correspondence 证明。基线为 mechanical-nat-eq-20261019/full-v1：源 nat/eq 都生成独立归纳类型，bootstrap 表为空。

## 从哪里开始

1. [类型、构造器和加法的翻译流程](TRANSLATION_FLOW.md)：先看具体例子。
2. [99 个声明的前后对照](DECLARATIONS.md)：点击每项查看实际 Lean 正文、尝试与对应证书；另有 [CSV](DECLARATIONS.csv)。
3. [原生 Nat 对应证明与缺口](CORRESPONDENCE.md)：区分类型双射、运算对应、接口往返和陈述 iff。
4. [文件阅读指南](FILES.md)及[每一个导出文件的解释](EXPORT_FILES.md)。
5. [全 Corelib 范围演变](SCOPE.md)：709 → 839 → 2180。

## 收录范围

| 来源 | 专题根数 | 内容 |
|---|---:|---|
| Init.Datatypes | 5 | nat、nat_ind、nat_rec、nat_rect、nat_sind；O/S 随归纳块记录 |
| Init.Nat | 58 | 常量、算术、比较、递归辅助、除法、位操作、数字表示转换 |
| Init.Peano | 36 | 大小关系、消去辅助及定理陈述 |
| 合计 | 99 | 不是整个2180根范围，也不是 Nat 的所有传递客户端 |

为保留源码上下文，source/、records/ 和 lean/ 中放的是三个完整模块，其中 Datatypes 还包含其他类型。专题统计只选择上述99项。
另有 [CORELIB_NAT_REFERENCES.csv](CORELIB_NAT_REFERENCES.csv)：整个2180根范围中，最终目标 AST 直接引用机械 nat/其构造器与消去器或 Init.Nat 运算的149个根（含 quality 分支后去重）。这不是传递依赖闭包，不等于“所有与自然数相关的声明”。

机械结果：65项完整定义/数据类型、33项定理/公理陈述、1项带条件定义（gcd），0项受阻。33项陈述检查通过不等于定理证明已迁移。详见 [summary.json](summary.json)。

## 阅读和运行

Mac 上可直接阅读本目录全部文本、JSON和证明源码。Lean 入口仍引用远程冻结运行的绝对路径，不能当成已打包的可同时 import 的便携库。

在远程仓库根运行：

    python3 results/casestudy/build.py
    python3 results/casestudy/verify.py

build.py 从已有冻结证据重建索引和副本，不重新翻译。verify.py 核对副本并重新检查主要对应证明及一个机械加法例子；结果写 VALIDATION.json，缓存和完整新日志只写被忽略的 .work/。需要既有远程 Lean 工具链和生成模块缓存。

Nat 对应证明是翻译后的独立步骤，不参与机械翻译选择规则。这里没有新增 Mathlib 互操作验证，也不承诺生成类型支持 #eval；计算例子使用内核归约与 rfl。
