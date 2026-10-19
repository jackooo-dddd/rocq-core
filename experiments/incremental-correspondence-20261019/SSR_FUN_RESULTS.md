# SSR 函数谓词与陈述原生化

本批新增 **79 个完成根**：27 个谓词、50 个完整原生陈述、2 个类型对应。另为已完成的 5 个 SSR Option 运算补充完整 Sort 参数的证明，不重复增加完成根。本批共新增 84 份覆盖证书。

ssrfun 的 128 根中，目前 101 根属于完成类别：2 类型、44 运算、55 完全原生陈述；仍有 27 根待处理（11 只有接口、10 尚无证书、6 带条件）。本批另一个新类型根 NonPropType.type 属于 ssreflect_rw。

**27 个谓词**

同态、运算保持、分配律、交换律、左右逆、左右消去、左右零元、幂等性、二元单射等，均转成只含 Lean 原生类型变量、函数应用、Eq、量词、蕴含及 And 的谓词。逐项完整表达式见 [谓词结果](reports/ssrfun-predicate-candidates.json)。

#ssr_predicate 对指定的透明谓词读取实际定义体，实例化参数后使用已证 iff 归一化，生成原生函数及逐点 iff。原生函数体和参数类型均检查源符号，证书由 kernel 接受。这覆盖当前 27 个谓词的自动目标生成，不代表任意计算函数的原生目标自动合成。它们归入“原生组合表达式”，没有冒充同名 Mathlib API。

**2 个类型对应**

| 源类型／命题 | 原生对应 | 范围 |
|---|---|---|
| ssrfun.bijective A B f | 存在逆函数 g，并满足两边的取消律 | A、B : Type；命题 Iso 的两个方向均证明；不是任意函数都双射 |
| ssreflect_rw.NonPropType.type | Bool × Type u | 保留布尔元数据以及载体类型；两个逆律均证明 |

NonPropType 不能在保持双向逆的同时简单丢掉布尔字段。本批保留该字段；Some_inj 的陈述随后在这个原生表示上归一化。

**Option 与 50 个陈述**

原有 Option 运算证书主要覆盖 Type 参数。源导出允许 Sort 参数，因此本批使用 Option (PLift A)：
- map、bind、apply、default、lift 分别对应原生 Option.map、bind、elim、getD、some，载荷的 PLift.up/down 显式出现。
- 量词和返回 Option 的函数参数通过双向转换搬运；函数相等先化为逐点相等。
- 转换与 Option.elim 的交换引理使同一规则覆盖多个陈述。
- 源 Sum 对应 PSum；sig/sig2 的量词和投影使用 Subtype；unit 使用 Unit。
- 空域上的全称命题可化为 True，依据 Empty_set 没有构造器的通用证明；没有把任意源定理替换成 True。

选取的 50 个原部分陈述均得到无源符号的原生目标和 kernel 检查的 iff，见 [逐陈述结果](reports/ssrfun-statement-candidates.json)。这是陈述对应；本批没有新增这 50 个业务定理的独立证明，也没有关闭剩余 6 个条件根。

**文件与验证**

- proofs/SSRFunNormalization.lean：bijective、逻辑、Subtype、Sum 与 unit 的对应。
- proofs/SSRFunPredicates.lean、ssrfun-predicate-command.lean.inc：谓词目标生成和证明。
- proofs/SSRFunOption.lean：完整 Sort 的 Option 桥接与原生 API 等式。
- proofs/SSRNonProp.lean：NonPropType 的无损表示。
- proofs/SSRFunStatements.lean：50 个陈述的归一化及 iff。
- reports/ssrfun-module-coverage.json：模块分类与剩余 27 根。

复查这批时执行 verify.py SSRFunNormalization SSRFunPredicates SSRFunOption SSRNonProp SSRFunStatements，再运行 make_report.py、对应五个 profile 的 interop/pack_all.py、interop/check_all.py 和 make_report.py。复用原 pinned Lean 和机械快照，不安装依赖，不重跑整个旧基线。临时探测和构建文件留在远程 .work。

当前全项目完成类别为 **1238 / 2180**：69 类型、450 运算、719 完全原生陈述。本批之后仍需继续处理剩余包装类型、条件义务和其它模块。

本批共同导入通过：63 个覆盖 profile 中的全部 976 份当前覆盖证书；全工作区 68 个验证 profile 有与源码和依赖一致的成功记录。
