# 第三十四至三十六批：CMorphisms 与二进制按位运算

从 1621 推进到 **1651 / 2180 个去重源根**。本批新增 30 个根、32 份覆盖证书：13 个类型根、16 个运算根、1 个完整原生陈述。Pos.ldiff 和 N.ldiff 各增加一份 Mathlib API 证书，但各只计一个根。

## 第三十四批：CMorphisms 的 19 个根

| 源声明 | 结果 |
|---|---|
| Normalizes | 逐点的双向函数对：R x y → S x y，以及 S x y → R x y |
| Params | 对原生 Nat arity 参数化的 True；natOf 与已有 Nat Iso 保证覆盖所有源 arity |
| PartialApplication、apply_subrelation、normalization_done | True；保留原有命题标记的往返证明 |
| Proper、ProperProxy | R x x，保留 Type 值关系中的数据 |
| forall_def | 原生依赖函数 (x : A) → P x |
| forall_relation | (x : A) → R x (f x) (g x) |
| pointwise_relation | (x : A) → R (f x) (g x) |
| respectful | (x y : A) → R x y → S (f x) (g y) |
| respectful_hetero | 允许输入类型和输出依赖族均不同的上述关系保持函数 |
| normalizes、proper_prf、proper_proxy、proper_flip_proper | 与对应原生投影／恒等函数的等式 |
| respectful_per_obligation_1 | 用输入、输出关系的对称函数构造 respectful 关系的对称函数 |
| iff_impl_subrelation | ∀ P Q, (P ↔ Q) → P → Q；陈述 iff 与原陈述证明均已完成 |
| flip_arrow | 原来唯一的 Type-valued statement；现有类型 Iso，并另外构造原生与源端 inhabitant |

所有导出的 universe 参数显式保留。flip_arrow 的 15 个参数仍在完整证书中；它证明的是导出陈述类型的对应，不声称恢复了原始 opaque 函数的计算行为。该项的构造性 inhabitant 是 Type 中的数据，不混入 Prop 原陈述证明数。

CMorphisms 当前 **24 / 78**，剩余 54 根。若透明外层依赖 opaque_data 内部实现，仍不能仅凭外层透明就宣称运算对应。

证明：[CMorphismData.lean](proofs/CMorphismData.lean)。

## 第三十五批：positive / N 的 8 个按位运算

| 源运算 | 原生目标 |
|---|---|
| Pos.land、N.land | Nat.land / &&& |
| Pos.lor、N.lor | Nat.lor / ||| |
| Pos.lxor、N.lxor | Nat.xor / ^^^ |
| Pos.ldiff、N.ldiff | Nat.bitwise (fun a b => a && !b) |

先用 Nat.testBit 证明一个通用的 bitwise 递归等式，再按源 positive 的三个构造器归纳；N 的对应复用 positive 的证明并补零分支。源构造器计算等式均由 rfl 检查。不是复制一个原生包装函数后把相同实现计作证明。

Pos.lor 的结果仍为 positive；另外三个 Pos 运算可能为零，源结果为 N。转换函数按实际结果类型选取。无有限位宽假设。

证明：[BinaryBitwise.lean](proofs/BinaryBitwise.lean)。

## 第三十六批：Mathlib API 与负数的 3 个根

Z.land、Z.lor、Z.lxor 分别证明等于 Mathlib 的 Int.land、Int.lor、Int.xor，覆盖正数、零和负数；另外把 Pos.ldiff / N.ldiff 明确连接到 Mathlib 的 Nat.ldiff。这两项新增 API 证书不重复增加根计数。

复用当前安装的 Mathlib 提交 0df444a360eaa60ab8c11dca51a86af692955474，未安装框架。验证记录包含 Mathlib Int.Bitwise 的编译产物指纹。

四个单独检查的例子：

| 机械输入 | 转换后结果 |
|---|---:|
| Z.land (-3) 6 | 4 |
| Z.lor (-3) (-6) | -1 |
| Z.lxor (-3) 6 | -5 |
| Z.lxor (-3) (-6) | 7 |

还通过 Nat.and_comm 与已证类型 Iso 的单射性，证明机械 N.land 的交换律 binaryNat_land_comm。这是原生定理反馈到机械对象的例子；不增加 Corelib 根数量。

证明：[BinaryIntBitwise.lean](proofs/BinaryIntBitwise.lean)。

## 验证和下一步

- 三个新 profile 的 Lean 编译、公理闭包及原生目标扫描全部通过；未引入公理或 sorry。
- 当前 93 个 profile 的源码与依赖指纹对应成功验证记录；新证明实际重新编译，未重跑全部旧证明或机械翻译。
- 84 个含覆盖证书的 profile、1392 份覆盖证书共同导入通过；1877 个导出入口、12493 个复制依赖声明。数量单位不同，不能相加。
- 原陈述的独立 Prop 证明累计 200 个；条件根仍为 293 个已完成对应、38 个未完成。
- 剩余 529 根：仅接口 121、部分原生陈述 134、尚无证书 236、条件类别 38。
- 下一步继续数值除法／余数与平方根余数，以及剩余依赖消去和原生陈述。opaque_data 函数继续保留为需要源计算等式或结果刻画的任务。
