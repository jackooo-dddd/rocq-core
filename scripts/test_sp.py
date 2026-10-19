#!/usr/bin/env python3
"""End-to-end strict-proposition rule regression and negative controls."""
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import contract,protection,audit
roots=['CoreSP.Strict.'+n for n in ['strict_domain','strict_index','strict_function','strict_quantifier','strict_unit','strict_unit_index','data_identity']]
def run(args,label):
 with open(O/(label+'.log'),'w') as f:return subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
checks={};positive=O/'positive';manifest=R/'translator/fixtures/corelib-sp/source.json'
rc=run(['export','--mode','statement','--manifest',manifest,'--roots',','.join(roots),'--out',positive],'export');checks['export_exit']=rc;assert rc==0
rc=run(['translate','--input',positive/'source.ndjson','--out',positive],'translate');checks['translate_exit']=rc;assert rc==0
rc=run(['validate','--run',positive],'validate');checks['validate_exit']=rc;assert rc==0
rep=json.load(open(positive/'translation_report.json'));checks['roots']=[{'name':r['name'],'status':r['status']} for r in rep['roots']]
# Independent audit must reject mapping strict propositions to any nonzero sort.
checker=audit.Auditor({},{});s={'k':'sort','s':{'k':'sprop'}}
checker.check(s,{'k':'sort','l':{'k':'zero'}},[])
for label,l in [('Type',{'k':'succ','l':{'k':'zero'}}),('universe_parameter',{'k':'param','n':'u'})]:
 try:checker.check(s,{'k':'sort','l':l},[])
 except audit.Mismatch:checks['reject_sprop_as_'+label]=True
 else:raise AssertionError('auditor accepted incorrect SProp target sort')
# A malformed IR cannot label a data binder as irrelevant and pass translation.
rows=[json.loads(l) for l in open(positive/'source.ndjson')]
for row in rows:
 if row.get('name')=='CoreSP.Strict.data_identity':
  assert row['type']['k']=='prod';row['type']['n']['r']='I';assert row['body']['k']=='lam';row['body']['n']['r']='I'
bad=O/'bad-relevance';bad.mkdir(exist_ok=True);ir=bad/'source.ndjson';ir.write_text(''.join(json.dumps(r,separators=(',',':'))+'\n' for r in rows))
con=contract.build(ir,roots,protection=protection.binding([r['name'] for r in rows if r['kind'] in ('constant','inductive')]))
(bad/'contract.json').write_text(json.dumps(con,indent=2)+'\n')
run(['translate','--input',ir,'--out',bad],'bad-relevance-translate')
brep=json.load(open(bad/'translation_report.json'));b=next(r for r in brep['results'] if r['source']=='CoreSP.Strict.data_identity');checks['bad_relevance_status']=b['status'];checks['bad_relevance_message']=b['message'];assert b['status']=='EXPORT_VALIDATION_FAILED' and 'non-propositional' in b['message']
checks['status']='PASS';(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))
