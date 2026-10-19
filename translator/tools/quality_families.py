"""Complete native sort-quality families; source checks never trust report success."""
import itertools
import json
import subprocess
from pathlib import Path

QUALITIES = ("SProp", "Prop", "Type")
POLICY = "uniform_source_implementation"

def branch_name(source, qualities):
    if all(q == "Type" for q in qualities):
        return source
    return source + "__rocq2lean_quality_" + "".join(dict(SProp="S", Prop="P", Type="T")[q] for q in qualities)

def descriptors(decls):
    """Recompute branch identity and full finite coverage from source metadata."""
    if not isinstance(decls, dict):
        decls = {d["name"]: d for d in decls}
    families = {}
    owned = set()
    for name, d in decls.items():
        f = (d.get("native") or {}).get("quality_family")
        if f is None:
            continue
        if d["kind"] != "constant" or f.get("source") != name:
            raise ValueError("quality family is not bound to its original constant")
        nq, nu = f.get("quality_parameters"), f.get("level_parameters")
        if type(nq) is not int or nq < 1 or type(nu) is not int or nu < 0:
            raise ValueError(name + ": malformed quality/level arity")
        if f.get("quality_constraints") != [] or f.get("source_proof_valued") is not False or f.get("implementation_policy") != POLICY:
            raise ValueError(name + ": unsupported uniform source quality context")
        if f.get("body_kind") not in ("transparent", "opaque"):
            raise ValueError(name + ": missing original body/opacity")
        raw_members = f.get("members") or []
        if any(type(m.get("proof_valued")) is not bool for m in raw_members):
            raise ValueError(name + ": missing native branch role")
        want = [{"qualities": list(qs), "name": branch_name(name, qs), "proof_valued": m["proof_valued"]}
                for qs, m in zip(itertools.product(QUALITIES, repeat=nq), raw_members)]
        if len(want) != 3 ** nq or raw_members != want:
            raise ValueError(name + ": missing, duplicate, reordered or misbound quality case")
        for m in want:
            n = m["name"]
            if n in owned or n not in decls:
                raise ValueError(name + ": quality branch missing or multiply owned: " + n)
            owned.add(n)
            b = decls[n]
            native = b.get("native") or {}
            expected = {"source": name, "qualities": m["qualities"], "proof_valued": m["proof_valued"], "implementation_policy": POLICY}
            if native.get("quality_branch") != expected or native.get("body_kind") != f["body_kind"]:
                raise ValueError(n + ": quality branch identity/opacity differs from its family")
            if b.get("body_state") != ("opaque_present" if f["body_kind"] == "opaque" else "transparent") or b.get("body") is None:
                raise ValueError(n + ": uniform implementation was omitted or changed opacity")
            ud = b.get("universes") or {}
            if ud.get("k") != "polymorphic" or len(ud.get("names", [])) != nu:
                raise ValueError(n + ": quality branch loses original level arity")
        families[name] = f
    for n, d in decls.items():
        if (d.get("native") or {}).get("quality_branch") is not None and n not in owned:
            raise ValueError(n + ": orphan native quality branch")
    return families

def members(d):
    native = d.get("native") or {}
    family = native.get("quality_family")
    if family:
        return [x["name"] for x in family["members"]]
    branch = native.get("quality_branch")
    return [branch["source"]] if branch else []

def contract_families(decls):
    fs = descriptors(decls)
    return [fs[n] for n in sorted(fs)]

def branch_kinds(decls):
    """Only structurally complete source families receive implementation kinds."""
    return {m["name"]: ("def" if f["body_kind"] == "transparent" else
                       ("theorem" if m["proof_valued"] else "opaque"))
            for f in descriptors(decls).values() for m in f["members"]}

