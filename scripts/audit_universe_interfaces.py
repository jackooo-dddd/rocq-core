"""Audit visible universe structure of original roots; no delta unfolding."""
import pathlib,json,collections,sys
S,O=map(pathlib.Path,sys.argv[1:])
def walk(t):
 if isinstance(t,dict):
  yield t
  for v in t.values():yield from walk(v)
 elif isinstance(t,list):
  for v in t:yield from walk(v)
features=["admitting_levels","universe_lowered","type_lift_coercions","prop_lift_coercions",
"poly_level_interp","level_interp","result_sort_inherited","level_copies","level_split",
"sort_interp","sort_fact_reduced","template_sort","implicit_levels"]
roots=[]
for p in sorted((S/"Corelib").rglob("result.json")):
 m=json.loads(p.read_text())
 if not m["root_results"]:continue
 rows={x["source"]:x for x in json.loads((p.parent/"translation_report.json").read_text())["results"]}
 source={}
 for line in (p.parent/"source.ndjson").open():
  x=json.loads(line)
  if x.get("kind") in {"constant","inductive"}:source[x["name"]]=x
 for n,result in sorted(m["root_results"].items()):
  key=result.get("canonical",n);row=rows[key]
  interface=row.get("target_value") if row.get("target_kind")=="statement" else row.get("target_type")
  terms=list(walk([interface,row.get("target_ctors")]))
  allterms=list(walk([row.get("target_type"),row.get("target_value"),row.get("target_ctors")]))
  ctx=source[key].get("universes",{})
  roots.append({"source":n,"status":row["status"],"target":row["target"],"nparams":len(row["level_params"]),
   "params":row["level_params"],"source_universes":ctx,
   "source_explicit_polymorphic_params":len(ctx.get("names",[])),
   "max_interface":any(t.get("k") in {"max","imax"} for t in terms),
   "lift_interface":any(t.get("k")=="const" and t.get("n","").startswith("PULift") for t in terms),
   "lift_any":any(t.get("k")=="const" and t.get("n","").startswith("PULift") for t in allterms),
   "features":[k for k in features if row.get(k)],"poly_level_interp":row.get("poly_level_interp")})
gens=[d for d in roots if d["status"]!="BOOTSTRAP_RESOLVED"]
out={"run":str(S.resolve()),"method":"Original roots only. Statement interface is its proposition body; other interfaces use target_type and constructor types. Explicit syntax only, no alias unfolding. Extra quality variants not counted as additional roots. Any BOOTSTRAP_RESOLVED rows are excluded from generated parameter distribution; current mechanical baseline has none.",
 "total_roots":len(roots),"generated_roots":len(gens),
 "parameter_count_distribution":dict(sorted(collections.Counter(d["nparams"] for d in gens).items())),
 "max_or_imax_in_interface":sum(d["max_interface"]for d in gens),
 "PULift_in_interface":sum(d["lift_interface"]for d in gens),
 "PULift_anywhere_in_target":sum(d["lift_any"]for d in gens),
 "feature_counts":dict(collections.Counter(f for d in gens for f in d["features"])),
 "per_root":roots}
O.write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps({k:v for k,v in out.items()if k!="per_root"},indent=2))
