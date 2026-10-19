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
    mpath = ROOT / "experiments/used-rule-coverage-20261019/M_RULE_USAGE.json"
    measurement = json.loads(mpath.read_text()) if mpath.exists() else None
    mrules = [x for x in measurement["rules"] if x["used"]] if measurement else []
    if measurement:
        assert measurement["scope"]["success"] and measurement["scope"]["distinct_requested"] == 2180
        assert not measurement["target_changes"]
        assert all(x["surviving_events_including_repeated_dependencies"] > 0 for x in mrules)
    link = "../experiments/mechanical-nat-eq-20261019/results/"
    lines = [
        "# 当前 Corelib 翻译中有使用证据的规则", "",
        "范围：机械 nat／eq 基线 mechanical-nat-eq-20261019/full-v1，67 个模块、2180 个去重根声明。"
        "依据最终通过检查的译文、导出产物和最终报告；不是历史所有运行的并集，也不包含后续 correspondence 证明规则。", "",
        f"本文件列出 **{len(rules)} 个有证据的翻译／宇宙处理条目**，并逐项列出 **4 个原语类型映射、61 个原语操作映射**。"
        "三个数字按不同粒度分列，不能相加后宣称是独立语义规则的最小数量。", "",
        "只收录当前产物能确认的使用。仅有源语法特征、策略开关、失败尝试、检查覆盖范围或代码实现，"
        "不足以进入本表。缺少独立记录的机制也不列出；因此这是**已确认使用的清单，不是所有实际执行路径的完整追踪**。"
        "未列出不等于从未使用，更不构成删除该代码的依据。", "",
        "“主项 / 含分支”均为去重根声明数：左数检查根的主表示，右数将该根的 quality 分支纳入后去重。"
        "同一根可以使用多项规则，各行不能相加；这些数字不是执行调用次数。"
        "statement 通过检查仅表示陈述合法，带前提的译文通过检查也不表示其前提已证明。", "",
        "**已确认的翻译与宇宙处理**", "",
        "| 原编号 | 规则／机制 | 实际作用 | 主项 / 含分支 | 使用证据 | 命中实例 |",
        "|---|---|---|---:|---|---|"]
    def esc(s):
        return str(s).replace("|", "&#124;").replace("\n", " ")
    for key, name, desc, primary, family, basis in sorted(rules, key=lambda r: r[0]):
        example = family[0]
        if key == "T07":
            example = "Corelib.Init.Datatypes.nat；Corelib.Init.Logic.eq"
            assert all(n in family for n in example.split("；"))
        cells = [key, name, desc, f"{len(primary)} / {len(family)}", basis, example]
        lines.append("| " + " | ".join(esc(x) for x in cells) + " |")
    lines += ["", "**M：最终保留路径上的匹配与递归转换**", ""]
    pruning_ok = False
    if measurement:
        lines += ["命中记录随翻译环境回滚。零命中项不进入本表；原 34 条的 C-整体、L03、U04 等继续保持原有合并粒度。",
                  "下表分别列直接根数和全部声明数（含依赖、辅助声明），均按名字去重；不是受该规则间接影响的根数。",
                  "", "| 编号 | 规则 | 实际作用 | 直接根 / 全部声明 | 命中实例 |", "|---|---|---|---:|---|"]
        for x in mrules:
            examples=x["direct_roots"] or x["distinct_declarations"]
            lines.append("| "+" | ".join(map(esc,[x["id"],x["name"],x["description"],
                str(x["direct_root_count"])+" / "+str(x["distinct_declaration_count"]),examples[0]]))+" |")
        lines += ["", "[M 类完整统计与零命中项](../experiments/used-rule-coverage-20261019/M_RULE_USAGE.json)。"]
        pruning=ROOT/"experiments/used-rule-coverage-20261019/M_PRUNING_VALIDATION.json"
        if pruning.exists():
            v=json.loads(pruning.read_text())
            assert v["status"]=="PASS" and v["roots"]==2180 and v["target_changes"]==0
            pruning_ok = True
            lines += ["禁用零命中 M 路径后，2180 根重新翻译及独立检查通过，目标声明不变；"
                      "[验证结果](../experiments/used-rule-coverage-20261019/M_PRUNING_VALIDATION.json)。"]
    else:
        lines += ["M01–M13 正在补充独立执行记录。未测得的规则不加入已使用清单。"]
    lines += ["", "**完整性边界**", "",
              "原 34 条含合并机制，例如 C-整体涵盖透明展开，L03 未拆分内部 Type 转换路径，U04 未拆分公开／局部层级求解。",
              ("全库验证说明这版翻译器可翻译 2180 根；M 的禁用重跑验证零命中 M 路径可以退出本次配置。"
               if pruning_ok else "M 的排除结果以完成后的独立重跑验证为准。"),
              "非 M 路径尚未逐项关闭验证，不能据此宣布“34＋M 已经穷尽所有翻译机制”。",
              "[原 34 条的合并范围](../experiments/used-rule-coverage-20261019/NON_M_SCOPE.md)。"]
    lines += ["", "**原语类型：已检查映射根本身的目标 AST**", "",
              "| 源类型根 | 目标表示 | 根数 |", "|---|---|---:|"]
    for name, target in type_rows:
        lines.append(f"| {name} | {target} | 1 |")
    lines += ["", "**原语操作：已检查映射根本身实际引用指定目标**", "",
              "这些是操作映射表的逐项实例，不另行重复列四个原语家族的汇总。"
              "目标可以是 Rocq2Lean 适配实现；出现目标名称本身不等于另有与 Mathlib 运算一致的 correspondence 证明。", "",
              "| 源操作标识 | Lean 目标 | 映射根数 | 源声明 |", "|---|---|---:|---|"]
    for source, target, names in primitive_rows:
        lines.append("| " + " | ".join(map(esc, [source, target, len(names), "；".join(names)])) + " |")
    lines += ["", "**证据与复现**", "",
              f"- [逐根紧凑证据]({link}rule-usage-evidence.json)：每根的 source、primary、variants 及验证结果。",
              f"- [逐条命中名单]({link}RULE_USAGE.json)：表内原编号的 names / family_names。C-整体直接筛选 delta_inlined。",
              f"- [完整历史编号说明]({link}ALL_RULES.md)：用于追溯名称，本文件没有把其中所有条目当成已使用。",
              "- [生成脚本](../scripts/used_translation_rules.py)：逐项验证非空命中、成功状态、名单一致、quality 分支完整和原语实际目标引用。", "",
              "在仓库根运行：", "", "    python3 scripts/used_translation_rules.py",
              "    python3 scripts/used_translation_rules.py --check", "",
              "该命令读取现有机械基线证据，不重新运行翻译器。", ""]
    return "\n".join(lines), len(rules) + len(mrules)

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
