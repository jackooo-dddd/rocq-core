"""Independent source-quality replay, for checked template dispatch.

Universe magnitudes are deliberately abstracted away: this module decides only
Prop/SProp/Type, never validates a source judgment or discharges universe checks.
Unknown source syntax/context is rejected. No target sort is used for selection.
"""
import copy
import audit

class UnknownQuality(Exception):
    pass

def _sort(q):
    return {"k":"sort","s":{"k":q,**({"u":[{"l":{"k":"set"},"n":0}]} if q=="type" else {})}}

def _instantiate(t,args):
    def sub(x,depth):
        if x.get("k")!="rel" or x["i"]<depth:return None
        i=x["i"]-depth
        return audit.src_lift(args[-1-i],depth) if i<len(args) else {"k":"rel","i":x["i"]-len(args)}
    return audit.src_rewrite(t,sub,again=False)

class QualityAnalysis:
    def __init__(self,declarations,canonical_type=False):
        self.canonical_type=canonical_type
        self.declarations=declarations
        self.bindings={}
        for name,d in declarations.items():
            if d.get("kind")!="inductive":continue
            ti=d.get("native",{}).get("template_info") or {}
            if ti.get("default_qualities")!=[{"k":"type"}] or ti.get("conclusion_quality")!={"k":"var","i":0}:continue
            if d.get("finite")!="Finite" or len(d["bodies"])!=1:continue
            b=d["bodies"][0]
            if b["indices"] or b["projs"] or d["npars"]!=len(d["params"]) or any(p["body"] is not None for p in d["params"]):continue
            recursive=any(audit.mentions_rels(a["ty"],len(c["args"])-1-k+d["npars"],1) for c in b["ctors"] for k,a in enumerate(c["args"]))
            recursive|=any(audit.mentions_rels(a,len(c["args"])+d["npars"],1) for c in b["ctors"] for a in c["indices"])
            if recursive:continue
            bind=audit.template_binding(d)
            pa=ti["param_arguments"];pq=ti.get("parameter_qualities",[])
            if len(pa)!=len(d["params"]) or len(pq)!=len(pa):raise UnknownQuality("missing native quality bindings")
            for a,q in zip(pa,pq):
                if (a is None and q is not None) or (a is not None and(q!={"k":"var","i":0}or a["k"]!="quality_sort")):raise UnknownQuality("inconsistent quality binding")
                if a is not None and ti["defaults"][a["u"][0]["bound"]]!=a["u"][0]["l"]:raise UnknownQuality("wrong level binding")
            if not bind or len(bind)!=len(ti["defaults"]):raise UnknownQuality("empty or duplicate template levels")
            self.bindings[name]=bind

    def inst(self,d,t,us):
        u=d["universes"]
        n=0 if u["k"]=="monomorphic" else len(u["names"])
        if len(us)!=n:raise UnknownQuality("source universe instance arity")
        return audit.instantiate_source_universes(t,us)

    def whnf(self,t,ctx, fuel=256):
        if fuel<=0:raise UnknownQuality("source reduction budget")
        k=t["k"]
        if k=="rel":
            i=t["i"]
            if not 0<=i<len(ctx):raise UnknownQuality("source variable outside context")
            d=ctx[-1-i]
            return self.whnf(audit.src_lift(d["body"],i+1),ctx,fuel-1) if d["body"] is not None else t
        if k=="const":
            d=self.declarations.get(t["c"])
            if d and d["kind"]=="constant" and d["body_state"]=="transparent" and d.get("body")is not None:
                return self.whnf(self.inst(d,d["body"],t["u"]),ctx,fuel-1)
            return t
        if k=="let":return self.whnf(audit.src_subst0(t["b"],t["v"]),ctx,fuel-1)
        if k=="cast":return self.whnf(t["t"],ctx,fuel-1)
        if k=="app":
            f=self.whnf(t["f"],ctx,fuel-1)
            if f["k"]=="lam" and t["args"]:
                return self.whnf(audit.beta_app(f,t["args"]),ctx,fuel-1)
            if f["k"]=="app":
                return self.whnf({"k":"app","f":f["f"],"args":f["args"]+t["args"]},ctx,fuel-1)
            return dict(t,f=f)
        return t

    def infer(self,t,ctx=(),fuel=256):
        if fuel<=0:raise UnknownQuality("source typing budget")
        fuel-=1;k=t["k"]
        if k=="rel":
            i=t["i"]
            if not 0<=i<len(ctx):raise UnknownQuality("source variable outside context")
            return audit.src_lift(ctx[-1-i]["ty"],i+1)
        if k=="sort":return _sort("type")
        if k=="const":
            d=self.declarations.get(t["c"])
            if not d or d["kind"]!="constant":raise UnknownQuality("unknown source constant")
            return self.inst(d,d["type"],t["u"])
        if k in("ind","construct"):
            name=t["ind"]["mind"];d=self.declarations.get(name)
            if not d or name in self.bindings:raise UnknownQuality("unknown/unsaturated family")
            b=d["bodies"][t["ind"]["i"]]
            ty=b["type"] if k=="ind" else b["ctors"][t["c"]]["type"]
            ty=self.inst(d,ty,t["u"])
            return ty if k=="ind" else _instantiate(ty,[{"k":"ind","ind":{"mind":name,"i":j},"u":t["u"]}for j in range(len(d["bodies"]))])
        if k=="cast":return t["ty"]
        if k=="lam":
            return {"k":"prod","n":t["n"],"ty":t["ty"],"b":self.infer(t["b"],[*ctx,{"n":t["n"],"body":None,"ty":t["ty"]}],fuel)}
        if k=="prod":
            ds=self.whnf(self.infer(t["ty"],ctx,fuel),ctx,fuel)
            cc=[*ctx,{"n":t["n"],"body":None,"ty":t["ty"]}]
            bs=self.whnf(self.infer(t["b"],cc,fuel),cc,fuel)
            if ds["k"]!="sort" or bs["k"]!="sort":raise UnknownQuality("not a source product arity")
            return _sort(bs["s"]["k"])
        if k=="let":
            bt=self.infer(t["b"],[*ctx,{"n":t["n"],"body":t["v"],"ty":t["ty"]}],fuel)
            return audit.src_subst0(bt,t["v"])
        if k=="app":
            t=audit.src_flatten_apps(t);f=t["f"];args=t["args"]
            name=f.get("ind",{}).get("mind")
            if f["k"]in("ind","construct")and name in self.bindings:
                if f["ind"]["i"]!=0 or f["u"]:raise UnknownQuality("unsupported family instance")
                q=self.select(name,args,ctx,fuel)
                d=self.declarations[name];b=d["bodies"][0]
                ty=b["type"] if f["k"]=="ind" else b["ctors"][f["c"]]["type"]
                if q=="Prop":
                    levels=set(self.bindings[name])
                    def lower(x,depth):
                        if x.get("k")!="sort"or x["s"]["k"]!="type":return None
                        us=x["s"]["u"]
                        if not any(u["l"].get("n")in levels for u in us):return None
                        if not all(u["n"]==0 and(u["l"]["k"]=="set"or u["l"].get("n")in levels)for u in us):
                            raise UnknownQuality("mixed quality universe")
                        return _sort("prop")
                    ty=audit.src_rewrite(ty,lower,again=False)
                if f["k"]=="construct":ty=audit.src_subst0(ty,{"k":"ind","ind":f["ind"],"u":f["u"]})
            else:ty=self.infer(f,ctx,fuel)
            for a in args:
                ty=self.whnf(ty,ctx,fuel)
                if ty["k"]!="prod":raise UnknownQuality("source application has no product")
                ty=audit.src_subst0(ty["b"],a)
            return ty
        if k in("fix","cofix"):return t["defs"][t["idx"]]["ty"]
        if k=="case":
            ty=audit.src_flatten_apps(self.whnf(self.infer(t["c"],ctx,fuel),ctx,fuel))
            head,args=(ty["f"],ty["args"])if ty["k"]=="app"else(ty,[])
            ci=t["ci"];np=ci["npar"]
            if head["k"]!="ind"or head["ind"]!=ci["ind"]or len(args)<np or len(t["p"]["ctx"])!=len(args)-np+1:
                raise UnknownQuality("source case context differs")
            return _instantiate(t["p"]["ret"],[*args[np:],t["c"]])
        raise UnknownQuality("source form unavailable: "+k)

    def argument(self,arg,ctx=(),fuel=256):
        t=self.infer(arg,ctx,fuel)
        while fuel>0:
            fuel-=1;t=self.whnf(t,ctx,fuel)
            if t["k"]=="sort":return {"prop":"Prop","sprop":"SProp","type":"Type"}[t["s"]["k"]]
            if t["k"]!="prod":raise UnknownQuality("source argument is not a type family")
            ctx=[*ctx,{"n":t["n"],"body":None,"ty":t["ty"]}];t=t["b"]
        raise UnknownQuality("source arity budget")

    def select(self,name,args,ctx=(),fuel=256):
        if fuel<=0:raise UnknownQuality("quality selection budget")
        positions=[v[0] for v in self.bindings[name].values()]
        if not positions or max(positions)>=len(args):raise UnknownQuality("missing quality parameter")
        qualities=[self.argument(args[p],ctx,fuel-1)for p in positions]
        if "SProp"in qualities:raise UnknownQuality("SProp family unvalidated")
        return "Type"if "Type"in qualities else"Prop"

