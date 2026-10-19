# Nat 的机械翻译：源 → IR → Lean → 独立对应证明

本页把实际记录和解释分开：声明状态、尝试标签、译文来自冻结报告；“为何使用递归器”的说明来自源 IR 形状及译文。现有材料没有保存每一个 AST 节点的逐步改写轨迹。

## 1. Rocq 的类型与构造器

[source/Datatypes.v](source/Datatypes.v) 中的定义：

    Inductive nat : Set :=
      | O : nat
      | S : nat -> nat.

导出记录见 [nat.json](declarations/Corelib.Init.Datatypes.nat.json) 的 mechanical_record.source_ir。nat 是归纳块，构造器存放在块内，不是两个独立 root。源 Set 在此译为 Lean Type。

实际生成结果见 [Datatypes.txt](lean/Datatypes.txt)：

    inductive Rocq.Corelib.Init.Datatypes.nat : Type
    Rocq.Corelib.Init.Datatypes.nat.O : Rocq.Corelib.Init.Datatypes.nat
    Rocq.Corelib.Init.Datatypes.nat.S :
      Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat

上面的三行按打印内容展示类型与签名，不是可以原样粘贴编译的 inductive 命令。真正注册声明的是导入器与 Lean 内核。

构造器的翻译身份是 O → Rocq.Corelib.Init.Datatypes.nat.O、S → Rocq.Corelib.Init.Datatypes.nat.S。它们不是 Lean 原生 Nat.zero/Nat.succ 的别名。Lean 内核还生成自己的 nat.rec。

实际分派为 inductive/generated，尝试为 i[pl]，结果 TRANSLATED_AND_CHECKED，无待证条件。这里 pl 表示归纳路径 plain levels；不应与常量尝试的 Prop lift 开关混为一谈。

## 2. 导出文件怎样产生

[exports/Datatypes/Export.v](exports/Datatypes/Export.v) / [exports/Nat/Export.v](exports/Nat/Export.v) 是 MetaRocq 导出驱动。
导出器生成 source.ndjson，其中包含头部、roots、依赖声明、原生宇宙信息及源类型/正文 IR。它不是直接输出 Lean 源码。

[exports/Nat/source.ndjson](exports/Nat/source.ndjson) 包含 Init.Nat 的依赖闭包，所以能引用 Datatypes 中的同一源 nat。源端准备提取的证明条件也属于导出流程。
源 roundtrip 将 IR 重建成 Rocq 声明并交回 Rocq 内核复查，见 [RoundTrip.v](exports/Nat/source-roundtrip/RoundTrip.v) 与对应日志；这项检查不能替代 Lean 检查。

## 3. 用 add 看函数翻译

[source/Nat.v](source/Nat.v) 中：

    Fixpoint add n m :=
      match n with
      | 0 => m
      | S p => S (p + m)
      end
    where "n + m" := (add n m) : nat_scope.

[add 的完整记录](declarations/Corelib.Init.Nat.add.json) 中 source_ir.body 是 fix 节点：单个定义、rarg=0；内部是两个 lambda 和对 n 的 case。
零分支返回 m；后继分支用源构造器 S 包裹递归调用。IR 中变量使用 de Bruijn 索引，construct 用归纳块身份及构造器编号表示。

这里结构递归可用新生成的 nat.rec 表达。其 motive 让递归结果本身是“接受第二个参数的函数”，得到实际输出：

    def Rocq.Corelib.Init.Nat.add :
      Rocq.Corelib.Init.Datatypes.nat →
      Rocq.Corelib.Init.Datatypes.nat →
      Rocq.Corelib.Init.Datatypes.nat :=
    fun n m =>
      Rocq.Corelib.Init.Datatypes.nat.rec
        (motive := fun _ =>
          Rocq.Corelib.Init.Datatypes.nat →
          Rocq.Corelib.Init.Datatypes.nat)
        (fun m => m)
        (fun _ ih m => (ih m).S)
        n m

这里为了阅读省略了打印出的 universe 参数并改写了无用 binder 名；[add 逐声明页](declarations/Corelib.Init.Nat.add.md)及[原始 Nat.txt](lean/Nat.txt)保存未经此简写的打印结果。
零分支为 fun m => m；后继分支用递归结果 ih m，再调用机械构造器 S。

add 的实际 tier 记录只有 c[]，结果 TRANSLATED_AND_CHECKED，待证参数为空。空开关列表表示不需要该标签里的额外策略开关，不能解释为“没有应用翻译规则”。

## 4. 注册与检查

依赖就绪后，常量/归纳块走不同分派；目标表达式的层级求解、类型与约束检查通过后，由 Lean 内核接受。
逐项报告保存于 translation_report.json；translation_timing.json 记录尝试顺序和结果；contract.json 与 translation_manifest.json 关联本次输入/输出和消费契约。

此外还有独立 Lean consumer 与结构 audit。三个模块的 roundtrip、consumer、audit 均通过；本案例保留它们的原始结果，没有重新伪造或重新运行历史翻译。

主要实现入口见仓库 translator/Rocq2Lean/Emit.lean 的 translateSource、processInductiveCore、processConstantCore，以及 Translate.lean。原生映射注册表 Bootstrap.lean 为空。

## 5. 不同产物仍有不同限制

- [gcd](declarations/Corelib.Init.Nat.gcd.md)：PENDING_KERNEL_CHECKED，额外携带 Corelib.Init.Nat.gcd__rocq2lean_termination_1；本案例没有消去这一条件。
- Peano 中许多定理输出为命题定义；其类型通过检查，不是已迁移源证明。
- Nat 也依赖机械 bool、comparison、数字表示等。完整模块副本与导出闭包保留这些依赖，不人为把它们换成 Lean 原生类型。
- .lean 文件是导入器入口；.txt 才是本案例供人阅读的实际展开打印结果。

## 6. 翻译完成以后才连接原生 Nat

natTo / natOf 及它们的逆律、构造器对应、加法等运算对应，在单独的 correspondence 证明中建立。
例如 natTo (机械 add n m) = natTo n + natTo m。右侧才是 Lean 原生加法。
这份证明不是机械翻译的输入，也不是给 nat 特设的 bootstrap 规则。

见 [CORRESPONDENCE.md](CORRESPONDENCE.md)。[KernelExample.lean](lean/KernelExample.lean) 提供独立的机械构造器与加法内核归约演示。
