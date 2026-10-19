# Datatypes 对应：第十九批

Init.Datatypes 的 110 个根均已获得明示范围内对应：14 类型、54 运算/谓词、42 完全原生陈述。本批新增 48 个完成根（2 类型、9 运算、37 陈述），以及 4 份既有类型根的补充证书。全项目完成类别 985 / 2180；51 个增量 profile 当前检查通过，718 份覆盖证书共同导入通过。

## 完整 Sort 的容器类型

Rocq 的 List/Option/Result 可接受 Sort 参数，而 Lean List/Option/Except 的元素参数为 Type。本批建立 List (PLift A)、Option (PLift A)、Except (PLift E) (PLift A) 的双向逆，覆盖任意 Sort 参数。PLift 只出现在 correspondence 的原生表示层；没有修改机械翻译，也没有重新启用机械翻译器的 ULift 规则。

当 A/E 是 Type 时，移除 PLift 包装后的结果，已证明恰好等于旧 List A / Option A / Except E A 转换。原先的原生 API 使用方式仍有效。此次完整 Sort 扩展覆盖新类型对应和新陈述；旧容器运算证书原有的 Type 参数范围没有被自动扩大。

## 比较规格与反射

BoolSpec、CompareSpec、CompSpec 对应由 Bool/Ordering 选择的普通命题。CompareSpecT、CompSpecT 与携带该命题证明的 PLift 建立 Iso。reflect 补充固定 Bool 索引下的同类 Iso。四项 rec/rect 对应原生 Bool/Ordering 和 PLift 的分支消去，分别记录 Type / Sort motive 范围。

两个 CompareSpec2Type 转换共同使用 3 个闭合义务证明，全部已实例化。原始机械产物依然含显式条件；correspondence 层闭合根增至 18，剩余 313。17 个独立义务见证中 16 个公理闭包为空，另 1 个是既有 gcd 的标准 Lean 公理见证。条件输入记录现在明确区分 source IR 与 translation report 哈希，并逐项核对实际 pending 元数据。

## 37 个原生陈述

包括 Bool、比较、列表、Option、积/和、Result、Unit/Empty 的归纳陈述，比较规格、reflect 的带证明参数归纳陈述，以及依赖等式对 pair 的搬运。不是把陈述替换成 True：先证明类型/索引/依赖函数的转换，再由已证 iff 规则生成对应原生陈述。

simp 不遍历某些证明实参，因此专用规范化器仅在以下条件同时满足时，用局部原生证明替换含源符号的证明项：二者都是证明、命题类型不含源符号、命题类型定义相等、证明项定义相等；最后检查整个陈述定义相等。这个步骤使用 Lean 的证明无关性，生成的 iff 仍经 kernel 检查。最终目标递归展开 NativeBridge 别名后均无源符号。

本批 37 个是陈述等价证书，不增加原业务定理证明计数；新增原陈述证明累计仍为 43。

证据入口：reports/datatype-module-coverage.json、reports/datatype-statement-candidates.json、reports/certificates.json；证明文件 DatatypeNormalization/DatatypeQuantifiers/DatatypeStatements/DatatypeSpecs.lean。
