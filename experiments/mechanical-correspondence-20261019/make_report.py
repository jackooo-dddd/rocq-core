from pathlib import Path
import json,csv,collections,re
W=Path(__file__).resolve().parent;R=W.parents[1]
D=W/'reports';D.mkdir(exist_ok=True)
load=lambda p:json.loads(p.read_text())
assert load(W/'unified/result.json')['status']=='PASS'
build=load(W/'build-result.json');assert all(r['exit']==0 for r in build)
auto=load(W/'auto/results.json');assert len(auto)==36 and all(r['exit']==0 for r in auto)
interfaces=load(W/'interfaces/results.json');assert len(interfaces)==45 and all(r['exit']==0 for r in interfaces)
audit=list({r['name']:r for name in ['Unified','DependentNat','DependentEq'] for r in load(W/'audits'/(name+'.json'))}.values());byname={r['name']:r for r in audit}
rows=list(csv.DictReader((R/'experiments/mechanical-nat-eq-20261019/results/declarations.csv').open()))
roots={r['source']:r for r in rows}
target_to_source={r['target']:r['source'] for r in rows}
iso_map={
'natIso':'Init.Datatypes.nat','eqIso':'Init.Logic.eq','nat_type_agrees':'Init.Nat.t','boolIso':'Init.Datatypes.bool','comparisonIso':'Init.Datatypes.comparison',
'listIso':'Init.Datatypes.list','optionIso':'Init.Datatypes.option','prodIso':'Init.Datatypes.prod',
'sumIso':'Init.Datatypes.sum','resultIso':'Init.Datatypes.result','unitIso':'Init.Datatypes.unit','emptyIso':'Init.Datatypes.Empty_set',
'sigIso':'Init.Specif.sig','sig2Iso':'Init.Specif.sig2','sigmaIso':'Init.Specif.sigT','sigma2Iso':'Init.Specif.sigT2',
'sumboolIso':'Init.Specif.sumbool','decidableIso':'Init.Specif.sumbool','sumorIso':'Init.Specif.sumor',
'positiveIso':'Numbers.BinNums.positive','binaryNatIso':'Numbers.BinNums.N','binaryIntIso':'Numbers.BinNums.Z',
'int63Iso':'Numbers.Cyclic.Int63.PrimInt63.int','int63WrapperIso':'Numbers.Cyclic.Int63.PrimInt63.int_wrapper',
'arrayIso':'Array.PrimArray.array','byteStringIso':'Strings.PrimString.string','byteIso':'Init.Byte.byte',
'floatClassIso':'Floats.FloatClass.float_class','decimalDigitsIso':'Init.Decimal.uint','hexadecimalDigitsIso':'Init.Hexadecimal.uint'}
isos=[];certs=collections.defaultdict(list)
for short,source in iso_map.items():
 r=byname['NativeBridge.'+short].copy();r['source']='Corelib.'+source
 isos.append(r);certs[r['source']].append(r['name'])
type_sources=set(certs)
operations=[]
for r in audit:
 if not r['name'].endswith('_agrees') or r['name'].startswith('NativeBridge.Iso.') or r['name'].removeprefix('NativeBridge.') in iso_map:continue
 refs=[s.removeprefix('Rocq.') for s in r['source_references'] if s.startswith('Rocq.Corelib.') and s.removeprefix('Rocq.') not in type_sources and s != 'Rocq.Corelib.Strings.PrimString.char63']
 if not refs:continue
 item=r.copy();item['sources']=refs;operations.append(item)
 for source in refs:
  if source in roots:certs[source].append(r['name'])
statements={}
for cfg in auto:
 for r in load(W/'audits'/(cfg['profile']+'.json')):
  if r['name'].startswith('NativeBridge.Statements.') and r['name'].endswith('.native'):
   target=r['name'].removeprefix('NativeBridge.Statements.').removesuffix('.native')
   statements[target]={**r,'profile':cfg['profile'],'certificate':r['name'].removesuffix('.native')+'.correspondence'}
