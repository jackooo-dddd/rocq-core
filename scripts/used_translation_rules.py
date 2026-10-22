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
              'Final target_kind=' + kind)
    entry("E04", lambda x, t: bool(x["source"]["obligations"]),
          'Exporting IR has generated the named obligations, and the corresponding root translation check has passed.',
          description='Extract proof fragments as named obligations. This confirms extraction, not proofs of those obligations.')
    entry("E12", lambda x, t: bool(t.get("pending_hypotheses")),
          'Finally pending_hypotheses is not empty.',
          name='Explicit prerequisite parameters', description='Retain proof parameters awaiting assembly; this count does not measure prerequisite merging or elimination.')
    entry("T01", lambda x, t: bool(t["ast"].get("bvar")), 'Eventually AST exists bvar.')
    entry("T02", lambda x, t: any(t["ast"].get(k) for k in ["forall", "lam", "let", "app"]),
          'Finally, AST exists forall / lam / let / app; here it is used as a structural class and does not split times.')
    entry("T03", lambda x, t: bool(t["consts"]), 'Finally AST has a constant reference, including auxiliary declarations.')
    entry("U02", lambda x, t: bool(t["ast"].get("sort")),
          'Eventually AST exists in Sort; only the sort representation is confirmed, and this number is not assigned to each sort sub-rule.')
    entry("U03", lambda x, t: any(n.startswith("u_") for n in t.get("level_params", [])),
          'The final public parameters appear at the u_ level.')
    for key, kind in [("U10", "constant"), ("U11", "inductive")]:
        entry(key, lambda x, t, kind=kind: t.get("kind") == kind and t.get("universe_poly_params", 0) > 0,
              'The final statement has explicit polymorphic universe parameters.')
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
        "U04": 'Record specific hierarchical solutions; public and body local solutions will not be subdivided.',
        "U06": 'Records the reference universe check that was performed; this is an acceptance condition, not an override.',
        "U07": 'Only the residual instance processing is confirmed, and the two historical naming sub-rules are not counted separately.',
        "U09": 'Only the template block itself is counted, not each downstream instantiation.',
        "U31": 'Record the final adoption result sort inheritance.',
        "Q03": 'The final product contains the quality_prop branch.'}
    for key, field in fields:
        entry(key, lambda x, t, field=field: bool(t.get(field)),
              'Final ' + field + ' is nonempty/nonzero.' + notes.get(key, ""))
    entry("L01", lambda x, t: t.get("prop_lift") is not None,
          'Finally prop_lift gives the boost depth (depth 0 is also valid).')
    entry("L03", lambda x, t: t.get("type_lift") is not None or t.get("type_lift_coercions", 0) > 0,
          'Eventually type_lift gives the depth, or type_lift_coercions > 0; internal conversion paths are not split.')
    add('C-aggregate', 'Transparent δβ unfolding', 'Unfold transparent definitions according to source convertibility; usage is not attributed to individual alias submechanisms.',
        lambda x, t: bool(t.get("delta_inlined")), 'The final delta_inlined field lists the names actually unfolded.')
    def family_present(x, t):
        return bool(x["source"]["quality_family"]) and (
            len(x["variants"]) + 1 == x["source"]["quality_members"])
    entry("Q05", family_present,
          'In addition to the source quality_family metadata, the number and success status of all branches have been checked; the same root is only counted once.')
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
        '# Rules with confirmed usage in the current Corelib translation', "",
        f"The current inventory contains **{count} translation/universe processing entries with evidence of use = {len(rules)} original entries + {len(mrules)} measured M entries**. "
        f"Also listed are **{len(type_rows)} primitive type mappings and {len(primitive_rows)} primitive operation mappings**; mapping instances and mechanism entries have different granularities and are counted separately.", "",
        f"Scope: **{scope['modules']} modules, {scope['roots']} distinct root declarations** in the current Corelib scope. "
        'The original entries use export artifacts, accepted translations, and reports from the mechanical nat/eq baseline mechanical-nat-eq-20261019/full-v1. '
        'M entries use accepted-path traces and a same-scope rerun in used-rule-coverage-20261019. Target declarations in the rerun match the original baseline. '
        'This file does not summarize hits from historical runs, nor does it contain subsequent correspondence proof rules.', "",
        'Sources nat, eq each generate independent mechanical inductive types, counting towards T07; the old T06 bootstrap that directly replaces these two roots with Lean Nat, Eq is not enabled.', "",
        '**How to read quantities and evidence**', "",
        'Only entries confirmed by current artifacts or final retained paths are included. An implementation, an enabled switch, or source syntax is insufficient on its own. '
        'A branch reached only by a failed attempt is also insufficient.', "",
        '| Count column | Unit and meaning |',
        "|---|---|",
        '| Primary roots | The main translation of each root is checked; roots that meet the evidence conditions of the row are deduplicated by source name. |',
        '| Roots including quality branches | Check both the main translation and the quality branch of that root; a hit in either representation counts that root once. |',
        '| M direct roots | Distinct requested roots with retained events attributed to the root itself; dependency-only hits are not attributed to that root. |',
        '| M total declarations | All source declarations in retained events, including roots, dependencies, and auxiliaries; repeated names across modules count once. |',
        '| Mapping roots | Distinct source roots using the primitive mapping, verified against the target AST of each root itself. |', "",
        'None of these columns measures invocations or success rates. A declaration may use several rules, so rows cannot be added together. '
        'M total declarations and roots including quality branches count different populations and are not interchangeable. '
        'The M JSON also records retained events with repeated dependencies; this file does not treat that count as distinct declarations or total attempts.', "",
        '| Evidence category | What exactly was checked? |',
        "|---|---|",
        '| Artifact structure | Find corresponding structures such as variables, binding structures, references, or Sort in the target AST that finally passes the check. |',
        '| Export artifacts | Named obligations actually occur in the exported IR and the corresponding root translation passes checking; source proof syntax alone is insufficient. |',
        '| Result report fields | The accepted result records fields and values such as unfolded names, solved levels, or lift information. Each row states its criterion. |',
        '| Branch cross-check | The number of source quality family members is consistent with all translation branches that have passed the check. |',
        '| Accepted-path trace | The M transformation takes effect and its record remains in the accepted environment. Rolled-back attempts and attempts returning failure are excluded. |',
        '| Primitive target reference | The final AST of the mapping root itself actually references the specified target representation or operation. |', "",
        f"**Translation, export, and universe processing: {len(rules)}**", "",
        'Original identifiers are retained for traceability. Gaps identify catalog entries excluded from this confirmed inventory. '
        'Entries such as U06 check acceptance conditions; therefore these are processing entries, not all semantic rewrites.', "",
        '| Original ID | Rule / mechanism | Behavior | Primary roots | Roots including quality branches | Evidence category and criterion | Example root |',
        "|---|---|---|---:|---:|---|---|"]
    def esc(s):
        return str(s).replace("|", "&#124;").replace("\n", " ")
    ast_rules = {"T01", "T02", "T03", "U02"}
    for key, name, desc, primary, family, basis in sorted(rules, key=lambda r: r[0]):
        example = family[0]
        if key == "T07":
            example = "Corelib.Init.Datatypes.nat；Corelib.Init.Logic.eq"
            assert all(n in family for n in example.split("；"))
        category = ('Artifact structure' if key in ast_rules else 'Export artifacts' if key == "E04"
                    else 'Branch cross-check' if key == "Q05" else 'Result report fields')
        cells = [key, name, desc, len(primary), len(family), category + "：" + basis, example]
        lines.append("| " + " | ".join(esc(x) for x in cells) + " |")
    lines += ["", f"**Matching and recursive transformation: {len(mrules)} M rules**", "",
              'Each entry below has an independent accepted-path trace. Events roll back with environment saveState/restore; '
              'A retry returning failure normally also clears its events. Merely entering a lowering function or generating a discarded candidate does not count.', "",
              '| ID | Rule | Behavior | Direct roots | All declarations (including dependencies/auxiliaries) | Example root |',
              "|---|---|---|---:|---:|---|"]
    for r in mrules:
        examples = r["direct_roots"] or r["distinct_declarations"]
        lines.append("| " + " | ".join(map(esc, [
            r["id"], r["name"], r["description"], r["direct_root_count"],
            r["distinct_declaration_count"], examples[0]])) + " |")
    lines += ["", 'For the complete name lists, see [per-rule M statistics](' + mlink + "M_RULE_USAGE.json)。"
              'The M11 fallback may introduce proof obligations; a hit does not mean that well-foundedness has been proved.', "",
              f"**Primitive type mapping: {len(type_rows)} item**", "",
              'The evidence category is Primitive target reference: the final AST of each mapped root has been inspected. '
              'Listed here are the representation options for the Rocq primitive; mechanical nat and eq do not belong to these four primitive mappings.', "",
              '| source type root | target representation | Number of mapping roots |', "|---|---|---:|"]
    for name, target in type_rows:
        lines.append(f"| {name} | {target} | 1 |")
    lines += ["", f"**Primitive operation mapping: {len(primitive_rows)} item**", "",
              'The evidence category is also Primitive target reference: each source root itself refers to the specified Lean target. '
              'Each operation is listed separately; primitive-family totals are not counted again. '
              'The target may be a Rocq2Lean adapter. This evidence is not a correspondence proof with an existing Lean/Mathlib operation.', "",
              '| Source operation identifier | Lean Target | Number of mapping roots | source statement |', "|---|---|---:|---|"]
    for source, target, names in primitive_rows:
        lines.append("| " + " | ".join(map(esc, [source, target, len(names), "；".join(names)])) + " |")
    lines += ["", '**Full-library validation and inventory scope**', "",
              f"The same range rerun covers {scope['modules']} modules, of which {populated} contain request roots."
              f"{scope['modules'] - populated} have no request roots at this level."
              f"The results for {scope['roots']} roots are as follows; modules with requested roots all pass source roundtrip, independent Lean consumer and structure audit.", "",
              '| Final status | Roots | Meaning of a successful check |', "|---|---:|---|"]
    status_meanings = [
        ("TRANSLATED_AND_CHECKED", 'The translation passes checking with no proof premises awaiting assembly.'),
        ("STATEMENT_KERNEL_CHECKED", 'The statement passes kernel checking with no proof premises awaiting assembly; this does not mean that the source proof has been translated.'),
        ("PENDING_KERNEL_CHECKED", 'The translation passes checking with explicit proof premises that still require proof or assembly.'),
        ("STATEMENT_PENDING_KERNEL_CHECKED", 'The statement passes kernel checking with explicit proof premises; neither the source proof nor those premises is thereby completed.')]
    for status, meaning in status_meanings:
        lines.append(f"| {status} | {statuses[status]} | {meaning} |")
    pending = statuses["PENDING_KERNEL_CHECKED"] + statuses["STATEMENT_PENDING_KERNEL_CHECKED"]
    disabled = "、".join(scope["disabled_M_rules"])
    lines += ["", f"Total {sum(statuses.values())} root; blocked {scope['blocked_roots']}, verification failed "
              f"{len(scope['validation_failures'])}. Among them, {pending} has an explicit premise to be proven.", "",
              f"M Zero hits in measurement {disabled} is not included in the usage list above;"
              'These paths were disabled and the same scope was rerun, preserving target types, bodies, constructors, universes, and premises. '
              '[Disable rerun recording](' + mlink + 'M_PRUNING_VALIDATION.json) Save module-by-module results.', "",
              f"This supports the current configuration to complete the mechanical translation of the above Corelib range, and the {len(unused_m)} M paths can be disabled in this range."
              f"**{count} is the number of manifest entries under the current evidence granularity, not the number of rules that have been proven to be the smallest and exhaustive of all implementation branches. **"
              'C-aggregate, L03, and U04 still combine internal submechanisms; non-M paths have not been disabled and tested individually. '
              'Unlisted non-M submechanisms cannot therefore be classified as unused. See the [non-M scope description](' + mlink + "NON_M_SCOPE.md)。", "",
              '**Evidence files and reproduction**', "",
              '| File | Content and purpose |', "|---|---|",
              f"| [Product evidence by root ]({link}rule-usage-evidence.json) | source, primary, variants and inspection results; used for filtering original entries. |",
              f"| [Hit list of original entry ]({link}RULE_USAGE.json) | The names/family_names lists for original identifiers; C-aggregate filters delta_inlined directly. |",
              f"| [M Successful path statistics ]({mlink}M_RULE_USAGE.json) | Root names, all declaration names, and retained-event counts for each M rule. |",
              f"| [M Full library verification after disabling ]({mlink}M_PRUNING_VALIDATION.json) | Rerun within the same scope, module-by-module inspection, status counting and target unchanged results. |",
              f"| [Record reliability test ]({mlink}INSTRUMENTATION_TESTS.json) | Verify event retention on accepted paths, rejection of disabled paths, and absence of retained hits after rollback or normal failure returns. |",
              f"| [Complete rules catalog ]({link}ALL_RULES.md) | Trace historical numbers and rule descriptions; directory members are not automatically considered to have been used this time. |",
              '| [Generator script](../scripts/used_translation_rules.py) | Generate full text from the above evidence, checking lists, counts, success statuses, primitive references, and M validation for consistency. |', "",
              'Generate or check this file at the repository root:', "",
              "    python3 scripts/used_translation_rules.py",
              "    python3 scripts/used_translation_rules.py --check", "",
              'These commands read saved evidence without rebuilding or retranslating Corelib. '
              'For complete measurement, compilation and re-running steps, see [M workspace description](' + mlink + "README.md)。"
              'The original export, compiled files and logs are kept in the remote .work/used-rule-coverage-20261019/ and are not submitted to Git.', ""]
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
