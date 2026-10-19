from pathlib import Path
import json,re
W=Path(__file__).resolve().parent;S=W.parents[1]/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
D=W/'interfaces';D.mkdir(exist_ok=True)
profiles={}
for p in sorted(S.rglob('translation_report.json')):
 r=json.loads(p.read_text());roots={x['name'] for x in r['roots']}
 candidates=[x for x in r['results'] if x['source'] in roots and x['target_kind']=='def' and not x['pending_hypotheses']]
 if not candidates:continue
 mod=str(p.parent.relative_to(S));name='Interface_'+mod.replace('/','_')
 targets={x['target'] for x in r['results'] if x.get('target')}
 parts=[(W/'fragments/Base.lean').read_text()];used=[]
 for source,frag in [('Rocq.Corelib.Init.Datatypes.nat','MechanicalNat'),('Rocq.Corelib.Init.Logic.eq','MechanicalEq')]:
  if source in targets: parts.append((W/'fragments'/f'{frag}.lean').read_text())
 for frag in ['Bool','Comparison','List','Datatypes','Binary','Positive','Specif','Int63','Array','ByteString','Byte','FloatClass','DecimalDigits','HexadecimalDigits']:
  if frag=='Positive' and 'Binary' in used:continue
  text=(W/'fragments'/f'{frag}.lean').read_text()
  blocks=re.split(r'(?=^def |^abbrev |^@\[simp\] theorem |^theorem )',text,flags=re.M) if frag in ['Datatypes','Specif','Int63','Array','ByteString'] else [text]
  defined=set()
  declarations=set(re.findall(r'^(?:def|abbrev|theorem|@\[simp\] theorem)\s+(\w+)',text,re.M))
  for block in blocks:
   own=set(re.findall(r'^(?:def|abbrev|theorem|@\[simp\] theorem)\s+(\w+)',block,re.M))
   needs=(set(re.findall(r'\b\w+\b',block)) & declarations)-own
   refs=set(re.findall(r'Rocq(?:Pending)?\.Corelib(?:\.[a-zA-Z0-9_]+)+',block))
   if block.strip() and needs <= defined and all(any(ref==t or ref.startswith(t+'.') for t in targets) for ref in refs):
    used.append(frag);parts.append(block);defined.update(own)
 parts.append((W/'fragments/NativeInterfaces.lean').read_text())
 parts.append('\n'.join('#export_native '+x['target'] for x in candidates))
 parts.append((W/'fragments/Audit.lean').read_text().replace('AUDIT_PATH',str(W/'audits'/f'{name}.json')))
 (W/(name+'.lean')).write_text('\n'.join(parts))
 profiles[name]={'module':mod,'candidates':len(candidates),'fragments':used,'sources':{x['target']:x['source'] for x in candidates}}
(D/'profiles.json').write_text(json.dumps(profiles,indent=2))
print('prepared',len(profiles),'profiles',sum(x['candidates'] for x in profiles.values()),'definitions')
