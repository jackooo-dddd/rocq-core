import pathlib,sys,json,collections
S=pathlib.Path(sys.argv[1]);O=pathlib.Path(sys.argv[2]);roots=json.loads((S/"all-roots.json").read_text());counts=collections.Counter();tiers=collections.Counter();statuses=collections.Counter();seen=set()
flags=["source_computed","erasing_poly_inlined","poly_level_interp","level_interp","type_lift_coercions","prop_lift_coercions","admitting_levels","universe_lowered","result_sort_inherited","delta_inlined","pending_hypotheses","level_copies"]
for result in (S/"Corelib").rglob("result.json"):
 m=json.loads(result.read_text())
 if not m.get("root_results"):continue
 rep=json.loads((result.parent/"translation_report.json").read_text());rows={r["source"]:r for r in rep["results"]}
 timing=json.loads((result.parent/"translation_timing.json").read_text());times={r["source"]:r for r in timing["declarations"]}
 for name,root in m["root_results"].items():
  if name in seen:continue
  seen.add(name);canonical=root.get("canonical",name);r=rows.get(canonical,{})
  statuses[root["status"]]+=1
  for flag in flags:
   if r.get(flag):counts[flag]+=1
  ts=times.get(canonical,{}).get("tier_times",[])
  if ts:tiers[ts[-1][0]]+=1
assert seen==set(roots)
out={"roots":len(seen),"status":dict(statuses),"reported_rule_features":dict(counts),"last_attempt_tiers":dict(tiers)}
O.write_text(json.dumps(out,indent=2)+"\n");print(json.dumps(out),flush=True)
