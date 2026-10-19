import pathlib,subprocess,sys,json,time,shutil,difflib,collections
R=pathlib.Path(__file__).resolve().parents[1]
S=R/"work/runs/quality-main75-full";T=R/"work/snapshots/quality-main75/translator"
O=R/"results/corelib-complete";C=R/"work/logs/quality-main75-full-campaign.log"
deadline=time.monotonic()+2400
while not C.read_text().rstrip().endswith("CAMPAIGN_COMPLETE"):
 assert time.monotonic()<deadline,"full campaign not complete within deadline"
 if "Traceback" in C.read_text():raise RuntimeError(C.read_text()[-5000:])
 time.sleep(10)
assert json.loads((R/"work/quality-main75-artifacts.json").read_text())["identical"]
print("FULL_CAMPAIGN_PASSED",flush=True)
subprocess.run([sys.executable,str(R/"scripts/package_corelib_results.py"),"--run",str(S),"--out",str(O),
                "--baseline",str(R/"work/runs/baseline"),"--campaign",str(C)],check=True)
subprocess.run([sys.executable,str(R/"scripts/compare_corelib_runs.py"),str(R/"work/runs/baseline"),str(S),
                "--out",str(O/"baseline-delta.json")],check=True)
subprocess.run([sys.executable,str(R/"scripts/core_rule_usage.py"),str(S),str(O/"rule-usage.json")],check=True)
for src,name in [
 (R/"work/quality-main75-artifacts.json","simplification-artifacts.json"),
 (R/"work/quality-main75-delta.json","simplification-coverage.json")]:shutil.copy2(src,O/name)
I=O/"interop";I.mkdir()
for name in ["Nat.lean","List.lean","Nat.log","List.log","result.json"]:
 shutil.copy2(R/"work/tests/basic-interop75"/name,I/name)
