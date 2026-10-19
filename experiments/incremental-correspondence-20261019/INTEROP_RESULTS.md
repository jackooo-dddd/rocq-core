# 跨模块导入与 Mathlib 消费结果

P7 首批验收通过。36 个含增量覆盖证书的 profile，共 613 份覆盖证书，连同原陈述证明和闭合包装函数，共 664 个导出入口，已在同一 Lean 文件中导入并审计。重新复制的依赖声明共 3915 个；这些重复副本不增加 correspondence 覆盖数量。

## 具体可以怎样使用

`interop/Consumer.lean` 同时使用三个原来不能直接并存导入的机械闭包：

- Init.Nat 的机械 Nat、加法及其对应证明；
- SSR 的机械 Option.map，容器元素使用前一个模块的机械 Nat；
- Setoid_Theory 与 Lean Equivalence 的转换，用于原生 Setoid / Quotient。

已证明转换后的 Option.map 等于原生加一 map，并把结果放进原生 Quotient；另证明机械加法转换结果可用 Nat.add_comm。Mathlib 消费例用现成的 `Nat.prime_two` 证明机械 `1 + 1` 转换结果为素数。

Lean 版本 4.33.1。复用远程已安装的 Mathlib，提交为 `0df444a360eaa60ab8c11dca51a86af692955474`；无新安装。实际验证包括上述四份消费证明，以及 NumericMathlib 中七个打印函数到 Nat.digits 的对应，不代表整个 Mathlib 均已兼容。

## 实现和边界

原 profile 都引用名为 Rocq2LeanOut 的不同模块，并有重复的 NativeBridge 名称。ProfilePack 从已编译环境读取指定证书的依赖闭包，在独立命名空间重新建立声明；每个声明再次经过 Lean kernel。保持 universe 参数、定义体、证明体和结构投影信息，不修改原始机械翻译，不把 Nat/Eq 映射成原生类型。

每个 profile 的机械类型仍有独立身份；这是带命名空间的共同导入。跨闭包通过已证明的原生接口组合，尚未把所有机械类型合成单一规范命名空间。打包器也未生成计算用的 native code，当前验收是证明消费，不是运行性能。

目前显式拒绝新增公理、不安全声明、opaque 声明、嵌套归纳组和有继承字段的结构。现有 613 份覆盖证书的闭包无需这些未支持分支。负向 fixture 证实新公理不能进入输出。允许的公理闭包仅 propext、Quot.sound、Classical.choice；实际各入口闭包在 JSON 中逐项列出。

## 文件与复现

- `interop/ProfilePack.lean`：声明复制及 kernel / 公理检查。
- `interop/pack_all.py`：选取增量覆盖清单及附加证明入口。
- `interop/check_all.py`：一次性导入所有 PackedAll 模块，检查入口及公理。
- `interop/pack_profiles.py`、`check_consumer.py`：三个独立模块及 Mathlib 消费例。
- `interop/check_rejection.py`：新公理拒绝测试。
- `reports/interop/all/import-all-validation.json`：共同导入证据。
- `reports/interop/coverage-manifest.json`：本次 613 份覆盖证书的固定清单。
- `reports/interop/consumer-validation.json`：实际 Mathlib 提交、工具链和消费结果。

在工作区依次执行 pack_all.py、check_all.py，以及 pack_profiles.py、check_consumer.py、check_rejection.py。编译缓存和生成的打包源码位于 .work/interop，仅远程保存。脚本需要先完成原 profile 编译；它们不下载依赖。

更新：当前共同导入快照已包含全部 613 份增量覆盖证书，包括 Specif、数字写出/读取、Mathlib digits、gcd、divmod、sqrt/log2。Registry 是机制验证模块，不产生覆盖根，所以 37 个验证 profile 对应 36 个覆盖模块。

NumericMathlib 的打包模块显式导入 Mathlib.Data.Nat.Digits.Defs，保留原生 Mathlib 常量身份；NatIterators 导入对应 Init 算术引理。pack_all.py 可传 profile 名，仅重建改变的模块；继承部分逐项核对源码、打包器和证书入口集合，最后仍执行全部模块的共同导入检查。

Peano 扩展后：38 个含覆盖证书的 profile、619 份覆盖证书共同导入通过。实际入口和依赖副本数见 reports/interop/all/import-all-validation.json。
