import pathlib,sys,json,subprocess
T,S,O=map(lambda x:pathlib.Path(x).resolve(),sys.argv[1:])
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
results=[]
for name,mod,n in [("Nat","Nat",1),("List","Datatypes",4)]:
 env=cli.lean_env();env["LEAN_PATH"]=str(S/("Corelib/Init/"+mod+"/lean"))+":"+str(T/".lake/build/lib/lean")
 with(O/(name+".log")).open("w")as log:
  p=subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(O/(name+".lean"))],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 text=(O/(name+".log")).read_text()
 results.append({"file":name+".lean","exit":p.returncode,"empty_axiom_closures":text.count("does not depend on any axioms")})
 assert p.returncode==0 and results[-1]["empty_axiom_closures"]==n,text
(O/"result.json").write_text(json.dumps({"status":"PASS","checks":results},indent=2)+"\n")
print("PASS",results,flush=True)