assert json.loads((I/"result.json").read_text())["status"]=="PASS"
(I/"run.py").write_text("""import pathlib,sys,subprocess
O=pathlib.Path(__file__).resolve().parent
R=O.parents[2]
sys.exit(subprocess.call([sys.executable,str(R/"scripts/test_basic_interop.py"),
 str(R/"work/snapshots/quality-main75/translator"),str(R/"work/runs/quality-main75-full"),str(O)]))
""")
(I/"README.md").write_text("""Lean 互操作实证

Nat.lean：翻译后的 Rocq add 直接接收／返回 Lean Nat。对任意 n,m，用 Lean 归纳证明 add n m = n+m；另有两个闭项计算等式。

List.lean：翻译后的 Rocq list 是单独的数据类型。显式 fromLean/toLean 双向转换；证明两个方向的往返恒等、length 与 Lean List.length 一致、app 与 Lean List.append 一致，均对任意元素宇宙有效。

五个定理的 axiom closure 均为空。这里使用的是最终 main75 的实际翻译结果，不是手写一个类似的替代实现。源测试第一次误以为 Lean 0+m 与 m 定义相等，已改用 Nat.zero_add；原失败日志保留在 work/tests/basic-interop75。

当前 importer 注册内核声明，并未为新归纳类型运行 Lean 编译器。List 的两个桥接定义因此标记 noncomputable：保留可归约的内核定义，不生成运行时代码；并非加入公理，也不影响上述证明。编译可执行程序属于额外打包工作。

复跑：python3 interop/run.py（完整仓库中）。
""")
a=(R/"work/snapshots/quality-main74/translator/Rocq2Lean/Translate.lean").read_text().splitlines(True)
b=(T/"Rocq2Lean/Translate.lean").read_text().splitlines(True)
(O/"simplification.patch").write_text("".join(difflib.unified_diff(a,b,fromfile="main74/Translate.lean",tofile="main75/Translate.lean")))
d=json.loads((O/"simplification-artifacts.json").read_text())
(O/"RULES.md").write_text("""规则与精简结果

本页按机制归类，分类数量不等于代码中的规则/开关数量。逐声明实际规则、所有尝试标签、宇宙实例、转换及条件见同名 JSON/MD。

1. 源端分类和证明条件：按实际归约后的 Prop/SProp 结果分类，保留局部假设的应用；证明实现抽取成显式条件，支持多态条件的不同实例。最终 pending 状态依据实际剩余条件 telescope。
2. 宇宙约束与解释：完整导出并重查原生事实；显式参数、模板 Sort 参数、局部约束闭包与必要的实例对应保留。带全局上界的局部解释只处理受检查的向外约束片段；公开参数、原生约束和引用检查没有省略。
3. SProp/Prop/Type quality：23 个原始根以原生检查过的完整 quality family 表示，共603种实例（23个主项加580个额外分支）。不把23个原始根从统计范围删除。
4. 精确源转换：透明别名的实际实例替换、beta/delta/zeta 化简、已知构造器驱动的受限递归求值。独立审计重建每次展开；不任意展开 opaque 证明。
5. 显式累积表示：PULift up/down，函数参数和结果的组合转换，以及非递归、单构造器、无索引记录的逐字段转换。保留字段次序、载荷、全部依赖类型及公共条件。
6. 递归与消去：结构递归、真实内核 recursor、accessibility/well-founded 对应和受检查的 deferred guard 处理；终止性所需条件保持显式。
7. 原语模型：kernel-registered Int63→BitVec63；有界数组；字节串；保留符号零/无穷/NaN的 binary64 模型。操作身份、大小界限、构造器角色、源端原语与目标载荷分别核查。
8. 原生对应：nat→Lean Nat，eq→Lean Eq；其他数据类型按报告生成，不能自动声称与 Lean 同名类型可互换。

检查配套包括源端 roundtrip、独立 Lean consumer/内核检查、独立结构审计、公共接口/宇宙检查及错误注入测试。定理陈述不是定理证明；待证条件没有被藏成 axiom 或 sorry。

最后一轮精简 main74→main75：
- liftCoerceValue 的 Type 路径不再先走独立 direct up/down，再走组合 up/down；统一由递归组合规则处理，直接转换是其基本情况。
- 两处失败回滚合并为 tryLiftConversion，同时恢复 elaborator 状态与转换计数。
- 保留 Prop-only 早期路径的限制；不删除独立校验、不改变源范围。
- 全2180项覆盖保持0受阻，完整回归和所有 campaign 检查通过。
- 包含依赖、辅助声明及 quality 分支的全部 """+str(d["declaration_occurrences"])+""" 条逐模块声明出现，其状态、名称、目标种类、类型、正文、构造器、宇宙参数及待证条件均与精简前完全一致（结构 JSON 比较，不是仅比较成功率）。

这是一轮经验证的重复机制合并，不是“规则数量已达到数学上的全局最小值”的证明。保留未能证明冗余的通用规则，尤其不能仅凭2180个根的命中次数删除其依赖或MathComp可能需要的路径。

规则命中统计见 rule-usage.json；精简补丁见 simplification.patch；全声明比较见 simplification-artifacts.json。早期失败实验留在 work/snapshots 和 work/tests 中，不作为成功证据。
""")
(R/"RESULTS.md").write_text("""已完成的 Corelib 全量翻译

最终版本：work/snapshots/quality-main75/translator
最终运行：work/runs/quality-main75-full
范围：67个源文件，2180个原始根声明；0受阻、0模块验证失败。
main74达到零阻塞；main75合并重复Type提升路径和失败回滚逻辑，完整回归无退步。

[逐文件结果入口](results/corelib-complete/README.md)
[规则与精简证据](results/corelib-complete/RULES.md)
[Lean实际互操作示例](results/corelib-complete/interop/README.md)
[2180项总表](results/corelib-complete/declarations.csv)

分类：1001完整定义/数据类型，2已有Lean对应，846无条件陈述，148带条件定义，183带条件陈述。陈述不是证明；条件仍须提供。结果支持Lean内核使用，非自动打包好的原生可执行库。

旧根目录README.txt及improved等文件夹是历史839项快照，保留不覆盖；请以本页及WORK_STATE.json为当前进度。
""")
print("FINAL_ARTIFACTS_COMPLETE",flush=True)
