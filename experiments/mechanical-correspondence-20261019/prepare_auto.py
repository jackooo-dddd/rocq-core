from pathlib import Path
import re,json
W=Path(__file__).resolve().parent
R=W.parents[1];S=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
def compatible(text,targets):
 refs=set(re.findall(r'Rocq(?:Pending)?\\.Corelib(?:\\.[a-zA-Z0-9_]+)+',text))
 return all(any(r==t or r.startswith(t+'.') for t in targets) for r in refs)
# Correct escaped regex after writing is checked below.
def blocks(name):
 text=(W/'fragments'/f'{name}.lean').read_text()
 return re.split(r'(?=^@\\[simp\\] theorem |^theorem |^abbrev )',text,flags=re.M)
profiles={}
for p in sorted(S.rglob('translation_report.json')):
 report=json.loads(p.read_text());mod=str(p.parent.relative_to(S))
 targets={r['target'] for r in report['results'] if r.get('target')}
 roots={r['name'] for r in report['roots']}
 stmts=[r for r in report['results'] if r['source'] in roots and r['target_kind']=='statement' and not r['pending_hypotheses'] and r['target'].endswith('.statement')]
 if not stmts: continue
 name='Auto_'+mod.replace('/','_')
 parts=[(W/'fragments/Base.lean').read_text()]
 for source,frag in [('Rocq.Corelib.Init.Datatypes.nat','MechanicalNat'),('Rocq.Corelib.Init.Logic.eq','MechanicalEq')]:
  if source in targets: parts.append((W/'fragments'/f'{frag}.lean').read_text())
 if 'Rocq.Corelib.Init.Datatypes.bool' in targets: parts.append((W/'fragments/Bool.lean').read_text())
 for frag in ['Logic','MechanicalNatOps','MechanicalPeano']:
  text=(W/'fragments'/f'{frag}.lean').read_text()
  for b in re.split(r'(?=^@\[simp\] theorem |^theorem |^abbrev )',text,flags=re.M):
   refs=set(re.findall(r'Rocq(?:Pending)?\.Corelib(?:\.[a-zA-Z0-9_]+)+',b))
   if b.strip() and all(any(r==t or r.startswith(t+'.') for t in targets) for r in refs):
    parts.append(b)
 parts.append((W/'fragments/StatementTools.lean').read_text())
 parts.append('\n'.join('#native_statement '+r['target'] for r in stmts))
 parts.append((W/'fragments/Audit.lean').read_text().replace('AUDIT_PATH',str(W/'audits'/f'{name}.json')))
 (W/(name+'.lean')).write_text('\n'.join(parts))
 profiles[name]={'module':mod,'statements':len(stmts)}
(W/'auto/profiles.json').write_text(json.dumps(profiles,indent=2))
print('prepared',len(profiles),'profiles',sum(x['statements'] for x in profiles.values()),'statements')
