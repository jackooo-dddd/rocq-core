# 第六十六至七十批：数组与字节串规格完成

新增 **23 个去重根、24 份覆盖证书**，1927 → **1950 / 2180**。ArrayAxioms **11/11**、PrimStringAxioms **12/12** 完成。三个字节串定义归为运算对应；20 项规格既有完整原生陈述对应，也有独立的机械原陈述证明。

## 数组

[ArraySpecs.lean](proofs/ArraySpecs.lean) 保持“有界长度、Vector 内容、默认元素”的表示，覆盖默认值、复制、读取、更新、重复构造、容量和外延性。

- get_out_of_bounds：越界返回默认元素。
- get_set_same / get_set_other：有效位置更新后读回；其他位置保持不变。
- length_make：长度取 min n 4194303；default_set / length_set 保持默认值和长度。
- array_ext：相同长度、每个有效位置相等以及默认值相等，推出数组相等。默认值不可省略，即使有效元素完全相同，越界观察仍可能不同。

所有元素类型 universe 保留；没有只证明 Nat 数组的特例。

## 字节串定义与规格

[StringUnsignedSupport.lean](proofs/StringUnsignedSupport.lean) 在本模块闭包重新检查 Z / unary nat / 63 位索引的转换，避免混用其他机械闭包中的同名类型。

[StringOperations.lean](proofs/StringOperations.lean) 的三个新增运算对应：

| 源声明 | 原生目标 |
|---|---|
| char63_valid | c.toNat < 256 |
| to_list | 有界 Vector 的 toList，再把每个 BitVec 8 零扩展到 BitVec 63 |
| of_list | List.foldr，依次重复构造一个字节并拼接，保持容量截断 |

[StringSpecs.lean](proofs/StringSpecs.lean) 证明读取、长度、重复构造、截取、字符有效性和最大长度。读取越界返回 0；make 将字符截成低 8 位，长度截到 16777211；sub 保留 offset 超界时返回空串的行为。

[StringRoundtrip.lean](proofs/StringRoundtrip.lean) 证明拼接等于列表拼接后 take 16777211，并证明 of_list (to_list s) = s。先证明原生 toWords 单射，再证明 ofWords 的列表内容，最后显式还原机械 Eq。任意字节均保留，包括 NUL；不把它替换成 Unicode String。

[StringComparison.lean](proofs/StringComparison.lean) 证明逐字节比较等于 Lean 的 List.compareLex。相同前缀按长度排序，空串也包括在内。另为已覆盖 PrimString.compare 添加直达现成 List.compareLex 的运算证书，不重复增加源根。

## 验证与总量

154 类型根、798 运算根、998 完全原生陈述，共 **1950**。剩余 **230**：22 仅接口、30 部分陈述、161 尚无证书、17 条件根。独立原陈述证明共 312。

134 个增量 profile 验证成功。120 个覆盖 profile、1698 份证书共同导入；2316 个入口、19997 个复制声明，复制数不增加覆盖数。原生目标递归检查无残留源符号；新证明均经过公理闭包和 Lean kernel 检查。

未重跑冻结基线或机械翻译。机械 nat/eq 仍是独立归纳定义；编译产物、探测脚本和临时日志只留远程 .work。下一步处理基础标记、决策辅助和关系类，再推进较大的 CMorphisms 与浮点缺口。
