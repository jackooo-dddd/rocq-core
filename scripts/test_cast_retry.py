#!/usr/bin/env python3
"""Check actual recovered declarations, failed-to-success tier sequence and audit rejection."""
import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();RUN=pathlib.Path(sys.argv[3]).resolve()
O.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
sys.path.insert(0,str(T/"tests"));from lib import audit_report
base=RUN/"Corelib/Classes/CMorphisms"
assert json.loads((base/"result.json").read_text())["checked"]
assert json.loads((base/"audit.json").read_text())["status"]=="OK"
rep=json.loads((base/"translation_report.json").read_text())
timing=json.loads((base/"translation_timing.json").read_text())["declarations"]
names=["Reflexive_partial_app_morphism","proper_normalizes_proper","proper_sym_flip","proper_sym_flip_2"]
targets=[next(d for d in rep["results"]if d["source"]=="Corelib.Classes.CMorphisms."+n)for n in names]
for name in ["source.ndjson","contract.json","consumer_result.json"]:(O/name).write_bytes((base/name).read_bytes())
negatives=[];sequences=[]
for original in targets:
 root=original["source"]
 assert original["protected"] and original["status"]=="TRANSLATED_AND_CHECKED"
 assert not original["pending_hypotheses"]
 times=next(d["tier_times"]for d in timing if d["source"]==root)
 failed=[i for i,t in enumerate(times)if "function expected" in t[2]]
 accepted=[i for i,t in enumerate(times)if t[2]=="TRANSLATED_AND_CHECKED"]
 assert failed and accepted and min(failed)<max(accepted),(root,times)
 sequences.append({"source":root,"first_failure":times[min(failed)],"accepted":times[max(accepted)]})
 for tag in ["wrong-body","wrong-universe-interpretation","missing-expansion"]:
  bad=copy.deepcopy(rep);row=next(d for d in bad["results"]if d["source"]==root)
  if tag=="wrong-body":row["target_value"]={"k":"natlit","v":773}
  elif tag=="wrong-universe-interpretation":
   assert row["poly_level_interp"];row["poly_level_interp"][0]={"k":"zero"}
  else:
   assert row["delta_inlined"];row["delta_inlined"]=[]
  rc,probs=audit_report(O,bad,root.rsplit(".",1)[-1]+"-"+tag)
  assert rc==1 and any(p["message"].startswith(root+":")for p in probs),(root,tag,probs)
  negatives.append([root,tag])
lean=O/"Clients.lean";lean.write_text("import Rocq2LeanOut\n"+"\n".join("#print axioms "+d["target"]for d in targets)+"\n")
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(base/"lean")
with (O/"clients.log").open("w")as log:
 rc=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(lean)],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,(O/"clients.log").read_text()
assert (O/"clients.log").read_text().count("does not depend on any axioms")==4
out={"status":"PASS","recovered_declarations":names,"failed_then_accepted":sequences,"negative_controls":negatives,"axiom_free_definitions":4}
(O/"result.json").write_text(json.dumps(out,indent=2)+"\n");print(json.dumps(out),flush=True)
