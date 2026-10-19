(* Rocq2Lean source exporter.

   Frontend: MetaRocq Template quotation ([Ast_quoter.quote_term_rec ~bypass:true]), which quotes
   each root together with its recursive dependency environment, reading opaque bodies through
   the [opaque_access] state of the vernacular command.  This module only serializes the quoted
   MetaRocq AST, field by field, into the NDJSON IR described in docs/IR_SPEC.md; it performs no
   normalization.  A small native audit adds what the quotation does not carry (body kind,
   typing flags, template/private status, library files). *)

open Metarocq_template_plugin
module A = Ast0
module E = Ast0.Env
module B = BasicAst
module K = Kernames
module U = Universes0
module J = R2l_json

let ir_version = "rocq2lean-ir/0.2"
let metarocq_commit = "c18395ad772a40d59b6d04a5fcd1a4e0e5073d81"

let bs = Caml_bytestring.caml_string_of_bytestring
let nat = Caml_nat.caml_int_of_nat

let rec int_of_pos = function
  | BinNums.Coq_xH -> 1
  | BinNums.Coq_xO p -> 2 * int_of_pos p
  | BinNums.Coq_xI p -> (2 * int_of_pos p) + 1

let int_of_z = function
  | BinNums.Z0 -> 0
  | BinNums.Zpos p -> int_of_pos p
  | BinNums.Zneg p -> -int_of_pos p

(* ---------- names ---------- *)

