# CRelationClasses 陈述对应：第三十二批

新增 **17 个根**：1 个类型、1 个运算、15 个完全原生陈述。累计 **1614 / 2180**，CRelationClasses 当前 **63 / 81**。

[证明源码](proofs/CRelationStatements.lean) 复用 CRelationData 的类型桥接：

- StrictOrder 对应 PLift 包装的原生反自反性证明，与 Type 值传递函数的乘积；保留传递函数的计算数据。
- StrictOrder_Transitive 对应原生记录的第二投影。
- 三个 RewriteRelation 标记实例对应 True／逐载体的 True。
- StrictOrder 的非对称性、反自反性；asymmetry、irreflexivity；补关系、翻转关系的性质；等价关系可作重写标记。
- 蕴含的自反性、传递性及两个显式 obligation 根。

全部 15 个陈述既有原生 iff，也有独立的原生证明和原陈述证明。目标保留相应的量词、关系值类型与函数假设。RewriteRelation 本身是无数据标记，其目标为 True；没有把其他关系性质统统替换为 True。

源声明中的载体／关系宇宙在 iff 中显式实例化。原生目标中的辅助类型递归检查无源符号。类型与函数的证明同时保留实际原生目标，不把仅能传参数的接口计为运算对应。

89 个增量 profile 的当前源码／依赖验证通过；80 个覆盖 profile、1353 份覆盖证书共同导入通过，1835 个入口，12111 个依赖副本。新增对应没有改变机械翻译或展开原有 opaque 函数。该批无需新增证明条件；原陈述证明累计 199 份。

本模块剩余 18 项见 [逐项报告](reports/crelation-module-coverage.json)。下一步处理 PartialOrder 的数据表示，并区分透明组合定义和返回函数数据的 opaque 结果；后者不能只凭证明无关性认定计算结果一致。
