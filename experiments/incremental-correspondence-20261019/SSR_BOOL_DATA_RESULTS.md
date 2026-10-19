# SSR Bool：谓词包装、逻辑数据和陈述（第二十四批）

本批新增 94 个完成根：14 个类型、34 个运算、46 个完整原生陈述。全项目当前完成类别为 1355 / 2180（约 62.2%）：84 类型、504 运算、767 陈述。所有计数按去重源根统计；每个证书的适用范围见完整类型。

ssrbool 模块共有 451 根，本批后完成 251 根（16 类型、46 运算、189 陈述）。其余 200 根分别为 128 个带显式条件、41 个未桥接、29 个部分陈述和 2 个仅接口；它们没有混入完成数。

## 类型对应

| 源类型 | 原生表示 |
|---|---|
| simpl_pred、mem_pred、collective_pred、applicative_pred | A → Bool |
| simpl_rel | A → A → Bool |
| predArgType | Type u |
| predType | Sigma (fun S : Type u => S → A → Bool) |
| implies | P → Q；P、Q 保留独立 Sort 参数 |
| decidable | Decidable P |
| and3、and4、and5 | 原生 And 的右结合嵌套 |
| or3、or4 | 原生 Or 的右结合嵌套 |

全部提供双向逆。predType 保留载体 S 与其解释函数，并非擦除封装只剩一个谓词。pred/simpl_pred/mem_pred 等沿用源声明的 Type 参数范围，不声称覆盖源声明本来不支持的任意 Sort。

## 运算对应

34 个运算包括：
- SimplPred、SimplRel、fun_of_pred、fun_of_rel 及谓词/成员包装的投影。
- pred0、predT、predI、predU、predC、predD：常布尔函数以及逐点 and/or/not。
- preim、relpre、relU：原生函数组合、关系拉回、逐点析取。
- pred_oapp：Option.any。
- pred_sort、topred：原生 Sigma 的载体和解释函数投影。
- and3/4/5 的 rec/rect：把分支函数应用到原生合取的各个证明参数；rec 返回 Type，rect 返回 Sort u。
- pre_symmetric、left_transitive、right_transitive、equivalence_rel：保留定义次序和参数的原生布尔关系性质。
- unless P Q ↔ Nonempty P ∨ Nonempty Q。
- classically P ↔ ¬¬ Nonempty P。

最后两项对 Sort 参数成立，证明不使用经典选择。classically 的本批目标保留双重否定；不以名字相近为由直接将其改成 P。

目标中的 Function.comp、Option.any、Sigma 投影、id 等与自定义原生组合表达式在 certificates.json 中分别标明。类型可互转不自动代表任意上层函数已经等于某个 Mathlib API。

## 46 个陈述升级

对剩余 75 个部分陈述重新归一化，46 个得到完全不含源端符号的目标。包括 and/or 的归纳陈述、布尔分配律、classicP/W/bind/ex/imply、部分同态/单态组合与关系性质。

归一化组合已证明的 iff 和转换规则，必要时继续处理新暴露的子表达式，每步保留等式证明。目标检查递归展开 NativeBridge 别名，最终 iff 由 Lean kernel 检查。29 个仍含源符号的候选仅记作部分陈述，没有提升覆盖。

本批没有增加独立业务定理证明；上述 46 项是陈述 iff。原有 139 份新增原陈述证明数量不变。

## 验证与后续依赖

三个新增 profile 均通过：SSRBoolData、SSRBoolLogic、SSRBoolExtendedStatements。当前 74 个验证 profile 匹配源码和依赖；1093 份增量覆盖证书经 68 个覆盖 profile 共同导入通过，1388 个入口、8655 个依赖声明副本。没有重跑全部机械翻译或全部旧基线证明。

下一步依赖为：manifest/keyed 包装的无损表示 → mem / prop_in / prop_on 的原生化 → 剩余 29 个部分陈述；另按共享依赖处理 128 个条件根。impliesP 等计算性 opaque 声明与上一批四个 ssrfun 函数有同类计算等式问题，不能只凭读取内部 body 就记为完成。

入口：
- proofs/SSRBoolData.lean、proofs/SSRBoolLogic.lean
- proofs/SSRBoolExtendedStatements.lean
- ssrbool-extended-statement-selection.json
- reports/ssrbool-extended-statement-candidates.json
- reports/CERTIFICATES.md 与 reports/CORELIB_LEDGER.csv
