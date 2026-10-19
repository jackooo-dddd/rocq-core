# SSR 包装类型、依赖数据与条件声明（第二十三批）

新增 23 个完成根：1 个类型、20 个运算、2 个完整原生陈述。全项目当前完成类别为 1261 / 2180（70 类型、470 运算、721 陈述）；ssrfun 的 128 根中已有 124 根完成，剩余四项见下文。所有数目按去重源根统计，范围以证书完整类型为准。

## 对应结果

| 源声明 | 原生目标 |
|---|---|
| wrapped、wrap、unwrap | A、id；wrappedIso 证明双向逆，A : Type u |
| SimplFunDelta | fun x => f x x |
| Tagged、Tagged2 | PSigma.mk；第二种负载使用 PProd |
| tag、tag2 | PSigma.fst |
| tagged、tagged2、tagged2' | PSigma.snd 及负载的 PProd 投影 |
| tag_of_tag2 | PSigma (fun a => PProd (P a) (Q a)) 上的 id |
| all_pair | 将依赖函数对拆成两个依赖函数的原生表达式 |
| s2val | Subtype.val |
| of_void | Empty.elim |
| phant_id | True → True；两侧 phantom 都只有一个证明构造器 |
| pcancel、ocancel | 原生 Option 等式定义的部分取消律 |
| pcomp | Option.bind |
| tag_of_sig | fun (x : Subtype P) => PSigma.mk x.val x.property |
| sig_of_sig2 | Subtype (fun a => P a ∧ Q a) 上的 id |
| esymK、etrans_id | 原生相等证明的二次对称律、右单位传递律 |

除 wrapped 的 Type 限制外，数据适配使用完整 Sort 参数；Option 使用 Option (PLift A)。依赖投影以原生 PSigma 输入证明等式，并提供输入转换的双向逆，因此不是只证明一个特例。原生组合表达式与已有 API 在 certificates.json 的 target_class 中区分。

tag_of_sig、sig_of_sig2、esymK、etrans_id 的 5 个不同前置声明均给出闭合证明，原机械声明不变。esymK、etrans_id 还另有原陈述的独立证明，不只登记 iff。新增五个前置见证和这两个原陈述证明的公理闭包均为空。

## 四项剩余：当前产物不暴露计算等式

| 声明 | 当前形态 | 已有原生候选 |
|---|---|---|
| all_tag | opaque，无显式条件 | PSigma 依赖选择：函数取 fst，证据函数取 snd |
| all_tag2 | opaque，无显式条件 | PSigma / PProd 的依赖选择 |
| all_sig | opaque，1 个显式条件 | Subtype 依赖选择 |
| all_sig2 | opaque，4 个显式条件 | Subtype 合取谓词的依赖选择 |

这些候选尚未登记为已证明运算对应。SSRFunOpacity 读取当前编译环境并执行同步 kernel 检查：四个声明确实是 opaque、内部 body 存在，但以 rfl 证明“声明 = body”均被 kernel 以 declTypeMismatch 拒绝。当前导入环境中也没有类型直接提及这些函数的 theorem 声明。仅能读取 body，不能据此假定它与 opaque 常量相等；复制 body 成为新 def 也不构成该等式的证明。

下一步需要在独立的机械产物扩展中，为计算性 opaque 声明提供经过核验的透明实现/计算方程及其源端联系，再接这里的原生候选。不能把旧 opaque 常量直接重命名成新 def 后声称旧对应已经成立。all_sig2 还须闭合其前置证明；其依赖 all_sig，而 all_sig 的实现使用 all_tag。

## 验证

- SSRFunData、SSRFunConditions：23 份新增对应证书，Lean kernel 和公理闭包检查通过。
- SSRFunOpacity：4 个不透明计算的精确失败诊断，不增加覆盖数。
- 当前 71 个验证 profile 均匹配源码与依赖指纹。
- 当前 999 份增量覆盖证书，经 65 个覆盖 profile 重新封装，共同导入通过；1294 个入口、8015 个依赖声明副本。
- 没有重跑全部机械翻译，也没有重编译全部旧基线证明。
- 编译缓存及临时探测仅留在远程 .work。

文件：proofs/SSRFunData.lean、proofs/SSRFunConditions.lean、proofs/SSRFunOpacity.lean；逐项证书见 reports/CERTIFICATES.md；不透明诊断见 reports/ssrfun-opacity.json。
