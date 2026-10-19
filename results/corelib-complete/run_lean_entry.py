import pathlib,sys,json,subprocess
R=pathlib.Path(__file__).resolve().parent
T=pathlib.Path(json.loads((R/"summary.json").read_text())["translator"])
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
entry=pathlib.Path(sys.argv[1]);entry=entry if entry.is_absolute() else R/entry
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
sys.exit(subprocess.call([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(entry)],cwd=T,env=env))
