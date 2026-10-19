# 数字表示与良基递归：第三、四批结果

本文件保留这两批完成时的计数；最新总计与条件实例化见 README.md、DEPENDENT_RESULTS.md。

本批新增 48 个去重根的 correspondence：4 个类型、36 个运算/谓词、8 个完全原生陈述。总完成数 467 → 515（37 类型 + 186 运算 + 292 完全原生陈述）。仅接口 319，尚无证书 461，部分陈述 553，带条件 331，非 Prop 特殊陈述 1。

新增覆盖证书 48 份；另有 8 份原陈述证明，不重复计根。累计增量覆盖证书 230 份。11 个 profile 有成功的 kernel/公理闭包检查及对应源码摘要；本批只重验新增/修改的 4 个 profile，沿用另外 7 个的成功记录和 45 个接口回归记录。没有重跑整套机械翻译或 Mathlib 集成。

## 数字表示与操作

| 源类型 | 原生表示 | 保留的信息 |
|---|---|---|
| Decimal.signed_int | Bool × List (Fin 10) | 符号、前导零、负零 |
| Hexadecimal.signed_int | Bool × List (Fin 16) | 符号、前导零、负零 |
| Number.uint | Sum (List (Fin 10)) (List (Fin 16)) | 进制标签及全部数字 |

已有 uint ↔ List (Fin radix) 的桥接在本批对应 profile 中复用，不重复记新类型。

Decimal、Hexadecimal 各新增 12 项运算对应：
- revapp、rev、app → reverse/append；
- nb_digits → List.length；
- nzhead → List.dropWhile；
- unorm → 去前导零后将空串规范为 [0]；
- abs、opp、app_int → 符号/数字 pair 的投影、符号翻转、拼接；
- uint_beq、signed_int_beq → 原生 List/Prod 的 BEq；
- norm → 去前导零，并把两种符号的零都规范为正零。

Nat 新增 5 项：
of_uint_acc、of_uint、of_hex_uint_acc、of_hex_uint → List.foldl（acc ↦ radix * acc + digit）；
of_num_uint → 按 Sum 进制标签选择上述 fold。

36 项新增运算中，25 项以现成 Lean API 为目标，11 项以明确的原生组合表达式为目标。类型对应另计，不把组合表达式说成同名现成 API。逐项 target_class 和完整适用范围见 certificates.json。

## 原生定理实际复用

两个数字模块各有 uint 和 signed_int 的比较健全性、完备性，共 8 个陈述：
- 比较结果为 true ⇒ 两个表示相等；
- 两个表示相等 ⇒ 比较结果为 true。

先证明源陈述与原生 BEq 陈述的 iff，再用 Lean 的 eq_of_beq 和自反比较证明原生陈述，最后经 iff 得到原陈述的证明。不是只有接口，也不是仅把原陈述包装进新的名字。

证据：proofs/DecimalOperations.lean、proofs/HexadecimalOperations.lean，及 reports/original-statement-proofs.json。
这些是先前无条件陈述的证明；尚未据此实例化并消除 eq_dec 等声明的显式义务，331 项带条件计数保持不变。

## 已证边界

- 数字串到 Nat 的读取不是单射：空串与一位零都读成零。两个进制分别有反例定理。
- del_head 1 Nil 返回一位零；List.drop 1 [] 返回空列表。两个进制分别有不相等证明。del_head/del_tail 因而尚未登记为 List.drop/take 的无条件对应。
- signed_int 与 Bool × digits 的 Iso 保留负零，不能替换成 signed_int ↔ Int 的双向逆。
- Hexadecimal.hexadecimal 的指数使用 Decimal.signed_int；后续表示桥接必须保留这个跨进制依赖。

这些边界是已证明的语义差异，不是翻译失败，也不表示不存在其他恰当目标。

## 良基递归

- Acc A R x ↔ Lean Acc R x：双向转换与逆律。
- well_founded A R ↔ WellFounded R。
- Fix_F、Fix → WellFounded.fixF、WellFounded.fix。
- Acc_rect、Acc_rec → Acc.rec；注册的是接受原生回调的版本，前驱可达性证明在边界转换。
- well_founded_induction_type、well_founded_induction → WellFounded.fix。

A 的范围是 Type u；递归结果按源签名为 Type v，Acc_rec 和非 type 后缀版本为 Type。没有额外假设 well-foundedness 成立：原 API 要求的证明显式传入并转换。

两个使用例不计 Corelib 根：
1. 用 Lean 的 InvImage.wf 和 natTo 为机械 Nat 上的度量关系构造源端 well_founded 证明；
2. 把原生 Nat 的良基性传给机械 Fix，复用原生递归正确性证明，得到倒计数函数结果等于输入。

证据：proofs/WellFounded.lean。以上不代表已经完成任意载体/依赖 motive 的自动转换。

## 接下来

1. 数字 Little.succ 与进位语义 → to_little_uint/to_little_hex_uint → to_uint/to_hex_uint 及读写性质。
2. 精确刻画 del_head 超出长度时的行为，再处理 del_tail；不强套 List.drop。
3. prodIso 与 Acc 转换 → Fix_F_2、well_founded_induction_type_2。
4. Sigma/Subtype 与 Eq transport；再把新证书用于剩余陈述。
5. 检查已证比较性质能否构造具体 eq_dec 义务；只有实际实例化、验证并更新产物后才减少带条件计数。

完整计划仍未完成；统一导入和 Mathlib 组合测试仍待进行。
