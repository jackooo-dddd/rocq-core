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
 rs={k:{'id':k,'name':e['name'],'precision':'未单独记录','primary_roots':None,'family_roots':None,'names':[],'family_names':[],
         'basis':'历史报告未独立记录此子机制；不能以父规则计数或开关启用次数代替。','related':[]} for k,e in es.items()}
 def put(k,p,b,precision='报告命中',src=False):
  names=[x['name'] for x in xs if p(x,x['primary'])]
  family=names if src else [x['name'] for x in xs if any(p(x,t) for t in [x['primary']]+x['variants'])]
  rs[k].update(precision=precision,primary_roots=len(names),family_roots=len(family),names=names,family_names=family,basis=b)
 def field(k,f,b=None):
  put(k,lambda x,t:bool(t.get(f)),b or '最终报告 '+f+' 非空／非零。')
 def source(k,p,b,precision='报告命中'):put(k,lambda x,t:p(x['source']),b,precision,True)
 def relate(k,p,b):
  names=[x['name'] for x in xs if p(x)];rs[k]['related'].append({'basis':b,'roots':len(names),'names':names})
 put('E01',lambda x,t:True,'原始根的导出覆盖；非函数调用次数。','覆盖')
 source('E02',lambda s:s['kind']=='constant','参与声明分类的常量；未拆分归约分支。','覆盖')
 put('E03',lambda x,t:t.get('target_kind')=='statement','最终陈述产物。')
 source('E04',lambda s:bool(s['obligations']),'自身源 IR 带 obligations；不等于所有继承待证条件的根。')
 put('E08',lambda x,t:t.get('target_kind')=='def','最终 def 产物覆盖。','覆盖')
 put('E09',lambda x,t:t.get('target_kind')=='opaque','最终 opaque 产物覆盖，含 quality family。','覆盖')
 put('E10',lambda x,t:t.get('rule')=='constant/opaque_interface','原始根最终采用 opaque_interface。')
 source('E11',lambda s:bool((s['prepared'] or {}).get('sealed_implementation')),'源准备 sealed_implementation=true。')
 field('E12','pending_hypotheses','最终有显式条件；条件合并／消除的内部次数未单列。')
 put('E14',lambda x,t:False,'本次 census 未装配外部提供的证明。')
 put('T01',lambda x,t:bool(t['ast'].get('bvar')),'最终 AST 含 bvar；不是 rel 转换调用次数。','覆盖')
 put('T02',lambda x,t:any(t['ast'].get(k) for k in ['forall','lam','let','app']),'最终 AST 含绑定／应用结构。','覆盖')
 put('T03',lambda x,t:bool(t['consts']),'最终 AST 含常量引用，含辅助引用。','覆盖')
 relate('T04',lambda x:bool(x['source']['ast'].get('cast')),'源 IR 含 cast，不等于使用 cast 修复。')
 relate('T05',lambda x:bool(x['source']['sorts'].get('sprop')),'主源 IR 含 SProp；未记录全部动态转换。')
 put('T06',lambda x,t:t.get('rule','').startswith('bootstrap/'),'已停用的 nat/eq bootstrap；当前应为零，源 nat/eq 由普通归纳生成。')
 put('T07',lambda x,t:t.get('target_kind')=='inductive','最终生成归纳块的覆盖。','覆盖')
 field('T08','primitive_record')
 source('T09',lambda s:s['kind']=='inductive' and s['npars']>s['nparams_rec'],'原生 npars>nparams_rec 的非均匀块。')
 field('T10','coinductive_as_inductive')
 put('T11',lambda x,t:t.get('target_kind')=='inductive' and bool(t.get('pending_hypotheses')),'只确认带条件归纳子项；嵌套归纳未单列。','下界')
 for k,sk in [('M01','case'),('M08','letin')]:
  relate(k,lambda x,sk=sk:bool(x['source']['ast'].get(sk)),'源 IR 含 '+sk+'；只是结构证据。')
 for k,sk in [('M03','single_fix'),('M07','mutual_fix')]:
  relate(k,lambda x,sk=sk:bool(x['source'][sk]),'源 IR '+sk+'；不是已确认的递归转换路径。')
 put('U01',lambda x,t:True,'原生宇宙上下文检查覆盖；不是每根都有非平凡约束。','覆盖')
 put('U02',lambda x,t:bool(t['ast'].get('sort')),'最终 AST 含 Sort，未区分普通读取和 R8。','覆盖')
 put('U03',lambda x,t:any(n.startswith('u_') for n in t.get('level_params',[])),'最终公开 u_ 层级参数覆盖，排除显式 v_i。','覆盖')
 for k,f in [('U04','solved_levels'),('U06','universe_checks'),('U07','universe_residuals'),
             ('U09','template'),('U12','sort_fact_reduced'),('U13','level_interp'),('U15','implicit_levels'),
             ('U16','result_sort_implicit_levels'),('U17','admitting_levels'),('U19','level_copies'),('U21','level_split'),
             ('U25','sort_interp'),('U29','r2bp_levels'),('U30','sort_lowered_levels'),('U31','result_sort_inherited'),
             ('U32','poly_level_interp'),('U36','phantom_lowered'),('C06','source_computed'),
             ('L02','prop_lift_coercions'),('L10','prop_lift_unfold'),('Q02','template_sort'),('Q03','quality_prop'),('V05','universe_checks')]:field(k,f)
 rs['U04']['basis']+=' 公开与正文局部求解未独立拆分。'
 rs['U09']['basis']+=' 统计模板块本身，下游实例化另属引用。'
 put('U08',lambda x,t:'Eq' in t['consts'],'最终 AST 直接含原生 Lean Eq（包括内部辅助证明）；不是源 eq 原生映射次数。','覆盖')
 for k,kind in [('U10','constant'),('U11','inductive')]:
  put(k,lambda x,t,kind=kind:t.get('kind')==kind and t.get('universe_poly_params',0)>0,'对应声明有显式多态宇宙参数。')
 put('U28',lambda x,t:bool(t.get('universe_lowered') or t.get('universe_cumulativity')),'lowered 或 cumulativity 标志；策略标志不能拆成实际抬升次数。')
 put('U35',lambda x,t:bool(t.get('universe_level_defaults') or t.get('universe_minimal_levels') or t.get('universe_residuals')),'仅确认报告的默认／residual 子机制；max 求解未单列。','下界')
 for k in ['C01','C02','C03','C04','C05','C07']:
  relate(k,lambda x:bool(x['primary'].get('delta_inlined')),'透明展开父机制合计，不能拆分到各别名形状。')
 put('L01',lambda x,t:t.get('prop_lift') is not None,'prop_lift 非 null；深度 0 也算命中。')
 put('L03',lambda x,t:t.get('type_lift') is not None or t.get('type_lift_coercions',0)>0,'type_lift 非 null 或 type_lift_coercions>0。')
 for k in ['L04','L05','L06','L07','L08','L09']:
  relate(k,lambda x:x['primary'].get('type_lift') is not None or x['primary'].get('type_lift_coercions',0)>0,'Type lift 父机制合计；未拆分内部路径。')
 source('Q01',lambda s:s['template_info'] or s['quality_family'],'原生 template_info 或 quality_family 覆盖。','覆盖')
 for k in ['Q05','Q06']:source(k,lambda s:s['quality_family'],'原生 quality_family 根；同一根的所有分支完整检查。')
 relate('Q04',lambda x:any('.qualityProp' in n for n in x['primary']['consts']),'目标引用 qualityProp 分支，非唯一的分派路径证据。')
 relate('Q07',lambda x:any('__rocq2lean_quality_' in n for n in x['primary']['consts']),'目标显式引用原生 quality 分支。')
 families={}
 for op in cat['primitive_operations']:
  fam='Int63' if op['target'].startswith(('BitVec.','PrimInt63.')) else op['target'].split('.')[0].removeprefix('Prim')
  families.setdefault(fam,set()).add(op['source'])
 for k,fam,typ in [('N01','Int63','int63'),('N02','Array','array'),('N03','String','string'),('N04','Float','float64')]:
  source(k,lambda s,fam=fam,typ=typ:s['primitive_type']==typ or s['primitive_operator'] in families[fam],'该族原生类型／操作根；下游包装调用不当成重新映射。')
 structured={'eq','lt','le','lts','les','compare','compares','addc','addCarryC','subc','subCarryC','mulc','diveucl','div21','string_compare','feq','fequal','flt','fle','fcompare','fclassify','frshiftexp'}
 source('N05',lambda s:s['primitive_operator'] in structured,'需源构造器适配的原语操作根。')
 source('N06',lambda s:bool(s['primitive_type'] or s['primitive_operator']),'只确认原语身份子机制；字面量和公理子机制未单列。','下界')
 for k in ['V01','V06','V09','S01']:put(k,lambda x,t:True,'本次处理／校验覆盖全部原始根；非内部执行次数。','覆盖')
 put('V02',lambda x,t:t.get('rule','').startswith('bootstrap/'),'Bootstrap 签名检查覆盖。')
 put('V03',lambda x,t:not t.get('rule','').startswith('bootstrap/'),'生成声明的内核检查覆盖；bootstrap 复用已有目标。','覆盖')
 put('V04',lambda x,t:t.get('protected') or t.get('target_kind')=='statement','protected 或 statement 检查范围。','覆盖')
 for k,v in [('V07','consumer'),('V08','audit')]:
  put(k,lambda x,t,v=v:x['validation'].get(v)=='OK','所属模块 '+v+'=OK 的根覆盖。','覆盖')
 put('S02',lambda x,t:bool(x['attempts']),'具有 tier_times 的根覆盖。','覆盖')
 put('S04',lambda x,t:any(z[0].startswith('i[') for z in x['attempts']),'具有归纳块 tier_times 的根覆盖。','覆盖')
 success={'TRANSLATED_AND_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
 relate('S03',lambda x:sum(z[2] in success for z in x['attempts'])>=2,'至少两个成功候选；最终选用不能只看最后一次尝试。')
 relate('S05',lambda x:any(z[2] not in success|{'DISCOVERED'} for z in x['attempts']),'至少一次失败尝试；不是回滚内部调用数。')
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
  '源端元数据':'E02 E04 E11 T09 Q01 Q05 Q06 N01 N02 N03 N04 N05',
  '产物结构':'E03 E08 E09 E12 T01 T02 T03 T07 U02 U03 U08 U10 U11',
  '处理范围':'E01 U01 V01 V03 V04 V06 V09 S01',
  '模块验证结果':'V07 V08',
  '尝试记录':'S02 S04',
  '策略标志':'U28',
  '部分子机制':'T11 U35 N06',
  '本次未启用':'E14 T06 V02',
 }
 assigned=set()
 for label,ids in categories.items():
  for k in ids.split():
   assert k not in assigned
   assert rs[k]['primary_roots'] is not None
   assigned.add(k);rs[k]['precision']=label
 for k,v in rs.items():
  if k not in assigned and v['primary_roots'] is not None:
   v['precision']='结果报告字段'
  v['unit']='去重原始根声明'
  v['execution_count']=None
  v['status']='retired' if k=='T06' else 'retained'
  v['same_predicate_as']={'Q06':'Q05','V05':'U06','V02':'T06'}.get(k)
  v['evidence_file']='rule-usage-evidence.json'
  v['limitation']='该数统计符合所列条件的根，不是规则调用次数，也不证明规则不可替代。'
  if v['precision']=='部分子机制':
   v['limitation']='只计 basis 指明的子机制；整个复合条目的使用根数未知。'
  if v['precision']=='未单独记录':
   v['limitation']='缺少该子规则的独立记录；null 表示未知，不能解释为零。'
  if v['same_predicate_as']:
   v['limitation']+=' 与 '+v['same_predicate_as']+' 使用同一统计条件，不能视为两组独立使用证据。'
 rs['T06']['basis']='已停用；当前 bootstrapRules=#[]，报告 bootstrap/ 根数为 0。源 nat/eq 均走 T07。'
 rs['V02']['basis']='当前 bootstrap 表为空，本次没有 bootstrap 签名适配对象。'
 rs['E14']['basis']='本次运行未装配外部证明；0 描述实验配置，非条件装配函数调用计数。'
 definitions={'处理范围': {'meaning': '该检查或流程所覆盖的声明集合，不要求每项触发特殊转换。', 'count_reading': '例如2180表示2180个根在覆盖范围内，不是执行2180次改写。', 'example': 'E01 导出范围；V03 生成声明的内核检查范围。'}, '源端元数据': {'meaning': '根据源 IR 的种类、标志或字段筛选声明。', 'count_reading': '统计具有该源特征的根，不能据此确认某目标转换分支实际执行。', 'example': 'T09 的 npars > nparams_rec；E04 自身带 obligations。'}, '产物结构': {'meaning': '根据最终目标的声明种类、AST 或可见属性筛选。', 'count_reading': '统计出现该产物特征的根；同一根出现多次结构仍只计1。', 'example': 'T07 最终生成 inductive；U08 目标 AST 直接含原生 Lean Eq。'}, '未单独记录': {'meaning': '现有证据没有该子机制独立、可归属的记录。', 'count_reading': '使用根数及调用次数未知（null），不能当成0，也不能用父机制数量代替。', 'example': 'M03 没有独立路径事件；源有 fix 只算相关结构证据。'}, '结果报告字段': {'meaning': '最终报告中相应字段非空、非零或满足所列条件。', 'count_reading': '统计满足字段条件的根；字段可能记录策略或求解结果，不统一等价于改写次数。', 'example': 'U15 的 implicit_levels；L02 的 prop_lift_coercions 非零。'}, '本次未启用': {'meaning': '本次配置没有使用该机制，或其历史路径已经停用。', 'count_reading': '当前为0；不意味着机制不存在或任何输入下都不需要。T06 则已明确停用。', 'example': 'T06 bootstrap 表为空；E14 本次没有装配外部证明。'}, '部分子机制': {'meaning': '复合条目只有一部分子机制有可识别证据。', 'count_reading': '数字只属于依据栏指出的部分；整个条目的使用数未知，不作为调用次数下界。', 'example': 'T11 仅记录带条件归纳部分，未独立统计嵌套归纳。'}, '策略标志': {'meaning': '报告标明采用的尝试策略，但不记录其内部具体转换事件。', 'count_reading': '统计带策略标志的根；启用策略不等于发生相应抬升或转换。', 'example': 'U28 的 universe_lowered / universe_cumulativity。'}, '模块验证结果': {'meaning': '声明所属模块的独立检查有明确通过结果。', 'count_reading': '统计通过模块中覆盖的根，不是逐规则证明数或检查调用次数。', 'example': 'V07 consumer=OK；V08 audit=OK。'}, '尝试记录': {'meaning': '该声明存在 tier_times，或其中出现指定类型的尝试。', 'count_reading': '主表统计有此记录的根；每根尝试几次另见重试开关表。', 'example': 'S02 有 tier_times；S04 有归纳块 i[...] 尝试。'}}
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
  if v['primary_roots'] is None:return '未单独记录'
  pre=''
  return f"{pre}{v['primary_roots']} / {pre}{v['family_roots']}（{v['precision']}）"
 text=(o/'ALL_RULES.md').read_text();lines=[]
 for line in text.splitlines():
  if line.startswith('| 审阅编号 |'):line='| 审阅编号 | 规则／机制 | 行为与边界 | 主项 / 含分支根数 | 统计依据 |'
  elif line=='|---|---|---|':line='|---|---|---|---|---|'
  else:
   m=re.match(r'^\| ([A-Z]\d{2}) \|',line)
   if m and m[1] in rs:
    v=rs[m[1]];line='|'.join(line.split('|')[:4])+'| '+display(v)+' | '+v['basis']+' |'
  lines.append(line)
 text='\n'.join(lines)+'\n'
 marker='<!-- usage-method-start -->';end='<!-- usage-method-end -->'
 method=marker+'\n\n**使用次数口径**\n\n分母为2180个原始根。左数是主表示满足统计条件的根数；右数将附带 quality 分支纳入后按根去重。它们都不是函数调用次数。源端元数据、产物结构、处理范围、模块验证结果、尝试记录、策略标志、结果报告字段分别标明；结果字段非空不自动意味着发生一次改写。部分子机制只统计依据中指明的部分，整个条目的使用数仍未知；未单独记录用 null，不以 0 代替。T06 已停用，保留编号仅供历史比较。每条的计数单位、限制、重复统计条件和完整名单见 JSON／CSV。Q05/Q06、U06/V05 等共用证据，不得相加。\n\n各证据类别的含义、如何理解次数及例子见 [RULE_USAGE.md 开头的解释表](RULE_USAGE.md)。失败重试的开关启用也单列在那里，不混入最终命中。全部声明名单见 [RULE_USAGE.json](RULE_USAGE.json)，筛选表见 [RULE_USAGE.csv](RULE_USAGE.csv)。\n\n'+end
 if marker in text:text=re.sub(re.escape(marker)+'.*?'+re.escape(end),lambda m:method,text,flags=re.S)
 else:text=text.replace('**E：',method+'\n\n**E：',1)
 text=re.sub(r'^\| 源操作 \| Lean 目标 \|.*$', '| 源操作 | Lean 目标 | 原生映射根数 | 目标直接引用根数 |',text,flags=re.M)
 for v in primitives:
  pattern=r'^\| '+re.escape(chr(96)+v['source']+chr(96))+r' \|.*$'
  line='| '+chr(96)+v['source']+chr(96)+' | '+chr(96)+v['target']+chr(96)+f" | {v['mapped_roots']} | {v['direct_target_roots']} |"
  text=re.sub(pattern,lambda m,line=line:line,text,flags=re.M)
 text=text.replace('| 原生映射根数 | 目标直接引用根数 |\n|---|---|\n','| 原生映射根数 | 目标直接引用根数 |\n|---|---|---:|---:|\n')
 (o/'ALL_RULES.md').write_text(text)
 md=['机械 nat／eq 基线逐规则使用统计','','[完整清单](ALL_RULES.md)。2180原始根去重；左数为主表示，右数含该根 quality 分支。','',
     '以下按证据类别统计审阅条目数（不是规则使用次数），共118项，含已停用T06。所有逐项数字的单位都是去重根声明。执行调用次数未独立采集。', '',
     '| 证据类别 | 审阅条目数 | 含义 | 怎样理解次数（含例子） |','|---|---:|---|---|',
     *[f"| {label} | {n} | {definitions[label]['meaning']} | {definitions[label]['count_reading']} {definitions[label]['example']} |" for label,n in counts.items()],
     '', '部分子机制不再写作整个规则的下界。Q05/Q06、U06/V05、T06/V02 使用相同条件；跨行数字不能相加。0 表示该条件未命中或本次未启用；未知用 null／未单独记录。',
     '','| 编号 | 规则 | 主项 / 含分支根数 | 依据 |','|---|---|---|---|']
 for v in rs.values():md.append(f"| {v['id']} | {v['name']} | {display(v)} | {v['basis']} |")
 md+=['','**独立字段及报告计数器**','','这些是报告已有计数器的主表示总和，不是新增的逐规则执行事件审计。', '', '| 字段 | 命中根数 | 主表示计数器总和 |','|---|---:|---:|']
 for k,v in features.items():md.append(f"| {k} | {v['roots']} | {v.get('event_total','—')} |")
 md+=['','**重试开关启用**','','这是开关启用次数，不是内部规则执行次数。成功候选也可能被后续候选替代。c:pl 是 Prop lift，i:pl 是 plain levels；ul 是 Type lift，un 是逐出现统一。',
      '','| 开关 | 根数 | 尝试数 | 成功候选 | 发现 | 失败 |','|---|---:|---:|---:|---:|---:|']
 for k,v in sorted(attempts.items()):md.append(f"| {k} | {v['roots']} | {v['attempts']} | {v['successful_candidates']} | {v['discovery']} | {v['failed_attempts']} |")
 md+=['','**复现**','','在仓库根运行：','','    python3 scripts/catalog_rule_usage.py','',
      '读取已提交的紧凑证据 rule-usage-evidence.json；不运行翻译器。远程完整报告在场时加 --extract 可重新提取。'
      '证据类别定义保存在 RULE_USAGE.json 的 measurement_definitions。完整命中名单和结构关联证据在 RULE_USAGE.json。对未记录项必须另加执行事件埋点，不能靠当前材料推算。','']
 (o/'RULE_USAGE.md').write_text('\n'.join(md))
 print(json.dumps({'entries':118,'roots':2180,'precision':counts,'primitive_operations':61,'quality_instances':ledger['quality_family_instances']},ensure_ascii=False))
if __name__=='__main__':main()
