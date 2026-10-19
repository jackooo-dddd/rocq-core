#!/usr/bin/env python3
"""Roundtrip native integer literals and reject altered/out-of-range encodings."""
import pathlib,sys,json,subprocess,copy
T=pathlib.Path(sys.argv[1]).resolve();SRC=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli,roundtrip
env=cli.opam_env()
def run(src,sub):
 out=O/sub
 with open(O/(sub+".log"),"w") as f:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/roundtrip.py"),str(src),str(out)]+(sys.argv[4:] or ["--","Corelib.Numbers.Cyclic.Int63.PrimInt63"]),env=env,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
 result=json.load(open(out/"roundtrip.json")) if (out/"roundtrip.json").exists() else {}
 return rc,result
rc,pos=run(SRC,"positive");assert rc==0 and pos.get("status")=="OK",(rc,pos)
rows=[json.loads(l) for l in open(SRC)];hit=[]
def mutate(x):
 if isinstance(x,dict):
  if not hit and x.get("k")=="int":
   old=x["v"];x["v"]=str((int(old)+1)%(2**63));hit.append((old,x["v"]))
  else:
   for v in x.values():mutate(v)
 elif isinstance(x,list):
  for v in x:mutate(v)
mutate(rows);assert hit
bad=O/"mutated.ndjson";bad.write_text("".join(json.dumps(r)+"\n" for r in rows))
rc,neg=run(bad,"changed-literal");assert rc!=0 and neg.get("status")!="OK",(rc,neg)
for bad_literal in ["-1",str(2**63),"12abc","0; Set Guard Checking.",None]:
 try:roundtrip.Dec({}).term({"k":"int","v":bad_literal})
 except roundtrip.Unsupported:pass
 else:raise AssertionError("accepted invalid integer literal")
result={"reject_invalid_encodings":True,"status":"PASS","positive_checked":pos.get("checked"),"changed_literal":hit[0],"negative_status":neg.get("status"),"negative_problems":neg.get("problems")}
(O/"result.json").write_text(json.dumps(result,indent=2)+"\n");print(json.dumps(result))
