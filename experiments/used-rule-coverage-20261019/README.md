# M 类规则的成功路径统计

结果：原 34 条＋实测命中的 10 条 M 规则，共 44 个有证据条目。M08、M10、M13 零命中，关闭后 67 个模块、2180 根再次通过独立 consumer/audit，目标声明不变。

[逐项统计](M_RULE_USAGE.json) · [禁用重跑](M_PRUNING_VALIDATION.json) · [归因测试](INSTRUMENTATION_TESTS.json) · [非 M 范围](NON_M_SCOPE.md)

以原 USED_RULES.md 的 34 个已有证据条目为起点，补齐 M01–M13 的独立记录。没有命中证据的条目不加入 USED_RULES；完整规则目录仍可保存候选机制说明。

测量区分：
- 转换分支产生了结果，且记录在最终保留的翻译环境中。
- 已被回滚的尝试：不计入保留记录。
- 零命中：从 USED_RULES 移除，并禁用对应路径重跑，核对全部 2180 根及原有类型、正文、条件不变。

记录保存在 Lean 环境扩展中，正常 saveState / restore 会同时回滚；常量和归纳声明的重试若正常返回失败状态，也会显式恢复该次尝试之前的记录。M01 在依赖 match 的 recursor 构造完成后记录；M02 在非均匀 match 的 convoy 或已知构造器归约完成后记录。M03–M13 按各自生效条件记录，不能把进入 transFix 或尝试调用修复函数视为命中。

M08 对递归暴露前后 IR 做结构相等比较，只有实际改变才记录。M13 排除原本定义相等、无需修复的直接返回。

原 34 条中 C-整体、L03、U04 等仍含合并统计的子机制；此工作不把这些子机制自动新增为独立规则，也不先验宣称“34 + M 已经覆盖全部代码路径”。

原始导出、编译文件和日志位于远程 .work/used-rule-coverage-20261019/，不发布到 Git。

复现入口：

    python3 experiments/used-rule-coverage-20261019/prepare.py
    LEAN_NUM_THREADS=1 ~/.elan/bin/lake -d .work/used-rule-coverage-20261019/translator build Rocq2Lean Rocq2Lean:shared
    python3 scripts/corelib_lab.py --translator .work/used-rule-coverage-20261019/translator --out .work/used-rule-coverage-20261019/full
    python3 experiments/used-rule-coverage-20261019/analyze.py

full 已存在时 corelib_lab 会续跑；重新测量须另存旧目录。analyze.py 与远程保存的原机械基线作逐声明比较。

测量完成后的 M 子集翻译入口：

    python3 experiments/used-rule-coverage-20261019/translate.py --input /path/source.ndjson --out /path/output

这个入口只关闭经完整重跑验证的零命中 M 路径；其他机制沿用原实现，不声称对非 M 路径做过逐项排除。

归因测试还覆盖正常返回 KERNEL_REJECTED 的重试：该次已产生的转换记录必须清空；接受的 Nat.add 保留 M03，关闭 M03 则拒绝该声明。运行 check_instrumentation.py 可复现。
