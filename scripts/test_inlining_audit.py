#!/usr/bin/env python3
"""Audit real nested-inline artifacts and reject altered argument/binder identities."""
import sys,pathlib,json,copy,subprocess
T=pathlib.Path(sys.argv[1]).resolve();B=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir(parents=True,exist_ok=True)
rep=json.load(open(B/"translation_report.json"))
def run(r,label):
 p=O/(label+"-report.json");p.write_text(json.dumps(r))
 a=O/(label+"-audit.json")
 proc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(B/"source.ndjson"),str(B/"contract.json"),str(p),str(a),str(B/"consumer_result.json")],capture_output=True,text=True,timeout=120)
 assert proc.returncode in (0,1),(proc.returncode,proc.stderr)
 return json.load(open(a))
assert run(rep,"positive")["status"]=="OK"
checks={}
name="Corelib.Classes.CMorphisms.flip1"
for mode in ["argument-identity","missing-expansion"]:
 r=copy.deepcopy(rep);row=next(x for x in r["results"] if x["source"]==name)
 assert row["delta_inlined"]
 if mode=="missing-expansion":
  row["delta_inlined"]=[]
 else:
  done=[False]
  def mutate(x):
   if isinstance(x,dict):
    if not done[0] and x.get("k")=="app" and x["a"].get("k")=="bvar":
     x["a"]["i"]+=1;done[0]=True
    else:
     for v in x.values():mutate(v)
   elif isinstance(x,list):
    for v in x:mutate(v)
  mutate(row["target_type"]);assert done[0]
 a=run(r,mode)
 assert a["status"]=="AUDIT_REJECTED" and any(p["detector"]=="structure" and p["message"].startswith(name+":") for p in a["problems"]),a["problems"]
 checks[mode]="REJECTED"
(O/"result.json").write_text(json.dumps({"status":"PASS","negative_controls":checks},indent=2)+"\n")
print(json.dumps(checks))