iface={};ifskips={}
ip=load(W/'interfaces/profiles.json')
for cfg in interfaces:
 name=cfg['profile'];aud={r['name']:r for r in load(W/'audits'/(name+'.json'))}
 log=(W/'logs'/(name+'.log')).read_text()
 for target,special in re.findall(r'INTERFACE_OK (\S+) type_universe_specialization=(true|false)',log):
  source=target_to_source.get(target,ip[name]['sources'][target].replace('/','.'));base='NativeBridge.Interfaces.'+target
  assert base+'.native' in aud and base+'.roundtrip' in aud
  iface[source]={'source':source,'profile':name,'native':aud[base+'.native'],'certificate':aud[base+'.roundtrip'],'type_universe_specialization':special=='true'}
 for m in re.finditer(r'INTERFACE_SKIP (\S+): (.*?)(?=\nINTERFACE_|\n[^\n]*\.lean:|\Z)',log,re.S):
  target,reason=m.groups()
  if target in ip[name]['sources']:ifskips[target_to_source.get(target,ip[name]['sources'][target].replace('/','.'))]=reason.strip()
assert len(statements)==845
assert all(s in roots for s in iface)
meaning={
 'TYPE_ISO':'已证明双向逆；具体参数、Type/Sort 范围见证书类型。',
 'BOOTSTRAP_EQ':'翻译器已复用 Lean Eq；并非另建相等关系。',
 'OPERATION_CORRESPONDENCE':'已证明与指定原生运算/谓词一致；前提以证书类型为准。',
 'STATEMENT_FULL_NATIVE':'陈述已得到 iff，结果无 Rocq/RocqPending/Rocq2Lean 符号；未证明业务定理本身。',
 'STATEMENT_PARTIAL':'已有 iff，但结果仍含源端类型、函数或辅助模型；不是完整原生化。',
 'EXPLICIT_PROOF_PARAMETERS':'原翻译仍带显式证明参数；此轮未消去或假定它们。',
 'TYPE_VALUED_STATEMENT':'结果不是 Prop；不能用 Prop iff 扫描处理，需类型对应。',
 'TRANSPORT_INTERFACE_ONLY':'已证明原生类型接口的往返性质；尚未证明等于 Lean 的同名现成函数。',
 'NOT_YET_BRIDGED':'尚无本轮证书；不代表数学上不存在对应。'}
ledger=[]
for r in rows:
 source=r['source'];s=statements.get(r['target'])
 if source in type_sources:status='TYPE_ISO'
 elif r['status']=='BOOTSTRAP_RESOLVED' and source.endswith('.eq'):status='BOOTSTRAP_EQ'
 elif source in certs:status='OPERATION_CORRESPONDENCE'
 elif int(r['prerequisites'] or 0)>0:status='EXPLICIT_PROOF_PARAMETERS'
 elif s:status='STATEMENT_PARTIAL' if s['remaining_source_symbols'] else 'STATEMENT_FULL_NATIVE'
 elif r['status']=='STATEMENT_KERNEL_CHECKED':status='TYPE_VALUED_STATEMENT'
 elif source in iface:status='TRANSPORT_INTERFACE_ONLY'
 else:status='NOT_YET_BRIDGED'
 e={**r,'bridge_status':status,'bridge_certificates':';'.join(certs.get(source,[])),
    'statement_certificate':s['certificate'] if s else '',
    'native_statement':s['native_body'] if s else '',
    'remaining_source_symbols':';'.join(s['remaining_source_symbols']) if s else '',
    'interface_certificate':iface[source]['certificate']['name'] if source in iface else '',
    'interface_type_specialized':iface[source]['type_universe_specialization'] if source in iface else '',
    'interface_skip_reason':ifskips.get(source,''),'interpretation':meaning[status]}
 ledger.append(e)
def write_csv(path,data):
 with path.open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(data[0]));w.writeheader();w.writerows(data)
write_csv(D/'CORELIB_LEDGER.csv',ledger)
for name,data in [('isomorphisms',isos),('operations',operations),('statements',list(statements.values())),('interfaces',list(iface.values()))]:
 (D/(name+'.json')).write_text(json.dumps(data,ensure_ascii=False,indent=2))
