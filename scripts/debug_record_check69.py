import pathlib,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"translator";M=R/"work/runs/quality-main68-transport/Corelib/ssr/ssrbool"
sys.path.insert(0,str(T/"tools"));import audit
old=audit.Auditor.check
cases=[]
def trace(self,s,e,path,env=()):
 try:return old(self,s,e,path,env)
 except audit.Mismatch:
  if len(path)>6:cases.append({"path":path,"source":s,"target":e,"env":env})
  raise
audit.Auditor.check=trace
try:audit.main(str(M/"source.ndjson"),str(M/"contract.json"),str(M/"translation_report.json"),str(R/"work/tests/record-check-debug69.json"),str(M/"consumer_result.json"))
finally:(R/"work/tests/record-check-cases69.json").write_text(json.dumps(cases[:4],indent=2))
