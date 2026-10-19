import UnifiedInterfaces
open NativeBridge
theorem demo_add_comm (n m : Nat) :
 Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
 rw [nat_add_agrees, nat_add_agrees, Nat.add_comm]
theorem demo_reverse_twice {A : Type u} (xs : RList A) :
 reverseTranslated (reverseTranslated xs) = xs :=
 reverseTranslated_involutive xs
theorem demo_nested_roundtrip (xs : RList RBool) :
 boolListIso.of (boolListIso.to xs) = xs := boolListIso.of_to xs
theorem demo_binary_multiply (x y : RIntBinary) :
 binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) = binaryIntTo x * binaryIntTo y :=
 int_mul_agrees x y
#print axioms demo_add_comm
#print axioms demo_reverse_twice
#print axioms demo_nested_roundtrip
#print axioms demo_binary_multiply

theorem demo_native_interface_map :
 NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.map.native
   Nat Nat (fun n => n+1) [1,2,3] = [2,3,4] := rfl
#print axioms demo_native_interface_map