counts=collections.Counter(r['bridge_status'] for r in ledger)
summary={'root_declarations':len(rows),'source_files':len(load(R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/manifest.json')['modules']),
 'files_with_roots':len({r['module'] for r in rows}),
 'coverage_status':dict(counts),'type_iso_certificates':len(isos),'distinct_type_roots':len(type_sources),
 'operation_certificates':len(operations),'distinct_operation_roots':counts['OPERATION_CORRESPONDENCE'],
 'statement_iff_certificates':len(statements),'fully_native_statement_iffs':sum(not s['remaining_source_symbols'] for s in statements.values()),
 'native_interface_roundtrips':len(iface),'interface_type_universe_specializations':sum(s['type_universe_specialization'] for s in iface.values()),
 'interface_candidates':sum(v['candidates'] for v in ip.values()),
 'unified_native_interfaces':sum(r['name'].startswith('NativeBridge.Interfaces.') and r['name'].endswith('.native') for r in load(W/'audits/UnifiedInterfaces.json')),
 'unified_export_roots':load(W/'unified/result.json')['roots'],'passing_manual_profiles':len(build),
 'passing_statement_profiles':len(auto),'passing_interface_profiles':len(interfaces),
 'unified_public_declarations':sum(r['kind']=='theorem' and '._' not in r['name'] for r in audit),
 'allowed_axioms':['propext','Quot.sound','Classical.choice'],
 'completion':'partial: all roots inventoried; correspondence coverage is not complete'}
(D/'summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2))
tick=chr(96);fence=tick*3
def block(s):return fence+'lean\n'+s+'\n'+fence
out=['# 已验证的类型双射','每个 Iso 同时包含 to、of、of_to、to_of；不是只有单向转换。具体 universe 范围由下面的完整类型限定。','']
for r in sorted(isos,key=lambda r:r['source']):
 out+=['## '+r['source'],tick+r['name']+tick,block(r['type']),'公理闭包：'+(', '.join(r['axioms']) or '空'),'']
(D/'ISOMORPHISMS.md').write_text('\n\n'.join(out))
out=['# 指定原生操作的对应证书','这里列的是实际等式/iff，不把通用包装接口算成 Lean 同名 API 的实现一致性。']
for r in sorted(operations,key=lambda r:r['name']):
 out+=['## '+r['name'],block(r['type']),'公理闭包：'+(', '.join(r['axioms']) or '空')]
(D/'OPERATIONS.md').write_text('\n\n'.join(out))
mods=collections.defaultdict(list)
for r in ledger:mods[r['module']].append(r)
for mod in load(R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/manifest.json')['modules']:mods.setdefault(mod,[])
for mod,rs in mods.items():
 dest=D/'modules'/Path(*mod.split('.')).with_suffix('.md');dest.parent.mkdir(parents=True,exist_ok=True)
 text=['# '+mod,'每项对应机械翻译基线中的一个 root。完整 native statement / interface 类型在总 JSON 文件中。','']
 if not rs:text.append('本基线中没有独立 kernel root 声明（例如 notation、tactic、兼容性导入或导出配置）。这不是翻译失败。')
 for r in rs:
  text+=['## '+r['source'],'状态：'+r['bridge_status']+'。'+r['interpretation']]
  for label,key in [('原始目标','target'),('操作/类型证书','bridge_certificates'),('陈述证书','statement_certificate'),('接口往返证书','interface_certificate'),('接口未覆盖原因','interface_skip_reason')]:
   if r[key]:text.append(label+'：'+r[key])
  if r['interface_type_specialized'] is True:text.append('接口只覆盖 Type 宇宙实例；未声称覆盖原始裸 Sort 的 Prop 分支。')
  if r['native_statement']:text.append(block(r['native_statement']))
  if r['remaining_source_symbols']:text.append('残留源符号：'+r['remaining_source_symbols'])
 dest.write_text('\n\n'.join(text))
print(json.dumps(summary,ensure_ascii=False,indent=2))
