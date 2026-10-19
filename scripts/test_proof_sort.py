#!/usr/bin/env python3
"""Classify transparent propositional aliases by their reduced source type."""
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import contract,protection,audit
roots=['CoreSort.Aliases.'+n for n in ['prop_alias','alias_proof','alias_function','ordinary_data','ordinary_type']]
def run(args,label):
 with open(O/(label+'.log'),'w') as f:return subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
checks={};positive=O/'positive';manifest=R/'translator/fixtures/corelib-proof-sort/source.json'
rc=run(['export','--mode','statement','--manifest',manifest,'--roots',','.join(roots),'--out',positive],'export');checks['export_exit']=rc;assert rc==0
rc=run(['translate','--input',positive/'source.ndjson','--out',positive],'translate');checks['translate_exit']=rc;assert rc in (0,2)
rc=run(['validate','--run',positive],'validate');checks['validate_exit']=rc;assert rc==0
rep=json.load(open(positive/'translation_report.json'));checks['roots']=[{'name':r['name'],'status':r['status']} for r in rep['roots']]
rows={r["name"]:r for r in map(json.loads,open(positive/"source.ndjson")) if r.get("kind") in ("constant","inductive")}
statuses={r["name"]:r["status"] for r in rep["roots"]}
for name in roots[1:3]:
 assert rows[name]["body_state"]=="statement_only" and rows[name]["body"] is None,rows[name]
 assert statuses[name]=="STATEMENT_KERNEL_CHECKED",statuses
for name in (roots[0],roots[3]):
 assert rows[name]["body"] is not None and statuses[name]=="TRANSLATED_AND_CHECKED",statuses
checks["source_classification"]={name:rows[name]["body_state"] for name in roots}
assert statuses[roots[4]]=="KERNEL_REJECTED",statuses
assert rows[roots[4]]["body"] is not None
assert set(statuses)==set(roots)
checks["known_unresolved_cumulativity"]=[roots[4]]
checks["status"]="PASS_PROOF_CLASSIFICATION"
(O/"result.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks))
