目标 Lean 接口的 universe 复杂度

统计来源：最终 main75 全量运行的目标 AST；2180个原始根，另排除原生 Nat/Eq 两个 bootstrap 项，参数分布统计2178个生成根。额外 quality 分支不当作新根重复计数。陈述取其命题正文，定义取类型，归纳类型还检查构造器类型。

| 宇宙参数个数 | 根声明数 |
|---|---:|
| 0 | 948 |
| 1 | 625 |
| 2–3 | 519 |
| 4及以上 | 86 |

2092/2178≈96.05%最多3个参数；1230项带至少一个参数，最多16个。
227项接口显式包含max/imax；29项接口显式包含PULift；49项的类型或正文中显式出现PULift。26项报告非平凡局部宇宙解释，66项报告level copies。各项会重叠，不能相加。
这里只数显式语法，不展开透明别名，所以29不是“所有可能经依赖遇到PULift的声明”的数量。

复杂实例：
- CMorphisms.compose_proper：16个参数，源Rocq显式多态context也有16个；目标本项接口没有显式max/PULift。
- CMorphisms.respectful_morphism：16个参数，源端也有16个；目标局部解释产生嵌套max，接口包含PULift。
- CMorphisms.PartialOrder_StrictOrder：6个参数，接口含PULift；仍有两个显式待证条件。
- 29个显式PULift接口都出现在Classes的RelationClasses/CRelationClasses/CMorphisms，详见JSON筛选。

判断：已经通过源端原生事实、公共接口、独立结构审计与Lean内核检查；不能把“复杂”称为“宇宙不合法”。但可用性确实不完全等同手写Lean。尤其PULift改变了表示，需要up/down或桥接，而max参数化增加了签名阅读成本。v_0/u_Corelib_...是稳定的机械命名，不是友好的公开API命名。

Lean可以从很多实参推断宇宙，但不保证每项都无需显式实例：幽灵参数、复杂依赖和提升表示可能需要注解。现有native clients已实证若干高风险接口和基础Nat/List互操作；尚未对2180项分别写完整手工用户程序。零阻塞不等于全部接口已具备理想交互体验。

适合后续API整理的是语义化参数命名、可证明冗余的max表达式归一化、经过核查的表示转换封装。不得把独立宇宙强行并成一个，或用固定Type 0隐藏问题；也不能把PULift包装的值无证明地当成原类型。
