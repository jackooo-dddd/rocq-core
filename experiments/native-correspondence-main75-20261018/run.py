import pathlib,sys,subprocess,os,json,time
W=pathlib.Path(__file__).resolve().parent
R=W.parents[1]
T=R/'work/snapshots/quality-main75/translator'
S=R/'work/runs/quality-main75-full'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
profile=sys.argv[1]
module=sys.argv[2] if len(sys.argv)>2 else 'Init/Datatypes'
src=W/(profile+'.lean')
env=cli.lean_env()
env['LEAN_PATH']=str(W)+':'+str(W/'unified/lean' if module=='unified' else S/'Corelib'/module/'lean')+':'+str(T/'.lake/build/lib/lean')
src.with_suffix('.olean').unlink(missing_ok=True)
p=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=600)
(W/'logs'/f'{profile}.log').write_text(p.stdout)
print(p.stdout,end='')
if p.returncode==0:
 print('PASS',profile,flush=True)
sys.exit(p.returncode)
