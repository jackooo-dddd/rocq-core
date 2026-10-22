#!/usr/bin/env python3
"""Package the pinned mechanical Nat case study from existing evidence."""
from pathlib import Path
import argparse,csv,json,re,shutil
from collections import Counter
ap=argparse.ArgumentParser()
ap.add_argument('--repo',type=Path,default=None)
R=(ap.parse_args().repo or Path(__file__).resolve().parents[2]).resolve();W=R/'results/casestudy'
C=R/'results/corelib-complete';M=R/'experiments/mechanical-nat-eq-20261019';B=R/'experiments/mechanical-correspondence-20261019'
W.mkdir(parents=True,exist_ok=True);bt=chr(96);fence=bt*3
def write(p,t):
 p=W/p;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t)
def dump(p,x):write(p,json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def table(rows,cols):
 return '| '+' | '.join(cols)+' |\n|'+'|'.join('---' for _ in cols)+'|\n'+''.join('| '+' | '.join(str(v).replace('|','&#124;').replace('\n','<br>') for v in row)+' |\n' for row in rows)
files=[]
def copy(src,dest,why):
 out=W/dest;out.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,out)
 files.append({'file':dest,'source':str(src.relative_to(R)),'bytes':out.stat().st_size,'explanation':why})
def csvout(p,rows,cols):
 p=W/p;p.parent.mkdir(parents=True,exist_ok=True)
 with p.open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=cols,lineterminator='\n');w.writeheader();w.writerows({k:r.get(k,'') for k in cols} for r in rows)
mods=['Datatypes','Nat','Peano'];selected={}
for m in mods:
 d=json.loads((C/f'Corelib/Init/{m}.json').read_text())
 for k,v in d['roots'].items():
  if m!='Datatypes' or k.rsplit('.',1)[1] in ['nat','nat_ind','nat_rec','nat_rect','nat_sind']:selected[k]=(m,v)
assert len(selected)==99
ledger={r['source']:r for r in csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open())}
counts=Counter(x['result']['status'] for m,x in selected.values())
bridgecounts=Counter(ledger[k]['bridge_status'] for k in selected)
for m in mods:
 for ext,folder,why in [('v','source','Complete Rocq source module, retaining other definitions and comments.'),('txt','lean','Lean actual printing result, non-independent compilable source file.'),('lean','lean','The import and print entries have been verified, referencing the absolute path of the remote freeze run.'),('json','records','Complete source IR, target AST, conditions, branches and check records.')]:
  copy(C/f'Corelib/Init/{m}.{ext}',f'{folder}/{m}.{ext}',why)
copy(C/'SOURCE-NOTICES.txt','SOURCE-NOTICES.txt','Source code sources and licensing instructions.')
descriptions={
 'Export.v':'MetaRocq Export driver: Import the module and specify roots.',
 'inventory.json':'Original root listing for this module.',
 'source.ndjson':'IR Declaration and proof conditions in header, universe context, dependency order; includes dependency closure.',
 'translation_report.json':'Target status, type/body AST, report fields, dependencies and conditions.',
 'translation_timing.json':'Statement by tier tag, time taken and result; not by AST event log.',
 'contract.json':'Declaration and constraint contracts used by import/consume checks.',
 'translation_manifest.json':'Run input, report, and build module associated information.',
 'result.json':'Summary of module export, translation and verification.',
 'audit.json':'Independent structural audit results.',
 'consumer_result.json':'Independent Lean consumer inspection results.',
 'lean/Rocq2LeanOut.lean':'Register the import entry for the Lean kernel declaration from the IR/ report.',
 'lean/Consumer.lean':'Independent consumer verification entrance.',
 'source-roundtrip/RoundTrip.v':'Rocq statement reconstructed from IR for source kernel review.',
 'source-roundtrip/RoundTripNative.v':'Source-side review entry for native metadata.',
 'source-roundtrip/RoundTripUniverses.v':'Source-side review entry for universe context.',
 'source-roundtrip/RoundTripUniverses.tsv':'Universe Fact Table.',
 'source-roundtrip/RoundTripUniverses.out':'Universe review output.',
 'source-roundtrip/roundtrip.json':'Source roundtrip result.'}
inventory=[]
for m in mods:
 run=M/f'runs/full-v1/Corelib/Init/{m}'
 for src in sorted(run.rglob('*')):
  if not src.is_file():continue
  rel=src.relative_to(run).as_posix();why=descriptions.get(rel)
  if src.suffix=='.log':why='Stage log:'+rel+'; Used to locate export, translation or validation issues.'
  keep=why is not None
  if not keep:why='Build cache, lock, or auxiliary artifact: retained at its original run path without another committed copy.'
  dest=f'exports/{m}/{rel}' if keep else ''
  inventory.append({'module':m,'file':rel,'bytes':src.stat().st_size,'included':keep,'explanation':why,'original':str(src),'case_file':dest})
  if keep:copy(src,dest,why)
