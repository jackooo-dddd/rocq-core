#!/usr/bin/env python3
"""Verify case-study copies and recheck proof profiles against the installed frozen environment."""
from pathlib import Path
import json, os, re, subprocess, sys, time
W=Path(__file__).resolve().parent;R=W.parents[1]
M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
B=R/'experiments/mechanical-correspondence-20261019';cache=W/'.work'
cache.mkdir(exist_ok=True);(cache/'audits').mkdir(exist_ok=True)
sys.path.insert(0,str(T/'tools'))
import rocq2lean as cli
lean=Path.home()/'.elan/bin/lean'
if not lean.is_file():raise SystemExit('Existing Lean toolchain missing; nothing installed.')
files=json.loads((W/'FILES.json').read_text())
for f in files:
 assert (W/f['file']).read_bytes()==(R/f['source']).read_bytes(),f['file']
s=json.loads((W/'summary.json').read_text())
assert s['case_roots']==99 and sum(s['mechanical_status'].values())==99
assert sum(s['correspondence_status'].values())==99
assert s['pending_roots']==['Corelib.Init.Nat.gcd']
for p in (W/'declarations').glob('*.json'):
 d=json.loads(p.read_text());x=d['mechanical_record']
 assert x['target_report']['status']==x['result']['status']
 for k in ['roundtrip','consumer','audit']:assert x['module_validation'][k]=='OK'
# Only case-authored Markdown has links; source proof comments remain original.
for p in W.rglob('*.md'):
 if '.work' in p.parts:continue
 for link in re.findall(r'\]\(([^)]+)\)',p.read_text()):
  if '://' in link or link.startswith('#'):continue
  dest=(p.parent/link.split('#')[0])
  if dest.name=='VALIDATION.json':continue
  assert dest.exists(),(str(p),link)
profiles={
 'NatEq':'Init/Datatypes','Nat':'Init/Nat','DependentNat':'Init/Datatypes',
 'Peano':'Init/Peano','Boundaries':'Init/Nat',
 'Interface_Init_Nat':'Init/Nat','Interface_Init_Datatypes':'Init/Datatypes',
 'Interface_Init_Peano':'Init/Peano','Auto_Init_Datatypes':'Init/Datatypes',
 'Auto_Init_Peano':'Init/Peano','UseNative':'unified','KernelExample':'Init/Nat'}
only=sys.argv[1] if len(sys.argv)>1 else None
if only: assert only in profiles,only
results=([r for r in json.loads((W/'VALIDATION.json').read_text())['profiles'] if r['profile']!=only] if only else [])
for name,module in profiles.items():
 if only and name!=only:continue
 src=W/('lean' if name=='KernelExample' else 'correspondence')/(name+'.lean')
 text=src.read_text()
 # Redirect IO-only audit output. Never modify any theorem/definition body.
 text,n=re.subn(r'(IO\.FS\.writeFile )"[^"]*/audits/([^"]+\.json)"',
     lambda m:m[1]+json.dumps(str(cache/'audits'/m[2])),text)
 local=cache/(name+'.lean');local.write_text(text)
 env=cli.lean_env()
 out=B/'unified/lean' if module=='unified' else M/'runs/full-v1/Corelib'/module/'lean'
 env['LEAN_PATH']=':'.join(map(str,[cache,B,out,T/'.lake/build/lib/lean']))
 start=time.monotonic()
 proc=subprocess.run([str(lean),*cli.native_args(),'-o',str(cache/(name+'.olean')),str(local)],
                     cwd=cache,env=env,capture_output=True,text=True,timeout=600)
 (cache/(name+'.log')).write_text(proc.stdout+proc.stderr)
 row={'profile':name,'module':module,'exit':proc.returncode,'seconds':round(time.monotonic()-start,3),
      'audit_output_redirects':n,'log':'.work/'+name+'.log'}
 results.append(row);print(name,'PASS' if not proc.returncode else 'FAIL',flush=True)
 if proc.returncode:print((proc.stdout+proc.stderr)[-3000:],flush=True)
report={'status':'PASS' if all(r['exit']==0 for r in results) else 'FAIL',
        'copied_files_verified':len(files),'case_roots_verified':99,
        'checks':['byte identity of copied artifacts','selected roots and pending conditions',
                  'recorded roundtrip/consumer/audit results','case Markdown links'],
        'proof_source_policy':'Original copies retained; only audit IO paths redirected in ignored temporary copies.',
        'translation_rerun':False,'profiles':results,
        'lean_version':subprocess.check_output([str(lean),'--version'],text=True).strip()}
(W/'VALIDATION.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
sys.exit(0 if report['status']=='PASS' else 1)
