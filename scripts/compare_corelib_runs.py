#!/usr/bin/env python3
"""Compare fixed Corelib scope, keeping status and independent validation distinct."""
import argparse,collections,csv,json,pathlib
P=pathlib.Path
R=P(__file__).resolve().parents[1]
a=argparse.ArgumentParser();a.add_argument("before",type=P);a.add_argument("after",type=P);a.add_argument("--out",type=P,required=True);x=a.parse_args()
good={"TRANSLATED_AND_CHECKED","STATEMENT_KERNEL_CHECKED","PENDING_KERNEL_CHECKED","STATEMENT_PENDING_KERNEL_CHECKED","BOOTSTRAP_RESOLVED"}
def read(p):
 roots=json.load(open(p/"all-roots.json"));mods={}
 for f in (p/"Corelib").rglob("result.json"):
  d=json.load(open(f))
  if "root_results" in d:
   for n in d["root_results"]:mods[n]=d
 assert set(roots)==set(mods)
 return roots,mods
b,bm=read(x.before);a,am=read(x.after);assert set(b)==set(a)
old={r["source"].replace("/",".") for r in csv.DictReader(open(R/"improved/declarations.csv"))};assert old<=set(a)
def counts(rs,ms,keys):
 return {"total":len(keys),"blocked_status":sum(rs[n]["status"] not in good for n in keys),
         "good_status_checked":sum(rs[n]["status"] in good and ms[n]["checked"] for n in keys),
         "good_status_validation_incomplete":sum(rs[n]["status"] in good and not ms[n]["checked"] for n in keys)}
out={"before":str(x.before),"after":str(x.after),"scope":{"original_839":{"before":counts(b,bm,old),"after":counts(a,am,old)},
 "added_1341":{"before":counts(b,bm,set(a)-old),"after":counts(a,am,set(a)-old)},
 "full_2180":{"before":counts(b,bm,set(a)),"after":counts(a,am,set(a))}}}
changes=[{"source":n,"module":am[n]["module"],"from":b[n]["status"],"to":a[n]["status"],"checked":am[n]["checked"]} for n in sorted(a) if b[n]["status"]!=a[n]["status"]]
out["changes"]=changes
out["verified_unblocked"]=[d for d in changes if d["from"] not in good and d["to"] in good and d["checked"]]
out["status_regressions"]=[d for d in changes if d["from"] in good and d["to"] not in good]
out["validation_regressions"]=sorted({am[n]["module"] for n in a if bm[n]["checked"] and not am[n]["checked"]})
out["validation_failures"]=sorted({am[n]["module"] for n in a if not am[n]["checked"]})
x.out.parent.mkdir(parents=True,exist_ok=True);x.out.write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps({k:v for k,v in out.items() if k not in {"changes","verified_unblocked"}}))
print("verified_unblocked",len(out["verified_unblocked"]))