dump('EXPORT_FILES.json',inventory)
write('EXPORT_FILES.md','# Export file itemized description\n\nList each file in the three frozen run directories; uningested compilation cache remains in the remote original directory.\n\n'+table([(r['module'],f"[{r['file']}]({r['case_file']})" if r['included'] else r['file'],'Yes' if r['included'] else 'No',r['explanation']) for r in inventory],['module','File','Already included','explain']))
proofs=['NatEq','Nat','DependentNat','Peano','Boundaries','Interface_Init_Nat','Interface_Init_Datatypes','Interface_Init_Peano','Auto_Init_Datatypes','Auto_Init_Peano','UseNative']
for name in proofs:
 copy(B/(name+'.lean'),'correspondence/'+name+'.lean','The original copy of the existing certificate remains unchanged; the original dependency environment and audit output path remain unchanged.')
 for folder,ext in [('audits','json'),('logs','log')]:
  f=B/folder/(name+'.'+ext)
  if f.exists():copy(f,'correspondence/'+folder+'/'+f.name,'The existing evidence of inspection is not new to this run.')
for n in ['VERIFIED.json','final-validation.json']:copy(B/n,'correspondence/'+n,'Summary of the entire correspondence experimental verification, which is larger than this case.')
profiles=json.loads((B/'profiles.json').read_text());frags=set()
for name in ['NatEq','Nat','DependentNat','Peano','Boundaries']:frags.update(profiles[name]['fragments'])
for name in sorted(frags):copy(B/'fragments'/(name+'.lean'),'correspondence/fragments/'+name+'.lean','Proof fragments need to be used after combining public definitions, and are not independent modules.')
audit_map={}
for audit in (W/'correspondence/audits').glob('*.json'):
 for entry in json.loads(audit.read_text()):
  audit_map[entry['name']]=entry
printed={}
for m in mods:
 text=(W/f'lean/{m}.txt').read_text();starts=list(re.finditer(r'^(?:def|theorem|opaque|inductive|axiom) ([^\s:]+)',text,re.M))
 for i,match in enumerate(starts):
  name=match[1].split('.{',1)[0];printed[name]=text[match.start():starts[i+1].start() if i+1<len(starts) else len(text)].rstrip()
rows=[]
for k,(m,x) in selected.items():
 t=x['target_report'];b=ledger[k];target=t['target'];text=printed.get(target);assert text is not None,(k,target)
 file='declarations/'+k
 certnames=set(re.findall(r'NativeBridge\.[A-Za-z0-9_.]+',' '.join(b[z] for z in ['bridge_certificates','interface_certificate','statement_certificate'])))
 certrecords=[audit_map[n] for n in sorted(certnames) if n in audit_map]
 dump(file+'.json',{'source_name':k,'mechanical_record':x,'correspondence':b,'available_certificate_types':certrecords})
 row={'source':k,'module':m,'target':target,'status':x['result']['status'],'pending_parameters':len(t.get('pending_hypotheses',[])),'bridge_status':b['bridge_status'],'certificates':b['bridge_certificates'],'interface_certificate':b['interface_certificate'],'statement_certificate':b['statement_certificate'],'page':file+'.md'};rows.append(row)
 write(file+'.md',f'# {k}\n\n[Index](../DECLARATIONS.md) · [Source module](../source/{m}.v) · [Complete record]({k}.json)\n\n'+
  f"Mechanical result: {row['status']}; dispatch: {t['rule']}; proof parameters to discharge: {row['pending_parameters']}.\n\n"+
  '## Source information\n\nThe source IR type and body/inductive block are in field mechanical_record.source_ir of the corresponding JSON file; the original source is in the complete .v file.\n\n'+
  '## Actual Lean printed output\n\n'+fence+'lean\n'+text+'\n'+fence+'\n\n'+
  '## Translation trace\n\n'+table(x.get('attempts',{}).get('tier_times',[]),['Attempt label','Elapsed time (ms)','Result'])+'\n'+
  'Labels identify attempt configurations, not a per-AST step log. 0 ms reflects the timing resolution and does not mean that no execution occurred.\n\n'+
  'Parameters to be verified:'+json.dumps(t.get('pending_hypotheses',[]),ensure_ascii=False)+'。\n\n'+
  'The complete target_report preserves universe fields, the target AST, and branches; prerequisite_declarations preserves prerequisite declarations. Report fields and switches cannot be converted directly into rule invocation counts. See module_validation for source roundtrip, consumer, and audit results.\n\n'+
  '## Correspondence to native Lean\n\n'+f"Coverage category: {b['bridge_status']}.\n\nType/operation certificate: {b['bridge_certificates'] or 'not recorded'}.\n\nInterface round-trip certificate: {b['interface_certificate'] or 'not recorded'}.\n\nStatement iff Certificate: {b['statement_certificate'] or 'not recorded'}.\n\n"+
  'A statement iff does not prove the proposition itself; interface round-trip laws do not automatically prove equality with the corresponding Lean operation.\n\n'+
  (('Native statement:\n\n'+fence+'lean\n'+b['native_statement']+'\n'+fence+'\n\n') if b['native_statement'] else '')+
  (('Remaining source symbols:'+b['remaining_source_symbols']+'。\n\n') if b['remaining_source_symbols'] else '')+
  '## Full types of the registered certificates\n\n'+
  ''.join(c['name']+'\n\n'+fence+'lean\n'+c['type']+'\n'+fence+'\n\nAxiomatic dependencies:'+str(c.get('axioms',[]))+'。\n\n' for c in certrecords)+
  ('The certificate type is subject to the copied audit; for other certificates, see the original experiment.\n\n' if not certrecords else '')+
  '[Correspondence proof description](../CORRESPONDENCE.md)\n')
