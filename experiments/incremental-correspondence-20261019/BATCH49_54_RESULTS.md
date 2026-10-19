# 第四十九至五十四批：良基递归与 SSR 重写接口

新增 **76 个去重根、76 份覆盖证书**，从 1795 推进到 **1871 / 2180**。

| 批次 | 新根 | 当前模块结果 |
|---|---:|---|
| 49：WellFoundedStatements | 11 | Init.Wf 21/21 |
| 50：ProgramWellFounded | 10 | Program.Wf 10/12 |
| 51：SSRRewriteData | 32 | 包装类型、投影、任意元数合同性谓词 |
| 52：SSRRewriteStatements | 12 | ssreflect_rw 合计 52/55 |
| 53：SSRClasses | 4 | ssrclasses 4/4 |
| 54：SSRUnder | 7 | ssrunder 7/7 |

## 良基递归

[WellFoundedStatements.lean](proofs/WellFoundedStatements.lean) 为 Acc 的归纳、逆向可达性、Fix_F 展开和证明无关性、Fix 展开给出完整原生陈述。原生目标使用 Lean Acc、WellFounded.fixF / fix。每项既有 iff，也有独立的源陈述证明。原声明中显式的外延性假设与 universe 参数仍保留。

Acc_inv_dep 的抽取条件通过源 Acc_intro 直接构造，随后证明依赖归纳陈述；该根不再带未闭合条件。

[ProgramWellFounded.lean](proofs/ProgramWellFounded.lean) 用原生 Subtype 表示递归的较小输入，将其递归调用交给 WellFounded.fixF / fix。sourceStep / nativeStep 两个回调适配器证明互为逆，因此源子类型参数没有被藏进原生目标。MR 对应 InvImage，measure_wf 对应 InvImage.wf。

该模块 8 个条件根已闭合并完成对应，另有 MR 和 measure_wf。剩余 Fix_F_sub_rect / Fix_sub_rect 都是 opaque_data，返回任意 Type 值：目前没有足够的计算等式证明它们等于指定原生实现。仅从函数签名猜测递归行为不计作完成。

## SSR 重写基础设施

[SSRRewriteData.lean](proofs/SSRRewriteData.lean) 的 32 根覆盖：

- NonPropType 的 call/test 数据及投影；Type 载荷对应原生 Type，测试标记对应 Unit。
- TheCanonical.put、phant、phantom 对应 True；其取值函数对应原生 id。
- external_view 对应 Type，依赖消去器对应直接函数应用。
- abstract_lock 对应 Unit；abstract、argumentType、returnType、dependentReturnType 保留它们实际选择的原生类型。
- unlockable 保留完整 Sort 载荷范围，证明其与 Unit 的双向逆；unlocked 返回它所证明相等的值。
- nary_congruence_statement 对应 Nat 上递归定义的无源符号谓词，对任意 arity 和 continuation k 证明 iff。机械 Eq 在每一层都通过已经证明的对应替换为 Lean Eq。

[SSRRewriteStatements.lean](proofs/SSRRewriteStatements.lean) 新增 10 个完整原生陈述和 2 个条件运算。任意元数合同性由自然数归纳证明；master_key 虽不透明，但其 Unit 类型只有一个值，锁定／解锁等式可严格证明。ssr_converse 对应 PProd True R，保留完整 Sort 参数及显式逆映射。

ssreflect_rw 剩余 3 根是 abstract_context、ssr_congr_arrow、ssr_have_upoly，均是任意 Type 值的不透明计算。它们与唯一值的 master_key 情形不同，尚未证明原生计算结果。

[SSRClasses.lean](proofs/SSRClasses.lean) 将自反性对应到 Lean Std.Refl，原生 Eq / Iff 的实例及 reflexivity 陈述均独立证明。[SSRUnder.lean](proofs/SSRUnder.lean) 保留实际关系 R，Under / Over 对应 id R，并证明相关方程和反身性陈述。

## 统计与验证

当前：154 类型根、771 运算根、946 完整原生陈述，共 1871。其余 41 只有接口、82 部分陈述、169 尚无证书、17 条件根尚未完成，共 309。原陈述独立证明从 224 增到 260。

机械导出仍有 331 个显式条件根；correspondence 层已闭合并完成其中 314 个，剩余 17。没有改动机械翻译器或用新公理填补证明。

113 个增量 profile 有当前验证记录。104 个覆盖 profile 的 1615 份证书共同导入通过，包含原陈述证明和包装函数共 2181 个入口，复制 16091 个依赖声明；入口／副本数量不等于去重源根数量。公理闭包和原生目标源符号检查通过。编译产物仍只留在远程 .work。

下一步推进 Uint63Axioms / Sint63Axioms 的原生数值运算和规格陈述，复用 BitVec、机械 Z/N/nat 的对应；浮点和 opaque 计算缺口另列，不能混作已经找到现成 API。
