# 跨模块导入与 Mathlib 消费结果

当前共同导入验收通过：84 个含增量覆盖证书的 profile、1392 份覆盖证书，连同原陈述证明和闭合包装函数，共 1877 个导出入口，在同一 Lean 文件中导入并审计。复制依赖声明 12493 个；这些副本不增加 correspondence 覆盖数量。

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

目前显式拒绝新增公理、不安全声明、嵌套归纳组和有继承字段的结构。opaque 声明以原有种类复制，其定义体和依赖同样核验；不将它改成透明 def。负向 fixture 证实新公理不能进入输出。允许的公理闭包仅 propext、Quot.sound、Classical.choice；实际各入口闭包在 JSON 中逐项列出。

## 文件与复现

- `interop/ProfilePack.lean`：声明复制及 kernel / 公理检查。
- `interop/pack_all.py`：选取增量覆盖清单及附加证明入口。
- `interop/check_all.py`：一次性导入所有 PackedAll 模块，检查入口及公理。
- `interop/pack_profiles.py`、`check_consumer.py`：三个独立模块及 Mathlib 消费例。
- `interop/check_rejection.py`：新公理拒绝测试。
- `reports/interop/all/import-all-validation.json`：共同导入证据。
- `reports/interop/coverage-manifest.json`：当前 1353 份覆盖证书的固定清单。
- `reports/interop/consumer-validation.json`：实际 Mathlib 提交、工具链和消费结果。

在工作区依次执行 pack_all.py、check_all.py，以及 pack_profiles.py、check_consumer.py、check_rejection.py。编译缓存和生成的打包源码位于 .work/interop，仅远程保存。脚本需要先完成原 profile 编译；它们不下载依赖。

第十五批历史快照包含当时全部 613 份增量覆盖证书，包括 Specif、数字写出/读取、Mathlib digits、gcd、divmod、sqrt/log2。Registry 是机制验证模块，不产生覆盖根，所以 37 个验证 profile 对应 36 个覆盖模块。

NumericMathlib 的打包模块显式导入 Mathlib.Data.Nat.Digits.Defs，保留原生 Mathlib 常量身份；NatIterators 导入对应 Init 算术引理。pack_all.py 可传 profile 名，仅重建改变的模块；继承部分逐项核对源码、打包器和证书入口集合，最后仍执行全部模块的共同导入检查。

Peano 扩展后：38 个含覆盖证书的 profile、619 份覆盖证书共同导入通过。实际入口和依赖副本数见 reports/interop/all/import-all-validation.json。

第十七批扩展后：42 个包含覆盖证书的 profile、651 份覆盖证书共同导入通过；对应全部当前增量覆盖。

第十八批扩展后：46 个包含覆盖证书的 profile、666 份覆盖证书全部共同导入通过。

第十九批扩展后：49 个包含覆盖证书的 profile、718 份覆盖证书共同导入通过。DatatypeQuantifiers 和 Registry 是无独立覆盖条目的验证模块，所需依赖随证书闭包封装。

第二十批扩展后：54 个包含覆盖证书的 profile、812 份覆盖证书共同导入通过。LogicWitnesses 是共享证明依赖模块，其证明随用户证书的依赖闭包封装，不单独增加覆盖根。

第二十一批扩展后：58 个包含覆盖证书的 profile、892 份覆盖证书共同导入通过。新增 SpecifOperations、SpecifChoice、SpecifEqualityElimination、SpecifClosedStatements；共享见证及归一化模块随依赖闭包纳入。当前清单与 certificates.json 一致，coimport_not_current_coverage=false。

第二十二批扩展后：63 个覆盖 profile、976 份覆盖证书共同导入通过，1265 个入口、7828 个依赖声明副本。新增 SSRFunNormalization、SSRFunPredicates、SSRFunOption、SSRNonProp、SSRFunStatements。

第二十三批扩展后：65 个覆盖 profile、999 份覆盖证书共同导入通过，1294 个入口、8015 个依赖声明副本。SSRFunOpacity 只作诊断，不产生覆盖入口。

第二十四批扩展后：68 个覆盖 profile、1093 份覆盖证书共同导入通过，1388 个入口、8655 个依赖声明副本。新增 SSRBoolData、SSRBoolLogic、SSRBoolExtendedStatements。

第二十五批扩展后：70 个覆盖 profile、1145 份覆盖证书共同导入通过，1441 个入口、9167 个依赖声明副本。新增 SSRBoolPackaging、SSRBoolRemainingStatements。

opaque 支持的独立验证见 interop/check_opaque.py 与 reports/interop/opaque-preservation.json：种类保留，任意 opaque Nat 的 body 等式被同步 kernel 拒绝，unit 单值证明可用。check_rejection.py 同时验证直接新公理和 opaque body 中的新公理都被拒绝。

第二十六批扩展后：72 个覆盖 profile、1228 份覆盖证书共同导入通过，1650 个入口、10315 个依赖副本。新增 SSRBoolClosedStatements、SSRBoolClosedOperations。

第二十七批扩展后：74 个覆盖 profile、1264 份覆盖证书共同导入通过，1722 个入口、11260 个依赖副本。新增 SSRBoolReflection、SSRBoolProofFunctions，opaque 函数保持原种类。

第二十八至三十一批扩展后：新增 SSRBoolIndexed、SSRBoolRestrictions、BinaryPower、SumboolBridge、CRelationData；79 个覆盖 profile、1336 份证书共同导入通过，1803 个入口、11977 个依赖副本。新证明的原生目标不残留源符号。旧 Mathlib 消费例本轮未重跑；共同导入检查仍包含 Mathlib 模块。

第三十二批扩展后：新增 CRelationStatements；80 个覆盖 profile、1353 份证书共同导入，1835 个入口、12111 个依赖副本。

第三十三批加入 CRelationOrder 后，81 个覆盖 profile、1360 份证书共同导入通过；1844 个导出入口、12229 个依赖声明。新增目标涵盖保留 Type 数据的偏序表示，以及 Lean Equivalence Eq/Iff。该批共同导入包括既有 Mathlib 导入检查，未重跑旧消费例。

第三十四至三十六批：新增 CMorphismData、BinaryBitwise、BinaryIntBitwise。后者实际导入 Mathlib.Data.Int.Bitwise，证明 Z.land/lor/lxor 与现成 Int API 对应，另有四个负数例子；通过 Nat.and_comm 证明机械 N.land 的交换律。共同导入为 84 个覆盖 profile、1392 份证书。编译使用相同 Mathlib 提交；旧消费例未在本批重新编译。新例子与交换律在原 profile 中检查，未额外注册为 Corelib 覆盖根。
