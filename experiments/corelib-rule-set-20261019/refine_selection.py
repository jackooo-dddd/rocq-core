#!/usr/bin/env python3
"""Retest the retained set under the final policy; preserve every decisive witness."""
import json,time,sys
from evaluate import W,MODULES,evaluate,save
ALL=[x['id'] for x in json.loads((W/'mechanisms.json').read_text())]
while True:
 p=W/'selection.json'
 if p.exists():
  seed=json.loads(p.read_text())
  if seed.get('status')=='TRANSLATION_VALIDATED':break
 time.sleep(5)
disabled=seed['disabled'][:]
hints={n:w['module'] for n,w in seed['witnesses'].items()}
state={'status':'RUNNING','seed':'selection.json','disabled':disabled,'decisions':[]}
for roundno in range(1,len(ALL)+2):
 changed=False;witnesses={}
 for name in ALL:
  if name in disabled:continue
  candidate=sorted(disabled+[name]);runid=f'minimal-r{roundno}-without-{name}'
  hint=hints.get(name);res=evaluate(candidate,runid+'-probe',[hint],workers=1) if hint else None
  if res is None or res['passed']:res=evaluate(candidate,runid)
  failures=[x for x in res['records'] if not x['passed']]
  if any(x.get('failure',{}).get('stage')=='infrastructure' for x in failures):
   state.update(status='INFRASTRUCTURE_ERROR',failure_run=res['run']);save(W/'verified-selection.json',state);sys.exit(1)
  if res['passed']:
   assert res['full_scope'] and res['root_count']==2180
   disabled.append(name);changed=True
  else:
   f=failures[0]
   witnesses[name]={'report':'reports/'+res['run']+'.json','module':f['module'],'failure':f['failure']}
  state['decisions'].append({'mechanism':name,'round':roundno,'trial':res['run'],'removed':res['passed']})
  state.update(disabled=sorted(disabled),round=roundno,witnesses=witnesses)
  save(W/'verified-selection.json',state)
 if not changed:break
else:raise RuntimeError('did not stabilize')
final=evaluate(sorted(disabled),'selected')
assert final['passed'] and final['root_count']==2180
state.update(status='TRANSLATION_VALIDATED',enabled=[n for n in ALL if n not in disabled],final_report='reports/selected.json',
 scope_roots=2180,scope_modules=67,finished=time.time(),
 minimality='single-deletion fixed point among 21 optional entry mechanisms; fixed core not minimized')
save(W/'verified-selection.json',state)
save(W/'corelib.json',{'schema':'rocq2lean-corelib-mechanisms/1','enabled':state['enabled'],'disabled':sorted(disabled),
 'scope':'scope.json','fixed_core':'FIXED_CORE.md','prerequisite_policy':'no new; reductions need independent audit','native_nat_eq_bootstrap':False})
print('FINAL ENABLED',state['enabled'],'DISABLED',disabled,flush=True)