csvout('DECLARATIONS.csv',rows,list(rows[0]))
write('DECLARATIONS.md','# Nat Comparison before and after each statement\n\n99 topic roots: nat in Datatypes and four elimination statements (5), Init.Nat (58), Init.Peano (36). O/S belongs to the nat inductive block and does not count additional roots. Other types in the complete copy of Datatypes are not included in the denominator of this topic.\n\n'+table([(f"[{r['source']}]({r['page']})",r['status'],r['pending_parameters'],r['bridge_status']) for r in rows],['Statement (click to view translation and process)','mechanical condition','condition number','Corresponding status']))
csvout('correspondence/DECLARATIONS.csv',[ledger[k] for k in selected],list(next(iter(ledger.values()))))
ev=json.loads((C/'rule-usage-evidence.json').read_text());cross=[]
for x in ev:
 hits=set()
 for t in [x['primary']]+x['variants']:
  for name in t['consts']:
   if name=='Rocq.Corelib.Init.Datatypes.nat' or name.startswith(('Rocq.Corelib.Init.Datatypes.nat.','Rocq.Corelib.Init.Nat.','RocqPending.Corelib.Init.Nat.')):hits.add(name)
 if hits:cross.append({'source':x['name'],'module':x['module'],'references':';'.join(sorted(hits)),'report':'../corelib-complete/'+x['module'].replace('.','/')+'.md'})
csvout('CORELIB_NAT_REFERENCES.csv',cross,['source','module','references','report'])
dump('summary.json',{'baseline':'mechanical-nat-eq-20261019/full-v1','corelib_roots':2180,'case_roots':99,'modules':{'Datatypes_nat_subset':5,'Nat':58,'Peano':36},'mechanical_status':dict(counts),'correspondence_status':dict(bridgecounts),'direct_nat_reference_roots':len(cross),'reference_scope':'Final target AST explicitly references generated nat/constructors/eliminators or Init.Nat operations; primary and quality branches deduplicated. Not transitive closure.','pending_roots':[r['source'] for r in rows if r['pending_parameters']]})
write('.gitignore','.work/\n__pycache__/\n')
dump('FILES.json',files)
write('FILES.md','# Document Reading Guide\n\nAll copied files and their repository sources can be found at [FILES.json](FILES.json). See also [EXPORT_FILES.md](EXPORT_FILES.md) for each file of the original run.\n\n'+table([
 ('README.md','Entry, Scope, Reading Order and Limitations.'),('SCOPE.md','The accurate source of 709/839/2180.'),('lean/KernelExample.lean','Mechanical constructor and additive reduction example, using existing output environment.'),('TRANSLATION_FLOW.md','Stage-by-stage explanation of nat and add, distinguishing between actual recording and explanation.'),
 ('DECLARATIONS.md / .csv','Browsable/filterable index of 99 topic roots.'),('declarations/< source name>.md / .json','Each translation, source IR, target AST, attempt, conditions and corresponding certificate.'),
 ('source/*.v','Three complete Rocq source modules, including original annotations and non-thematic content.'),('lean/*.txt','Lean is the actual printing result, not an independent module.'),('lean/*.lean','Import/print entry, referencing the remote freeze path.'),
 ('records/*.json','Item-by-item documentation of three complete modules.'),('exports/< module>/','Key export/translation/validation files; with dependency closures.'),
 ('correspondence/*.lean','Complete proof profile, dependent on the production environment.'),('correspondence/fragments/','Proof snippets for constructors, recursion, arithmetic/comparisons/bit operations, etc.'),
 ('correspondence/audits/ and logs/','Existing certificate types, axiom dependencies, and check logs.'),('correspondence/DECLARATIONS.csv','Corresponding coverage and gaps of item 99.'),
 ('CORRESPONDENCE.md','Corresponding explanations of types, constructors, operations, and eliminators.'),('CORELIB_NAT_REFERENCES.csv','The target AST in the entire 2180 root range directly refers to the index of the mechanical Nat/ operation, non-transitive closure.'),
 ('summary.json','Scope, status and roots to be proven.'),('verify.py / VALIDATION.json','Document review and major proof revalidation scripts/results.'),('build.py','Deterministic reconstruction from existing results without re-translation.'),('.work/','Only the remote verification cache/log is left, which is gitignore.')
],['path','Purpose']))
if Path(__file__).resolve()!=W/'build.py':shutil.copyfile(__file__,W/'build.py')
print(json.dumps({'case_roots':len(rows),'statuses':dict(counts),'correspondence':dict(bridgecounts),'copied_files':len(files),'direct_nat_reference_roots':len(cross)},ensure_ascii=False))
