from pathlib import Path
import subprocess,json,time
W=Path(__file__).resolve().parent
steps=[['prepare_auto.py'],['prepare_interfaces.py'],['build_all.py'],['run_auto.py'],['run_interfaces.py'],['build_unified.py'],['build_interfaces_unified.py'],['run.py','UseNative','unified'],['run.py','IdentityCheck','Init/Datatypes']]
rows=[]
for args in steps:
 start=time.time()
 p=subprocess.run(['python3',str(W/args[0]),*args[1:]],cwd=W,capture_output=True,text=True)
 (W/'logs'/('final-'+args[0]+('-'+args[1] if len(args)>1 else '')+'.log')).write_text(p.stdout+p.stderr)
 row={'command':args,'exit':p.returncode,'seconds':round(time.time()-start,3)}
 rows.append(row);(W/'final-validation.json').write_text(json.dumps(rows,indent=2));print(row,flush=True)
 if p.returncode: print((p.stdout+p.stderr)[-3500:],flush=True);raise SystemExit(1)
 for path in ['auto/results.json','interfaces/results.json','build-result.json']:
  if args[0] in ['run_auto.py','run_interfaces.py','build_all.py'] and (W/path).exists():
   assert all(r['exit']==0 for r in json.loads((W/path).read_text())),path
print('ALL_FINAL_CHECKS_PASS',flush=True)
