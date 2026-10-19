# SSR 包装消除与剩余陈述（第二十五批）

新增 52 个完成根：8 个类型、15 个运算、29 个完整原生陈述。当前全项目完成类别为 1407 / 2180（约 64.5%）：92 类型、519 运算、796 陈述。每项证书仍有明确的 universe 与参数适用范围。

ssrbool 的 451 根中已有 301 根完成（24 类型、59 运算、218 陈述）。剩余 150 根：128 个显式条件根、20 个未桥接根、2 个仅接口；没有剩余部分陈述。

## 为什么有些包装可以对应 Unit

manifest_simpl_pred、registered_applicative_pred、manifest_mem_pred、applicative_mem_pred、keyed_pred、keyed_qualifier 的参数已经指定目标谓词或 qualifier；它们存储的值还附有等式或逐点等价证明。因此在固定外部参数后，这些包装各自只有一个值，已证明与 Unit 的双向逆。

这里没有删除任意数据：谓词和 qualifier 仍是外部参数；逆转换重新构造指定值，并使用原字段中的等式证明往返。keyed_pred 的逐点等价经函数外延性得到函数相等。不同外部参数之间没有声称相等。

另有 qualifier n A ↔ (A → Bool) 与 pred_key A p ↔ True 的双向对应。qualifier 的 n 是固定的机械 Nat 索引；其原生目标不额外保存已由类型参数指定的索引。后续陈述中的 Nat 量词通过已有 natIso 转换。

## 15 个运算

- collective_pred_of_simpl、applicative_pred_of_simpl、rel_of_simpl：包装中的原生布尔函数。
- simpl_pred_value、applicative_pred_value、mem_pred_value：返回参数指定的谓词。
- applicative_mem_pred_value：Unit 上的 id。
- has_quality：取得 qualifier 的原生谓词。
- unkey_pred、unkey_qualifier：取得参数指定的谓词或 qualifier 的解释。
- eq_mem：原生函数相等。
- sub_mem：逐点布尔蕴含。
- mem：应用原生 Sigma 中的解释函数。

这些等式证明沿用全部源端 Type 参数和相关独立元数据 universe；没有只验证若干具体谓词。

## 29 个剩余部分陈述全部完成

28 个陈述自动完成原生化。新机制对包装量词直接构造已证明的转换引理应用，检查左端与当前表达式定义相等，再由 propext 构造等式；适配器展开与后续归一化均保留证明。这样避免了依赖包装和 universe 参数导致的普通 simp 匹配缺口。

if_arg 另给出原生 Bool 条件函数应用陈述、对应 iff，以及原机械陈述的闭合证明；不把它替换成 True。新增原陈述证明总数为 140。

进一步检查表明 locked 本身是透明定义，只依赖不透明的 master_key : unit。对只有一个构造器的 unit 消去即可证明 locked A x = x，不需要展开 master_key。新增 locked → id、master_key → Unit.unit 两个运算对应，并完成 is_true_locked_true 的原生陈述。这个单值类型论证不适用于任意 opaque 函数。

## 验证

- SSRBoolPackaging、SSRBoolRemainingStatements 通过 Lean kernel 与公理闭包检查。
- 当前 76 个验证 profile 与源码及依赖指纹一致。
- 1145 份增量覆盖证书经 70 个覆盖 profile 共同导入通过：1441 个入口、9167 个依赖声明副本。
- 本批未改变机械翻译，不增加翻译规则，没有重跑全部机械结果或旧基线证明；因打包器支持发生变化，70 个覆盖 profile 全部重新打包核验。
- .work 中的编译缓存与探测文件只留在远程。

下一步处理 128 个条件根的共享前置证明和其余数据操作。对于带载体类型的包，需要保持“载体可双向转换”和“两个包在 Lean 中相等”的区别；已有类型 Iso 不自动提供载体类型的等式。

证明与逐项结果：proofs/SSRBoolPackaging.lean、proofs/SSRBoolRemainingStatements.lean、reports/ssrbool-remaining-statement-candidates.json、reports/CERTIFICATES.md。

共同导入工具新增 opaque 支持：保留声明种类，复制并核验定义体及其依赖。fixture 证实任意 opaque Nat 仍无法用 rfl 展开，单值类型上的证明可以导入；直接新增公理及藏在 opaque body 内的新公理都被拒绝。
