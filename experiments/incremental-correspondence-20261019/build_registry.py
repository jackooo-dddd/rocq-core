from pathlib import Path
W=Path(__file__).resolve().parent
B=W.parent/'mechanical-correspondence-20261019'
s=(B/'fragments/NativeInterfaces.lean').read_text()
s=s.replace('exportNative','exportNativeIncremental').replace('elabExportNative','elabExportNativeIncremental').replace('#export_native ','#export_native_incremental ').replace('NativeBridge.Interfaces.','NativeBridge.IncrementalInterfaces.')
s=s.replace('let ty ← Core.betaReduce ty','let ty ← whnf (← Core.betaReduce ty)')
needle=' for (source,bridge) in simple do'
extra=''' if name.toString == "Rocq.Corelib.ssr.ssrfun.simpl_fun" && args.size == 2 then
  let a ← findNativeIso args[0]!
  let b ← findNativeIso args[1]!
  let first ← mkAppM "NativeBridge.Incremental.simplFunIso".toName args
  let second ← mkAppM "NativeBridge.Iso.functions".toName #[a,b]
  return ← mkAppM "NativeBridge.Iso.trans".toName #[first,second]
'''
assert needle in s;s=s.replace(needle,extra+needle)
prefix='''import SSR
namespace NativeBridge
namespace Incremental
noncomputable def simplBoolProbe
 (f : Rocq.Corelib.ssr.ssrfun.simpl_fun RBool RBool) : RBool :=
 Rocq.Corelib.ssr.ssrfun.fun_of_simpl RBool RBool f Rocq.Corelib.Init.Datatypes.bool.true
end Incremental
'''
suffix='''#export_native_incremental Rocq.Corelib.ssr.ssrfun.fun_of_simpl
#export_native_incremental NativeBridge.Incremental.simplBoolProbe
namespace Incremental
theorem registered_simpl_bool_agrees (f : Bool → Bool) :
 NativeBridge.IncrementalInterfaces.NativeBridge.Incremental.simplBoolProbe.native f = f true := by
 change boolTo (boolOf (f true)) = _
 exact bool_to_of _
end Incremental
end NativeBridge
'''
(W/'proofs/Registry.lean').write_text(prefix+s+'\n'+suffix)
