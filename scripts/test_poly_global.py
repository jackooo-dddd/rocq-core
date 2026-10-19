#!/usr/bin/env python3
import pathlib,sys,json,subprocess,os,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4'
sys.path.insert(0,str(T/'tools'));import audit,rocq2lean as cli
def v(i):return {'k':'var','i':i}
def g(n):return {'k':'global','n':n}
def con(a,n,b):return {'l':a,'rel':{'k':'le','offset':n},'r':b}
def ctx(n,cs):return {'k':'polymorphic','names':[None]*n,'constraints':cs}
direct=ctx(1,[con(v(0),0,g('G'))])
trans=ctx(2,[con(v(0),0,v(1)),con(v(1),0,g('G'))])
strict=ctx(2,[con(v(0),1,v(1)),con(v(1),1,g('G'))])
signed=ctx(2,[con(v(0),-1,v(1)),con(v(1),2,g('G'))])
equal=ctx(2,[{'l':v(0),'rel':{'k':'eq'},'r':v(1)},con(v(1),0,g('G'))])
V=('var',0);G=('global','G');H=('global','H')
tests=[
 ('direct',direct,V,G,0,True),('missing-strict',direct,V,G,1,False),
 ('transitive',trans,V,G,0,True),('native-transitive',trans,V,H,1,True),
 ('two-strict',strict,V,G,2,True),('too-large',strict,V,G,3,False),
 ('signed-offset',signed,V,G,1,True),('signed-offset-too-large',signed,V,G,2,False),
 ('signed-and-native',signed,V,H,2,True),('equality',equal,V,G,0,True),
 ('unbounded',ctx(1,[]),V,G,0,False),
 ('foreign-variable',direct,('var',1),G,0,False),
 ('foreign-constraint',ctx(1,[con(v(1),0,g('G'))]),V,G,0,False),
 ('positive-cycle',ctx(1,[con(v(0),1,v(0)),con(v(0),0,g('G'))]),V,G,0,False),
 ('global-local-name-collision',ctx(1,[con(g('v_0'),0,g('G'))]),V,G,0,False),
 ('Set-floor',ctx(1,[]),('set',),V,0,True),
 ('monomorphic',{'k':'monomorphic'},V,G,0,False)]
facts=audit.Facts({'levels':['G','H'],'relations':[{'l':'Set','rel':'le','r':'G'},{'l':'Set','rel':'le','r':'H'},{'l':'G','rel':'lt','r':'H'}]})
for name,c,a,b,k,want in tests:
 got=audit.poly_context_entails(facts,c,a,b,k);assert got==want,(name,got,want)
def lx(n):
 if n[0]=='set':return 'IR.Level.set'
 if n[0]=='global':return '(IR.Level.global '+json.dumps(n[1])+')'
 return '(IR.Level.var '+str(n[1])+')'
ls=['import Rocq2Lean','open Lean Rocq2Lean','def facts : IR.UniverseFacts := IR.UniverseFacts.indexed #["G", "H"] #[("Set", "le", "G"), ("Set", "le", "H"), ("G", "lt", "H")]']
for i,(name,c,a,b,k,want) in enumerate(tests):
 js=json.dumps(json.dumps(c,separators=(',',':')))
 ls.append(f'def ctx{i} : IR.UDecl := (IR.parseUDecl ((Json.parse {js}).toOption.get!)).toOption.get!')
 ls.append(f'#guard polyContextEntails facts ctx{i} {lx(a)} {lx(b)} ({k}) == '+str(want).lower())
# The R3 entry point, including motive offset conventions and out-of-scope variables.
p0={'k':'param','n':'v_0'}
def argcheck(c,level,admit=False):
 return audit.check_universe_args(facts,set(),{'Ref':['G']},[{'k':'const','n':'Ref','u':[level]}],admit={'Ref':{'G'}} if admit else None,source_context=c)
assert argcheck(direct,p0)==1
assert argcheck(direct,{'k':'succ','l':p0},True)==1
for c,level in [(ctx(1,[]),p0),(direct,{'k':'succ','l':p0}),(direct,{'k':'param','n':'v_1'})]:
 try:argcheck(c,level)
 except audit.Mismatch:pass
 else:raise AssertionError(('R3 accepted invalid local bound',c,level))
ls += [
 '#guard (checkInstantiation facts #[] "G" (.param (polyParamName 0)) (polyContext := ctx0)).isOk',
 '#guard !(checkInstantiation facts #[] "G" (.succ (.param (polyParamName 0))) (polyContext := ctx0)).isOk',
 '#guard (checkInstantiation facts #[] "G" (.succ (.param (polyParamName 0))) (cAdmit := true) (polyContext := ctx0)).isOk',
 '#guard !(checkInstantiation facts #[] "G" (.param (polyParamName 1)) (polyContext := ctx0)).isOk']
(O/'LocalUniverseChecks.lean').write_text('\n'.join(ls)+'\n')
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')
with (O/'local-checks.log').open('w') as log:
 rc=subprocess.run([str(pathlib.Path.home()/'.elan/bin/lean'),*cli.native_args(),str(O/'LocalUniverseChecks.lean')],cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300).returncode
assert rc==0,('Lean constraint checks',rc)
print('Local constraints/negative controls PASS',flush=True)
roots=['CorePolyGlobal.Global.'+n for n in ['identity_global','bounded_use','transitive_use']]
positive=O/'positive'
for label,args in [('export',['export','--mode','statement','--manifest',R/'translator/fixtures/corelib-poly-global/source.json','--roots',','.join(roots),'--out',positive]),('translate',['translate','--input',positive/'source.ndjson','--out',positive]),('validate',['validate','--run',positive])]:
 with (O/(label+'.log')).open('w') as log:
  rc=subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
 assert rc==0,(label,rc);print(label,'OK',flush=True)
rep=json.loads((positive/'translation_report.json').read_text())
states={r['name']:r['status'] for r in rep['roots']};assert set(states)==set(roots) and all(s=='TRANSLATED_AND_CHECKED' for s in states.values())
(O/'result.json').write_text(json.dumps({'status':'PASS','local_weighted_cases':len(tests),'R3_positive_and_negative_checks':True,'roots':states},indent=2)+'\n')
print('PASS',states)
