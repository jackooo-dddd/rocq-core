import pathlib,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"translator";M=R/"work/runs/quality-main68-transport/Corelib/Classes/CMorphisms"
sys.path.insert(0,str(T/"tools"));import audit
old=audit.Auditor.application_domain
cases=[]
def trace(self,e,path):
 try:return old(self,e,path)
 except audit.Mismatch:
  cases.append({"path":path,"function":e});raise
audit.Auditor.application_domain=trace
try:audit.main(str(M/"source.ndjson"),str(M/"contract.json"),str(M/"translation_report.json"),str(R/"work/tests/domain-debug69.json"),str(M/"consumer_result.json"))
finally:(R/"work/tests/domain-cases69.json").write_text(json.dumps(cases,indent=2))
