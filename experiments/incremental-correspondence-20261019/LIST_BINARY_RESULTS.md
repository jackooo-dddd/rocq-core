# List 和二进制数：第十七批

新增 32 个完成根：List 1 个运算 + 2 个陈述，二进制数 29 个运算/谓词。累计 922 / 2180 个根属于完成类别；43 个增量 profile 有成功记录，651 份覆盖证书全部共同导入通过。

## List

list_compare 对应 List.compareLex，对任意比较器成立，不要求比较器构成全序；比较结果转换为 Ordering。Forall_ind 和 Forall_sind 的陈述转换为普通 List 上的归纳原则，无源符号。Lists.ListDef 的全部 10 根均有明示范围内的对应。List 参数范围为 Type u；没有新增完整 Sort 列表的原生类型声明。

## 二进制数

| 源范围 | 新根数 | 原生目标 |
|---|---:|---|
| PosDef | 9 | compare_cont、compare、eqb、leb、div2、div2_up、pred_N、Ndouble、Nsucc_double |
| NatDef | 5 | compare、leb、double、succ_double、succ_pos |
| IntDef | 15 | compare、eqb、ltb、leb、lt、gt、le、ge、max、min、double、succ_double、pred_double、div2、to_pos |

Pos.compare_cont 对应带“相等时返回指定 Ordering”的原生表达式。其余为已有原生 Nat/Int 运算及必要的边界适配组合，具体等式见证书清单。严格保留正整数截断规则：Pos.div2 对应 max 1 (n/2)，Pos.div2_up 对应 (n+1)/2；Z.to_pos 对应 max 1 z.toNat。Z.div2 对应 Lean Int 的 Euclidean /2，负奇数向负无穷方向取整。

BinaryOrder、BinaryInt 在 IntDef 的实际机械闭包上检查，没有用原生类型替换机械定义。转换类型来自既有 positive/N/Z 证书。重新证明的 succ/pred_double 等辅助引理不重复计覆盖根。所有新增运算等式对所列输入类型的全部值成立，无额外前提。

本批未解决正整数减法 mask、完整整数除法、位运算和平方根。后续将以 mask 的表示对应和减法不变量为起点。

证据：proofs/ListBridge.lean、ListStatements.lean、BinaryOrder.lean、BinaryInt.lean；reports/certificates.json 和各 profile 审计；reports/list-module-coverage.json。
