"""Compare every emitted declaration, including dependencies and quality cases."""
import json,pathlib,sys,collections
A,B,O=map(pathlib.Path,sys.argv[1:])
fields=["status","target","target_kind","level_params","target_type","target_value","target_ctors","pending_hypotheses"]
differences=[];total=0;missing=[];counts=collections.Counter()
for f in sorted((A/"Corelib").rglob("translation_report.json")):
 rel=f.relative_to(A);other=B/rel
 if not other.exists():missing.append(str(rel));continue
 old={r["source"]:r for r in json.loads(f.read_text())["results"]}
 new={r["source"]:r for r in json.loads(other.read_text())["results"]}
 for name in sorted(old.keys()|new.keys()):
  total+=1
  if name not in old or name not in new:
   differences.append({"module":str(rel.parent),"source":name,"fields":["declaration_presence"]});continue
  changed=[k for k in fields if old[name].get(k)!=new[name].get(k)]
  if changed:
   differences.append({"module":str(rel.parent),"source":name,"fields":changed})
   counts.update(changed)
out={"before":str(A),"after":str(B),"declaration_occurrences":total,"missing_modules":missing,
     "compared_fields":fields,"changed_field_counts":dict(counts),"differences":differences,
     "identical":not differences and not missing}
O.write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps({k:v for k,v in out.items() if k!="differences"}))