def occurrences(analysis,owner,t,ctx=(),path=()):
    """Paths match the native diagnostic's ordinary binder traversal."""
    k=t["k"];rows=[]
    if k=="app"and t["f"]["k"]=="ind":
        ref=t["f"]["ind"]
        if ref["mind"]in analysis.bindings:
            rows.append({"owner":owner,"path":list(path),"reference":ref["mind"]+":"+str(ref["i"]),"result_quality":analysis.select(ref["mind"],t["args"],ctx)})
    visit=lambda c,p,x:occurrences(analysis,owner,x,c,(*path,p))
    if k in("lam","prod"):
        rows+=visit(ctx,0,t["ty"])
        rows+=visit([*ctx,{"n":t["n"],"body":None,"ty":t["ty"]}],1,t["b"])
    elif k=="let":
        rows+=visit(ctx,0,t["v"])+visit(ctx,1,t["ty"])
        rows+=visit([*ctx,{"n":t["n"],"body":t["v"],"ty":t["ty"]}],2,t["b"])
    elif k=="app":
        rows+=visit(ctx,0,t["f"])
        for i,a in enumerate(t["args"]):rows+=visit(ctx,i+1,a)
    elif k=="cast":rows+=visit(ctx,0,t["t"])+visit(ctx,1,t["ty"])
    return rows


