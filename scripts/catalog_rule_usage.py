#!/usr/bin/env python3
"""Reproduce rule coverage from compact current-baseline evidence; --extract refreshes from full reports."""
import argparse,csv,json,re,gzip
from pathlib import Path
from collections import Counter
def walk(x):
 if isinstance(x,dict):
  yield x
  for v in x.values(): yield from walk(v)
 elif isinstance(x,list):
  for v in x: yield from walk(v)
def brief(t):
 d={k:v for k,v in t.items() if k not in ['target_type','target_value','target_ctors','quality_prop','universe_residuals','message','path']}
 d['quality_prop']=bool(t.get('quality_prop'));d['universe_residuals']=bool(t.get('universe_residuals'))
 ns=list(walk([t.get('target_type'),t.get('target_value'),t.get('target_ctors')]))
 d['ast']=dict(Counter(n.get('k') for n in ns if 'k' in n))
 d['consts']=dict(Counter(n['n'] for n in ns if n.get('k')=='const'))
 return d
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--extract',action='store_true')
 ap.add_argument('--results',type=Path,default=Path(__file__).resolve().parents[1]/'results/corelib-complete');a=ap.parse_args();o=a.results
 if a.extract:
  xs=[]
  paths=sorted(set((o/'Corelib').rglob('*.json')) | {p for p in (o/'Corelib').rglob('*.json.gz') if not p.with_suffix('').exists()})
  for p in paths:
   doc=json.loads(gzip.decompress(p.read_bytes()).decode() if p.suffix=='.gz' else p.read_text())
   for name,x in sorted(doc.get('roots',{}).items()):
    s=x['source_ir'];n=s.get('native',{});t=x['target_report']
    vs=x.get('quality_variants',[])+([t['quality_prop']] if t.get('quality_prop') else [])
    ns=list(walk([s.get('type'),s.get('body'),s.get('bodies')]))
    src={k:s.get(k) for k in ['kind','body_state','finite','npars','obligations','statement_prepared','statement_prop_view','quality_dispatch']}
    src.update({k:n.get(k) for k in ['nparams_rec','prepared','body_kind','polymorphic','template','primitive_type']})
    src['primitive_operator']=(n.get('primitive_signature') or {}).get('operator')
    src['quality_family']=bool(n.get('quality_family'));src['quality_members']=len((n.get('quality_family') or {}).get('members',[]))
    src['template_info']=bool(n.get('template_info'))
    src['ast']=dict(Counter(z.get('k') for z in ns if 'k' in z))
    src['sorts']=dict(Counter(z.get('s',{}).get('k') for z in ns if z.get('k')=='sort'))
    src['mutual_fix']=sum(z.get('k')=='fix' and len(z.get('defs',[]))>1 for z in ns)
    src['single_fix']=sum(z.get('k')=='fix' and len(z.get('defs',[]))==1 for z in ns)
    xs.append({'name':name,'module':doc['module'],'source':src,'primary':brief(t),'variants':[brief(v) for v in vs],
               'attempts':[[z[0],z[1],str(z[2]).split(' | ')[0]] for z in x.get('attempts',{}).get('tier_times',[])],
               'validation':x.get('module_validation',{})})
  assert len(xs)==2180 and len({x['name'] for x in xs})==2180
  (o/'rule-usage-evidence.json').write_text(json.dumps(xs,ensure_ascii=False,separators=(',',':'))+'\n')
 else: xs=json.loads((o/'rule-usage-evidence.json').read_text())
 cat=json.loads((o/'ALL_RULES.json').read_text())
 for op in cat['primitive_operations']:op.pop('usage',None)
 es={e['id']:e for g in cat['groups'] for e in g['entries']}
 rs={k:{'id':k,'name':e['name'],'precision':'Not separately recorded','primary_roots':None,'family_roots':None,'names':[],'family_names':[],
         'basis':'Historical reports did not record this submechanism separately; parent-rule counts or switch activations cannot substitute for that evidence.','related':[]} for k,e in es.items()}
 def put(k,p,b,precision='Report evidence',src=False):
  names=[x['name'] for x in xs if p(x,x['primary'])]
  family=names if src else [x['name'] for x in xs if any(p(x,t) for t in [x['primary']]+x['variants'])]
  rs[k].update(precision=precision,primary_roots=len(names),family_roots=len(family),names=names,family_names=family,basis=b)
 def field(k,f,b=None):
  put(k,lambda x,t:bool(t.get(f)),b or 'final report '+f+' is nonempty/nonzero.')
 def source(k,p,b,precision='Report evidence'):put(k,lambda x,t:p(x['source']),b,precision,True)
 def relate(k,p,b):
  names=[x['name'] for x in xs if p(x)];rs[k]['related'].append({'basis':b,'roots':len(names),'names':names})
 put('E01',lambda x,t:True,'Export override of original root; non-function call count.','Coverage')
 source('E02',lambda s:s['kind']=='constant','Constants participating in declaration classification; reduction branch not split.','Coverage')
 put('E03',lambda x,t:t.get('target_kind')=='statement','Final presentation product.')
 source('E04',lambda s:bool(s['obligations']),'Self source IR with obligations; not equal to the root of all inherited unproven conditions.')
 put('E08',lambda x,t:t.get('target_kind')=='def','The final def product coverage.','Coverage')
 put('E09',lambda x,t:t.get('target_kind')=='opaque','The final opaque product coverage includes quality and family.','Coverage')
 put('E10',lambda x,t:t.get('rule')=='constant/opaque_interface','The original root ended up being opaque_interface.')
 source('E11',lambda s:bool((s['prepared'] or {}).get('sealed_implementation')),'Source preparation sealed_implementation=true.')
 field('E12','pending_hypotheses','Finally there are explicit conditions; internal times of conditional merging/elimination are not listed separately.')
 put('E14',lambda x,t:False,'This census is not assembled with externally provided certificates.')
 put('T01',lambda x,t:bool(t['ast'].get('bvar')),'Ultimately AST contains bvar; not rel conversion call count.','Coverage')
 put('T02',lambda x,t:any(t['ast'].get(k) for k in ['forall','lam','let','app']),'Final AST with binding/application structure.','Coverage')
 put('T03',lambda x,t:bool(t['consts']),'Finally, AST contains constant references and auxiliary references.','Coverage')
 relate('T04',lambda x:bool(x['source']['ast'].get('cast')),'Source IR contains cast, which is not equivalent to using cast to repair.')
 relate('T05',lambda x:bool(x['source']['sorts'].get('sprop')),'Main source IR contains SProp; not all dynamic conversions are recorded.')
 put('T06',lambda x,t:t.get('rule','').startswith('bootstrap/'),'Deactivated nat/eq bootstrap; should currently be zero, source nat/eq generated by normal induction.')
 put('T07',lambda x,t:t.get('target_kind')=='inductive','The final coverage of the inductive block is generated.','Coverage')
 field('T08','primitive_record')
 source('T09',lambda s:s['kind']=='inductive' and s['npars']>s['nparams_rec'],'Non-uniform blocks of native npars>nparams_rec.')
 field('T10','coinductive_as_inductive')
 put('T11',lambda x,t:t.get('target_kind')=='inductive' and bool(t.get('pending_hypotheses')),'Only the sub-items of conditional induction are confirmed; nested induction is not listed separately.','Lower bound')
 for k,sk in [('M01','case'),('M08','letin')]:
  relate(k,lambda x,sk=sk:bool(x['source']['ast'].get(sk)),'Source IR contains '+sk+'; Just structural evidence.')
 for k,sk in [('M03','single_fix'),('M07','mutual_fix')]:
  relate(k,lambda x,sk=sk:bool(x['source'][sk]),'Source IR '+sk+'; is not a confirmed recursive transformation path.')
 put('U01',lambda x,t:True,'Native universe context check override; not every root has non-trivial constraints.','Coverage')
 put('U02',lambda x,t:bool(t['ast'].get('sort')),'The final AST contains Sort, without distinguishing between normal reading and R8.','Coverage')
 put('U03',lambda x,t:any(n.startswith('u_') for n in t.get('level_params',[])),'Finally, the u_ level parameter coverage is disclosed, excluding explicit v_i.','Coverage')
 for k,f in [('U04','solved_levels'),('U06','universe_checks'),('U07','universe_residuals'),
             ('U09','template'),('U12','sort_fact_reduced'),('U13','level_interp'),('U15','implicit_levels'),
             ('U16','result_sort_implicit_levels'),('U17','admitting_levels'),('U19','level_copies'),('U21','level_split'),
             ('U25','sort_interp'),('U29','r2bp_levels'),('U30','sort_lowered_levels'),('U31','result_sort_inherited'),
             ('U32','poly_level_interp'),('U36','phantom_lowered'),('C06','source_computed'),
             ('L02','prop_lift_coercions'),('L10','prop_lift_unfold'),('Q02','template_sort'),('Q03','quality_prop'),('V05','universe_checks')]:field(k,f)
 rs['U04']['basis']+=' The public and body local solutions are not separated independently.'
 rs['U09']['basis']+=' The statistics template block itself, downstream instantiation is a separate reference.'
 put('U08',lambda x,t:'Eq' in t['consts'],'The final AST directly contains the native Lean Eq (including internal auxiliary proof); it is not the number of native mappings of the source eq.','Coverage')
 for k,kind in [('U10','constant'),('U11','inductive')]:
  put(k,lambda x,t,kind=kind:t.get('kind')==kind and t.get('universe_poly_params',0)>0,'The corresponding declaration has explicit polymorphic universe parameters.')
 put('U28',lambda x,t:bool(t.get('universe_lowered') or t.get('universe_cumulativity')),'lowered or cumulativity flag; the strategy flag cannot be broken down into the actual number of lifts.')
 put('U35',lambda x,t:bool(t.get('universe_level_defaults') or t.get('universe_minimal_levels') or t.get('universe_residuals')),'Only the reported Default/residual submechanism is confirmed; the max solution is not listed separately.','Lower bound')
 for k in ['C01','C02','C03','C04','C05','C07']:
  relate(k,lambda x:bool(x['primary'].get('delta_inlined')),'Transparent expansion parent mechanism total, cannot be split into individual alias shapes.')
 put('L01',lambda x,t:t.get('prop_lift') is not None,'prop_lift is not null; depth 0 is also a hit.')
 put('L03',lambda x,t:t.get('type_lift') is not None or t.get('type_lift_coercions',0)>0,'type_lift is not null or type_lift_coercions>0.')
 for k in ['L04','L05','L06','L07','L08','L09']:
  relate(k,lambda x:x['primary'].get('type_lift') is not None or x['primary'].get('type_lift_coercions',0)>0,'Type lift Parent mechanism total; internal paths not split.')
 source('Q01',lambda s:s['template_info'] or s['quality_family'],'Native template_info or quality_family override.','Coverage')
 for k in ['Q05','Q06']:source(k,lambda s:s['quality_family'],'Native quality_family root; all branches of the same root are fully checked.')
 relate('Q04',lambda x:any('.qualityProp' in n for n in x['primary']['consts']),'Target references branch qualityProp, evidence of non-unique dispatch path.')
 relate('Q07',lambda x:any('__rocq2lean_quality_' in n for n in x['primary']['consts']),'The target explicitly references the native quality branch.')
 families={}
 for op in cat['primitive_operations']:
  fam='Int63' if op['target'].startswith(('BitVec.','PrimInt63.')) else op['target'].split('.')[0].removeprefix('Prim')
  families.setdefault(fam,set()).add(op['source'])
 for k,fam,typ in [('N01','Int63','int63'),('N02','Array','array'),('N03','String','string'),('N04','Float','float64')]:
  source(k,lambda s,fam=fam,typ=typ:s['primitive_type']==typ or s['primitive_operator'] in families[fam],'Native type/operation root of this family; downstream wrapper calls do not constitute remapping.')
 structured={'eq','lt','le','lts','les','compare','compares','addc','addCarryC','subc','subCarryC','mulc','diveucl','div21','string_compare','feq','fequal','flt','fle','fcompare','fclassify','frshiftexp'}
 source('N05',lambda s:s['primitive_operator'] in structured,'The primitive operation root that needs to be adapted by the source constructor.')
 source('N06',lambda s:bool(s['primitive_type'] or s['primitive_operator']),'Only the primitive identity sub-mechanism is confirmed; the literal and axiom sub-mechanisms are not listed separately.','Lower bound')
 for k in ['V01','V06','V09','S01']:put(k,lambda x,t:True,'This processing/verification covers all original roots; not internal execution times.','Coverage')
 put('V02',lambda x,t:t.get('rule','').startswith('bootstrap/'),'Bootstrap signature check coverage.')
 put('V03',lambda x,t:not t.get('rule','').startswith('bootstrap/'),'Generate declared kernel check coverage; bootstrap reuses an existing target.','Coverage')
 put('V04',lambda x,t:t.get('protected') or t.get('target_kind')=='statement','protected or statement inspection range.','Coverage')
 for k,v in [('V07','consumer'),('V08','audit')]:
  put(k,lambda x,t,v=v:x['validation'].get(v)=='OK','Belonging module '+v+'=OK root coverage.','Coverage')
 put('S02',lambda x,t:bool(x['attempts']),'Has root coverage of tier_times.','Coverage')
 put('S04',lambda x,t:any(z[0].startswith('i[') for z in x['attempts']),'Root coverage with inductive block tier_times.','Coverage')
 success={'TRANSLATED_AND_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
 relate('S03',lambda x:sum(z[2] in success for z in x['attempts'])>=2,'At least two successful candidates; final selection cannot be based solely on the last attempt.')
 relate('S05',lambda x:any(z[2] not in success|{'DISCOVERED'} for z in x['attempts']),'At least one failed attempt; not a rollback internal call count.')
 attempts={}
 for x in xs:
  for tier,ms,status in x['attempts']:
   m=re.match(r'([ci])\[([^\]]*)\](?: eo(\d+))?',tier);assert m,tier
   fs=[m[1]+':'+f for f in m[2].split(',') if f]+([m[1]+':extraOwn'] if m[3] else [])
   for f in fs:
    v=attempts.setdefault(f,{'attempts':0,'successful_candidates':0,'discovery':0,'failed_attempts':0,'names':set()})
    v['attempts']+=1;v['names'].add(x['name'])
    v['successful_candidates' if status in success else 'discovery' if status=='DISCOVERED' else 'failed_attempts']+=1
 for v in attempts.values():v['names']=sorted(v['names']);v['roots']=len(v['names'])
 primitives=[]
 for op in cat['primitive_operations']:
  target=op['target'];names=[x['name'] for x in xs if x['source']['primitive_operator']==op['source']]
  def count(t):return sum(v for n,v in t['consts'].items() if n==target or n.endswith('.'+target))
  direct=[x['name'] for x in xs if count(x['primary'])]
  primitives.append(dict(op,mapped_roots=len(names),mapped_names=names,direct_target_roots=len(direct),direct_target_names=direct,
                         primary_ast_occurrences=sum(count(x['primary']) for x in xs)))
 assert len(primitives)==61 and all(p['mapped_roots']==1 for p in primitives)
 features={}
 old=json.loads((o/'rule-usage.json').read_text())
 for f,n in old['reported_rule_features'].items():
  names=[x['name'] for x in xs if x['primary'].get(f)]
  assert len(names)==n,(f,n,len(names))
  features[f]={'roots':len(names),'names':names}
  if f.endswith('_coercions'):features[f]['event_total']=sum(x['primary'].get(f,0) for x in xs)
 for v in rs.values():
  if v['primary_roots'] is not None:
   assert v['primary_roots']==len(v['names']) and v['family_roots']>=v['primary_roots']
 # Evidence categories describe what is measured, never the strength of a proof.
 categories={
  'Source metadata':'E02 E04 E11 T09 Q01 Q05 Q06 N01 N02 N03 N04 N05',
  'Artifact structure':'E03 E08 E09 E12 T01 T02 T03 T07 U02 U03 U08 U10 U11',
  'Processing scope':'E01 U01 V01 V03 V04 V06 V09 S01',
  'Module validation results':'V07 V08',
  'Attempt records':'S02 S04',
  'Policy flag':'U28',
  'Partial submechanisms':'T11 U35 N06',
  'Not enabled in this run':'E14 T06 V02',
 }
 assigned=set()
 for label,ids in categories.items():
  for k in ids.split():
   assert k not in assigned
   assert rs[k]['primary_roots'] is not None
   assigned.add(k);rs[k]['precision']=label
 for k,v in rs.items():
  if k not in assigned and v['primary_roots'] is not None:
   v['precision']='Result report fields'
  v['unit']='Distinct original root declarations'
  v['execution_count']=None
  v['status']='retired' if k=='T06' else 'retained'
  v['same_predicate_as']={'Q06':'Q05','V05':'U06','V02':'T06'}.get(k)
  v['evidence_file']='rule-usage-evidence.json'
  v['limitation']='This counts roots satisfying the listed conditions, not rule invocations; it does not prove that the rule is indispensable.'
  if v['precision']=='Partial submechanisms':
   v['limitation']='Only the sub-mechanism specified by basis is counted; the number of used roots for the entire composite entry is unknown.'
  if v['precision']=='Not separately recorded':
   v['limitation']='A separate record for this subrule is missing; null means unknown and cannot be interpreted as zero.'
  if v['same_predicate_as']:
   v['limitation']+=' with '+v['same_predicate_as']+' Using the same statistical conditions cannot be regarded as two independent sets of evidence.'
 rs['T06']['basis']='Disabled: bootstrapRules=#[], with 0 reported bootstrap/ roots. Source nat/eq use T07.'
 rs['V02']['basis']='The current bootstrap table is empty, and there is no bootstrap signature adaptation object this time.'
 rs['E14']['basis']='No external proofs are assembled in this census; 0 describes the configuration, not prerequisite-assembly invocation counts.'
 definitions={'Processing scope': {'meaning': 'Declarations covered by a check or processing stage; not every declaration must trigger a special transformation.', 'count_reading': 'For example, 2180 means that 2180 roots are covered, not that 2180 rewrites occurred.', 'example': 'E01: export scope; V03: kernel checks of generated declarations.'}, 'Source metadata': {'meaning': 'Declarations selected by source IR kind, flags, or fields.', 'count_reading': 'Counts roots with that source feature; it does not confirm execution of a target transformation branch.', 'example': 'T09: npars > nparams_rec; E04: obligations on the root itself.'}, 'Artifact structure': {'meaning': 'Selection by the final target declaration kind, AST, or visible attributes.', 'count_reading': 'Counts distinct roots with the artifact feature; repeated occurrences in one root count as 1.', 'example': 'T07: target kind inductive; U08: native Lean Eq directly in the target AST.'}, 'Not separately recorded': {'meaning': 'Available evidence has no independent record attributable to this submechanism.', 'count_reading': 'Both root usage and invocation counts are unknown (null), not 0; parent-mechanism counts cannot substitute.', 'example': 'M03 has no independent path events in this historical report; a source fix is only related structural evidence.'}, 'Result report fields': {'meaning': 'Final report fields are nonempty, nonzero, or satisfy the stated conditions.', 'count_reading': 'Counts roots meeting those conditions. A field may record a policy or a solution, so it is not necessarily a rewrite count.', 'example': 'U15: implicit_levels; L02: nonzero prop_lift_coercions.'}, 'Not enabled in this run': {'meaning': 'The current configuration does not use the mechanism, or its historical path has been disabled.', 'count_reading': 'The current count is 0; this does not imply that the mechanism is absent or unnecessary for every input. T06 is explicitly disabled.', 'example': 'T06: empty bootstrap table; E14: no externally supplied proofs assembled in this run.'}, 'Partial submechanisms': {'meaning': 'Only part of a composite entry has identifiable evidence.', 'count_reading': 'The count covers only the part named in basis. Total entry usage remains unknown, and this is not a lower bound on invocation count.', 'example': 'T11 records conditional inductive subcases, not nested inductive types separately.'}, 'Policy flag': {'meaning': 'The report records a policy that was tried, without the individual conversions inside it.', 'count_reading': 'Counts roots with the flag. Enabling a policy does not show that a corresponding raising or conversion occurred.', 'example': 'U28: universe_lowered / universe_cumulativity.'}, 'Module validation results': {'meaning': 'The module containing the declaration has an explicit successful independent validation result.', 'count_reading': 'Counts roots covered by validated modules, not per-rule proofs or check invocations.', 'example': 'V07: consumer=OK; V08: audit=OK.'}, 'Attempt records': {'meaning': 'A declaration has tier_times, or a specified attempt kind occurs in that record.', 'count_reading': 'The main table counts roots with such records; the retry-switch table separately gives attempt totals.', 'example': 'S02: tier_times exists; S04: an inductive i[...] attempt.'}}
 counts=dict(Counter(v['precision'] for v in rs.values()))
 ledger={'schema_version':2,'baseline':'mechanical-nat-eq-20261019/full-v1',
         'root_count':2180,'entry_count':118,'retired_entry_ids':['T06'],
         'count_semantics':'Each number counts unique roots satisfying basis. Not execution counts. Categories count review entries.',
         'measurement_counts':counts,'measurement_definitions':definitions,'rules':list(rs.values()),
         'primitives':primitives,'attempt_flags':attempts,'reported_features':features,
         'quality_family_roots':sum(x['source']['quality_family'] for x in xs),
         'quality_family_instances':sum(x['source']['quality_members'] for x in xs)}
 (o/'RULE_USAGE.json').write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
 with (o/'RULE_USAGE.csv').open('w',newline='') as f:
  cols=['id','name','status','precision','unit','primary_roots','family_roots','execution_count','same_predicate_as','basis','limitation'];w=csv.DictWriter(f,fieldnames=cols,lineterminator='\n');w.writeheader()
  w.writerows({k:v[k] for k in cols} for v in rs.values())
 for k,e in es.items():e['usage']=rs[k]
 for op,v in zip(cat['primitive_operations'],primitives):op['usage']={k:x for k,x in v.items() if k not in ['source','target','usage']}
 (o/'ALL_RULES.json').write_text(json.dumps(cat,ensure_ascii=False,indent=2)+'\n')
 def display(v):
  if v['primary_roots'] is None:return 'Not separately recorded'
  pre=''
  return f"{pre}{v['primary_roots']} / {pre}{v['family_roots']}（{v['precision']}）"
 text=(o/'ALL_RULES.md').read_text();lines=[]
 for line in text.splitlines():
  if line.startswith('| Review number |'):line='| Review number | Rule / mechanism | behavior and boundaries | Main item / including number of branches | Statistical basis |'
  elif line=='|---|---|---|':line='|---|---|---|---|---|'
  else:
   m=re.match(r'^\| ([A-Z]\d{2}) \|',line)
   if m and m[1] in rs:
    v=rs[m[1]];line='|'.join(line.split('|')[:4])+'| '+display(v)+' | '+v['basis']+' |'
  lines.append(line)
 text='\n'.join(lines)+'\n'
 marker='<!-- usage-method-start -->';end='<!-- usage-method-end -->'
 method=marker+'\n\n**Number of times used**\n\nThe population is 2180 original roots. The left count selects roots by their primary representation; the right includes quality branches and deduplicates by root. Neither measures invocations. Evidence is classified as source metadata, artifact structure, processing scope, module validation, attempt records, policy flags, or result report fields. A nonempty field does not automatically show a rewrite. Partial-submechanism counts cover only the part specified in basis; total entry usage remains unknown. Missing independent records are null, not 0. T06 is disabled and retained for historical comparison. JSON/CSV records give units, limitations, shared predicates, and full name lists. Shared evidence such as Q05/Q06 and U06/V05 cannot be added together.\n\nFor the meaning of each evidence category, how to understand the number and examples, please see the [explanation table at the beginning of RULE_USAGE.md](RULE_USAGE.md). The switch enable for failed retries is also listed there separately and is not mixed in with the final hit. See [RULE_USAGE.json](RULE_USAGE.json) for the full declaration list, and see [RULE_USAGE.csv](RULE_USAGE.csv) for the screening list.\n\n'+end
 if marker in text:text=re.sub(re.escape(marker)+'.*?'+re.escape(end),lambda m:method,text,flags=re.S)
 else:text=text.replace('**E：',method+'\n\n**E：',1)
 text=re.sub('^\\| Source operations \\| Lean Target \\|.*$', '| source operation | Lean Target | Number of native mapping roots | The target directly refers to the root number |',text,flags=re.M)
 for v in primitives:
  pattern=r'^\| '+re.escape(chr(96)+v['source']+chr(96))+r' \|.*$'
  line='| '+chr(96)+v['source']+chr(96)+' | '+chr(96)+v['target']+chr(96)+f" | {v['mapped_roots']} | {v['direct_target_roots']} |"
  text=re.sub(pattern,lambda m,line=line:line,text,flags=re.M)
 text=text.replace('| Number of native mapping roots | The target directly refers to the root number |\n|---|---|\n','| Number of native mapping roots | The target directly refers to the root number |\n|---|---|---:|---:|\n')
 (o/'ALL_RULES.md').write_text(text)
 md=['Mechanical nat/eq baseline rule-by-rule usage statistics','','[Full catalog](ALL_RULES.md). Counts use 2180 distinct original roots: the left count checks the primary representation; the right also includes quality branches, deduplicated by root.','',
     'The table groups 118 review entries by evidence category, including disabled T06. These are entry counts, not rule usage counts. Per-rule figures count distinct roots; execution invocations were not independently collected.', '',
     '| Evidence category | Review entries | Meaning | How to read the count (with examples) |','|---|---:|---|---|',
     *[f"| {label} | {n} | {definitions[label]['meaning']} | {definitions[label]['count_reading']} {definitions[label]['example']} |" for label,n in counts.items()],
     '', 'Partial-submechanism evidence is not labeled as a lower bound for the whole rule. Q05/Q06, U06/V05, and T06/V02 share predicates; their counts cannot be added. 0 means no qualifying hit or not enabled in this run; null means unknown/not separately recorded.',
     '','| ID | Rule | Main item / including number of branches | Basis |','|---|---|---|---|']
 for v in rs.values():md.append(f"| {v['id']} | {v['name']} | {display(v)} | {v['basis']} |")
 md+=['','**Independent fields and report counters**','','These are report sums of the main representation of existing counters, not new per-rule execution event auditing.', '', '| Field | Number of hits | Main represents counter sum |','|---|---:|---:|']
 for k,v in features.items():md.append(f"| {k} | {v['roots']} | {v.get('event_total','—')} |")
 md+=['','**Retry switch activations**','','This is the number of switch enablements, not the number of internal rule executions. Successful candidates may also be replaced by subsequent candidates. c:pl is Prop lift, i:pl is plain levels; ul is Type lift, un is unified by appearance.',
      '','| switch | Roots | number of attempts | successful candidate | discover | failed |','|---|---:|---:|---:|---:|---:|']
 for k,v in sorted(attempts.items()):md.append(f"| {k} | {v['roots']} | {v['attempts']} | {v['successful_candidates']} | {v['discovery']} | {v['failed_attempts']} |")
 md+=['','**Reproduction**','','Run at the repository root:','','    python3 scripts/catalog_rule_usage.py','',
      'Read submitted compact evidence rule-usage-evidence.json; do not run translator. The remote full report can be re-extracted by adding --extract when present.'
      'The evidence class definition is stored in measurement_definitions in RULE_USAGE.json. The complete hit list and evidence of structural association is at RULE_USAGE.json. Unrecorded mechanisms require additional execution-event instrumentation; their usage cannot be inferred from current evidence.','']
 (o/'RULE_USAGE.md').write_text('\n'.join(md))
 print(json.dumps({'entries':118,'roots':2180,'precision':counts,'primitive_operations':61,'quality_instances':ledger['quality_family_instances']},ensure_ascii=False))
if __name__=='__main__':main()