(* MetaRocq dirpaths are innermost-first (Rocq's internal order); the IR stores them outer-first. *)
let dirpath_outer_first (dp : K.dirpath) = List.rev_map bs dp

(* Canonical string keys: file components joined by '.', module fields by '/', then '.' ident.
   Identifiers contain neither '.' nor '/', so keys are unambiguous. *)
let rec mp_key = function
  | K.MPfile dp -> String.concat "." (dirpath_outer_first dp)
  | K.MPdot (mp, id) -> mp_key mp ^ "/" ^ bs id
  | K.MPbound (dp, id, n) ->
    Printf.sprintf "%%bound(%s,%s,%d)" (String.concat "." (dirpath_outer_first dp)) (bs id) (nat n)

let kn_key ((mp, id) : K.kername) = mp_key mp ^ "." ^ bs id

let rec mp_json = function
  | K.MPfile dp -> J.Obj [ ("file", J.Arr (List.map (fun s -> J.Str s) (dirpath_outer_first dp))) ]
  | K.MPdot (mp, id) -> J.Obj [ ("dot", J.Arr [ mp_json mp; J.Str (bs id) ]) ]
  | K.MPbound (dp, id, n) ->
    J.Obj
      [ ( "bound",
          J.Arr
            [ J.Arr (List.map (fun s -> J.Str s) (dirpath_outer_first dp)); J.Str (bs id); J.Int (nat n) ] ) ]

let ind_json (i : K.inductive) =
  J.Obj [ ("mind", J.Str (kn_key i.K.inductive_mind)); ("i", J.Int (nat i.K.inductive_ind)) ]

(* ---------- universes ---------- *)

let level_json = function
  | U.Level.Coq_lzero -> J.Obj [ ("k", J.Str "set") ]
  | U.Level.Coq_level s -> J.Obj [ ("k", J.Str "global"); ("n", J.Str (bs s)) ]
  | U.Level.Coq_lvar n -> J.Obj [ ("k", J.Str "var"); ("i", J.Int (nat n)) ]

let universe_json (u : U.Universe.t) =
  J.Arr
    (List.map
       (fun ((l, k) : U.LevelExpr.t) -> J.Obj [ ("l", level_json l); ("n", J.Int (nat k)) ])
       (U.LevelExprSet.elements u))

let sort_json = function
  | U.Sort.Coq_sProp -> J.Obj [ ("k", J.Str "prop") ]
  | U.Sort.Coq_sSProp -> J.Obj [ ("k", J.Str "sprop") ]
  | U.Sort.Coq_sType u -> J.Obj [ ("k", J.Str "type"); ("u", universe_json u) ]

let instance_json (i : U.Instance.t) = J.Arr (List.map level_json i)

let constraint_json (((l1, ct), l2) : U.UnivConstraint.t) =
  let rel =
    match ct with
    | U.ConstraintType.Le z -> J.Obj [ ("k", J.Str "le"); ("offset", J.Int (int_of_z z)) ]
    | U.ConstraintType.Eq -> J.Obj [ ("k", J.Str "eq") ]
  in
  J.Obj [ ("l", level_json l1); ("rel", rel); ("r", level_json l2) ]

let name_json = function B.Coq_nAnon -> J.Null | B.Coq_nNamed id -> J.Str (bs id)

let udecl_json = function
  | U.Monomorphic_ctx -> J.Obj [ ("k", J.Str "monomorphic") ]
  | U.Polymorphic_ctx (names, cs) ->
    J.Obj
      [ ("k", J.Str "polymorphic");
        ("names", J.Arr (List.map name_json names));
        ("constraints", J.Arr (List.map constraint_json (U.ConstraintSet.elements cs))) ]

(* ---------- terms ---------- *)

let rel_json = function B.Relevant -> J.Str "R" | B.Irrelevant -> J.Str "I"
let aname_json (a : B.aname) = J.Obj [ ("n", name_json a.B.binder_name); ("r", rel_json a.B.binder_relevance) ]

let rec term_json (t : A.term) : J.t =
  let k tag fields = J.Obj (("k", J.Str tag) :: fields) in
  match t with
  | A.Coq_tRel n -> k "rel" [ ("i", J.Int (nat n)) ]
  | A.Coq_tVar id -> k "var" [ ("id", J.Str (bs id)) ]
  | A.Coq_tEvar (ev, args) -> k "evar" [ ("ev", J.Int (nat ev)); ("args", terms args) ]
  | A.Coq_tSort s -> k "sort" [ ("s", sort_json s) ]
  | A.Coq_tCast (c, ck, ty) ->
    let kind = match ck with B.VmCast -> "vm" | B.NativeCast -> "native" | B.Cast -> "default" in
    k "cast" [ ("t", term_json c); ("kind", J.Str kind); ("ty", term_json ty) ]
  | A.Coq_tProd (na, ty, b) -> k "prod" [ ("n", aname_json na); ("ty", term_json ty); ("b", term_json b) ]
  | A.Coq_tLambda (na, ty, b) -> k "lam" [ ("n", aname_json na); ("ty", term_json ty); ("b", term_json b) ]
  | A.Coq_tLetIn (na, v, ty, b) ->
    k "let" [ ("n", aname_json na); ("v", term_json v); ("ty", term_json ty); ("b", term_json b) ]
  | A.Coq_tApp (f, args) -> k "app" [ ("f", term_json f); ("args", terms args) ]
  | A.Coq_tConst (c, u) -> k "const" [ ("c", J.Str (kn_key c)); ("u", instance_json u) ]
  | A.Coq_tInd (i, u) -> k "ind" [ ("ind", ind_json i); ("u", instance_json u) ]
  | A.Coq_tConstruct (i, c, u) -> k "construct" [ ("ind", ind_json i); ("c", J.Int (nat c)); ("u", instance_json u) ]
  | A.Coq_tCase (ci, p, c, brs) ->
    k "case"
      [ ( "ci",
          J.Obj
            [ ("ind", ind_json ci.B.ci_ind); ("npar", J.Int (nat ci.B.ci_npar)); ("r", rel_json ci.B.ci_relevance) ] );
        ( "p",
          J.Obj
            [ ("u", instance_json p.A.puinst);
              ("params", terms p.A.pparams);
              ("ctx", J.Arr (List.map aname_json p.A.pcontext));
              ("ret", term_json p.A.preturn) ] );
        ("c", term_json c);
        ( "brs",
          J.Arr
            (List.map
               (fun (br : A.term A.branch) ->
                 J.Obj [ ("ctx", J.Arr (List.map aname_json br.A.bcontext)); ("body", term_json br.A.bbody) ])
               brs) ) ]
  | A.Coq_tProj (p, c) ->
    k "proj"
      [ ( "p",
          J.Obj
            [ ("ind", ind_json p.K.proj_ind); ("npars", J.Int (nat p.K.proj_npars)); ("arg", J.Int (nat p.K.proj_arg)) ] );
        ("t", term_json c) ]
  | A.Coq_tFix (mfix, idx) -> k "fix" [ ("defs", mfix_json mfix); ("idx", J.Int (nat idx)) ]
  | A.Coq_tCoFix (mfix, idx) -> k "cofix" [ ("defs", mfix_json mfix); ("idx", J.Int (nat idx)) ]
  | A.Coq_tInt i -> k "int" [ ("v", J.Str (Uint63.to_string i)) ]
  | A.Coq_tFloat f -> k "float" [ ("v", J.Str (Float64.to_hex_string f)) ]
  | A.Coq_tString s ->
    let s = Pstring.to_string s in
    k "string" [ ("bytes", J.Arr (List.init (String.length s) (fun i -> J.Int (Char.code s.[i])))) ]
  | A.Coq_tArray (u, arr, def, ty) ->
    k "array" [ ("u", level_json u); ("elems", terms arr); ("default", term_json def); ("ty", term_json ty) ]

and terms l = J.Arr (List.map term_json l)

and mfix_json m =
  J.Arr
    (List.map
       (fun (d : A.term B.def) ->
         J.Obj
           [ ("n", aname_json d.B.dname);
             ("ty", term_json d.B.dtype);
             ("body", term_json d.B.dbody);
             ("rarg", J.Int (nat d.B.rarg)) ])
       m)

(* MetaRocq contexts are snoc lists: element 0 is the innermost (last-bound) declaration. *)
let ctx_json (ctx : E.context) =
  J.Arr
    (List.map
       (fun (d : A.term B.context_decl) ->
         J.Obj
           [ ("n", aname_json d.B.decl_name); ("body", J.opt term_json d.B.decl_body); ("ty", term_json d.B.decl_type) ])
       ctx)

(* ---------- dependency edges ---------- *)

module SS = Set.Make (String)

let rec deps acc (t : A.term) =
  let ind acc (i : K.inductive) = SS.add (kn_key i.K.inductive_mind) acc in
  match t with
  | A.Coq_tRel _ | A.Coq_tVar _ | A.Coq_tSort _ | A.Coq_tInt _ | A.Coq_tFloat _ | A.Coq_tString _ -> acc
  | A.Coq_tEvar (_, args) -> List.fold_left deps acc args
  | A.Coq_tCast (a, _, b) | A.Coq_tProd (_, a, b) | A.Coq_tLambda (_, a, b) -> deps (deps acc a) b
  | A.Coq_tLetIn (_, a, b, c) -> deps (deps (deps acc a) b) c
  | A.Coq_tApp (f, args) -> List.fold_left deps (deps acc f) args
  | A.Coq_tConst (c, _) -> SS.add (kn_key c) acc
  | A.Coq_tInd (i, _) | A.Coq_tConstruct (i, _, _) -> ind acc i
  | A.Coq_tCase (ci, p, c, brs) ->
    let acc = ind acc ci.B.ci_ind in
    let acc = List.fold_left deps acc p.A.pparams in
    let acc = deps (deps acc p.A.preturn) c in
    List.fold_left (fun acc (br : A.term A.branch) -> deps acc br.A.bbody) acc brs
  | A.Coq_tProj (p, c) -> deps (ind acc p.K.proj_ind) c
  | A.Coq_tFix (m, _) | A.Coq_tCoFix (m, _) ->
    List.fold_left (fun acc (d : A.term B.def) -> deps (deps acc d.B.dtype) d.B.dbody) acc m
  | A.Coq_tArray (_, arr, d, ty) -> deps (deps (List.fold_left deps acc arr) d) ty

let ctx_deps acc (ctx : E.context) =
  List.fold_left
    (fun acc (d : A.term B.context_decl) ->
      let acc = deps acc d.B.decl_type in
      match d.B.decl_body with None -> acc | Some b -> deps acc b)
    acc ctx

let set_json s = J.Arr (List.map (fun x -> J.Str x) (SS.elements s))

(* ---------- native audit ---------- *)

let rec to_rocq_mp = function
  | K.MPfile dp -> Names.ModPath.MPfile (Names.DirPath.make (List.map (fun s -> Names.Id.of_string (bs s)) dp))
  | K.MPdot (mp, id) -> Names.ModPath.MPdot (to_rocq_mp mp, Names.Id.of_string (bs id))
  | K.MPbound _ -> raise Not_found

let to_rocq_kn ((mp, id) : K.kername) = Names.KerName.make (to_rocq_mp mp) (Names.Id.of_string (bs id))

let flags_json (f : Declarations.typing_flags) =
  let open Declarations in
  J.Obj
    [ ("check_guarded", J.Bool f.check_guarded);
      ("check_positive", J.Bool f.check_positive);
      ("check_universes", J.Bool f.check_universes);
      ("check_eliminations", J.Bool f.check_eliminations);
      ("indices_matter", J.Bool f.indices_matter);
      ("impredicative_set", J.Bool f.impredicative_set);
      ("sprop_allowed", J.Bool f.sprop_allowed);
      ("allow_uip", J.Bool f.allow_uip) ]

(* ---------- prepared environment (M5) ----------
   Sealed-module implementations are read from the module's structure and
   rechecked by the kernel. Sort-polymorphic ssr_have_upoly references are now
   preserved and handled by complete native quality families below. The former
   name-specific rest/step rewrite is no longer needed and must not unfold Qed. *)

let sealed_impl env c =
  let cb = Environ.lookup_constant c env in
  match cb.Declarations.const_body with
  | Declarations.Undef _ ->
    let kn = Names.Constant.user c in
    (try
       match Mod_declarations.mod_expr (Environ.lookup_module (Names.KerName.modpath kn) env) with
       | Mod_declarations.Struct (_, sb) ->
         (match List.assoc_opt (Names.Label.to_id (Names.KerName.label kn)) sb with
          | Some (Declarations.SFBconst icb) -> Some icb
          | _ -> None)
       | _ -> None
     with Not_found -> None)
  | _ -> None

(* (prepared body, sealed implementation?, lowered?) *)
let prepared_body ~opaque_access env c =
  let cb = Environ.lookup_constant c env in
  let sealed, src = match sealed_impl env c with Some icb -> (true, icb) | None -> (false, cb) in
  match Global.body_of_constant_body opaque_access src with
  | None -> None
  | Some (b, _, _) ->
    Some (b, sealed, false)

(* Diagnostic only: preserve the native reference quality instance before
   MetaRocq quotation or transparent-alias expansion can erase its identity. *)
let trace_native_reference_qualities ~opaque_access env owner cb =
  match Sys.getenv_opt "ROCQ2LEAN_REFERENCE_QUALITY_TRACE" with
  | None -> ()
  | Some file ->
    let quality = function
      | Sorts.Quality.QConstant Sorts.Quality.QProp -> J.Str "Prop"
      | Sorts.Quality.QConstant Sorts.Quality.QSProp -> J.Str "SProp"
      | Sorts.Quality.QConstant Sorts.Quality.QType -> J.Str "Type"
      | Sorts.Quality.QGlobal q -> J.Str (Sorts.QGlobal.to_string q)
      | Sorts.Quality.QVar q -> J.Str (Sorts.QVar.to_string q)
    in
    let oc = open_out_gen [Open_creat; Open_append; Open_text] 0o600 file in
    let rec visit env phase path t =
      let found = match Constr.kind t with
        | Constr.Const (c,u) -> Some ("constant",Names.KerName.to_string (Names.Constant.user c),u)
        | Constr.Ind ((m,i),u) -> Some ("inductive",Names.KerName.to_string (Names.MutInd.user m) ^ ":" ^ string_of_int i,u)
        | Constr.Construct (((m,i),j),u) -> Some ("constructor",Names.KerName.to_string (Names.MutInd.user m) ^ ":" ^ string_of_int i ^ ":" ^ string_of_int j,u)
        | _ -> None
      in
      (match found with
       | None -> ()
       | Some (kind,name,u) ->
         let qs,ls = UVars.Instance.to_array u in
         let record = J.Obj [("owner",J.Str owner);("phase",J.Str phase);
           ("path",J.Arr(List.map(fun i->J.Int i)path));("kind",J.Str kind);("reference",J.Str name);
           ("qualities",J.Arr(Array.to_list(Array.map quality qs)));
           ("levels",J.Arr(Array.to_list(Array.map(fun l->J.Str(Univ.Level.to_string l))ls)))] in
         output_string oc (J.to_string record);output_char oc '\n');
      (match Constr.kind t with
       | Constr.App (f,_) ->
         (match Constr.kind f with
          | Constr.Ind ((m,i),_) when Option.has_some (Environ.lookup_mind m env).Declarations.mind_template ->
            let result =
              try let sigma = Evd.from_env env in
                quality (Sorts.quality (EConstr.ESorts.kind sigma (Retyping.get_sort_of env sigma (EConstr.of_constr t))))
              with e -> J.Obj [("error",J.Str(Printexc.to_string e))]
            in
            output_string oc (J.to_string (J.Obj [("owner",J.Str owner);("phase",J.Str phase);
              ("path",J.Arr(List.map(fun i->J.Int i)path));("kind",J.Str "template_application");
              ("reference",J.Str(Names.KerName.to_string(Names.MutInd.user m)^":"^string_of_int i));
              ("result_quality",result)]));output_char oc '\n'
          | _ -> ())
       | _ -> ());
      match Constr.kind t with
      | Constr.Lambda (n,ty,b) | Constr.Prod (n,ty,b) ->
        visit env phase (path @ [0]) ty;
        visit (Environ.push_rel (Context.Rel.Declaration.LocalAssum(n,ty)) env) phase (path @ [1]) b
      | Constr.LetIn (n,v,ty,b) ->
        visit env phase (path @ [0]) v;visit env phase (path @ [1]) ty;
        visit (Environ.push_rel (Context.Rel.Declaration.LocalDef(n,v,ty)) env) phase (path @ [2]) b
      | Constr.Case _ | Constr.Fix _ | Constr.CoFix _ -> ()
      | _ ->
        let index = ref 0 in
        Constr.iter (fun child -> let i = !index in incr index;visit env phase (path @ [i]) child) t
    in
    visit env "type" [] cb.Declarations.const_type;
    (match Global.body_of_constant_body opaque_access cb with
     | Some (b,_,_) -> visit env "body" [] b | None -> ());
    close_out oc

let rec native_constant ~opaque_access env kn = native_constant_kn ~opaque_access env (to_rocq_kn kn)

and native_constant_kn ~opaque_access env rkn =
  match Environ.lookup_constant (Names.Constant.make1 rkn) env with
  | cb ->
    trace_native_reference_qualities ~opaque_access env (Names.KerName.to_string rkn) cb;
    let private_univs =
      match Global.body_of_constant_body opaque_access cb with
      | Some (_, Opaqueproof.PrivateMonomorphic (), _) -> "none"
      | Some (_, Opaqueproof.PrivatePolymorphic _, _) -> "polymorphic_private"
      | None -> "no_body"
    in
    let c = Names.Constant.make1 rkn in
    let sealed, lowered =
      match prepared_body ~opaque_access env c with Some (_, s, l) -> (s, l) | None -> (false, false)
    in
    let kind =
      match cb.Declarations.const_body with
      | Declarations.Undef _ when sealed -> "sealed_implementation"
      | Declarations.Undef _ -> "assumption"
      | Declarations.Def _ -> "transparent"
      | Declarations.OpaqueDef _ -> "opaque"
      | Declarations.Primitive _ -> "primitive"
      | Declarations.Symbol _ -> "symbol"
    in
    let primitive =
      match cb.Declarations.const_body with
      | Declarations.Primitive op ->
        let sigma = Evd.from_env env in
        let bool_result =
          match (Environ.retroknowledge env).Retroknowledge.retro_bool with
          | None -> []
          | Some (ct, cf) ->
            let quote c = term_json (Ast_quoter.quote_term env sigma (Constr.mkConstruct c)) in
            [("bool_constructors", J.Obj [("true", quote ct); ("false", quote cf)])]
        in
        let comparison_result =
          match (Environ.retroknowledge env).Retroknowledge.retro_cmp with
          | None -> []
          | Some (ce, cl, cg) ->
            let quote c = term_json (Ast_quoter.quote_term env sigma (Constr.mkConstruct c)) in
            [("comparison_constructors", J.Obj [("eq", quote ce); ("lt", quote cl); ("gt", quote cg)])]
        in
        let structured_result =
          let retro = Environ.retroknowledge env in
          let quote c = term_json (Ast_quoter.quote_term env sigma (Constr.mkConstruct c)) in
          let carry = match retro.Retroknowledge.retro_carry with
            | None -> []
            | Some (c0, c1) -> [("carry_constructors", J.Obj [("C0", quote c0); ("C1", quote c1)])]
          in
          let pair = match retro.Retroknowledge.retro_pair with
            | None -> []
            | Some cp -> [("pair_constructor", quote cp)]
          in carry @ pair
        in
        let float_result =
          let retro = Environ.retroknowledge env in
          let quote c = term_json (Ast_quoter.quote_term env sigma (Constr.mkConstruct c)) in
          let cmp = match retro.Retroknowledge.retro_f_cmp with
            | None -> []
            | Some (ce,cl,cg,cn) -> [("float_comparison_constructors", J.Obj
                [("eq",quote ce);("lt",quote cl);("gt",quote cg);("nc",quote cn)])]
          in
          let cls = match retro.Retroknowledge.retro_f_class with
            | None -> []
            | Some (pn,nn,ps,ns,pz,nz,pi,ni,nan) -> [("float_class_constructors", J.Obj
                [("pn",quote pn);("nn",quote nn);("ps",quote ps);("ns",quote ns);
                 ("pz",quote pz);("nz",quote nz);("pi",quote pi);("ni",quote ni);("nan",quote nan)])]
          in cmp @ cls
        in
        [ ("primitive_signature", J.Obj
            ([ ("operator", J.Str (CPrimitives.to_string op));
              ("type", term_json (Ast_quoter.quote_term env sigma cb.Declarations.const_type));
              ("universes", udecl_json (Ast_quoter.quote_universes_decl cb.Declarations.const_universes None));
              ("relevance", rel_json (Ast_quoter.quote_relevance cb.Declarations.const_relevance)) ] @ bool_result @ comparison_result @ structured_result @ float_result @ [("array_max_length", J.Str (Uint63.to_string Parray.max_length));
                ("string_max_length", J.Str (Uint63.to_string Pstring.max_length))])) ]
      | _ -> []
    in
    let primitive_type =
      if Environ.is_int63_type env c then [("primitive_type", J.Str "int63")]
      else if Environ.is_float64_type env c then [("primitive_type", J.Str "float64")]
      else if Environ.is_string_type env c then [("primitive_type", J.Str "string"); ("string_max_length", J.Str (Uint63.to_string Pstring.max_length))]
      else if Environ.is_array_type env c then [("primitive_type", J.Str "array"); ("array_max_length", J.Str (Uint63.to_string Parray.max_length))]
      else []
    in
    ( Some kind,
      J.Obj
        ([ ("body_kind", J.Str kind);
          ("prepared", J.Obj [ ("sealed_implementation", J.Bool sealed); ("lowered_ssr_have_upoly", J.Bool lowered) ]);
          ("polymorphic", J.Bool (Declareops.constant_is_polymorphic cb));
          ("private_universes", J.Str private_univs);
          ("typing_flags", flags_json cb.Declarations.const_typing_flags) ] @ primitive @ primitive_type) )
  | exception Not_found -> (None, J.Obj [ ("error", J.Str "not found in native environment") ])

let rec native_inductive env kn = native_inductive_kn env (to_rocq_kn kn)

(* Template polymorphism as the Rocq kernel records it (Declarations.template_universes): the
   default instance (the levels MetaRocq substitutes into the quoted terms), and for each
   LocalAssum parameter in regular order whether its sort binds template levels, with every bound
   level variable named by its default level. The conclusion sort likewise. *)
and template_info_json (t : Declarations.template_universes) =
  let open Declarations in
  let level_name l = if Univ.Level.is_set l then "Set" else Univ.Level.to_string l in
  let defaults = snd (UVars.Instance.to_array t.template_defaults) in
  let univ_json u =
    J.Arr
      (List.map
         (fun (l, k) ->
           match Univ.Level.var_index l with
           | Some i when i < Array.length defaults ->
             J.Obj [ ("l", J.Str (level_name defaults.(i))); ("bound", J.Int i); ("n", J.Int k) ]
           | _ -> J.Obj [ ("l", J.Str (level_name l)); ("bound", J.Null); ("n", J.Int k) ])
         (Univ.Universe.repr u))
  in
  let sort_json (s : Sorts.t) =
    match s with
    | Sorts.SProp -> J.Obj [ ("k", J.Str "sprop") ]
    | Sorts.Prop -> J.Obj [ ("k", J.Str "prop") ]
    | Sorts.Set -> J.Obj [ ("k", J.Str "set") ]
    | Sorts.Type u -> J.Obj [ ("k", J.Str "type"); ("u", univ_json u) ]
    | Sorts.GSort (_, u) | Sorts.VSort (_, u) -> J.Obj [ ("k", J.Str "quality_sort"); ("u", univ_json u) ]
  in
  (* Preserve quality-variable bindings alongside level-variable bindings.
     NativeMeta recomputes this complete record in a fresh Rocq process. *)
  let quality_json = function
    | Sorts.Quality.QConstant Sorts.Quality.QProp -> J.Obj [("k", J.Str "prop")]
    | Sorts.Quality.QConstant Sorts.Quality.QSProp -> J.Obj [("k", J.Str "sprop")]
    | Sorts.Quality.QConstant Sorts.Quality.QType -> J.Obj [("k", J.Str "type")]
    | Sorts.Quality.QGlobal q -> J.Obj [("k", J.Str "global"); ("name", J.Str (Sorts.QGlobal.to_string q))]
    | Sorts.Quality.QVar q ->
      (match Sorts.QVar.var_index q with
       | Some i -> J.Obj [("k", J.Str "var"); ("i", J.Int i)]
       | None -> J.Obj [("k", J.Str "unbound"); ("name", J.Str (Sorts.QVar.to_string q))])
  in
  (match Sys.getenv_opt "ROCQ2LEAN_TEMPLATE_TRACE" with
   | None -> ()
   | Some path ->
     let qs = fst (UVars.Instance.to_array t.template_defaults) in
     let record = J.Obj [
       ("defaults", J.Arr (Array.to_list (Array.map (fun l -> J.Str (level_name l)) defaults)));
       ("default_qualities", J.Arr (Array.to_list (Array.map quality_json qs)));
       ("parameter_qualities", J.Arr (List.map (function None -> J.Null | Some s -> quality_json (Sorts.quality s)) t.template_param_arguments));
       ("conclusion_quality", quality_json (Sorts.quality t.template_concl)) ] in
     let oc = open_out_gen [Open_creat; Open_append; Open_text] 0o600 path in
     output_string oc (J.to_string record); output_char oc '\n'; close_out oc);
  J.Obj
    [ ("defaults", J.Arr (Array.to_list (Array.map (fun l -> J.Str (level_name l)) defaults)));
      ( "param_arguments",
        J.Arr (List.map (function None -> J.Null | Some s -> sort_json s) t.template_param_arguments) );
      ("concl", sort_json t.template_concl);
      ("default_qualities", J.Arr (Array.to_list (Array.map quality_json (fst (UVars.Instance.to_array t.template_defaults)))));
      ("parameter_qualities", J.Arr (List.map (function None -> J.Null | Some s -> quality_json (Sorts.quality s)) t.template_param_arguments));
      ("conclusion_quality", quality_json (Sorts.quality t.template_concl)) ]

and native_inductive_kn env rkn =
  match Environ.lookup_mind (Names.MutInd.make1 rkn) env with
  | mib ->
    let open Declarations in
    J.Obj
      [ ("polymorphic", J.Bool (Declareops.inductive_is_polymorphic mib));
        (* M6: number of *uniform* parameters (recursive occurrences use them unchanged); the others
           are non-uniform and become indices in Lean *)
        ("nparams_rec", J.Int mib.mind_nparams_rec);
        ("template", J.Bool (Option.has_some mib.mind_template));
        ( "template_info",
          match mib.mind_template with None -> J.Null | Some t -> template_info_json t );
        ( "private",
          match mib.mind_private with None -> J.Null | Some b -> J.Bool b );
        ("typing_flags", flags_json mib.mind_typing_flags) ]
  | exception Not_found -> J.Obj [ ("error", J.Str "not found in native environment") ]

(* Body state, from the native body kind and the presence of a quoted body. *)
let body_state native_kind (body : A.term option) =
  match (native_kind, body) with
  | Some "transparent", Some _ -> "transparent"
  | Some "opaque", Some _ -> "opaque_present"
  | Some "sealed_implementation", Some _ -> "sealed_implementation"
  | Some "assumption", None -> "assumption"
  | Some ("primitive" | "symbol"), _ -> "unsupported_primitive"
  | _, None -> "unavailable"
  | _, Some _ -> "inconsistent"

(* ---------- statement-only mode: bookkeeping (docs/STATEMENT_ONLY_DESIGN.md) ---------- *)

(* What the statement preparation did, by IR key: proof-valued constants exported without their
   body; obligation constants (parent definition, index); the obligations of each definition; the
   definitions whose extraction was refused (reason). *)
type stmt_info = {
  proof_only : (string, unit) Hashtbl.t;
  (* opaque data (Qed with a type that is not a proposition): the type only, with its sort; Rocq's
     kernel never unfolds it, so its body is not exported and providing a value is a task *)
  opaque_data : (string, Constr.t) Hashtbl.t;
  (* A′: opaque data whose body was prepared (proof subterms extracted, Rocq's kernel re-check
     passed): exported with its body, translated as an opaque constant (never unfolded, as Rocq never
     unfolds Qed). [opaque_body_refused]: opaque data whose body could not be prepared; it keeps the
     interface treatment above, with the reason *)
  opaque_body : (string, unit) Hashtbl.t;
  opaque_body_refused : (string, string) Hashtbl.t;
  obligation_of : (string, string * int) Hashtbl.t;
  def_obligations : (string, string list) Hashtbl.t;
  prepared_statement : (string, unit) Hashtbl.t;
  statement_prop_view : (string, unit) Hashtbl.t;
  failed : (string, string) Hashtbl.t;
  (* rewritten definitions accepted by Rocq's kernel only without the guard check: a recursive call
     whose structural argument was a proof subterm, now an obligation (termination is deferred) *)
  deferred_guard : (string, string) Hashtbl.t;
}

let new_stmt_info () =
  { proof_only = Hashtbl.create 97; opaque_data = Hashtbl.create 17; opaque_body = Hashtbl.create 17;
    opaque_body_refused = Hashtbl.create 7; obligation_of = Hashtbl.create 97; def_obligations = Hashtbl.create 97;
    prepared_statement = Hashtbl.create 97; statement_prop_view = Hashtbl.create 17;
    failed = Hashtbl.create 17; deferred_guard = Hashtbl.create 7 }

(* The IR key of a native kernel name (same scheme as [kn_key]). *)
let rec native_mp_key = function
  | Names.ModPath.MPfile dp -> String.concat "." (List.rev_map Names.Id.to_string (Names.DirPath.repr dp))
  | Names.ModPath.MPdot (mp, l) -> native_mp_key mp ^ "/" ^ Names.Label.to_string l
  | Names.ModPath.MPbound _ -> "%bound"

let native_kn_key kn = native_mp_key (Names.KerName.modpath kn) ^ "." ^ Names.Label.to_string (Names.KerName.label kn)
let const_key c = native_kn_key (Names.Constant.user c)

(* ---------- native universe facts ---------- *)

let level_name l = if Univ.Level.is_set l then "Set" else Univ.Level.to_string l

(* A polymorphic context can mention global bounds absent from its terms.
   Those levels also occur in the exported declaration and require native facts. *)
let native_context_levels univs acc =
  match univs with
  | Declarations.Monomorphic -> acc
  | Declarations.Polymorphic ctx ->
    let cs = UVars.UContext.univ_constraints (UVars.AbstractContext.repr ctx) in
    Univ.UnivConstraints.fold
      (fun (a, _, b) acc -> Univ.Level.Set.add a (Univ.Level.Set.add b acc)) cs acc

(* Universe levels occurring in the native kernel terms of an exported declaration. *)
let native_decl_levels ~opaque_access env (((kn : K.kername), (d : E.global_decl))) acc =
  try
    match d with
    | E.ConstantDecl _ ->
      let cb = Environ.lookup_constant (Names.Constant.make1 (to_rocq_kn kn)) env in
      let acc = native_context_levels cb.Declarations.const_universes acc in
      let acc = Vars.universes_of_constr ~init:acc cb.Declarations.const_type in
      (match Global.body_of_constant_body opaque_access cb with
       | Some (c, _, _) -> Vars.universes_of_constr ~init:acc c
       | None -> acc)
    | E.InductiveDecl _ ->
      let mib = Environ.lookup_mind (Names.MutInd.make1 (to_rocq_kn kn)) env in
      let acc = native_context_levels mib.Declarations.mind_universes acc in
      (* Template inductives: MetaRocq quotes them at their default instance (template_defaults),
         so those default levels are part of the export. *)
      let acc =
        match mib.Declarations.mind_template with
        | Some t ->
          Array.fold_left (fun acc l -> Univ.Level.Set.add l acc) acc
            (snd (UVars.Instance.to_array t.Declarations.template_defaults))
        | None -> acc
      in
      Array.fold_left
        (fun acc oib ->
          let acc = Vars.universes_of_constr ~init:acc oib.Declarations.mind_user_arity in
          Array.fold_left (fun acc c -> Vars.universes_of_constr ~init:acc c) acc oib.Declarations.mind_user_lc)
        acc mib.Declarations.mind_packets
  with Not_found -> acc

let native_relation g a b =
  let u = Univ.Universe.make in
  if UGraph.check_leq g (Univ.Universe.super (u a)) (u b) then "lt"
  else if UGraph.check_leq g (u a) (u b) then "le"
  else "none"

(* Pairwise native relations (from the loaded environment's universe graph) between Set and
   every global level occurring in the exported declarations. *)
let universe_facts_json ~opaque_access env decls =
  let lv = List.fold_left (fun acc d -> native_decl_levels ~opaque_access env d acc) Univ.Level.Set.empty decls in
  let lv = Univ.Level.Set.filter (fun l -> not (Univ.Level.is_set l) && Univ.Level.var_index l = None) lv in
  let levels = Univ.Level.set :: Univ.Level.Set.elements lv in
  let g = Environ.universes env in
  let rels =
    List.concat_map
      (fun a ->
        List.filter_map
          (fun b ->
            if Univ.Level.equal a b then None
            else
              match native_relation g a b with
              | "none" -> None
              | r -> Some (J.Obj [ ("l", J.Str (level_name a)); ("rel", J.Str r); ("r", J.Str (level_name b)) ]))
          levels)
      levels
  in
  J.Obj
    [ ("kind", J.Str "universe_facts");
      ("levels", J.Arr (List.map (fun l -> J.Str (level_name l)) (List.tl levels)));
      ("relations", J.Arr rels);
      ("source", J.Str "native UGraph.check_leq on the loaded environment; pairwise over Set and all levels of the export") ]

(* Rocq2Lean CheckRelation "a" "b" "lt|le|none": re-check one fact against the native graph of a
   fresh process. Names are resolved through the graph's own domain (no string parsing). *)
let check_relation a b want =
  let g = Environ.universes (Global.env ()) in
  let by_name = Hashtbl.create 97 in
  Univ.Level.Set.iter (fun l -> Hashtbl.replace by_name (level_name l) l) (UGraph.domain g);
  Hashtbl.replace by_name "Set" Univ.Level.set;
  match (Hashtbl.find_opt by_name a, Hashtbl.find_opt by_name b) with
  | Some la, Some lb ->
    let got = if a = b then "eq" else native_relation g la lb in
    if got = want then Feedback.msg_info Pp.(str ("UREL_OK " ^ a ^ " " ^ b ^ " " ^ want))
    else Feedback.msg_info Pp.(str ("UREL_MISMATCH " ^ a ^ " " ^ b ^ " expected=" ^ want ^ " native=" ^ got))
  | _ -> Feedback.msg_info Pp.(str ("UREL_UNKNOWN " ^ a ^ " " ^ b))

(* Rocq2Lean CheckRelations "in.tsv" "out.txt": re-check every fact of [in.tsv] (one "a<TAB>b<TAB>want"
   per line) exactly as CheckRelation does, building the graph's name table once; one UREL_* line per
   fact is written to [out.txt] (the per-call table made large exports' pairwise checks quadratic in
   the graph's domain). *)
let check_relations inp outp =
  let g = Environ.universes (Global.env ()) in
  let by_name = Hashtbl.create 4096 in
  Univ.Level.Set.iter (fun l -> Hashtbl.replace by_name (level_name l) l) (UGraph.domain g);
  Hashtbl.replace by_name "Set" Univ.Level.set;
  let ic = open_in inp and oc = open_out outp in
  let n = ref 0 in
  (try
     while true do
       let line = input_line ic in
       match String.split_on_char '\t' line with
       | [ a; b; want ] ->
         incr n;
         (match (Hashtbl.find_opt by_name a, Hashtbl.find_opt by_name b) with
          | Some la, Some lb ->
            let got = if a = b then "eq" else native_relation g la lb in
            if got = want then output_string oc ("UREL_OK " ^ a ^ " " ^ b ^ " " ^ want ^ "\n")
            else output_string oc ("UREL_MISMATCH " ^ a ^ " " ^ b ^ " expected=" ^ want ^ " native=" ^ got ^ "\n")
          | _ -> output_string oc ("UREL_UNKNOWN " ^ a ^ " " ^ b ^ "\n"))
       | _ -> ()
     done
   with End_of_file -> ());
  close_in ic;
  close_out oc;
  Feedback.msg_info Pp.(str ("UREL_DONE " ^ string_of_int !n))

(* Rocq2Lean NativeMeta "key" "constant|inductive": recompute the native metadata of one
   declaration in a fresh process. Keys are parsed back to kernel names (IR_SPEC "Keys"). *)
let kername_of_key key =
  let i = String.rindex key '.' in
  let mp_s = String.sub key 0 i and id = String.sub key (i + 1) (String.length key - i - 1) in
  let parts = String.split_on_char '/' mp_s in
  let file = List.hd parts in
  let dp = Names.DirPath.make (List.rev_map Names.Id.of_string (String.split_on_char '.' file)) in
  let mp =
    List.fold_left (fun mp f -> Names.ModPath.MPdot (mp, Names.Id.of_string f)) (Names.ModPath.MPfile dp) (List.tl parts)
  in
  Names.KerName.make mp (Names.Id.of_string id)

let native_meta ~opaque_access key kind =
  let env = Global.env () in
  let j =
    try
      let rkn = kername_of_key key in
      match kind with
      | "constant" -> snd (native_constant_kn ~opaque_access env rkn)
      | _ -> native_inductive_kn env rkn
    with e -> J.Obj [ ("error", J.Str (Printexc.to_string e)) ]
  in
  Feedback.msg_info Pp.(str ("NATIVE_META " ^ key ^ " " ^ J.to_string j))

(* ---------- declarations ---------- *)

let finite_json = function B.Finite -> J.Str "Finite" | B.CoFinite -> J.Str "CoFinite" | B.BiFinite -> J.Str "BiFinite"

let kelim_json = function
  | U.IntoSProp -> J.Str "IntoSProp"
  | U.IntoPropSProp -> J.Str "IntoPropSProp"
  | U.IntoSetPropSProp -> J.Str "IntoSetPropSProp"
  | U.IntoAny -> J.Str "IntoAny"

let variance_json = function
  | U.Variance.Irrelevant -> J.Str "irrelevant"
  | U.Variance.Covariant -> J.Str "covariant"
  | U.Variance.Invariant -> J.Str "invariant"

let decl_json ?stmt ~opaque_access env ((kn : K.kername), (d : E.global_decl)) =
  let key = kn_key kn in
  let ident = [ ("name", J.Str key); ("mp", mp_json (fst kn)); ("id", J.Str (bs (snd kn))) ] in
  match d with
  | E.ConstantDecl cb ->
    (* native metadata always from the original environment (not the prepared one): body kind,
       sealed implementation / lowering provenance, typing flags; an obligation constant exists only
       in the prepared environment (statement mode) *)
    let native_kind, native =
      match stmt with
      | Some st when Hashtbl.mem st.obligation_of key ->
        (* an obligation is checked under its parent definition's typing flags *)
        let parent, k = Hashtbl.find st.obligation_of key in
        let flags =
          match Environ.lookup_constant (Names.Constant.make1 (kername_of_key parent)) (Global.env ()) with
          | pcb -> flags_json pcb.Declarations.const_typing_flags
          | exception Not_found -> J.Null
        in
        (Some "obligation",
         J.Obj [ ("obligation", J.Obj [ ("of", J.Str parent); ("index", J.Int k) ]); ("typing_flags", flags) ])
      | _ -> native_constant ~opaque_access (Global.env ()) kn
    in
    let state =
      match stmt with
      | Some st when Hashtbl.mem st.obligation_of key -> "obligation"
      | Some st when Hashtbl.mem st.proof_only key -> "statement_only"
      | Some st when Hashtbl.mem st.opaque_body key -> "opaque_data"
      | Some st when Hashtbl.mem st.opaque_data key -> "opaque_interface"
      | Some st when Hashtbl.mem st.failed key -> "obligation_extraction_failed"
      | _ -> body_state native_kind cb.E.cst_body
    in
    let stmt_fields =
      match stmt with
      | Some st when Hashtbl.mem st.def_obligations key ->
        [ ("obligations", J.Arr (List.map (fun o -> J.Str o) (Hashtbl.find st.def_obligations key))) ]
      | Some st when Hashtbl.mem st.failed key -> [ ("extraction_refused", J.Str (Hashtbl.find st.failed key)) ]
      | _ -> []
    in
    let stmt_fields =
      match stmt with
      | Some st when Hashtbl.mem st.prepared_statement key ->
        stmt_fields @ [ ("statement_prepared", J.Bool true) ]
      | _ -> stmt_fields
    in
    let stmt_fields =
      match stmt with
      | Some st when Hashtbl.mem st.statement_prop_view key ->
        stmt_fields @ [ ("statement_prop_view", J.Bool true) ]
      | _ -> stmt_fields
    in
    let stmt_fields =
      match stmt with
      | Some st when Hashtbl.mem st.opaque_body_refused key ->
        stmt_fields @ [ ("opaque_body_refused", J.Str (Hashtbl.find st.opaque_body_refused key)) ]
      | _ -> stmt_fields
    in
    let stmt_fields =
      match stmt with
      | Some st when Hashtbl.mem st.deferred_guard key ->
        stmt_fields @ [ ("termination", J.Obj [ ("state", J.Str "deferred"); ("guard_error", J.Str (Hashtbl.find st.deferred_guard key)) ]) ]
      | _ -> stmt_fields
    in
    let stmt_fields =
      match stmt with
      | Some st when Hashtbl.mem st.opaque_data key ->
        let sigma = Evd.from_env env in
        stmt_fields
        @ [ ("type_sort", term_json (snd (Ast_quoter.quote_term_rec ~bypass:true ~opaque_access env sigma (Hashtbl.find st.opaque_data key)))) ]
      | _ -> stmt_fields
    in
    let tdeps = deps SS.empty cb.E.cst_type in
    let bdeps = match cb.E.cst_body with None -> SS.empty | Some b -> deps SS.empty b in
    J.Obj
      ((("kind", J.Str "constant") :: ident)
      @ [ ("type", term_json cb.E.cst_type);
          ("body", J.opt term_json cb.E.cst_body);
          ("body_state", J.Str state);
          ("universes", udecl_json cb.E.cst_universes);
          ("relevance", rel_json cb.E.cst_relevance);
          ("deps", J.Obj [ ("type", set_json (SS.remove key tdeps)); ("body", set_json (SS.remove key bdeps)) ]);
          ("native", native) ]
      @ stmt_fields)
  | E.InductiveDecl mib ->
    let body_json (ob : E.one_inductive_body) =
      J.Obj
        [ ("name", J.Str (bs ob.E.ind_name));
          ("indices", ctx_json ob.E.ind_indices);
          ("sort", sort_json ob.E.ind_sort);
          ("type", term_json ob.E.ind_type);
          ("kelim", kelim_json ob.E.ind_kelim);
          ( "ctors",
            J.Arr
              (List.map
                 (fun (c : E.constructor_body) ->
                   J.Obj
                     [ ("name", J.Str (bs c.E.cstr_name));
                       ("args", ctx_json c.E.cstr_args);
                       ("indices", terms c.E.cstr_indices);
                       ("type", term_json c.E.cstr_type);
                       ("arity", J.Int (nat c.E.cstr_arity)) ])
                 ob.E.ind_ctors) );
          ( "projs",
            J.Arr
              (List.map
                 (fun (p : E.projection_body) ->
                   J.Obj
                     [ ("name", J.Str (bs p.E.proj_name)); ("r", rel_json p.E.proj_relevance); ("type", term_json p.E.proj_type) ])
                 ob.E.ind_projs) );
          ("r", rel_json ob.E.ind_relevance) ]
    in
    let tdeps =
      List.fold_left
        (fun acc (ob : E.one_inductive_body) ->
          let acc = deps (ctx_deps acc ob.E.ind_indices) ob.E.ind_type in
          let acc =
            List.fold_left
              (fun acc (c : E.constructor_body) ->
                List.fold_left deps (deps (ctx_deps acc c.E.cstr_args) c.E.cstr_type) c.E.cstr_indices)
              acc ob.E.ind_ctors
          in
          List.fold_left (fun acc (p : E.projection_body) -> deps acc p.E.proj_type) acc ob.E.ind_projs)
        (ctx_deps SS.empty mib.E.ind_params) mib.E.ind_bodies
    in
    J.Obj
      ((("kind", J.Str "inductive") :: ident)
      @ [ ("finite", finite_json mib.E.ind_finite);
          ("npars", J.Int (nat mib.E.ind_npars));
          ("params", ctx_json mib.E.ind_params);
          ("bodies", J.Arr (List.map body_json mib.E.ind_bodies));
          ("universes", udecl_json mib.E.ind_universes);
          ("variance", J.opt (fun l -> J.Arr (List.map variance_json l)) mib.E.ind_variance);
          ("deps", J.Obj [ ("type", set_json (SS.remove key tdeps)) ]);
          ("native", native_inductive (Global.env ()) kn) ])

(* ---------- driver ---------- *)

let root_constr env (gr : Names.GlobRef.t) =
  match gr with
  | Names.GlobRef.ConstRef cst ->
    let cb = Environ.lookup_constant cst env in
    Constr.mkConstU (cst, UVars.make_abstract_instance (Declareops.constant_polymorphic_context cb))
  | Names.GlobRef.IndRef ind ->
    let mib = Environ.lookup_mind (fst ind) env in
    Constr.mkIndU (ind, UVars.make_abstract_instance (Declareops.inductive_polymorphic_context mib))
  | Names.GlobRef.ConstructRef c ->
    let mib = Environ.lookup_mind (fst (fst c)) env in
    Constr.mkConstructU (c, UVars.make_abstract_instance (Declareops.inductive_polymorphic_context mib))
  | Names.GlobRef.VarRef _ -> CErrors.user_err Pp.(str "Rocq2Lean Export: a section variable cannot be a root")

let rec mp_file = function
  | K.MPfile dp -> Some dp
  | K.MPdot (mp, _) -> mp_file mp
  | K.MPbound _ -> None

(* ---------- native closure scan (quotability, before MetaRocq quoting) ----------
   MetaRocq c18395ad cannot quote a declaration whose universe context binds sort qualities (Rocq
   9.x sort polymorphism); [quote_term_rec] then aborts the whole export. The scan walks each root's
   native dependency closure (types, bodies incl. opaque ones, inductive arities and constructors)
   and reports the first such declaration with its dependency path, so that the CLI can report a
   precise blocker instead of an opaque failure. *)
let gref_name = function
  | Names.GlobRef.ConstRef c -> Names.KerName.to_string (Names.Constant.user c)
  | Names.GlobRef.IndRef (m, _) -> Names.KerName.to_string (Names.MutInd.user m)
  | _ -> "?"

let gref_key g = (match g with Names.GlobRef.ConstRef _ -> "c:" | _ -> "i:") ^ gref_name g

let rec constr_refs acc c =
  let acc =
    match Constr.kind c with
    | Constr.Const (cst, _) -> Names.GlobRef.ConstRef cst :: acc
    | Constr.Ind ((m, _), _) -> Names.GlobRef.IndRef (m, 0) :: acc
    | Constr.Construct (((m, _), _), _) -> Names.GlobRef.IndRef (m, 0) :: acc
    | Constr.Case (ci, _, _, _, _, _, _) -> Names.GlobRef.IndRef (fst ci.Constr.ci_ind, 0) :: acc
    | Constr.Proj (p, _, _) -> Names.GlobRef.IndRef (fst (Names.Projection.inductive p), 0) :: acc
    | _ -> acc
  in
  Constr.fold constr_refs acc c

let decl_refs ~opaque_access env = function
  | Names.GlobRef.ConstRef c ->
    let cb = Environ.lookup_constant c env in
    let acc = constr_refs [] cb.Declarations.const_type in
    (match Global.body_of_constant_body opaque_access cb with Some (b, _, _) -> constr_refs acc b | None -> acc)
  | Names.GlobRef.IndRef (m, _) ->
    let mib = Environ.lookup_mind m env in
    Array.fold_left
      (fun acc oib ->
        Array.fold_left constr_refs (constr_refs acc oib.Declarations.mind_user_arity) oib.Declarations.mind_user_lc)
      [] mib.Declarations.mind_packets
  | _ -> []

(* Number of sort-quality variables bound by a polymorphic declaration (None if monomorphic). *)
let sort_qualities env = function
  | Names.GlobRef.ConstRef c ->
    (match (Environ.lookup_constant c env).Declarations.const_universes with
     | Declarations.Polymorphic a -> Some (fst (UVars.AbstractContext.size a))
     | _ -> None)
  | Names.GlobRef.IndRef (m, _) ->
    (match (Environ.lookup_mind m env).Declarations.mind_universes with
     | Declarations.Polymorphic a -> Some (fst (UVars.AbstractContext.size a))
     | _ -> None)
  | _ -> None

let scan_root ~opaque_access env root =
  let parent = Hashtbl.create 97 and q = Queue.create () and found = ref None in
  Hashtbl.replace parent (gref_key root) None;
  Queue.add root q;
  while Option.is_empty !found && not (Queue.is_empty q) do
    let g = Queue.pop q in
    match sort_qualities env g with
    | Some nq when nq > 0 -> found := Some g
    | _ ->
      List.iter
        (fun d ->
          let k = gref_key d in
          if not (Hashtbl.mem parent k) then begin Hashtbl.replace parent k (Some g); Queue.add d q end)
        (decl_refs ~opaque_access env g)
  done;
  match !found with
  | None -> None
  | Some g ->
    let rec path g acc =
      match Hashtbl.find parent (gref_key g) with None -> g :: acc | Some p -> path p (g :: acc)
    in
    Some (path g [])

(* The prepared environment for a set of roots: every constant of the (prepared) closure with a sealed
   implementation or a lowering gets its prepared body; then each prepared body is re-checked by the
   kernel against its declared type (after all replacements, so that a sealed `unlock := erefl`
   sees its transparent `body`). *)
let prepare_env ~opaque_access env0 roots =
  let env = ref env0 and seen = Hashtbl.create 97 and q = Queue.create () and changed = ref [] in
  List.iter (fun g -> Queue.add g q) roots;
  while not (Queue.is_empty q) do
    let g = Queue.pop q in
    let k = gref_key g in
    if not (Hashtbl.mem seen k) then begin
      Hashtbl.add seen k ();
      (match g with
       | Names.GlobRef.ConstRef c ->
         (match prepared_body ~opaque_access !env c with
          | Some (b', sealed, lowered) when sealed || lowered ->
            let cb = Environ.lookup_constant c !env in
            env := Environ.add_constant c { cb with Declarations.const_body = Declarations.Def b' } !env;
            changed := (g, b', cb.Declarations.const_type) :: !changed
          | _ -> ())
       | _ -> ());
      List.iter (fun d -> Queue.add d q) (decl_refs ~opaque_access !env g)
    end
  done;
  List.iter
    (fun (g, b', ty) ->
      let ok =
        try
          let j = Typeops.infer !env b' in
          Conversion.conv_leq !env j.Environ.uj_type ty = Ok ()
        with _ -> false
      in
      if not ok then
        CErrors.user_err Pp.(str ("ROCQ2LEAN_PREPARE: the prepared body of " ^ gref_name g ^ " is not accepted by the kernel at its declared type")))
    !changed;
  !env

(* ---------- statement-only preparation (docs/STATEMENT_ONLY_DESIGN.md) ----------
   A constant is proof-valued when the sort of its type is Prop or SProp (Rocq's kernel decides,
   not the keyword). The statement environment keeps every kept term's proofs out:
   * a proof-valued constant keeps its type and loses its body (statement only);
   * in every kept term (a type, or the body of a constant that is not a proof) each maximal proof
     subterm t, in local context G, is replaced by [o G], where [o : forall G, T] is a new obligation
     constant (parameter) of the declaration; a proof subterm that is a proof-valued constant [c]
     stays as a reference to [c] (its statement is a task of its own); local variables stay;
   * the rewritten body must type-check against the rewritten type with Rocq's kernel, the
     obligations being parameters; otherwise the definition is exported without a body and the
     refusal is recorded (never silently kept). *)

let rec is_proof_type env sigma ty =
  (* The declared sort of a transparent type alias may be a cumulative upper
     bound (Type) even when its instantiated body is a proposition. Inspect
     the reduced codomain, including under dependent products, before deciding
     whether a constant has a proof implementation that must not be exported. *)
  let ty = Reductionops.whd_all env sigma ty in
  match EConstr.kind sigma ty with
  | Constr.Prod (na, dom, cod) ->
    is_proof_type
      (EConstr.push_rel (Context.Rel.Declaration.LocalAssum (na, dom)) env) sigma cod
  | _ ->
    match Retyping.get_sort_quality_of env sigma ty with
    | Sorts.Quality.QConstant (Sorts.Quality.QProp | Sorts.Quality.QSProp) -> true
    | _ -> false

(* Expose the proposition behind a cumulative transparent alias only for a
   proof statement. Keep every binder domain; reduce just the codomain spine.
   The caller checks native conversion against the ORIGINAL declared type under
   its complete universe context. Definitions retain their original annotations. *)
let rec statement_prop_view env sigma ty =
  let already_prop =
    match Retyping.get_sort_quality_of env sigma ty with
    | Sorts.Quality.QConstant (Sorts.Quality.QProp | Sorts.Quality.QSProp) -> true
    | _ -> false
  in
  if already_prop then ty
  else
    let reduced = Reductionops.whd_all env sigma ty in
    match EConstr.kind sigma reduced with
    | Constr.Prod (na, dom, cod) ->
      let env' = EConstr.push_rel (Context.Rel.Declaration.LocalAssum (na, dom)) env in
      EConstr.mkProd (na, dom, statement_prop_view env' sigma cod)
    | _ -> reduced

let proof_valued env c =
  let cb = Environ.lookup_constant c env in
  let sigma = Evd.from_env env in
  try is_proof_type env sigma (EConstr.of_constr cb.Declarations.const_type) with _ -> false

(* A stable, environment-free description of why Rocq's kernel refused a rewritten declaration. *)
let refusal_reason e =
  let open Type_errors in
  match e with
  | TypeError (_, err) -> (
    "kernel type error: "
    ^
    match err with
    | IllFormedRecBody (FixGuardError g, _, i, _, _) ->
      "ill-formed recursive definition (fixpoint " ^ string_of_int i ^ "): "
      ^ (match g with
         | NotEnoughAbstractionInFixBody _ -> "not enough abstractions"
         | RecursionNotOnInductiveType _ -> "recursion not on an inductive type"
         | RecursionOnIllegalTerm (k, _, _) -> "recursive call " ^ string_of_int k ^ " on a term that is not a structural subterm"
         | NotEnoughArgumentsForFixCall k -> "recursive call " ^ string_of_int k ^ " with too few arguments"
         | FixpointOnNonEliminable _ -> "fixpoint on a non-eliminable type")
    | IllFormedRecBody (CoFixGuardError _, _, _, _, _) -> "ill-formed corecursive definition"
    | IllTypedRecBody _ -> "ill-typed recursive body"
    | ActualType _ -> "actual type mismatch"
    | CantApplyBadType _ -> "application to an argument of the wrong type"
    | CantApplyNonFunctional _ -> "application of a non-function"
    | UnsatisfiedUnivConstraints _ | UnsatisfiedPConstraints _ -> "universe constraints not satisfied"
    | UndeclaredUniverses _ | UndeclaredQualities _ -> "undeclared universe levels or qualities"
    | ElimArity _ -> "elimination not allowed"
    | BadCaseRelevance _ | BadBinderRelevance _ -> "relevance mismatch"
    | IllFormedBranch _ -> "ill-formed branch"
    | _ -> "other")
  | Failure m -> m
  | e -> Printexc.to_string e

(* Replace the maximal proof subterms of [t] (closed in [env0]) by applications of fresh obligations;
   [mk stmt] returns the obligation constant for the closed statement [stmt].
   The statement of an obligation is the type its position *expects* — the domain of the applied
   function at that argument (after the preceding, already rewritten, arguments), or the declared
   type of a let — not the type inferred from the proof: the inferred type depends on how the proof
   was written (a convertible variant, e.g. a beta-redex left by a tactic), the expected type only on
   the surrounding definition. Statements are beta-normalized. Elsewhere (no expected type at hand)
   the inferred type is used. *)
let extract_proofs ?(keep_constructors = false) env0 sigma mk t =
  let canon env ty = Reductionops.nf_beta env sigma ty in
  let is_proof env t = try is_proof_type env sigma (Retyping.get_type_of env sigma t) with _ -> false in
  let extract env ty t =
    match EConstr.kind sigma t with
    | Constr.Const (c, _) when proof_valued env c -> t
    | _ ->
      let ctx = EConstr.rel_context env in
      let o = mk (EConstr.it_mkProd_or_LetIn (canon env ty) ctx) in
      EConstr.mkApp (o, Context.Rel.instance EConstr.mkRel 0 ctx)
  in
  (* local variables (hypotheses of the context) stay: they are not proof terms of the source *)
  let atomic t =
    match EConstr.kind sigma t with
    | Constr.Rel _ | Constr.Var _ | Constr.Sort _ | Constr.Meta _ | Constr.Evar _ -> true
    | _ -> false
  in
  (* Applying a local hypothesis transports no source proof implementation. Keep
     this neutral spine and recursively prepare its arguments. In the dependent
     fallback, global reference spines are retained too: proof-valued constants
     still lose their bodies and become separate prerequisite statements. Keeping
     their applications preserves sharing between a dependent type and its value. *)
  let local_application t =
    match EConstr.kind sigma t with
    | Constr.App (f, _) ->
      (match EConstr.kind sigma f with
       | Constr.Rel _ | Constr.Var _ -> true
       | Constr.Const _ -> keep_constructors
       | _ -> false)
    | _ -> false
  in
  (* On a failed dependent conversion, constructor-shaped proof terms retain
     their computational indices. Their arguments are still recursively prepared;
     arbitrary proof lambdas, matches, fixpoints and theorem bodies are not retained. *)
  let constructor_application t =
    match EConstr.kind sigma t with
    | Constr.Construct _ -> true
    | Constr.App (f, _) ->
      (match EConstr.kind sigma f with Constr.Construct _ -> true | _ -> false)
    | _ -> false
  in
  (* A proof projection is computational syntax, not a proof implementation:
     one constructor branch selects one of its own fields, optionally applied
     to neutral variables. Retain this spine so structural recursion can still
     see the selected subterm. Rocq rechecks the complete rewritten declaration.
     Arbitrary proof matches/lambdas remain obligations. *)
  let rec proof_projection env t =
    match EConstr.kind sigma t with
    | Constr.App (f, _) -> proof_projection env f
    | Constr.Case (_, _, _, _, _, scrut, branches)
      when Array.length branches = 1 && atomic scrut && is_proof env scrut ->
      let names, body = branches.(0) in
      let rec field_head t =
        match EConstr.kind sigma t with
        | Constr.Rel k -> k > 0 && k <= Array.length names
        | Constr.App (f, args) ->
          Array.for_all atomic args && field_head f
        | _ -> false
      in field_head body
    | _ -> false
  in
  (* Expand a transparent reference only when its weak-head reduct is exactly
     the neutral proof projection above. This preserves a definitional piece of
     computation (e.g. a predecessor proof) without importing arbitrary theorem
     implementations. Reduction uses the fixed original source environment. *)
  let expand_projection env t =
    let head = match EConstr.kind sigma t with Constr.App (f, _) -> f | _ -> t in
    match EConstr.kind sigma head with
    | Constr.Const (c, _) ->
      (match (Environ.lookup_constant c env).Declarations.const_body with
       | Declarations.Def _ when is_proof env t ->
         (try
            let reduced = Reductionops.nf_beta env sigma (Reductionops.whd_all env sigma t) in
            if proof_projection env reduced then reduced else t
          with _ -> t)
       | _ -> t)
    | _ -> t
  in
  let needs_extraction env t =
    let t = expand_projection env t in
    (not (atomic t)) && (not (local_application t))
    && (not (proof_projection env t))
    && (not (keep_constructors && constructor_application t)) && is_proof env t in
  let rec go env t =
    let t = expand_projection env t in
    match EConstr.kind sigma t with
    | _ when atomic t -> t
    | _ when needs_extraction env t -> extract env (Retyping.get_type_of env sigma t) t
    | Constr.App (f, args) ->
      let f' = go env f in
      let fty = ref (try Some (Retyping.get_type_of env sigma f') with _ -> None) in
      let args' =
        Array.map
          (fun a ->
            let dom_cod =
              match !fty with
              | None -> None
              | Some ty -> (
                let ty = match EConstr.kind sigma ty with Constr.Prod _ -> ty | _ -> Reductionops.whd_all env sigma ty in
                match EConstr.kind sigma ty with Constr.Prod (_, d, b) -> Some (d, b) | _ -> None)
            in
            let a' =
              match dom_cod with
              | Some (d, _) when needs_extraction env a -> extract env d a
              | _ -> go env a
            in
            fty := (match dom_cod with Some (_, b) -> Some (EConstr.Vars.subst1 a' b) | None -> None);
            a')
          args
      in
      EConstr.mkApp (f', args')
    (* Continue below a dependent binder using its rewritten domain.  The generic
       mapper pushes the original domain, which is stale after proof extraction. *)
    | Constr.Prod (na, ty, b) ->
      let ty' = go env ty in
      EConstr.mkProd (na, ty', go (EConstr.push_rel (Context.Rel.Declaration.LocalAssum (na, ty')) env) b)
    | Constr.Lambda (na, ty, b) ->
      let ty' = go env ty in
      EConstr.mkLambda (na, ty', go (EConstr.push_rel (Context.Rel.Declaration.LocalAssum (na, ty')) env) b)
    | Constr.LetIn (na, v, ty, b) ->
      let ty' = go env ty in
      let v' = if needs_extraction env v then extract env ty' v else go env v in
      EConstr.mkLetIn (na, v', ty', go (EConstr.push_rel (Context.Rel.Declaration.LocalDef (na, v', ty')) env) b)
    | _ -> Termops.map_constr_with_full_binders env sigma EConstr.push_rel go env t
  in
  go env0 t

(* An extracted proof keeps the relevance determined by its own statement.
   In particular SProp obligations are irrelevant: marking them Relevant destroys
   the source kernel's proof-irrelevant conversion in dependent types. *)
let add_proof_obligation env cb (o, stmt) =
  let sigma = Evd.from_env env in
  let relevance = EConstr.ERelevance.kind sigma
      (Retyping.relevance_of_type env sigma (EConstr.of_constr stmt)) in
  Environ.add_constant o
    { cb with Declarations.const_body = Declarations.Undef None; const_type = stmt;
              const_relevance = relevance; const_hyps = [] }
    env

(* The statement environment for [roots], recording what was done in [st]. *)
let statement_env ?(follow = true) ~opaque_access st env0 roots =
  let env = ref env0 and seen = Hashtbl.create 97 and q = Queue.create () in
  List.iter (fun g -> Queue.add g q) roots;
  while not (Queue.is_empty q) do
    let g = Queue.pop q in
    let k = gref_key g in
    if not (Hashtbl.mem seen k) then begin
      Hashtbl.add seen k ();
      (match g with
       | Names.GlobRef.ConstRef c when not (Hashtbl.mem st.obligation_of (const_key c)) ->
         (* rewritten against the fixed base environment (never against earlier rewrites): the
            result for a constant does not depend on the request or on the walk order *)
         let cb = Environ.lookup_constant c env0 in
         let key = const_key c in
         let sigma = Evd.from_env env0 in
         let poly = Declareops.constant_is_polymorphic cb in
         let inst =
           if poly then EConstr.EInstance.make (UVars.make_abstract_instance (Declareops.constant_polymorphic_context cb))
           else EConstr.EInstance.empty
         in
         let prepare keep_constructors =
           let obls = ref [] and n = ref 0 in
           let mk stmt =
             incr n;
             let lbl = Names.Label.to_string (Names.Constant.label c) ^ "__rocq2lean_obligation_" ^ string_of_int !n in
             let o = Names.Constant.make1 (Names.KerName.make (Names.Constant.modpath c) (Names.Label.make lbl)) in
             obls := (o, EConstr.to_constr sigma stmt) :: !obls;
             EConstr.mkConstU (o, inst)
           in
           let is_proof = proof_valued env0 c in
           (* opacity as declared in Rocq (the native environment): the preparation may have replaced
              an opaque body by its lowered form, which does not make it transparent *)
           let is_opaque_data =
             (not is_proof)
             && (match (Environ.lookup_constant c (Global.env ())).Declarations.const_body with
                 | Declarations.OpaqueDef _ -> true
                 | _ -> false
                 | exception Not_found -> false)
           in
           let original_ty = EConstr.of_constr cb.Declarations.const_type in
           let view_ty = if is_proof then statement_prop_view env0 sigma original_ty else original_ty in
           let view_changed = not (Constr.equal cb.Declarations.const_type (EConstr.to_constr sigma view_ty)) in
           let ty' = EConstr.to_constr sigma (extract_proofs ~keep_constructors env0 sigma mk view_ty) in
           let obls_ty = List.rev !obls in
           let body' =
             if is_proof then None
             else
               match Global.body_of_constant_body opaque_access cb with
               | None -> None
               | Some (b, _, _) -> Some (EConstr.to_constr sigma (extract_proofs ~keep_constructors env0 sigma mk (EConstr.of_constr b)))
           in
           let obls = List.rev !obls in
           (* the obligations, as parameters, then Rocq's kernel re-check of the rewritten declaration *)
           let add_obls e =
             List.fold_left (fun e o -> add_proof_obligation e cb o) e obls
           in
           (* a polymorphic constant is re-checked under its abstract universe context (De Bruijn
              universe variables), as Rocq's checker does *)
           let env' =
             if poly then Environ.push_context ~strict:false (UVars.AbstractContext.repr (Declareops.constant_polymorphic_context cb)) (add_obls env0)
             else add_obls env0
           in
           (* the constant's own typing flags, as when Rocq checked it *)
           let flags = cb.Declarations.const_typing_flags in
           let env' = Environ.set_typing_flags flags env' in
           let check ?(body' = body') env' =
             let stage = ref "rewritten type" in
             try
               if view_changed then begin
                 stage := "proof statement view conversion";
                 if Conversion.conv env' cb.Declarations.const_type (EConstr.to_constr sigma view_ty) <> Ok () then
                   failwith "proof statement view is not convertible to the original declared type";
                 Hashtbl.replace st.statement_prop_view key ()
               end;
               stage := "rewritten type";
               let _ = Typeops.infer_type env' ty' in
               List.iter (fun (o, stmt) ->
                 stage := "obligation " ^ const_key o;
                 ignore (Typeops.infer_type env' stmt)) obls;
               (match body' with
                | Some b ->
                  stage := "rewritten body inference";
                  let j = Typeops.infer env' b in
                  stage := "rewritten body/type conversion";
                  if Conversion.conv_leq env' j.Environ.uj_type ty' <> Ok () then
                    let pp t = Pp.string_of_ppcmds (Printer.safe_pr_constr_env env' (Evd.from_env env') t) in
                    failwith ("rewritten body does not have the rewritten type\nInferred: " ^ pp j.Environ.uj_type ^ "\nExpected: " ^ pp ty')
                | None -> ());
               None
             with e ->
               let detail = match e with
                 | Type_errors.TypeError (err_env, err) ->
                   (try "\n" ^ Pp.string_of_ppcmds
                     (Himsg.explain_type_error err_env (Evd.from_env err_env) (Pretype_errors.of_type_error err))
                    with _ -> "")
                 | _ -> ""
               in
               Some (e, refusal_reason e ^ " [stage: " ^ !stage ^ "]" ^ detail)
           in
           let checked =
             match check env' with
             | None -> None
             | Some (Type_errors.TypeError (_, Type_errors.IllFormedRecBody (Type_errors.FixGuardError (Type_errors.RecursionOnIllegalTerm _), _, _, _, _)), why)
               when flags.Declarations.check_guarded && not is_proof ->
               (* Rocq accepted the original under the guard check; the rewritten body differs only in
                  proof subterms, one of which was a recursive call's structural argument. Re-check
                  everything but the guard; termination becomes an explicit obligation of the
                  translation (never assumed). *)
               (match check (Environ.set_typing_flags { flags with Declarations.check_guarded = false } env') with
                | None -> Hashtbl.replace st.deferred_guard key why; None
                | Some (_, why') -> Some why')
             | Some (_, why) -> Some why
           in
           (* Optional diagnostics only: preserve both failed attempts and their
              typed obligation contexts, without affecting export decisions. *)
           (match Sys.getenv_opt "ROCQ2LEAN_EXTRACT_TRACE", checked with
            | Some dir, Some why ->
              let pp t = try Pp.string_of_ppcmds (Printer.safe_pr_constr_env env' (Evd.from_env env') t)
                with _ -> "<printing failed>" in
              let name = String.map (fun c -> if c = '/' then '_' else c) key in
              let file = Filename.concat dir (name ^ (if keep_constructors then ".constructors.json" else ".original.json")) in
              let oc = open_out file in
              output_string oc (J.to_string (J.Obj [
                ("source", J.Str key); ("keep_constructors", J.Bool keep_constructors);
                ("reason", J.Str why); ("type", J.Str (pp ty'));
                ("body", (match body' with Some b -> J.Str (pp b) | None -> J.Null));
                ("obligations", J.Arr (List.map (fun (o, t) ->
                  J.Obj [("name", J.Str (const_key o)); ("type", J.Str (pp t))]) obls)) ]));
              close_out oc
            | _ -> ());
           (ty', obls_ty, body', obls, env', check, checked, is_proof, is_opaque_data)
         in
         let first = prepare false in
         let (ty', obls_ty, body', obls, env', check, checked, is_proof, is_opaque_data) =
           match first with
           | (_, _, _, _, _, _, None, _, _) -> first
           | _ ->
             (* Keep the existing artifact when it already checks. Only a failed
                preparation retries with constructor terms visible to conversion.
                Both attempts must pass the same source kernel checks. *)
             let second = prepare true in
             match second with
             | (_, _, _, _, _, _, None, _, _) -> second
             | _ -> first
         in
         (* A′: an opaque data body that cannot be prepared falls back to the interface (type only,
            as before A′), with the reason; the type's own obligations are kept *)
         (* (also when its body is accepted only with the guard check deferred: a recursion on an
            extracted proof subterm has no translation rule, and Rocq never unfolds the body anyway) *)
         let fallback why =
           match check ~body':None env' with
           | None -> Hashtbl.replace st.opaque_body_refused key why; (None, None)
           | Some (_, why') -> (body', Some why')
         in
         let body', checked =
           match checked, body' with
           | Some why, Some _ when is_opaque_data -> fallback why
           | None, Some _ when is_opaque_data && Hashtbl.mem st.deferred_guard key ->
             let why = "termination deferred (recursion on an extracted proof subterm): " ^ Hashtbl.find st.deferred_guard key in
             Hashtbl.remove st.deferred_guard key;
             fallback why
           | _ -> (body', checked)
         in
         (* (an interface fallback keeps only the obligations of the type) *)
         let obls = if Hashtbl.mem st.opaque_body_refused key then obls_ty else obls in
         let add_obls e =
           List.fold_left (fun e o -> add_proof_obligation e cb o) e obls
         in
         (match checked with
          | Some why when not is_proof ->
            (* refused: exported without a body, statement deps only *)
            Hashtbl.replace st.failed key why;
            env := Environ.add_constant c { cb with Declarations.const_body = Declarations.Undef None } !env
          | Some why ->
            Hashtbl.replace st.failed key why;
            Hashtbl.replace st.proof_only key ();
            env := Environ.add_constant c { cb with Declarations.const_body = Declarations.Undef None } !env
          | None ->
            env := add_obls !env;
            List.iteri (fun i (o, _) -> Hashtbl.replace st.obligation_of (const_key o) (key, i + 1)) obls;
            if obls <> [] then Hashtbl.replace st.def_obligations key (List.map (fun (o, _) -> const_key o) obls);
            let changed_body = match cb.Declarations.const_body, body' with
              | Declarations.Def old, Some b -> not (Constr.equal old b)
              | Declarations.Def _, None -> true
              | _, Some _ -> true
              | _ -> false
            in
            if changed_body || not (Constr.equal cb.Declarations.const_type ty') then
              Hashtbl.replace st.prepared_statement key ();
            if is_proof then Hashtbl.replace st.proof_only key ();
            if is_opaque_data && body' <> None then Hashtbl.replace st.opaque_body key ()
            else if is_opaque_data then
              Hashtbl.replace st.opaque_data key
                (EConstr.to_constr sigma (EConstr.mkSort (Retyping.get_sort_of env' sigma (EConstr.of_constr ty'))));
            let body = match body' with Some b -> Declarations.Def b | None -> Declarations.Undef None in
            env := Environ.add_constant c { cb with Declarations.const_type = ty'; const_body = body } !env;
            List.iter (fun (o, _) -> Queue.add (Names.GlobRef.ConstRef o) q) obls)
       | _ -> ());
      if follow then List.iter (fun d -> Queue.add d q) (decl_refs ~opaque_access !env g)
    end
  done;
  !env

let statement_env_one ~opaque_access st env c =
  statement_env ~follow:false ~opaque_access st env [ Names.GlobRef.ConstRef c ]

(* Diagnostic native quality-family quotation. This is not an accepted root
   translation: family coverage/dispatch and the independent consumer remain
   separate gates. Every case keeps the original instantiated DECLARED type. *)
let native_quality_family_data ?(on_case = fun _ _ _ _ _ -> ()) ~opaque_access key =
  let env0 = Global.env () in
  let c = Names.Constant.make1 (kername_of_key key) in
  let cb = Environ.lookup_constant c env0 in
  let ctx = match cb.Declarations.const_universes with
    | Declarations.Polymorphic ctx -> ctx
    | _ -> CErrors.user_err Pp.(str "native quality family requires a polymorphic constant")
  in
  let nq, nu = UVars.AbstractContext.size ctx in
  if nq = 0 then CErrors.user_err Pp.(str "native quality family requires quality parameters");
  let body, body_kind = match cb.Declarations.const_body with
    | Declarations.Def b -> b, "transparent"
    | Declarations.OpaqueDef _ ->
      (match Global.body_of_constant_body opaque_access cb with
       | Some (b, _, body_ctx) when UVars.AbstractContext.size body_ctx = (nq, nu) -> b, "opaque"
       | _ -> CErrors.user_err Pp.(str "native quality family needs explicit private-universe support"))
    | _ -> CErrors.user_err Pp.(str "native quality family diagnostic requires an available body")
  in
  if proof_valued env0 c then
    CErrors.user_err Pp.(str "uniform quality family requires a source implementation, not a fixed proof statement");
  if not (Sorts.ElimConstraints.is_empty (UVars.UContext.elim_constraints (UVars.AbstractContext.repr ctx))) then
    CErrors.user_err Pp.(str "quality-family elimination constraints need an explicit admissible-case policy");
  let names = UVars.AbstractContext.names ctx in
  let rec tuples n =
    if n = 0 then [ [] ] else
    List.concat_map (fun q -> List.map (fun qs -> q :: qs) (tuples (n - 1)))
      [ Sorts.Quality.QConstant Sorts.Quality.QSProp;
        Sorts.Quality.QConstant Sorts.Quality.QProp;
        Sorts.Quality.QConstant Sorts.Quality.QType ]
  in
  let qname = function
    | Sorts.Quality.QConstant Sorts.Quality.QSProp -> "SProp"
    | Sorts.Quality.QConstant Sorts.Quality.QProp -> "Prop"
    | Sorts.Quality.QConstant Sorts.Quality.QType -> "Type"
    | _ -> assert false
  in
  let cases = List.map (fun qs ->
    let inst = UVars.Instance.of_array (Array.of_list qs, Array.init nu Univ.Level.var) in
    let constraints = UVars.AbstractContext.instantiate inst ctx in
    let branch_ctx = UVars.AbstractContext.make { names with UVars.quals = [||] } constraints in
    let env = Environ.push_context ~strict:false (UVars.AbstractContext.repr branch_ctx) env0 in
    let env = Environ.set_typing_flags cb.Declarations.const_typing_flags env in
    let sigma = Evd.from_env env in
    let original_type = Vars.subst_instance_constr inst cb.Declarations.const_type in
    let original_body = Vars.subst_instance_constr inst body in
    let norm t = EConstr.to_constr sigma (Reductionops.nf_all env sigma (EConstr.of_constr t)) in
    let ty = norm original_type and value = norm original_body in
    let original_ref = Constr.mkConstU (c, inst) in
    let native_type = (Typeops.infer env original_ref).Environ.uj_type in
    if Conversion.conv env native_type original_type <> Ok ()
       || Conversion.conv env original_type ty <> Ok ()
       || Conversion.conv env original_body value <> Ok ()
       || (body_kind = "transparent" && Conversion.conv env original_ref value <> Ok ()) then
      CErrors.user_err Pp.(str ("quality-family native conversion failed: " ^ key));
    ignore (Typeops.infer_type env ty);
    let checked = Typeops.infer env value in
    if Conversion.conv_leq env checked.Environ.uj_type ty <> Ok () then
      CErrors.user_err Pp.(str ("quality-family declared type check failed: " ^ key));
    let quote t =
      let ast = Ast_quoter.quote_term env sigma t in
      if not (SS.is_empty (deps SS.empty ast)) then
        CErrors.user_err Pp.(str "native quality-family normal form has unresolved global references");
      let levels = Vars.universes_of_constr ~init:Univ.Level.Set.empty t in
      if Univ.Level.Set.exists (fun l -> not (Univ.Level.is_set l) && Univ.Level.var_index l = None) levels then
        CErrors.user_err Pp.(str "native quality family needs explicit global-bound export");
      term_json ast
    in
    on_case qs inst branch_ctx ty value;
    J.Obj [
      ("qualities", J.Arr (List.map (fun q -> J.Str (qname q)) qs));
      ("universes", udecl_json (Ast_quoter.quote_universes_decl (Declarations.Polymorphic branch_ctx) None));
      ("type", quote ty); ("body", quote value);
      ("proof_valued", J.Bool (is_proof_type env sigma (EConstr.of_constr ty)));
      ("native_declared_type_conversion", J.Bool true);
      ("native_value_conversion", J.Bool true);
      ("native_kernel_check", J.Bool true)
    ]) (tuples nq)
  in
  J.Obj [
    ("schema", J.Str "rocq2lean-native-quality-family/1");
    ("source", J.Str key); ("body_kind", J.Str body_kind); ("quality_parameters", J.Int nq);
    ("level_parameters", J.Int nu); ("typing_flags", flags_json cb.Declarations.const_typing_flags);
    ("implementation_policy", J.Str "uniform_source_implementation");
    ("source_proof_valued", J.Bool false); ("quality_constraints", J.Arr []);
    ("cases", J.Arr cases)
  ]

let quality_field key = function J.Obj fields -> List.assoc key fields | _ -> assert false
let quality_cases family = match quality_field "cases" family with J.Arr xs -> xs | _ -> assert false
let quality_string = function J.Str s -> s | _ -> assert false
let quality_branch_name key qs =
  let names = match qs with J.Arr xs -> List.map quality_string xs | _ -> assert false in
  if List.for_all ((=) "Type") names then key else
  key ^ "__rocq2lean_quality_" ^
  String.concat "" (List.map (function "SProp" -> "S" | "Prop" -> "P" | "Type" -> "T" | _ -> assert false) names)

let native_quality_family ~opaque_access key file =
  let family = native_quality_family_data ~opaque_access key in
  let oc = open_out_bin file in
  output_string oc (J.to_string family); output_char oc '\n'; close_out oc;
  Feedback.msg_info Pp.(str "NATIVE_QUALITY_FAMILY " ++ str key ++ str " " ++ int (List.length (quality_cases family)))

let quality_family_descriptor family =
  let key = quality_string (quality_field "source" family) in
  let members = List.map (fun c ->
    let qs = quality_field "qualities" c in
    J.Obj [("qualities", qs); ("name", J.Str (quality_branch_name key qs));
      ("proof_valued", quality_field "proof_valued" c)]) (quality_cases family) in
  J.Obj (List.map (fun k -> k, quality_field k family)
    ["source"; "body_kind"; "quality_parameters"; "level_parameters"; "implementation_policy"; "source_proof_valued"; "quality_constraints"]
    @ [("members", J.Arr members)])

let quality_family_declarations family =
  let key = quality_string (quality_field "source" family) in
  let c = Names.Constant.make1 (kername_of_key key) in
  let dp = match Names.Constant.modpath c with
    | Names.ModPath.MPfile dp -> List.rev_map Names.Id.to_string (Names.DirPath.repr dp)
    | _ -> CErrors.user_err Pp.(str "quality-family module path needs explicit support")
  in
  let label = Names.Id.to_string (Names.Constant.label c) in
  let body_kind = quality_string (quality_field "body_kind" family) in
  let make case =
    let qs = quality_field "qualities" case in
    let name = quality_branch_name key qs in
    let id = if name = key then label else label ^ String.sub name (String.length key) (String.length name - String.length key) in
    let provenance = J.Obj [("source", J.Str key); ("qualities", qs);
      ("proof_valued", quality_field "proof_valued" case);
      ("implementation_policy", J.Str "uniform_source_implementation")] in
    let native = [
      ("body_kind", J.Str body_kind); ("polymorphic", J.Bool true);
      ("typing_flags", quality_field "typing_flags" family);
      ("quality_branch", provenance)
    ] @ if name = key then [("quality_family", quality_family_descriptor family)] else [] in
    J.Obj [
      ("kind", J.Str "constant"); ("name", J.Str name);
      ("mp", J.Obj [("file", J.Arr (List.map (fun s -> J.Str s) dp))]); ("id", J.Str id);
      ("type", quality_field "type" case); ("body", quality_field "body" case);
      ("body_state", J.Str (if body_kind = "opaque" then "opaque_present" else "transparent"));
      ("universes", quality_field "universes" case);
      ("deps", J.Obj [("type", J.Arr []); ("body", J.Arr [])]);
      ("native", J.Obj native)
    ]
  in
  let cases = quality_cases family in
  let other, default = List.partition (fun c -> quality_branch_name key (quality_field "qualities" c) <> key) cases in
  List.map make (other @ default)


(* Closed-quality references are renamed from their SOURCE instance. Opaque
   branches are assumptions only in this temporary quotation environment, so
   retyping cannot gain an unfolding forbidden by the original source. Their
   checked implementations and original opacity are emitted by the family IR. *)
let quality_dispatch_env ~opaque_access env0 roots =
  let env = ref env0 and families = Hashtbl.create 17 and branches = Hashtbl.create 97 in
  let changed = Hashtbl.create 17 and seen = Hashtbl.create 97 and queue = Queue.create () in
  let source_env = Global.env () in
  let quality_json qs = J.Arr (List.map (function
    | Sorts.Quality.QConstant Sorts.Quality.QSProp -> J.Str "SProp"
    | Sorts.Quality.QConstant Sorts.Quality.QProp -> J.Str "Prop"
    | Sorts.Quality.QConstant Sorts.Quality.QType -> J.Str "Type"
    | _ -> CErrors.user_err Pp.(str "quality dispatch requires a closed source quality instance")) qs) in
  let ensure c =
    let key = const_key c in
    if not (Hashtbl.mem families key) then begin
      let cb = Environ.lookup_constant c source_env in
      let on_case qs inst ctx ty value =
        let name = quality_branch_name key (quality_json qs) in
        let bc = Names.Constant.make1 (kername_of_key name) in
        if name <> key && Environ.mem_constant bc env0 then
          CErrors.user_err Pp.(str ("quality branch name collides with source constant: " ^ name));
        let body = match cb.Declarations.const_body with
          | Declarations.Def _ -> Declarations.Def value
          | Declarations.OpaqueDef _ -> Declarations.Undef None
          | _ -> assert false in
        let bcb = { cb with Declarations.const_type = ty; const_body = body;
          const_universes = Declarations.Polymorphic ctx;
          const_relevance = UVars.subst_instance_relevance inst cb.Declarations.const_relevance } in
        env := Environ.add_constant bc bcb !env;
        Hashtbl.add branches name ()
      in
      let family = native_quality_family_data ~on_case ~opaque_access key in
      Hashtbl.add families key family
    end
  in
  let is_family c =
    Environ.mem_constant c source_env &&
    match sort_qualities source_env (Names.GlobRef.ConstRef c) with Some n -> n > 0 | _ -> false
  in
  let rec rewrite t =
    match Constr.kind t with
    | Constr.Const (c, inst) when is_family c ->
      ensure c;
      let qs, us = UVars.Instance.to_array inst in
      let key = const_key c in
      let f = Hashtbl.find families key in
      let nq = match quality_field "quality_parameters" f with J.Int n -> n | _ -> assert false in
      let nu = match quality_field "level_parameters" f with J.Int n -> n | _ -> assert false in
      if Array.length qs <> nq || Array.length us <> nu then
        CErrors.user_err Pp.(str ("quality reference instance arity differs from source: " ^ key));
      let name = quality_branch_name key (quality_json (Array.to_list qs)) in
      Constr.mkConstU (Names.Constant.make1 (kername_of_key name), UVars.Instance.of_array ([||], us))
    | _ -> Constr.map rewrite t
  in
  List.iter (fun g -> Queue.add g queue) roots;
  let checks = ref [] and opaque_originals = ref [] in
  while not (Queue.is_empty queue) do
    let g = Queue.pop queue in
    let key = gref_key g in
    if not (Hashtbl.mem seen key) then begin
      Hashtbl.add seen key ();
      match g with
      | Names.GlobRef.ConstRef c when is_family c -> ensure c
      | Names.GlobRef.ConstRef c ->
        (* Read ordinary declarations from the prepared environment, never from
           the accumulating branch environment. *)
        let cb = Environ.lookup_constant c env0 in
        (if Environ.mem_constant c source_env then
          match (Environ.lookup_constant c source_env).Declarations.const_body with
          | Declarations.OpaqueDef _ -> opaque_originals := c :: !opaque_originals
          | _ -> ());
        let ty = rewrite cb.Declarations.const_type in
        let body = match cb.Declarations.const_body with
          | Declarations.Def b -> Declarations.Def (rewrite b)
          | Declarations.OpaqueDef _ ->
            (match Global.body_of_constant_body opaque_access cb with
             | Some (b, _, body_ctx) ->
               let b' = rewrite b in
               if Constr.equal b b' then cb.Declarations.const_body else begin
                 let declared_ctx = Declareops.constant_polymorphic_context cb in
                 if UVars.AbstractContext.size body_ctx <> UVars.AbstractContext.size declared_ctx then
                   CErrors.user_err Pp.(str ("quality dispatch requires explicit opaque private-universe support: " ^ const_key c));
                 Declarations.Def b'
               end
             | None -> cb.Declarations.const_body)
          | other -> other in
        if not (Constr.equal ty cb.Declarations.const_type) || body <> cb.Declarations.const_body then begin
          Hashtbl.replace changed (const_key c) ();
          let cb' = { cb with Declarations.const_type = ty; const_body = body } in
          env := Environ.add_constant c cb' !env;
          checks := (c, cb') :: !checks
        end;
        List.iter (fun d -> Queue.add d queue) (decl_refs ~opaque_access env0 g)
      | _ ->
        (* Non-constant declarations retain the existing quoter and failure gate.
           No inductive interface is silently altered. *)
        List.iter (fun d -> Queue.add d queue) (decl_refs ~opaque_access env0 g)
    end
  done;
  (* Opaque implementations are materialized only for quotation. During
     native retyping every original opaque reference remains non-unfoldable. *)
  let check_env = List.fold_left (fun e c ->
    let cb = Environ.lookup_constant c e in
    Environ.add_constant c { cb with Declarations.const_body = Declarations.Undef None } e)
    !env !opaque_originals in
  List.iter (fun (c, cb) ->
    let e = match cb.Declarations.const_universes with
      | Declarations.Polymorphic ctx -> Environ.push_context ~strict:false (UVars.AbstractContext.repr ctx) check_env
      | _ -> check_env in
    let e = Environ.set_typing_flags cb.Declarations.const_typing_flags e in
    ignore (Typeops.infer_type e cb.Declarations.const_type);
    match cb.Declarations.const_body with
    | Declarations.Def b ->
      let inferred = (Typeops.infer e b).Environ.uj_type in
      if Conversion.conv_leq e inferred cb.Declarations.const_type <> Ok () then
        CErrors.user_err Pp.(str ("quality dispatch does not preserve source typing: " ^ const_key c))
    | _ -> ()) !checks;
  !env, (List.sort compare (Hashtbl.fold (fun key f acc -> (key, f) :: acc) families [])), branches, changed

let export_in ?stmt ~opaque_access env file (roots : Libnames.qualid list) =
  let source_env = env in
  let _family_roots, ordinary_roots = List.partition (fun qid ->
    match Nametab.global qid with
    | Names.GlobRef.ConstRef _ as gr -> (match sort_qualities env gr with Some n -> n > 0 | _ -> false)
    | _ -> false) roots in
  let env, families, family_branches, quality_changed =
    quality_dispatch_env ~opaque_access source_env (List.map Nametab.global roots) in
  let sigma = Evd.from_env env in
  let family_decls = List.concat_map (fun (_, f) -> quality_family_declarations f) families in
  let blocked =
    List.filter_map
      (fun qid ->
        match scan_root ~opaque_access env (Nametab.global qid) with
        | Some p -> Some (qid, p)
        | None -> None)
      ordinary_roots
  in
  if blocked <> [] then begin
    let oc = open_out (file ^ ".blockers.json") in
    output_string oc
      (J.to_string
         (J.Obj
            [ ("kind", J.Str "unquotable");
              ( "reason",
                J.Str "sort-polymorphic universe context: MetaRocq c18395ad cannot quote it" );
              ( "roots",
                J.Arr
                  (List.map
                     (fun (qid, p) ->
                       J.Obj
                         [ ("requested", J.Str (Libnames.string_of_qualid qid));
                           ("path", J.Arr (List.map (fun g -> J.Str (gref_name g)) p)) ])
                     blocked) ) ]));
    close_out oc;
    CErrors.user_err
      Pp.(str "ROCQ2LEAN_UNQUOTABLE: " ++ int (List.length blocked)
          ++ str " root(s) depend on a sort-polymorphic declaration; see " ++ str file ++ str ".blockers.json")
  end;
  let quoted =
    List.map
      (fun qid ->
        let gr = Nametab.global qid in
        let (genv, t) : E.program =
          Ast_quoter.quote_term_rec ~bypass:true ~opaque_access env sigma (root_constr env gr)
        in
        (qid, genv, t))
      ordinary_roots
  in
  (* Merge the per-root environments; each MetaRocq environment is newest-first, so reversing
     yields dependencies before dependents. *)
  let seen = Hashtbl.create 97 in
  let order = ref [] in
  List.iter
    (fun (_, (genv : E.global_env), _) ->
      List.iter
        (fun ((kn, _) as d) ->
          let key = kn_key kn in
          if not (Hashtbl.mem seen key) then begin
            Hashtbl.add seen key ();
            order := d :: !order
          end)
        (List.rev genv.E.declarations))
    quoted;
  let decls = List.filter (fun (kn, _) -> not (Hashtbl.mem family_branches (kn_key kn))) (List.rev !order) in
  let levels = Hashtbl.create 17 and constraints = Hashtbl.create 17 in
  let add tbl j = let s = J.to_string j in if not (Hashtbl.mem tbl s) then Hashtbl.add tbl s j in
  List.iter
    (fun (_, (genv : E.global_env), _) ->
      let lvls, cstrs = genv.E.universes in
      List.iter (fun l -> add levels (level_json l)) (U.LevelSet.elements lvls);
      List.iter (fun c -> add constraints (constraint_json c)) (U.ConstraintSet.elements cstrs))
    quoted;
  let sorted tbl = List.sort compare (Hashtbl.fold (fun s _ acc -> s :: acc) tbl []) |> List.map (Hashtbl.find tbl) in
  let libs =
    List.sort_uniq compare
      (List.filter_map (fun ((mp, _), _) -> Option.map (fun dp -> List.map bs dp) (mp_file mp)) decls
       @ List.map (fun (_, f) ->
           let c = Names.Constant.make1 (kername_of_key (quality_string (quality_field "source" f))) in
           match Names.Constant.modpath c with
           | Names.ModPath.MPfile dp -> List.map Names.Id.to_string (Names.DirPath.repr dp)
           | _ -> assert false) families)
  in
  let lib_json dp =
    let rdp = Names.DirPath.make (List.map Names.Id.of_string dp) in
    let vo = match Loadpath.locate_absolute_library rdp with Ok f -> J.Str f | Error _ -> J.Null in
    J.Obj [ ("dirpath", J.Str (String.concat "." (List.rev dp))); ("vo", vo) ]
  in
  let header =
    J.Obj
      [ ("kind", J.Str "header");
        ("ir", J.Str ir_version);
        ( "frontend",
          J.Obj
            [ ("name", J.Str "metarocq-template");
              ("metarocq_commit", J.Str metarocq_commit);
              ("quoter", J.Str "Ast_quoter.quote_term_rec ~bypass:true");
              ("opaque_access", J.Str "vernac STATE opaque_access") ] );
        ("rocq_version", J.Str Coq_config.version);
        ("ocaml_version", J.Str Sys.ocaml_version);
        ("global_typing_flags", flags_json (Environ.typing_flags env));
        ( "mode",
          match stmt with
          | None -> J.Str "proof"
          | Some st ->
            J.Obj
              [ ("name", J.Str "statement");
                ("proof_only", J.Int (Hashtbl.length st.proof_only));
                ("obligations", J.Int (Hashtbl.length st.obligation_of));
                ( "extraction_refused",
                  J.Obj (List.sort compare (Hashtbl.fold (fun k v acc -> (k, J.Str v) :: acc) st.failed [])) );
                ( "termination_deferred",
                  J.Arr (List.map (fun k -> J.Str k) (List.sort compare (Hashtbl.fold (fun k _ acc -> k :: acc) st.deferred_guard []))) ) ] );
        ( "conventions",
          J.Obj
            [ ("bvar", J.Str "MetaRocq tRel n = IR rel n, 0 = innermost binder");
              ("contexts", J.Str "arrays innermost-first (MetaRocq snoc order)");
              ("ctor_index", J.Str "0-based");
              ("dirpaths", J.Str "outer-first");
              ("case", J.Str "MetaRocq compact case: pcontext/bcontext carry names only") ] ) ]
  in
  let roots_json =
    J.Obj [("kind", J.Str "roots"); ("roots", J.Arr (List.map (fun qid ->
      let requested = Libnames.string_of_qualid qid in
      match List.assoc_opt (gref_name (Nametab.global qid)) families with
      | Some f ->
        let key = quality_string (quality_field "source" f) in
        let nu = match quality_field "level_parameters" f with J.Int n -> n | _ -> assert false in
        let nq = match quality_field "quality_parameters" f with J.Int n -> n | _ -> assert false in
        let vars n = J.Arr (List.init n (fun i -> J.Obj [("k", J.Str "var"); ("i", J.Int i)])) in
        J.Obj [("requested", J.Str requested); ("name", J.Str key);
          ("term", J.Obj [("k", J.Str "const"); ("c", J.Str key); ("u", vars nu); ("q", vars nq)])]
      | None ->
        let _, _, t = List.find (fun (q, _, _) -> Libnames.string_of_qualid q = requested) quoted in
        let name = match t with
          | A.Coq_tConst (c, _) -> J.Str (kn_key c)
          | A.Coq_tInd (i, _) | A.Coq_tConstruct (i, _, _) -> J.Str (kn_key i.K.inductive_mind)
          | _ -> J.Null in
        J.Obj [("requested", J.Str requested); ("name", name); ("term", term_json t)]
    ) roots))]
  in
  let oc = open_out_bin file in
  let line j = output_string oc (J.to_string j); output_char oc '\n' in
  line header;
  line roots_json;
  line (J.Obj [ ("kind", J.Str "libraries"); ("libraries", J.Arr (List.map lib_json libs)) ]);
  line (J.Obj [ ("kind", J.Str "universes"); ("levels", J.Arr (sorted levels)); ("constraints", J.Arr (sorted constraints)) ]);
  line (universe_facts_json ~opaque_access env decls);
  List.iter line family_decls;
  List.iter (fun ((kn, _) as d) ->
    let j = decl_json ?stmt ~opaque_access env d in
    let j = if Hashtbl.mem quality_changed (kn_key kn) then
      match j with J.Obj xs -> J.Obj (xs @ [("quality_dispatch", J.Bool true)]) | _ -> assert false
      else j in
    line j) decls;
  line (J.Obj [ ("kind", J.Str "footer"); ("declarations", J.Int (List.length family_decls + List.length decls)) ]);
  close_out oc;
  Feedback.msg_info
    Pp.(str "Rocq2Lean Export: wrote " ++ int (List.length family_decls + List.length decls) ++ str " declarations for "
        ++ int (List.length roots) ++ str " root(s) to " ++ str file)

let export ~opaque_access file (roots : Libnames.qualid list) =
  let env = prepare_env ~opaque_access (Global.env ()) (List.map Nametab.global roots) in
  export_in ~opaque_access env file roots

(* Statement-only export: the statement environment of the roots (after the usual preparation). *)
let export_statements ~opaque_access file (roots : Libnames.qualid list) =
  let grefs = List.map Nametab.global roots in
  let env = prepare_env ~opaque_access (Global.env ()) grefs in
  let st = new_stmt_info () in
  let env = statement_env ~opaque_access st env grefs in
  export_in ~stmt:st ~opaque_access env file roots

(* Round trip of the statement preparation: a fresh process re-prepares one constant alone and
   prints its rewritten type and body and its obligations (quoted), to be compared with the IR. *)
let check_statement_prepared ?env ~opaque_access key =
  let c = Names.Constant.make1 (kername_of_key key) in
  let env = match env with Some e -> e | None -> prepare_env ~opaque_access (Global.env ()) [ Names.GlobRef.ConstRef c ] in
  let st = new_stmt_info () in
  (* only this constant: stop the closure walk after it *)
  let env' = statement_env_one ~opaque_access st env c in
  let env', _, _, quality_changed = quality_dispatch_env ~opaque_access env' [Names.GlobRef.ConstRef c] in
  let sigma = Evd.from_env env' in
  (* (the term alone: quote_term_rec would also quote the term's whole environment closure, the
     dominant cost of a batched re-derivation; the term part is the same quotation) *)
  let q t = term_json (Ast_quoter.quote_term env' sigma t) in
  let cb = Environ.lookup_constant c env' in
  let body = match cb.Declarations.const_body with Declarations.Def b -> q b | _ -> J.Null in
  let obls =
    match Hashtbl.find_opt st.def_obligations key with
    | None -> []
    | Some os ->
      List.map
        (fun o -> J.Obj [ ("name", J.Str o); ("type", q (Environ.lookup_constant (Names.Constant.make1 (kername_of_key o)) env').Declarations.const_type) ])
        os
  in
  let state =
    if Hashtbl.mem st.failed key && not (Hashtbl.mem st.proof_only key) then "obligation_extraction_failed"
    else if Hashtbl.mem st.proof_only key then "statement_only"
    else if Hashtbl.mem st.opaque_body key then "opaque_data"
    else if Hashtbl.mem st.opaque_data key then "opaque_interface" else "kept"
  in
  Feedback.msg_info
    Pp.(str ("STATEMENT " ^ key ^ " " ^ J.to_string (J.Obj [ ("type", q cb.Declarations.const_type); ("body", body);
                                                                ("state", J.Str state); ("obligations", J.Arr obls);
                                                                ("statement_prepared", J.Bool (Hashtbl.mem st.prepared_statement key));
                                                                ("statement_prop_view", J.Bool (Hashtbl.mem st.statement_prop_view key));
                                                                ("quality_dispatch", J.Bool (Hashtbl.mem quality_changed key));
                                                                ("termination", if Hashtbl.mem st.deferred_guard key then J.Str "deferred" else J.Null) ])))

(* Batched: the statement preparation of every constant listed in [file] (one key per line), the
   environment prepared once for all of them (as the export prepares it for all its roots); each
   constant is then re-derived alone (statement_env_one, a fresh record), printed as above. *)
let check_statements_prepared ~opaque_access file =
  let ic = open_in file in
  let keys = ref [] in
  (try
     while true do
       let l = String.trim (input_line ic) in
       if l <> "" then keys := l :: !keys
     done
   with End_of_file -> ());
  close_in ic;
  let keys = List.rev !keys in
  let env =
    prepare_env ~opaque_access (Global.env ())
      (List.map (fun k -> Names.GlobRef.ConstRef (Names.Constant.make1 (kername_of_key k))) keys)
  in
  List.iter (fun k -> check_statement_prepared ~env ~opaque_access k) keys

(* Fresh-process recomputation for the round trip: the prepared type and body of one constant, quoted,
   after the kernel re-check (prepare_env raises otherwise). *)
let check_prepared ~opaque_access key =
  let rkn = kername_of_key key in
  let c = Names.Constant.make1 rkn in
  let env = prepare_env ~opaque_access (Global.env ()) [ Names.GlobRef.ConstRef c ] in
  let env, _, _, quality_changed = quality_dispatch_env ~opaque_access env [Names.GlobRef.ConstRef c] in
  let sigma = Evd.from_env env in
  let cb = Environ.lookup_constant c env in
  let q t = snd (Ast_quoter.quote_term_rec ~bypass:true ~opaque_access env sigma t) in
  let body = match cb.Declarations.const_body with Declarations.Def b -> term_json (q b) | _ -> J.Null in
  Feedback.msg_info
    Pp.(str ("PREPARED " ^ key ^ " " ^ J.to_string (J.Obj [ ("type", term_json (q cb.Declarations.const_type)); ("body", body); ("quality_dispatch", J.Bool (Hashtbl.mem quality_changed key)) ])))

(* Rocq2Lean CheckInstance "key" "l1=r1;l2=r2": re-check a constant with Rocq's own kernel after
   substituting the given global levels (by Set or by other global levels) in its type and in its
   (prepared) body: the source-side obligation of the cumulativity tier's R2B-P (a proof-local level
   solved below a native fact must still be a valid Rocq instance of the declaration). *)
let check_instance ~opaque_access key subst_s =
  let env = Global.env () in
  let g = Environ.universes env in
  let by_name = Hashtbl.create 97 in
  Univ.Level.Set.iter (fun l -> Hashtbl.replace by_name (level_name l) l) (UGraph.domain g);
  Hashtbl.replace by_name "Set" Univ.Level.set;
  let res =
    try
      let pairs = List.filter (fun s -> s <> "") (String.split_on_char ';' subst_s) in
      let m =
        List.fold_left
          (fun m p ->
            match String.split_on_char '=' p with
            | [ a; b ] -> (
              match (Hashtbl.find_opt by_name a, Hashtbl.find_opt by_name b) with
              | Some la, Some lb -> Univ.Level.Map.add la lb m
              | _ -> failwith ("unknown level in " ^ p))
            | _ -> failwith ("malformed substitution " ^ p))
          Univ.Level.Map.empty pairs
      in
      let sub = (Sorts.QVar.Map.empty, m) in
      let c = Names.Constant.make1 (kername_of_key key) in
      let ty = Vars.subst_univs_level_constr sub (Environ.lookup_constant c env).Declarations.const_type in
      let _ = Typeops.infer_type env ty in
      match prepared_body ~opaque_access env c with
      | None -> "INSTANCE_OK"
      | Some (b, _, _) -> (
        let b = Vars.subst_univs_level_constr sub b in
        let j = Typeops.infer env b in
        match Conversion.default_conv_leq env j.Environ.uj_type ty with
        | Ok () -> "INSTANCE_OK"
        | Error () -> "INSTANCE_TYPE_MISMATCH")
    with e -> "INSTANCE_REJECTED " ^ String.map (fun ch -> if ch = '\n' then ' ' else ch) (Printexc.to_string e)
  in
  Feedback.msg_info Pp.(str ("INSTANCE " ^ key ^ " " ^ res))

(* Rocq2Lean CheckConversionDeps "L1;L2" "deps.txt" "out.txt" (docs/TERMINATION.md): for each constant
   key in deps.txt, re-run its statement preparation (proof subterms extracted, Rocq's kernel re-check
   of the rewritten declaration) once in the prepared environment and once with the bodies of the
   constants L1, L2, ... removed (made opaque). A constant that is accepted in the first and refused in
   the second needs the definitional unfolding of some Li (conversion dependence): CONV_NEEDS. *)
let check_conversion_deps ~opaque_access lowered_s inp outp =
  let genv = Global.env () in
  let lowered =
    List.filter_map
      (fun k ->
        if k = "" then None
        else
          let c = Names.Constant.make1 (kername_of_key k) in
          if Environ.mem_constant c genv then Some c else None)
      (String.split_on_char ';' lowered_s)
  in
  let ic = open_in inp in
  let deps = ref [] in
  (try
     while true do
       let l = String.trim (input_line ic) in
       if l <> "" then deps := l :: !deps
     done
   with End_of_file -> ());
  close_in ic;
  let deps = List.rev !deps in
  let crefs =
    List.filter_map
      (fun k ->
        match Names.Constant.make1 (kername_of_key k) with
        | c when Environ.mem_constant c genv -> Some (k, c)
        | _ -> None
        | exception _ -> None)
      deps
  in
  let env =
    prepare_env ~opaque_access genv
      (List.map (fun (_, c) -> Names.GlobRef.ConstRef c) crefs @ List.map (fun c -> Names.GlobRef.ConstRef c) lowered)
  in
  let env_o =
    List.fold_left
      (fun e c ->
        let cb = Environ.lookup_constant c e in
        Environ.add_constant c { cb with Declarations.const_body = Declarations.Undef None } e)
      env lowered
  in
  let oc = open_out outp in
  let line s = output_string oc (String.map (fun ch -> if ch = '\n' then ' ' else ch) s); output_char oc '\n' in
  let n = ref 0 in
  List.iter
    (fun k ->
      incr n;
      match List.assoc_opt k crefs with
      | None -> line ("CONV_SKIP " ^ k ^ " not a constant of the environment")
      | Some c ->
        let run e =
          let st = new_stmt_info () in
          (try ignore (statement_env_one ~opaque_access st e c) with ex -> Hashtbl.replace st.failed (const_key c) (Printexc.to_string ex));
          match Hashtbl.find_opt st.failed (const_key c) with
          | Some why -> Some why
          | None -> if Hashtbl.mem st.deferred_guard (const_key c) then Some "guard deferred" else None
        in
        (match (run env, run env_o) with
         | Some why, _ -> line ("CONV_BASE_REFUSED " ^ k ^ " " ^ why)
         | None, None -> line ("CONV_OK " ^ k)
         | None, Some why -> line ("CONV_NEEDS " ^ k ^ " " ^ why)))
    deps;
  close_out oc;
  Feedback.msg_info Pp.(str ("CONV_DONE " ^ string_of_int !n))

