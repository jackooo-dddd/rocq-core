#!/usr/bin/env python3
"""Preserve explicit universe instances on pending proof prerequisites."""
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import contract,protection,audit
roots=['CorePrereq.Prereq.'+n for n in ['refl_task','witness','two']]
def run(args,label):
 with open(O/(label+'.log'),'w') as f:return subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
checks={};positive=O/'positive';manifest=R/'translator/fixtures/corelib-poly-prereq/source.json'
rc=run(['export','--mode','statement','--manifest',manifest,'--roots',','.join(roots),'--out',positive],'export');checks['export_exit']=rc;assert rc==0
rc=run(['translate','--input',positive/'source.ndjson','--out',positive],'translate');checks['translate_exit']=rc;assert rc==0
rc=run(['validate','--run',positive],'validate');checks['validate_exit']=rc;assert rc==0
rep=json.load(open(positive/'translation_report.json'));checks['roots']=[{'name':r['name'],'status':r['status']} for r in rep['roots']]
rows={r["name"]:r for r in map(json.loads,open(positive/"source.ndjson")) if r.get("kind") in ("constant","inductive")}
statuses={r["name"]:r["status"] for r in rep["roots"]}
assert statuses[roots[0]]=="STATEMENT_KERNEL_CHECKED",statuses
assert all(statuses[n]=="PENDING_KERNEL_CHECKED" for n in roots[1:]),statuses
# The same proof task at different source universes needs different hypotheses.
r=next(r for r in rep["results"] if r["source"]==roots[2])
hs=r["pending_hypotheses"]
assert len(hs)==2 and hs[0]==hs[1],hs
checks["two_instance_hypotheses"]=hs
leaf=hs[0]
checker=audit.Auditor(rows,{})
checker.leaves={leaf}
source={"k":"const","c":leaf,"u":[{"k":"var","i":0}]}
p0={"k":"param","n":"v_0"};p1={"k":"param","n":"v_1"}
env=[("hyp",leaf,0,[p0]),("hyp",leaf,1,[p1])]
checker.check(source,{"k":"bvar","i":0},[],env)
for label,e in [("wrong-instance",{"k":"bvar","i":1}),("not-a-hypothesis",{"k":"bvar","i":2})]:
 try:checker.check(source,e,[],env)
 except audit.Mismatch:checks["reject_"+label]=True
 else:raise AssertionError("auditor accepted "+label)
try:checker.check(dict(source,u=[]),{"k":"bvar","i":0},[],env)
except audit.Mismatch:checks["reject_missing_source_instance"]=True
else:raise AssertionError("auditor accepted missing source instance")
checks["status"]="PASS"
(O/"result.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks))
