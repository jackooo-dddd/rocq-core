#!/usr/bin/env python3
"""Reproduce rule coverage from compact main75 evidence; --extract refreshes from full reports."""
import argparse,csv,json,re
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
  for p in sorted((o/'Corelib').rglob('*.json')):
   doc=json.loads(p.read_text())
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
 put('T06',lambda x,t:t.get('rule','').startswith('bootstrap/'),'nat、eq 的原生根映射；下游引用不重复计数。')
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
 put('U08',lambda x,t:'Eq' in t['consts'],'最终 AST 直接含 Lean Eq。','覆盖')
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
 counts=dict(Counter(v['precision'] for v in rs.values()))
 ledger={'root_count':2180,'entry_count':118,'measurement_counts':counts,'rules':list(rs.values()),
         'primitives':primitives,'attempt_flags':attempts,'reported_features':features,
         'quality_family_roots':sum(x['source']['quality_family'] for x in xs),
         'quality_family_instances':sum(x['source']['quality_members'] for x in xs)}
 (o/'RULE_USAGE.json').write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
 with (o/'RULE_USAGE.csv').open('w',newline='') as f:
  cols=['id','name','precision','primary_roots','family_roots','basis'];w=csv.DictWriter(f,fieldnames=cols,lineterminator='\n');w.writeheader()
  w.writerows({k:v[k] for k in cols} for v in rs.values())
 for k,e in es.items():e['usage']=rs[k]
 for op,v in zip(cat['primitive_operations'],primitives):op['usage']={k:x for k,x in v.items() if k not in ['source','target','usage']}
 (o/'ALL_RULES.json').write_text(json.dumps(cat,ensure_ascii=False,indent=2)+'\n')
 def display(v):
  if v['primary_roots'] is None:return '未单独记录'
  pre='≥' if v['precision']=='下界' else ''
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
 method=marker+'\n\n**使用次数口径**\n\n分母为2180个原始根。左数为主表示命中；右数将该根附带 quality 分支纳入后去重。依赖闭包的重复出现不重复计数。报告命中是明确字段记录；覆盖仅指处理范围或结构出现；≥是复合条目的可确认下界；未单独记录不等于零。历史日志无法恢复所有内部子规则调用次数，需要另一次带事件埋点的运行才能补全。命中次数不表示规则不可替代。\n\n失败重试的开关启用单列在 [RULE_USAGE.md](RULE_USAGE.md)，不混入最终命中。全部声明名单见 [RULE_USAGE.json](RULE_USAGE.json)，筛选表见 [RULE_USAGE.csv](RULE_USAGE.csv)。\n\n'+end
 if marker in text:text=re.sub(re.escape(marker)+'.*?'+re.escape(end),lambda m:method,text,flags=re.S)
 else:text=text.replace('**E：',method+'\n\n**E：',1)
 text=re.sub(r'^\| 源操作 \| Lean 目标 \|.*$', '| 源操作 | Lean 目标 | 原生映射根数 | 目标直接引用根数 |',text,flags=re.M)
 for v in primitives:
  pattern=r'^\| '+re.escape(chr(96)+v['source']+chr(96))+r' \|.*$'
  line='| '+chr(96)+v['source']+chr(96)+' | '+chr(96)+v['target']+chr(96)+f" | {v['mapped_roots']} | {v['direct_target_roots']} |"
  text=re.sub(pattern,lambda m,line=line:line,text,flags=re.M)
 text=text.replace('| 原生映射根数 | 目标直接引用根数 |\n|---|---|\n','| 原生映射根数 | 目标直接引用根数 |\n|---|---|---:|---:|\n')
 (o/'ALL_RULES.md').write_text(text)
 md=['main75 逐规则使用统计','','[完整清单](ALL_RULES.md)。2180原始根去重；左数为主表示，右数含该根 quality 分支。','',
     '118项统计精度：'+str(counts)+'。未单独记录不等于零，覆盖不等于内部调用次数。',
     '','| 编号 | 规则 | 主项 / 含分支根数 | 依据 |','|---|---|---|---|']
 for v in rs.values():md.append(f"| {v['id']} | {v['name']} | {display(v)} | {v['basis']} |")
 md+=['','**独立字段及项级计数器**','','| 字段 | 命中根数 | 计数器总和 |','|---|---:|---:|']
 for k,v in features.items():md.append(f"| {k} | {v['roots']} | {v.get('event_total','—')} |")
 md+=['','**重试开关启用**','','这是开关启用次数，不是内部规则执行次数。成功候选也可能被后续候选替代。c:pl 是 Prop lift，i:pl 是 plain levels；ul 是 Type lift，un 是逐出现统一。',
      '','| 开关 | 根数 | 尝试数 | 成功候选 | 发现 | 失败 |','|---|---:|---:|---:|---:|---:|']
 for k,v in sorted(attempts.items()):md.append(f"| {k} | {v['roots']} | {v['attempts']} | {v['successful_candidates']} | {v['discovery']} | {v['failed_attempts']} |")
 md+=['','**复现**','','在仓库根运行：','','    python3 scripts/catalog_rule_usage.py','',
      '读取已提交的紧凑证据 rule-usage-evidence.json；不运行翻译器。远程完整报告在场时加 --extract 可重新提取。'
      '完整命中名单和结构关联证据在 RULE_USAGE.json。对未记录项必须另加执行事件埋点，不能靠当前材料推算。','']
 (o/'RULE_USAGE.md').write_text('\n'.join(md))
 print(json.dumps({'entries':118,'roots':2180,'precision':counts,'primitive_operations':61,'quality_instances':ledger['quality_family_instances']},ensure_ascii=False))
if __name__=='__main__':main()
