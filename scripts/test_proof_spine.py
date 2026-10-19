#!/usr/bin/env python3
"""Check local-hypothesis applications without retaining constructed proofs."""
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import contract,protection,audit
roots=['CoreSpine.Spine.'+n for n in ['local_index','built_index','nested_index']]
def run(args,label):
 with open(O/(label+'.log'),'w') as f:return subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
checks={};positive=O/'positive';manifest=R/'translator/fixtures/corelib-proof-spine/source.json'
rc=run(['export','--mode','statement','--manifest',manifest,'--roots',','.join(roots),'--out',positive],'export');checks['export_exit']=rc;assert rc==0
rc=run(['translate','--input',positive/'source.ndjson','--out',positive],'translate');checks['translate_exit']=rc;assert rc==0
rc=run(['validate','--run',positive],'validate');checks['validate_exit']=rc;assert rc==0
rep=json.load(open(positive/'translation_report.json'));checks['roots']=[{'name':r['name'],'status':r['status']} for r in rep['roots']]
rows={r["name"]:r for r in map(json.loads,open(positive/"source.ndjson")) if r.get("kind") in ("constant","inductive")}
statuses={r["name"]:r["status"] for r in rep["roots"]}
assert statuses[roots[0]]=="TRANSLATED_AND_CHECKED",statuses
assert not rows[roots[0]].get("obligations"),rows[roots[0]]
for name in roots[1:]:
 assert statuses[name]=="PENDING_KERNEL_CHECKED",statuses
 assert len(rows[name].get("obligations",[]))==1,rows[name]
checks["obligation_counts"]={name:len(rows[name].get("obligations",[])) for name in roots}
checks["status"]="PASS"
(O/"result.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks))