def check_rows(decls, con, rows, problem):
    try:
        fs = descriptors(decls)
        if con.get("quality_families", []) != [fs[n] for n in sorted(fs)]:
            problem("quality_family", "contract quality-family binding differs from the source")
        by = {r["source"]: r for r in rows}
        for name, f in fs.items():
            failed = [m["name"] for m in f["members"]
                      if by.get(m["name"], {}).get("status") != "TRANSLATED_AND_CHECKED"]
            if by.get(name, {}).get("status") == "TRANSLATED_AND_CHECKED" and failed:
                problem("quality_family", name + ": incomplete family reported as accepted: " + str(failed))
            for m in f["members"]:
                r = by.get(m["name"], {})
                if r.get("status") != "TRANSLATED_AND_CHECKED":
                    continue
                if r.get("level_params") != ["v_" + str(i) for i in range(f["level_parameters"])]:
                    problem("quality_family", m["name"] + ": original public level parameters changed")
                if r.get("r2bp_levels") or r.get("sort_lowered_levels") or r.get("pending_hypotheses"):
                    problem("quality_family", m["name"] + ": specialized or conditional family implementation")
                kind = "def" if f["body_kind"] == "transparent" else ("theorem" if m["proof_valued"] else "opaque")
                if r.get("target_kind") != kind:
                    problem("quality_family", m["name"] + ": original family opacity changed")
    except (ValueError, KeyError, TypeError) as e:
        problem("quality_family", str(e))

def check_native(decls, out, loadpaths, requires):
    """Fresh native source replay, checking every field of every quality case."""
    out = Path(out); out.mkdir(parents=True, exist_ok=True)
    by = {d["name"]: d for d in decls}
    results, problems = {}, []
    try:
        fs = descriptors(by)
    except (ValueError, KeyError, TypeError) as e:
        return {"results": {}, "problems": ["quality family: " + str(e)]}
    if not fs:
        return {"results": {}, "problems": []}
    plugin = Path(__file__).resolve().parent.parent / "rocq/exporter"
    lines = ["From Rocq2LeanExport Require Import Loader.", *["Require " + r + "." for r in requires]]
    outputs = {}
    for i, name in enumerate(sorted(fs)):
        output = out / ("native-family-" + str(i) + ".json"); outputs[name] = output
        lines.append("Rocq2Lean NativeQualityFamily " + json.dumps(name) + " " + json.dumps(str(output)) + ".")
    v = out / "RoundTripQualityFamilies.v"; v.write_text("\n".join(lines) + "\n")
    p = subprocess.run(["rocq", "compile", "-I", str(plugin / "src"), "-Q", str(plugin / "theories"),
                        "Rocq2LeanExport", *loadpaths, str(v)], capture_output=True, text=True)
    (out / "native-family.log").write_text(p.stdout + p.stderr)
    if p.returncode:
        problems.append("native quality family replay exited with " + str(p.returncode))
    for name, f in fs.items():
        try:
            native = json.loads(outputs[name].read_text())
            if native.get("schema") != "rocq2lean-native-quality-family/1":
                raise ValueError("unknown native quality family schema")
            for k in ("source", "body_kind", "quality_parameters", "level_parameters",
                      "implementation_policy", "source_proof_valued", "quality_constraints"):
                if native.get(k) != f.get(k):
                    raise ValueError("native original family metadata differs: " + k)
            cases = native["cases"]
            if [c["qualities"] for c in cases] != [m["qualities"] for m in f["members"]]:
                raise ValueError("native quality-case coverage differs")
            for c, m in zip(cases, f["members"]):
                d = by[m["name"]]
                ok = all(d[k] == c[k] for k in ("type", "body", "universes")) and c.get("proof_valued") == m["proof_valued"]
                ok = ok and d["native"]["typing_flags"] == native["typing_flags"]
                ok = ok and all(c.get(k) is True for k in (
                    "native_declared_type_conversion", "native_value_conversion", "native_kernel_check"))
                results[d["name"]] = "RT_OK" if ok else "RT_QUALITY_FAMILY_MISMATCH"
        except (OSError, ValueError, KeyError, TypeError) as e:
            problems.append(name + ": native quality family mismatch: " + str(e))
    return {"results": results, "problems": problems}
