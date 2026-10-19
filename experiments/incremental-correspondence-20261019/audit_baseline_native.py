from pathlib import Path
import sys,subprocess,json,csv,collections,time,hashlib
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
T=R/'experiments/mechanical-nat-eq-20261019/translator'
M=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
D=W/'reports/baseline-native-audit';D.mkdir(exist_ok=True)
P=W/'.work/baseline-native-audit';P.mkdir(exist_ok=True)
ledger=list(csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open()))
statements={r['name']:r for r in json.loads((B/'reports/statements.json').read_text())}
configs=json.loads((B/'auto/profiles.json').read_text())
groups=collections.defaultdict(list)
for r in ledger:
 if r['bridge_status']=='STATEMENT_FULL_NATIVE':
  name=r['statement_certificate'].removesuffix('.correspondence')+'.native'
  st=statements[name]
  groups[st['profile']].append((r['source'],name))
helper=(W/'statement-command.lean.inc').read_text().split('run_cmd Lean.Elab.Command.liftTermElabM')[0]
validation=[];allrows=[]
for profile,roots in groups.items():
 module=configs[profile]['module'];src=P/(profile+'.lean');report=D/(profile+'.json')
 report.unlink(missing_ok=True)
 tick=chr(96)
 code='import '+profile+'\n'+helper+'\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  let mut rows : Array Json := #[]\n'
 for source,name in roots:
  code+='  let ci ← getConstInfo '+tick+name+'\n  let some body := ci.value? | throwError "Missing native body"\n  let refs ← sourceRefs body\n  rows := rows.push (Json.mkObj [("source",.str '+json.dumps(source)+'),("native",.str '+json.dumps(name)+'),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])\n'
 code+='  IO.FS.writeFile '+json.dumps(str(report))+' (Json.pretty (.arr rows))\n'
 src.write_text(code)
 env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[B,M/module/'lean',T/'.lake/build/lib/lean']))
 start=time.time()
 with (D/(profile+'.log')).open('w') as log:
  p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=60)
 row=dict(profile=profile,module=module,exit=p.returncode,seconds=round(time.time()-start,3),source_sha256=hashlib.sha256((B/(profile+'.lean')).read_bytes()).hexdigest(),olean_sha256=hashlib.sha256((B/(profile+'.olean')).read_bytes()).hexdigest())
 validation.append(row);print(row,flush=True)
 if p.returncode==0:allrows.extend(json.loads(report.read_text()))
 (D/'validation.json').write_text(json.dumps(validation,indent=2))
summary=dict(requested=sum(map(len,groups.values())),audited=len(allrows),profiles=len(validation),profiles_pass=sum(r['exit']==0 for r in validation),with_remaining_source_symbols=sum(bool(r['remaining_source_symbols']) for r in allrows),scope='Exact native target bodies from profiles selected by frozen baseline reports/statements.json; source references include recursive NativeBridge alias expansion; existing compiled proofs imported, not a full baseline recompilation.')
(D/'summary.json').write_text(json.dumps(summary,indent=2))
(D/'rows.json').write_text(json.dumps(allrows,indent=2))
print(summary,flush=True)
sys.exit(0 if all(r['exit']==0 for r in validation) and not summary['with_remaining_source_symbols'] else 1)
