import pathlib,sys,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/quality-main67/translator";M=R/"work/runs/quality-main67-transport/Corelib/ssr/ssrbool"
sys.path.insert(0,str(T/"tools"));import audit
old=audit.Auditor.peel_record_transport
cases=[]
def trace(self,e,path,depth=0):
 result=old(self,e,path,depth)
 head,args=self.unspine(e)
 if head.get("n")=="Rocq.Corelib.Init.Specif.sigT.rec" and len(args)==5:
  h,p=self.unspine(args[2].get("b",{}))
  if h.get("n")=="Rocq.Corelib.Init.Specif.sigT":
   cases.append({"path":path,"depth":depth,"accepted":result is not None,"e":e,"ind":self.decls["Corelib.Init.Specif.sigT"],"row":self.ok.get("Corelib.Init.Specif.sigT")})
 return result
audit.Auditor.peel_record_transport=trace
try:audit.main(str(M/"source.ndjson"),str(M/"contract.json"),str(M/"translation_report.json"),str(R/"work/tests/record-audit-debug67.json"),str(M/"consumer_result.json"))
finally:(R/"work/tests/record-audit-cases67.json").write_text(json.dumps(cases,indent=2))
