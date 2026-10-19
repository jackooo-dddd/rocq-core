#!/usr/bin/env python3
"""Greedy deletion, followed by a fixed-point pass and a full final replay."""
import json,time,sys,hashlib
from pathlib import Path
from evaluate import W,MODULES,evaluate,save
ALL=[x['id'] for x in json.loads((W/'mechanisms.json').read_text())]
BULK=['joint-levels','instance-hypotheses','phantom-sort','operand-split','set-delta','implicit-discovery','wf-obligations']
HINTS={'fact-reduce':'Corelib.Relations.Relation_Definitions','fact-interpretation':'Corelib.Classes.RelationClasses',
 'motive-sort':'Corelib.Init.Logic','cumulativity':'Corelib.ssr.ssreflect_rw',
 'reference-lowering':'Corelib.ssr.ssrbool','result-sort':'Corelib.Init.Datatypes',
 'occurrence-levels':'Corelib.ssr.ssrbool','prop-lift':'Corelib.Classes.CRelationClasses',
 'type-lift':'Corelib.Init.Specif','alias-delta':'Corelib.Init.Specif','source-compute':'Corelib.Classes.Morphisms',
 'carrier-copies':'Corelib.ssr.ssrbool','template-sort':'Corelib.Init.Logic','poly-model':'Corelib.Init.Specif'}
p=W/'reports/all-enabled.json'
while True:
 if p.exists():
  r=json.loads(p.read_text())
  if 'finished' in r:break
 time.sleep(5)
assert r['passed'] and r['root_count']==2180,r
assert r['target_changed_declarations']==0,'configuration changed the all-enabled baseline'
state={'status':'RUNNING','all_mechanisms':ALL,'disabled':[],'decisions':[]}
save(W/'selection.json',state)
bulk=evaluate(BULK,'bulk-unused')
disabled=BULK[:] if bulk['passed'] else []
state['decisions'].append({'trial':'bulk-unused','disabled':BULK,'removed':bulk['passed']})
state['disabled']=disabled[:];save(W/'selection.json',state)
for roundno in range(1,len(ALL)+2):
 changed=False;witnesses={}
 for name in ALL:
  if name in disabled:continue
  candidate=sorted(disabled+[name]);runid=f'round{roundno}-without-{name}'
  mods=list(MODULES);hint=HINTS.get(name)
  if hint:mods.remove(hint);mods.insert(0,hint)
  # First try the likely witness alone; if it passes, verify every module.
  res=evaluate(candidate,runid+'-probe',[hint],workers=1) if hint else None
  if res is None or res['passed']:res=evaluate(candidate,runid,mods)
  failures=[x for x in res['records'] if not x['passed']]
  if any(x.get('failure',{}).get('stage')=='infrastructure' for x in failures):
   state.update(status='INFRASTRUCTURE_ERROR',failure_run=res['run'])
   save(W/'selection.json',state);sys.exit(1)
  if res['passed']:
   assert res['full_scope'] and res['root_count']==2180
   disabled.append(name);changed=True
  else:
   witnesses[name]={'report':'reports/'+res['run']+'.json','module':failures[0]['module'],'failure':failures[0]['failure']}
  state['decisions'].append({'mechanism':name,'round':roundno,'trial':res['run'],'removed':res['passed']})
  state.update(disabled=sorted(disabled),round=roundno,witnesses=witnesses)
  save(W/'selection.json',state)
 if not changed:break
else:raise RuntimeError('greedy search did not stabilize')
final=evaluate(sorted(disabled),'final')
assert final['passed'] and final['root_count']==2180
state.update(status='TRANSLATION_VALIDATED',enabled=[n for n in ALL if n not in disabled],
             final_report='reports/final.json',finished=time.time(),
             minimality='single-deletion fixed point only among these optional mechanisms, with fixed core, implementation, checks and scope')
save(W/'selection.json',state)
save(W/'corelib.json',{'schema':'rocq2lean-corelib-mechanisms/1','enabled':state['enabled'],'disabled':sorted(disabled),
 'scope':'scope.json','fixed_core':'FIXED_CORE.md','preserve_status_and_prerequisites':True,'native_nat_eq_bootstrap':False})
print('SELECTED',state['enabled'],'REMOVED',disabled,flush=True)
