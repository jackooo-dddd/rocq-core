#!/usr/bin/env python3
"""List only translation mechanisms supported by accepted-result evidence."""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "experiments/mechanical-nat-eq-20261019/results"
SUCCESS = {"TRANSLATED_AND_CHECKED", "PENDING_KERNEL_CHECKED",
           "STATEMENT_KERNEL_CHECKED", "STATEMENT_PENDING_KERNEL_CHECKED"}

def render():
    evidence = json.loads((BASE / "rule-usage-evidence.json").read_text())
    usage = json.loads((BASE / "RULE_USAGE.json").read_text())
    catalog = json.loads((BASE / "ALL_RULES.json").read_text())
    by_name = {x["name"]: x for x in evidence}
    entries = {e["id"]: e for g in catalog["groups"] for e in g["entries"]}
    records = {r["id"]: r for r in usage["rules"]}
    assert len(by_name) == len(evidence) == 2180
    assert all(t["status"] in SUCCESS for x in evidence for t in [x["primary"]] + x["variants"])
    # Explicitly curated evidence predicates: a nonzero catalog row is insufficient.
    rules = []
    def add(key, name, description, predicate, basis, ledger=None):
        primary = [x["name"] for x in evidence if predicate(x, x["primary"])]
        family = [x["name"] for x in evidence
                  if any(predicate(x, t) for t in [x["primary"]] + x["variants"])]
        assert family, key
        if ledger:
            assert primary == records[ledger]["names"], key
            assert family == records[ledger]["family_names"], key
        rules.append((key, name, description, primary, family, basis))
    def entry(key, predicate, basis, name=None, description=None):
        e = entries[key]
        add(key, name or e["name"], description or e["description"], predicate, basis, key)
    for key, kind in [("E03", "statement"), ("E08", "def"), ("E09", "opaque"), ("T07", "inductive")]:
        entry(key, lambda x, t, kind=kind: t.get("target_kind") == kind,
              "最终 target_kind=" + kind)
    entry("E04", lambda x, t: bool(x["source"]["obligations"]),
          "导出 IR 已产生具名 obligations，且对应根译文检查通过。",
          description="证明片段抽成具名 obligation；只确认抽取结果，不声称已证明这些条件。")
    entry("E12", lambda x, t: bool(t.get("pending_hypotheses")),
          "最终 pending_hypotheses 非空。",
          name="显式前提参数", description="译文保留尚未装配的证明参数；不据此统计条件合并或删除。")
    entry("T01", lambda x, t: bool(t["ast"].get("bvar")), "最终 AST 存在 bvar。")
    entry("T02", lambda x, t: any(t["ast"].get(k) for k in ["forall", "lam", "let", "app"]),
          "最终 AST 存在 forall / lam / let / app；此处作为一个结构类，不拆分次数。")
    entry("T03", lambda x, t: bool(t["consts"]), "最终 AST 有常量引用，含辅助声明。")
    entry("U02", lambda x, t: bool(t["ast"].get("sort")),
          "最终 AST 存在 Sort；只确认 sort 表示，不将此数归给每一种 sort 子规则。")
    entry("U03", lambda x, t: any(n.startswith("u_") for n in t.get("level_params", [])),
          "最终公开参数出现 u_ 层级。")
    for key, kind in [("U10", "constant"), ("U11", "inductive")]:
        entry(key, lambda x, t, kind=kind: t.get("kind") == kind and t.get("universe_poly_params", 0) > 0,
              "最终声明有显式多态宇宙参数。")
    fields = [
        ("T10", "coinductive_as_inductive"), ("U04", "solved_levels"),
        ("U06", "universe_checks"), ("U07", "universe_residuals"),
        ("U09", "template"), ("U13", "level_interp"), ("U15", "implicit_levels"),
        ("U17", "admitting_levels"), ("U19", "level_copies"),
        ("U29", "r2bp_levels"), ("U30", "sort_lowered_levels"),
        ("U31", "result_sort_inherited"), ("U32", "poly_level_interp"),
        ("C06", "source_computed"), ("L02", "prop_lift_coercions"),
        ("Q02", "template_sort"), ("Q03", "quality_prop")]
    notes = {
        "U04": "记录具体层级解；公开与正文局部求解不再细分。",
        "U06": "记录已执行的引用宇宙检查；这是接受条件，不是改写。",
        "U07": "只确认 residual 实例处理，不把两个历史命名子规则分别计数。",
        "U09": "只计模板块本身，不计下游每次实例化。",
        "U31": "记录最终采用结果 sort 继承。",
        "Q03": "最终产物包含 quality_prop 分支。"}
    for key, field in fields:
        entry(key, lambda x, t, field=field: bool(t.get(field)),
              "最终 " + field + " 非空／非零。" + notes.get(key, ""))
    entry("L01", lambda x, t: t.get("prop_lift") is not None,
          "最终 prop_lift 给出提升深度（深度 0 也有效）。")
    entry("L03", lambda x, t: t.get("type_lift") is not None or t.get("type_lift_coercions", 0) > 0,
          "最终 type_lift 给出深度，或 type_lift_coercions > 0；不拆分内部转换路径。")
    add("C-整体", "透明 δβ 展开", "按源可转换性展开透明定义；未归因到各别名子机制。",
        lambda x, t: bool(t.get("delta_inlined")), "最终 delta_inlined 列出实际展开的名称。")
    def family_present(x, t):
        return bool(x["source"]["quality_family"]) and (
            len(x["variants"]) + 1 == x["source"]["quality_members"])
    entry("Q05", family_present,
          "除源 quality_family 元数据外，已核对全部分支的数量及成功状态；同根只计一次。")
    # These mappings must occur in the mapped root's own accepted AST, not elsewhere.
    primitive_rows = []
    for p in usage["primitives"]:
        if not p["mapped_names"]:
            continue
        for name in p["mapped_names"]:
            t = by_name[name]["primary"]
            assert any(n == p["target"] or n.endswith("." + p["target"]) for n in t["consts"]), (name, p["target"])
        primitive_rows.append((p["source"], p["target"], p["mapped_names"]))
    assert len(primitive_rows) == 61
    type_targets = {"array": "Rocq2Lean.PrimArray.Rep", "float64": "Rocq2Lean.PrimFloat.Rep",
                    "int63": "BitVec", "string": "Rocq2Lean.PrimString.Rep"}
    type_rows = []
    for x in evidence:
        typ = x["source"]["primitive_type"]
        if typ:
            target = type_targets[typ]
            assert target in x["primary"]["consts"]
            type_rows.append((x["name"], target))
    assert len(type_rows) == 4
    mbase = ROOT / "experiments/used-rule-coverage-20261019"
    measurement = json.loads((mbase / "M_RULE_USAGE.json").read_text())
    validation = json.loads((mbase / "M_PRUNING_VALIDATION.json").read_text())
    instrumentation = json.loads((mbase / "INSTRUMENTATION_TESTS.json").read_text())
    mrules = [x for x in measurement["rules"] if x["used"]]
    unused_m = [x["id"] for x in measurement["rules"] if not x["used"]]
    scope = measurement["scope"]
    assert scope == validation, "M measurement and replay must describe the same run"
    assert scope["success"] and scope["status"] == "PASS"
    assert scope["distinct_requested"] == scope["roots"] == len(evidence)
    assert scope["blocked_roots"] == 0 and not scope["validation_failures"]
    assert not measurement["target_changes"] and scope["target_changes"] == 0
    assert scope["modules"] == len(scope["records"]) == 67
    assert all(r["checked"] for r in scope["records"])
    for r in scope["records"]:
        if r["roots"]:
            assert r["translate_exit"] == 0
            assert all(r[k] == "OK" for k in ("consumer", "audit", "source_roundtrip"))
    assert sorted(scope["disabled_M_rules"]) == sorted(unused_m)
    assert len(mrules) == measurement["rule_count_used"]
    for r in measurement["rules"]:
        roots, decls = set(r["direct_roots"]), set(r["distinct_declarations"])
        assert len(roots) == len(r["direct_roots"]) == r["direct_root_count"]
        assert len(decls) == len(r["distinct_declarations"]) == r["distinct_declaration_count"]
        assert roots == decls.intersection(by_name)
        assert r["used"] == (r["surviving_events_including_repeated_dependencies"] > 0)
        assert r["used"] == bool(decls)
    assert instrumentation["rollback_test"] == instrumentation["documented_entrypoint"] == "PASS"
    tests = {x["case"]: x for x in instrumentation["tests"]}
    assert tests["accepted"]["status"] == "TRANSLATED_AND_CHECKED"
    assert tests["accepted"]["retained_M_rules"] == ["M03"]
    for case, status in [("disabled", "TRANSLATION_FAILED"), ("normal_failure", "KERNEL_REJECTED")]:
        assert tests[case]["status"] == status and not tests[case]["retained_M_rules"]
    from collections import Counter
    statuses = Counter(x["primary"]["status"] for x in evidence)
    assert dict(statuses) == scope["root_counts"]
    ids = [r[0] for r in rules] + [r["id"] for r in mrules]
    assert len(ids) == len(set(ids))
    count = len(ids)
    populated = sum(bool(r["roots"]) for r in scope["records"])
    link = "../experiments/mechanical-nat-eq-20261019/results/"
    mlink = "../experiments/used-rule-coverage-20261019/"
    lines = [
        "# 当前 Corelib 翻译中有使用证据的规则", "",
        f"当前共 **{count} 个有使用证据的翻译／宇宙处理条目 = {len(rules)} 个原有条目 + {len(mrules)} 个实测 M 类条目**。"
        f"另列 **{len(type_rows)} 个原语类型映射、{len(primitive_rows)} 个原语操作映射**；映射实例与机制条目粒度不同，分别统计。", "",
        f"范围：当前 Corelib 清单的 **{scope['modules']} 个模块、{scope['roots']} 个去重根声明**。"
        "原有条目依据机械 nat／eq 基线 mechanical-nat-eq-20261019/full-v1 的导出产物、最终译文与报告；"
        "M 类依据 used-rule-coverage-20261019 的成功路径记录及同范围重跑。重跑目标声明与原基线一致。"
        "本文件不汇总历史运行的命中，也不包含后续 correspondence 证明规则。", "",
        "源 nat、eq 均生成独立的机械归纳类型，计入 T07；没有启用将这两个根直接替换为 Lean Nat、Eq 的旧 T06 bootstrap。", "",
        "**如何读数量和证据**", "",
        "本表只纳入能由当前产物或最终保留路径确认的条目。规则有实现、开关打开、源端出现某种语法，"
        "或失败尝试曾经过某分支，都不能单独算作使用证据。", "",
        "| 计数列 | 单位与含义 |",
        "|---|---|",
        "| 主表示根数 | 检查每个根的主译文；符合该行证据条件的根按源名称去重。 |",
        "| 含 quality 分支根数 | 同时检查主译文和该根的 quality 分支；任一表示命中即计该根一次。 |",
        "| M 直接根数 | 本次保留记录归属到请求根本身的声明数；不把仅在其依赖中命中的规则归给该根。 |",
        "| M 全部声明数 | 本次保留记录涉及的全部源声明，含根、依赖和辅助声明；跨模块重复出现按名称去重。 |",
        "| 映射根数 | 该原语映射涉及的去重源根；已检查这些根自身的目标 AST。 |", "",
        "这些列均不是执行调用次数，也不是成功率。同一声明可命中多条规则，各行不能相加。"
        "M 的“全部声明数”与“含 quality 分支根数”统计对象不同，不能互换。"
        "M 原始 JSON 另有含重复依赖的保留事件数，本文没有把它当作独立声明数或尝试总次数。", "",
        "| 证据类别 | 具体检查了什么 |",
        "|---|---|",
        "| 产物结构 | 在最终通过检查的目标 AST 中找到变量、绑定结构、引用或 Sort 等对应结构。 |",
        "| 导出产物 | 导出 IR 已实际产生具名 obligation，且对应根译文通过检查；不只是源端有证明语法。 |",
        "| 结果报告字段 | 最终接受结果有对应字段和值，例如实际展开名称、层级解或提升信息；逐行说明判断条件。 |",
        "| 分支核对 | 源 quality 家族成员数与全部已通过检查的译文分支一致。 |",
        "| 成功路径记录 | M 转换实际生效，且其记录留在最终接受环境中；被回滚或返回失败状态的尝试不计。 |",
        "| 原语目标引用 | 映射根自身的最终 AST 实际引用指定目标表示或操作。 |", "",
        f"**翻译、导出与宇宙处理：{len(rules)} 项**", "",
        "保留原编号便于追溯；编号不连续表示其他目录项没有列入本次已确认清单。"
        "U06 等条目属于接受条件检查，因此这里使用“处理条目”，不把所有条目都称作语义改写。", "",
        "| 原编号 | 规则／机制 | 实际作用 | 主表示根数 | 含 quality 分支根数 | 证据类别及判断条件 | 命中实例 |",
        "|---|---|---|---:|---:|---|---|"]
    def esc(s):
        return str(s).replace("|", "&#124;").replace("\n", " ")
    ast_rules = {"T01", "T02", "T03", "U02"}
    for key, name, desc, primary, family, basis in sorted(rules, key=lambda r: r[0]):
        example = family[0]
        if key == "T07":
            example = "Corelib.Init.Datatypes.nat；Corelib.Init.Logic.eq"
            assert all(n in family for n in example.split("；"))
        category = ("产物结构" if key in ast_rules else "导出产物" if key == "E04"
                    else "分支核对" if key == "Q05" else "结果报告字段")
        cells = [key, name, desc, len(primary), len(family), category + "：" + basis, example]
        lines.append("| " + " | ".join(esc(x) for x in cells) + " |")
    lines += ["", f"**匹配与递归转换：{len(mrules)} 项 M 规则**", "",
              "以下每项都有独立的成功路径记录。记录随环境 saveState／restore 回滚；"
              "重试正常返回失败状态时也会清除该次记录。只进入转换函数、产生后又被丢弃的候选结果不计入。", "",
              "| 编号 | 规则 | 实际作用 | 直接根数 | 全部声明数（含依赖／辅助声明） | 命中实例 |",
              "|---|---|---|---:|---:|---|"]
    for r in mrules:
        examples = r["direct_roots"] or r["distinct_declarations"]
        lines.append("| " + " | ".join(map(esc, [
            r["id"], r["name"], r["description"], r["direct_root_count"],
            r["distinct_declaration_count"], examples[0]])) + " |")
    lines += ["", "各行的全部命中名称见 [M 类逐项统计](" + mlink + "M_RULE_USAGE.json)。"
              "M11 的显式良基回退仍可能引入待证明条件；命中不表示良基性证明已完成。", "",
              f"**原语类型映射：{len(type_rows)} 项**", "",
              "证据类别为“原语目标引用”：已检查映射根自身的最终 AST。"
              "这里列的是 Rocq 原语的表示选择；机械 nat、eq 不属于这四项原语映射。", "",
              "| 源类型根 | 目标表示 | 映射根数 |", "|---|---|---:|"]
    for name, target in type_rows:
        lines.append(f"| {name} | {target} | 1 |")
    lines += ["", f"**原语操作映射：{len(primitive_rows)} 项**", "",
              "证据类别同为“原语目标引用”：下列源根自身实际引用指定 Lean 目标。"
              "每个操作单独列出，不重复加入原语家族汇总项。"
              "目标可以是 Rocq2Lean 适配实现；此证据不等于已证明该操作与 Lean／Mathlib 现成运算的 correspondence。", "",
              "| 源操作标识 | Lean 目标 | 映射根数 | 源声明 |", "|---|---|---:|---|"]
    for source, target, names in primitive_rows:
        lines.append("| " + " | ".join(map(esc, [source, target, len(names), "；".join(names)])) + " |")
    lines += ["", "**全库验证结果与清单的适用范围**", "",
              f"同范围重跑覆盖 {scope['modules']} 个模块，其中 {populated} 个含请求根，"
              f"{scope['modules'] - populated} 个在此层面没有请求根。"
              f"{scope['roots']} 个根的结果如下；有请求根的模块均通过源端 roundtrip、独立 Lean consumer 和结构 audit。", "",
              "| 最终状态 | 根数 | 通过检查意味着什么 |", "|---|---:|---|"]
    status_meanings = [
        ("TRANSLATED_AND_CHECKED", "译文通过检查，未携带待装配证明前提。"),
        ("STATEMENT_KERNEL_CHECKED", "定理等声明的陈述通过内核检查，未携带待装配证明前提；不表示源证明已翻译。"),
        ("PENDING_KERNEL_CHECKED", "带显式证明前提的译文通过检查；这些前提尚待证明或装配。"),
        ("STATEMENT_PENDING_KERNEL_CHECKED", "带显式证明前提的陈述通过内核检查；源证明及前提不能据此视为已完成。")]
    for status, meaning in status_meanings:
        lines.append(f"| {status} | {statuses[status]} | {meaning} |")
    pending = statuses["PENDING_KERNEL_CHECKED"] + statuses["STATEMENT_PENDING_KERNEL_CHECKED"]
    disabled = "、".join(scope["disabled_M_rules"])
    lines += ["", f"合计 {sum(statuses.values())} 根；受阻 {scope['blocked_roots']}，验证失败 "
              f"{len(scope['validation_failures'])}。其中 {pending} 根带显式待证明前提。", "",
              f"M 测量中的零命中项 {disabled} 未收入上面的使用清单；"
              "已关闭这些路径并完成同范围重跑，目标类型、正文、构造器、宇宙与前提保持不变。"
              "[禁用重跑记录](" + mlink + "M_PRUNING_VALIDATION.json) 保存逐模块结果。", "",
              f"这支持当前配置完成上述 Corelib 范围的机械翻译，及这 {len(unused_m)} 条 M 路径在本范围可以禁用。"
              f"**{count} 是当前证据粒度下的清单条目数，不是已证明最小且穷尽所有实现分支的规则数。**"
              "原有 C-整体、L03、U04 等仍合并了内部子机制；非 M 路径尚未逐项关闭验证。"
              "未列出的非 M 子机制不能据此判为未使用，完整合并口径见 [非 M 范围说明](" + mlink + "NON_M_SCOPE.md)。", "",
              "**证据文件与复现**", "",
              "| 文件 | 内容与用途 |", "|---|---|",
              f"| [逐根产物证据]({link}rule-usage-evidence.json) | source、primary、variants 及检查结果；用于原有条目的筛选。 |",
              f"| [原有条目的命中名单]({link}RULE_USAGE.json) | 原编号的 names／family_names；C-整体直接筛选 delta_inlined。 |",
              f"| [M 成功路径统计]({mlink}M_RULE_USAGE.json) | 每条 M 规则的根名单、全部声明名单和保留事件数。 |",
              f"| [M 禁用后的全库验证]({mlink}M_PRUNING_VALIDATION.json) | 同范围重跑、逐模块检查、状态计数和目标不变结果。 |",
              f"| [记录可靠性测试]({mlink}INSTRUMENTATION_TESTS.json) | 验证接受路径保留记录、禁用路径拒绝、回滚和正常返回失败均不留下命中。 |",
              f"| [完整规则目录]({link}ALL_RULES.md) | 追溯历史编号与规则说明；目录成员不自动视为本次已使用。 |",
              "| [本文生成脚本](../scripts/used_translation_rules.py) | 从上述证据生成全文，核对名单、计数、成功状态、原语引用及 M 验证的一致性。 |", "",
              "在仓库根生成或检查本文：", "",
              "    python3 scripts/used_translation_rules.py",
              "    python3 scripts/used_translation_rules.py --check", "",
              "上述命令读取已保存证据，不重新编译或翻译 Corelib。"
              "完整测量、编译和重跑步骤见 [M 工作区说明](" + mlink + "README.md)。"
              "原始导出、编译文件及日志保留在远程 .work/used-rule-coverage-20261019/，不提交到 Git。", ""]
    # The introduction, table sizes and CLI summary share the same counts.
    assert sum(line.startswith("| " + key + " |") for key in ids for line in lines) == count
    return "\n".join(lines), count

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    content, count = render()
    output = ROOT / "results/USED_RULES.md"
    if args.check:
        assert output.read_text() == content, "USED_RULES.md differs from current evidence"
    else:
        output.write_text(content)
    print(f"{output.relative_to(ROOT)}: {count} mechanisms, 4 primitive types, 61 primitive operations; verified")

if __name__ == "__main__":
    main()