def derived_families(analysis):
    """Derive candidate signatures only from the checked source bindings.
    These are internal audit views, never additional source roots."""
    out={}
    for name,binding in analysis.bindings.items():
        original=analysis.declarations[name];levels=set(binding)
        for branch in ["qualityProp","qualityType"]:
            d=copy.deepcopy(original)
            if branch!="qualityType"or not analysis.canonical_type:
                d["name"]=name+"."+branch;d["bodies"][0]["name"]=branch
            ti=d["native"]["template_info"]
            if branch=="qualityType":
                ti["concl"]["k"]="type"
                for a in ti["param_arguments"]:
                    if a is not None:a["k"]="type"
            else:
                def lower(x):
                    if isinstance(x,list):return[lower(v)for v in x]
                    if not isinstance(x,dict):return x
                    if x.get("k")=="sort"and x["s"]["k"]=="type":
                        us=x["s"]["u"]
                        if any(u["l"].get("n")in levels for u in us):
                            if not all(u["n"]==0 and(u["l"]["k"]=="set"or u["l"].get("n")in levels)for u in us):
                                raise UnknownQuality("mixed quality sort")
                            return _sort("prop")
                    if x.get("k")in("ind","construct","const")and any(l.get("n")in levels for l in x.get("u",[])):
                        raise UnknownQuality("quality crosses reference universe")
                    return{k:lower(v)for k,v in x.items()}
                d["params"]=lower(d["params"]);d["bodies"]=lower(d["bodies"])
                d["bodies"][0]["sort"]={"k":"prop"};d["bodies"][0]["r"]="I"
                d["native"]["template"]=False
            out[d["name"]]=d
    return out

