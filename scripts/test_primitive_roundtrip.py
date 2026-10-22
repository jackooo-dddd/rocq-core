#!/usr/bin/env python3
"""Fresh-source primitive checks, including coherent signature and literal mutations."""
import pathlib,sys,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]).resolve()
O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/'tools'))
import rocq2lean as cli,roundtrip
env=cli.opam_env()
results={}
def run(rows,tag,flags):
 src=O/(tag+'.ndjson');src.write_text(''.join(json.dumps(r)+'\n' for r in rows))
 out=O/tag
 with (O/(tag+'.log')).open('w') as log:
  p=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(out),*flags],env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 report=json.loads((out/'roundtrip.json').read_text()) if (out/'roundtrip.json').exists() else {}
 results[tag]={'exit':p.returncode,'status':report.get('status'),'problems':report.get('problems',[])[:5]}
 print(tag,results[tag],flush=True)
 return p.returncode,report
src=R/'work/runs/primitive-signatures-probe/Corelib/Numbers/Cyclic/Int63/PrimInt63/source.ndjson'
rows=[json.loads(l) for l in src.read_text().splitlines()]
idx=next(i for i,r in enumerate(rows) if (r.get('native') or {}).get('body_kind')=='primitive')
flags=['--','Corelib.Numbers.Cyclic.Int63.PrimInt63']
rc,rep=run(rows,'native-positive',flags);assert rc==0 and rep.get('status')=='OK'
for tag in ['operator','type','universes','relevance','body','body_state','coherent-type','missing-signature']:
 bad=copy.deepcopy(rows);d=bad[idx]
 if tag=='operator':d['native']['primitive_signature']['operator']='int63_wrong_operator'
 elif tag=='type':d['type']={'k':'sort','s':{'k':'prop'}}
 elif tag=='universes':d['universes']={'invalid':'universe-context'}
 elif tag=='relevance':d['relevance']='irrelevant' if d['relevance']!='irrelevant' else 'relevant'
 elif tag=='body':d['body']={'k':'int','v':'0'}
 elif tag=='body_state':d['body_state']='assumption'
 elif tag=='coherent-type':
  d['type']={'k':'sort','s':{'k':'prop'}}
  d['native']['primitive_signature']['type']=copy.deepcopy(d['type'])
 else:del d['native']['primitive_signature']
 rc,rep=run(bad,'native-'+tag,flags);assert rc!=0 and rep.get('status')=='EXPORT_VALIDATION_FAILED',tag
fixture=R/'translator/fixtures/corelib-primitive-literals'
exp=O/'export'
subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),'export','--mode','statement','--manifest',str(fixture/'source.json'),'--roots',','.join('CorePrim.Literals.'+n for n in ['plus_zero','minus_zero','quiet_nan','pos_inf','neg_inf','fraction','raw_bytes','small_array']),'--out',str(exp)],check=True,env=env)
rows=[json.loads(l) for l in (exp/'source.ndjson').read_text().splitlines()]
flags=['-Q',str(fixture),'CorePrim','--','CorePrim.Literals']
rc,rep=run(rows,'literals-positive',flags);assert rc==0 and rep.get('status')=='OK'
def find(x,kind):
 if isinstance(x,dict):
  if x.get('k')==kind:yield x
  for v in x.values():yield from find(v,kind)
 elif isinstance(x,list):
  for v in x:yield from find(v,kind)
for kind in ['float','string','array']:
 values=list(find(rows,kind));assert values,kind
 print('LITERAL_VALUES',kind,values,flush=True)
 if kind=='float':assert {'0x0p+0','-0x0p+0','nan','infinity','neg_infinity'} <= {v['v'] for v in values}
for tag in ['zero-sign','byte-content','array-element','array-default']:
 bad=copy.deepcopy(rows)
 if tag=='zero-sign':
  node=next(x for x in find(bad,'float') if x['v']=='0x0p+0');node['v']='-0x0p+0'
 elif tag=='byte-content':next(find(bad,'string'))['bytes'][1]=129
 elif tag=='array-element':next(find(bad,'array'))['elems'][0]['v']='8'
 else:next(find(bad,'array'))['default']['v']='6'
 rc,rep=run(bad,tag,flags);assert rc!=0 and rep.get('status')=='EXPORT_VALIDATION_FAILED',tag
for node in [{'k':'string','bytes':[True]},{'k':'string','bytes':[-1]},{'k':'string','bytes':[256]},{'k':'string','v':'\u6c34'},{'k':'float','v':'0; Set Guard Checking.'}]:
 try:roundtrip.Dec({}).term(node)
 except roundtrip.Unsupported:pass
 else:raise AssertionError(('accepted-invalid',node))
(O/'result.json').write_text(json.dumps({'status':'PASS','checks':results,'invalid_literals_rejected':True},indent=2)+'\n')
