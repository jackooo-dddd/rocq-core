from pathlib import Path
import json,subprocess,sys,re,time
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019';M=R/'experiments/mechanical-nat-eq-20261019';T=M/'translator'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
configs=json.loads((B/'interfaces/profiles.json').read_text())
outdir=W/'.work/alias-regression';outdir.mkdir(parents=True,exist_ok=True)
fragment=(B/'fragments/NativeInterfaces.lean').read_text()
fragment=fragment.replace('exportNative','exportNativeAlias').replace('elabExportNative','elabExportNativeAlias').replace('#export_native ','#export_alias ').replace('NativeBridge.Interfaces.','NativeBridge.AliasRegression.')
fallback=' let reduced ← whnf ty\n if reduced != ty then return ← findNativeIso reduced\n'
fragment=fragment.replace(fallback,'')
fragment=fragment.replace(' -- Preserve arbitrary parameters',fallback+' -- Preserve arbitrary parameters')

rows=[];results={}
for name,cfg in configs.items():
 src=outdir/('Alias_'+name+'.lean')
 src.write_text('import '+name+'\nnamespace NativeBridge\n'+fragment+'\n'+'\n'.join('#export_alias '+x for x in cfg['sources'])+'\nend NativeBridge\n')
 env=cli.lean_env();env['LEAN_PATH']=str(B)+':'+str(M/'runs/full-v1/Corelib'/cfg['module']/'lean')+':'+str(T/'.lake/build/lib/lean')
 start=time.time()
 with (outdir/(name+'.log')).open('w') as log:
  try:
   p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),str(src)],cwd=outdir,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=90)
   rc=p.returncode
  except subprocess.TimeoutExpired:rc=124
 text=(outdir/(name+'.log')).read_text()
 ok={cfg['sources'][t].replace('/','.') for t in re.findall(r'INTERFACE_OK (\S+) type_universe_specialization=',text)}
 oldtext=(B/'logs'/(name+'.log')).read_text()
 old={cfg['sources'][t].replace('/','.') for t in re.findall(r'INTERFACE_OK (\S+) type_universe_specialization=',oldtext)}
 row={'profile':name,'exit':rc,'seconds':round(time.time()-start,3),'baseline_interfaces':len(old),'normalized_interfaces':len(ok),'lost':sorted(old-ok),'gained':sorted(ok-old)}
 rows.append(row);print(row,flush=True)
 (W/'reports/alias-regression.json').write_text(json.dumps(rows,indent=2))
print('Completed',len(rows),'profiles; failures',sum(r['exit']!=0 for r in rows),'lost',sum(len(r['lost']) for r in rows),'gained',sum(len(r['gained']) for r in rows),flush=True)
sys.exit(0 if all(r['exit']==0 for r in rows) else 1)
