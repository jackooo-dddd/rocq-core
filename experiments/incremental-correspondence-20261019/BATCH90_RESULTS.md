# 第九十批：SSR predicate package 值

新增 5 个去重根，冻结基线达到 **2100/2180**：164 类型、908 运算、1028 完整原生陈述；独立原陈述证明仍为 318。

证明：[SSRPredicatePackages.lean](proofs/SSRPredicatePackages.lean)。

| 源声明 | 原生结果 |
|---|---|
| boolfunPredType | 承载类型沿 predicateIso 转换后为 (A → Bool, id) |
| predPredType | 同上 |
| memPredType | 承载类型沿 memIso 转换后为 (A → Bool, id) |
| simplPredType | 承载类型沿 simplPredIso 转换后为 (A → Bool, id) |
| clone_pred | (U, fun x => predTo (toP x)) |

前四项用 rebase 明确给出承载类型的双向逆，并证明运输后的 package 等式。该证明保留谓词可计算字段；没有使用 univalence，也没有断言原始两个载体类型相等。clone 保留原始 universes、phant_id 以及全部参数。

166 个验证 profile 通过；145 个覆盖 profile、1848 份增量证书共同导入通过，2472 个入口、26507 个依赖副本。公理闭包与目标无残留源符号检查通过。

剩余 80 根：57 尚无证书、6 仅接口、17 条件类别；部分陈述 0。audit_remaining.py 在各模块实际环境检查，发现 69 个 opaque 根和 11 个透明包装；80 个根均非 Prop，正文均保留。并非正文不存在，而是原常量不提供可展开计算等式。接下来的透明正文实验另行统计。