def specialize(analysis,t,ctx=(),fuel=256):
    """Independently select family names in a source audit view.
    Context entries always retain ORIGINAL source types, before this rewrite.
    Constructor/case types determine nested binder contexts; target terms and
    reported selected branches are never consulted."""
    if not has_family_reference(t,analysis.bindings):return t
    if fuel<=0:raise UnknownQuality("source quality rewrite budget")
    fuel-=1;k=t["k"]
    go=lambda a,c=ctx:specialize(analysis,a,c,fuel)
    def selected(ref,args):
        name=ref["mind"]
        if name not in analysis.bindings:return ref
        if ref["i"]!=0:raise UnknownQuality("quality family mutual body")
        q=analysis.select(name,args,ctx,fuel)
        return dict(ref,mind=name+(".qualityProp"if q=="Prop"else(""if analysis.canonical_type else".qualityType")))
    if k=="app":
        t=audit.src_flatten_apps(t);f=t["f"]
        if f["k"]in("ind","construct")and f["ind"]["mind"]in analysis.bindings:
            f=dict(f,ind=selected(f["ind"],t["args"]))
        else:f=go(f)
        return dict(t,f=f,args=[go(a)for a in t["args"]])
    if k in("ind","construct"):
        if t["ind"]["mind"]in analysis.bindings:raise UnknownQuality("unsaturated quality family reference")
        return t
    if k in("prod","lam"):
        cc=[*ctx,{"n":t["n"],"body":None,"ty":t["ty"]}]
        return dict(t,ty=go(t["ty"]),b=go(t["b"],cc))
    if k=="let":
        cc=[*ctx,{"n":t["n"],"body":t["v"],"ty":t["ty"]}]
        return dict(t,v=go(t["v"]),ty=go(t["ty"]),b=go(t["b"],cc))
    if k=="cast":return dict(t,t=go(t["t"]),ty=go(t["ty"]))
    if k=="case":
        ci=t["ci"];ref=ci["ind"];name=ref["mind"];d=analysis.declarations[name]
        b=d["bodies"][ref["i"]];ps=t["p"]["params"];us=t["p"]["u"]
        if len(ps)!=ci["npar"]:raise UnknownQuality("case parameter count")
        arity=analysis.inst(d,b["type"],us)
        def apply(ty,args,context):
            for a in args:
                ty=analysis.whnf(ty,context,fuel)
                if ty["k"]!="prod":raise UnknownQuality("case source telescope")
                ty=audit.src_subst0(ty["b"],a)
            return ty
        arity=apply(arity,ps,ctx);pc=list(ctx);ni=len(t["p"]["ctx"])-1
        if ni<0:raise UnknownQuality("empty predicate context")
        for j in range(ni):
            arity=analysis.whnf(arity,pc,fuel)
            if arity["k"]!="prod":raise UnknownQuality("case index context")
            pc.append({"n":arity["n"],"ty":arity["ty"],"body":None});arity=arity["b"]
        scrutty={"k":"app","f":{"k":"ind","ind":ref,"u":us},"args":[audit.src_lift(p,ni)for p in ps]+[{"k":"rel","i":ni-1-j}for j in range(ni)]}
        if not scrutty["args"]:scrutty=scrutty["f"]
        pc.append({"n":{"n":None,"r":ci["r"]},"ty":scrutty,"body":None})
        brs=[]
        if len(t["brs"])!=len(b["ctors"]):raise UnknownQuality("case constructor count")
        selves=[{"k":"ind","ind":{"mind":name,"i":j},"u":us}for j in range(len(d["bodies"]))]
        for br,ctor in zip(t["brs"],b["ctors"]):
            ty=apply(_instantiate(analysis.inst(d,ctor["type"],us),selves),ps,ctx);bc=list(ctx)
            for _ in br["ctx"]:
                ty=analysis.whnf(ty,bc,fuel)
                if ty["k"]!="prod":raise UnknownQuality("case branch context")
                bc.append({"n":ty["n"],"ty":ty["ty"],"body":None});ty=ty["b"]
            brs.append(dict(br,body=go(br["body"],bc)))
        return dict(t,ci=dict(ci,ind=selected(ref,ps)),p=dict(t["p"],params=[go(p)for p in ps],ret=go(t["p"]["ret"],pc)),c=go(t["c"]),brs=brs)
    if k in("fix","cofix"):
        fc=list(ctx)
        for i,d in enumerate(t["defs"]):fc.append({"n":d["n"],"body":None,"ty":audit.src_lift(d["ty"],i)})
        return dict(t,defs=[dict(d,ty=go(d["ty"]),body=go(d["body"],fc))for d in t["defs"]])
    if k=="proj":return dict(t,t=go(t["t"]))
    if k=="array":return dict(t,ty=go(t["ty"]),default=go(t["default"]),elems=[go(a)for a in t["elems"]])
    if k in("rel","sort","const","int","float","string"):return t
    raise UnknownQuality("source quality rewrite unavailable: "+k)


