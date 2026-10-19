#!/usr/bin/env python3
import pathlib,sys,os,subprocess,time,json,signal,resource
T=pathlib.Path(sys.argv[1]).resolve();log=pathlib.Path(sys.argv[2]).resolve();log.parent.mkdir(parents=True,exist_ok=True)
env=dict(os.environ,LEAN_NUM_THREADS='4',ROCQ2LEAN_LEAN_THREADS='4');env['PATH']=str(pathlib.Path.home()/'.elan/bin')+':'+env['PATH']
# Lean/Lake reserve substantial virtual address space. Bound resident memory of
# this isolated build's entire process group, not harmless address reservations.
def limits():resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
with open(log,'w') as f:
 p=subprocess.Popen(['lake','-d',str(T),'build','Rocq2Lean','Rocq2Lean:shared'],stdout=f,stderr=subprocess.STDOUT,env=env,start_new_session=True,preexec_fn=limits)
 peak=0;start=time.time();stopped=None
 while p.poll() is None:
  rss=0
  for proc in pathlib.Path('/proc').iterdir():
   if not proc.name.isdigit():continue
   try:
    stat=(proc/'stat').read_text().rsplit(')',1)[1].split()
    if int(stat[2])==p.pid:rss+=int(stat[21])*os.sysconf('SC_PAGE_SIZE')
   except (FileNotFoundError,ProcessLookupError,ValueError,PermissionError):pass
  peak=max(peak,rss)
  if rss>8<<30 or time.time()-start>900:
   stopped='RSS_LIMIT' if rss>8<<30 else 'TIMEOUT';os.killpg(p.pid,signal.SIGTERM);break
  time.sleep(2)
 code=p.wait()
log.with_suffix('.json').write_text(json.dumps({'exit':code,'stopped':stopped,'peak_group_rss_bytes':peak,'seconds':time.time()-start},indent=2)+'\n')
sys.exit(code if code>=0 else 1)
