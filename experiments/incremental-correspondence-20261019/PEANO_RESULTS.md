# Peano 对应与旧目标复查

本批新增 6 个完成根：IsSucc 对应原生 Nat 的 0 < n；f_equal_pred、le_pred、nat_rect_plus、nat_rect_succ_r、pred_Sn 的陈述已证明等价于纯原生陈述。Init.Peano 共 36 根全部有范围明确的对应。

PeanoBridge 在实际 Auto_Init_Peano 闭包中重证前驱、加乘、最大最小值和迭代器的辅助对应。PeanoStatements 检查全部 31 个陈述，其中 26 个原已完全原生，不重复计覆盖证书；新增 5 个。陈述 iff 不等于证明原业务定理。

旧账本的陈述证据来自 automatic profile，不是同名手写 profile。audit_baseline_native.py 根据 frozen reports/statements.json 精确选择原证据模块，对旧账本 143 个完全原生目标递归展开 NativeBridge 别名；10 个模块、143 个目标全部通过，无源符号。此检查导入已有编译证明，没有重新编译全部旧证明。此前在手写 Peano 模块发现的 12 个源符号残留不属于账本采用的目标，不能据此判定账本错误。

证据：reports/peano-module-coverage.json、reports/peano-statement-candidates.json、reports/baseline-native-audit/。检查记录包含实际源码和编译产物哈希。当前 39 个增量 profile 有成功记录；619 份增量覆盖证书共同导入通过，累计完成类别为 890 / 2180。