def has_family_reference(t,names):
    if isinstance(t,list):return any(has_family_reference(v,names)for v in t)
    if not isinstance(t,dict):return False
    if t.get("k")in("ind","construct")and t.get("ind",{}).get("mind")in names:return True
    if t.get("k")=="case"and t.get("ci",{}).get("ind",{}).get("mind")in names:return True
    return any(has_family_reference(v,names)for v in t.values()if isinstance(v,(dict,list)))

def specialize_declaration(analysis,d):
    """Rewrite a checked normalized declaration, retaining source binder scopes."""
    def go(t,ctx=()):
        return specialize(analysis,t,ctx) if t is not None and has_family_reference(t,analysis.bindings) else t
    if d["kind"]=="constant":return dict(d,type=go(d["type"]),body=go(d.get("body")))
    def context(entries,base):
        current=list(base);out=[]
        for c in reversed(entries):
            out.append(dict(c,ty=go(c["ty"],current),body=go(c["body"],current)))
            current.append(c)       # original annotation, before rewriting
        return list(reversed(out)),current
    params,pc=context(d["params"],[])
    selves=[{"n":{"n":b["name"],"r":b["r"]},"ty":audit.src_lift(b["type"],j),"body":None}for j,b in enumerate(d["bodies"])]
    # The full constructor telescope is authoritative for its parameters; contexts
    # stored beside fields already include the mutual self binders.
    cp=[]
    for p in reversed(d["params"]):cp.append(p)
    bodies=[]
    for b in d["bodies"]:
        indices,ic=context(b["indices"],pc)
        ctors=[]
        for c in b["ctors"]:
            args,ac=context(c["args"],[*selves,*cp])
            ctors.append(dict(c,type=go(c["type"],selves),args=args,indices=[go(x,ac)for x in c["indices"]]))
        # A projection's quoted type includes its own full telescope.
        projs=[dict(p,type=go(p["type"],selves))for p in b["projs"]]
        bodies.append(dict(b,type=go(b["type"]),indices=indices,ctors=ctors,projs=projs))
    return dict(d,params=params,bodies=bodies)

def expand_report_views(original,decls,rows,views=None):
    """Validate the family envelope, derive signatures and specialize source uses.
    Called AFTER original source coverage and prerequisite checks. The returned
    auxiliary keys are representation records, not additional exported roots."""
    analysis=QualityAnalysis(original,canonical_type=True)
    enabled={};aux={}
    for name,r in rows.items():
        p=r.get("quality_prop")
        if p is None:continue
        if name not in analysis.bindings or r.get("kind")!="inductive"or r.get("status")!="TRANSLATED_AND_CHECKED"or r.get("target_kind")!="inductive":
            raise UnknownQuality(name+": auxiliary family on an ineligible declaration")
        key=name+".qualityProp"
        if (not isinstance(p,dict)or p.get("source")!=key or p.get("target")!=audit.target_name(key)
                or p.get("kind")!="inductive"or p.get("status")!="TRANSLATED_AND_CHECKED"
                or p.get("target_kind")!="inductive"or p.get("quality_prop")is not None
                or p.get("pending_hypotheses")!=[]or key in original or key in rows or key in aux):
            raise UnknownQuality(name+": invalid or colliding Prop representation")
        enabled[name]=analysis.bindings[name];aux[key]=p
    analysis.bindings=enabled
    derived=derived_families(analysis)
    dd=dict(decls);rr=dict(rows);vv=None if views is None else dict(views)
    accepted={"TRANSLATED_AND_CHECKED","STATEMENT_KERNEL_CHECKED","PENDING_KERNEL_CHECKED","STATEMENT_PENDING_KERNEL_CHECKED"}
    for name,d in decls.items():
        if rows.get(name,{}).get("status")not in accepted:continue
        if name in enabled:
            dd[name]=derived[name]
            if vv is not None:vv[name]=derived[name]
        else:
            dd[name]=specialize_declaration(analysis,d)
            if vv is not None and name in vv:vv[name]=specialize_declaration(analysis,vv[name])
    for name,r in aux.items():
        dd[name]=derived[name];rr[name]=r
        if vv is not None:vv[name]=derived[name]
    return dd,rr,vv,set(aux)
