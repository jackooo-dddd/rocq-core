# 指定原生操作的对应证书

这里列的是实际等式/iff，不把通用包装接口算成 Lean 同名 API 的实现一致性。

## NativeBridge.all_agrees

```lean
∀ {A : Sort u} (P : A → Prop), Rocq.Corelib.Init.Logic.all A P ↔ ∀ (x : A), P x
```

公理闭包：空

## NativeBridge.and_agrees

```lean
∀ (P Q : Prop), Rocq.Corelib.Init.Logic.and P Q ↔ P ∧ Q
```

公理闭包：空

## NativeBridge.andb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (NativeBridge.boolTo a && NativeBridge.boolTo b)
```

公理闭包：空

## NativeBridge.append_agrees

```lean
∀ {A : Type u} (xs ys : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = NativeBridge.listTo xs ++ NativeBridge.listTo ys
```

公理闭包：空

## NativeBridge.array_copy_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A),
  NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.copy A a) = NativeBridge.arrayTo a
```

公理闭包：propext

## NativeBridge.array_default_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.default A a = (NativeBridge.arrayTo a).snd.snd
```

公理闭包：propext

## NativeBridge.array_get_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63),
  Rocq.Corelib.Array.PrimArray.get A a i =
    if h : i.toNat < ↑(NativeBridge.arrayTo a).fst then (NativeBridge.arrayTo a).snd.fst[i.toNat]
    else (NativeBridge.arrayTo a).snd.snd
```

公理闭包：propext, Classical.choice, Quot.sound

## NativeBridge.array_length_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.length A a = BitVec.ofNat 63 ↑(NativeBridge.arrayTo a).fst
```

公理闭包：propext

## NativeBridge.array_make_length_agrees

```lean
∀ {A : Type u} (n : BitVec 63) (x : A),
  ↑(NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).fst = min n.toNat 4194303
```

公理闭包：propext, Quot.sound

## NativeBridge.array_make_values_agrees

```lean
∀ {A : Type u} (n : BitVec 63) (x : A),
  (NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).snd.fst =
    Vector.replicate (↑(NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).fst) x
```

公理闭包：propext, Classical.choice, Quot.sound

## NativeBridge.array_set_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63) (x : A),
  NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.set A a i x) =
    ⟨(NativeBridge.arrayTo a).fst,
      ((NativeBridge.arrayTo a).snd.fst.setIfInBounds i.toNat x, (NativeBridge.arrayTo a).snd.snd)⟩
```

公理闭包：propext, Classical.choice, Quot.sound

## NativeBridge.byteString_get_agrees

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (i : BitVec 63),
  Rocq.Corelib.Strings.PrimString.get s i =
    BitVec.ofNat 63
      (if h : i.toNat < ↑(NativeBridge.byteStringTo s).fst then (NativeBridge.byteStringTo s).snd[i.toNat] else 0).toNat
```

公理闭包：propext, Classical.choice, Quot.sound

## NativeBridge.byteString_length_agrees

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimString.length s = BitVec.ofNat 63 ↑(NativeBridge.byteStringTo s).fst
```

公理闭包：propext

## NativeBridge.compOpp_agrees

```lean
∀ (c : NativeBridge.RComparison),
  NativeBridge.comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp c) = (NativeBridge.comparisonTo c).swap
```

公理闭包：空

## NativeBridge.ex2_agrees

```lean
∀ {A : Sort u} (P Q : A → Prop), Rocq.Corelib.Init.Logic.ex2 A P Q ↔ ∃ x, P x ∧ Q x
```

公理闭包：空

## NativeBridge.ex_agrees

```lean
∀ {A : Sort u} (P : A → Prop), Rocq.Corelib.Init.Logic.ex A P ↔ ∃ x, P x
```

公理闭包：空

## NativeBridge.false_agrees

```lean
Rocq.Corelib.Init.Logic.False ↔ False
```

公理闭包：空

## NativeBridge.firstn_agrees

```lean
∀ {A : Type u} (n : NativeBridge.MN) (xs : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) =
    List.take (NativeBridge.natTo n) (NativeBridge.listTo xs)
```

公理闭包：空

## NativeBridge.forall_list_agrees

```lean
∀ {A : Type u} (P : A → Prop) (xs : NativeBridge.RList A),
  Rocq.Corelib.Lists.ListDef.Forall A P xs ↔ ∀ (x : A), x ∈ NativeBridge.listTo xs → P x
```

公理闭包：空

## NativeBridge.fst_agrees

```lean
∀ {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.fst A B x = (NativeBridge.prodTo x).fst
```

公理闭包：空

## NativeBridge.iff_agrees

```lean
∀ (P Q : Prop), Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q)
```

公理闭包：propext

## NativeBridge.implb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.implb a b) = (!NativeBridge.boolTo a || NativeBridge.boolTo b)
```

公理闭包：空

## NativeBridge.inhabited_agrees

```lean
∀ (A : Sort u), Rocq.Corelib.Init.Logic.inhabited A ↔ Nonempty A
```

公理闭包：空

## NativeBridge.int63_add_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y = x + y
```

公理闭包：空

## NativeBridge.int63_compare_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y) =
    if x.toNat < y.toNat then Ordering.lt else if y.toNat < x.toNat then Ordering.gt else Ordering.eq
```

公理闭包：空

## NativeBridge.int63_compares_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares x y) =
    if x.toInt < y.toInt then Ordering.lt else if y.toInt < x.toInt then Ordering.gt else Ordering.eq
```

公理闭包：空

## NativeBridge.int63_div_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y = x / y
```

公理闭包：propext

## NativeBridge.int63_eqb_agrees

```lean
∀ (x y : BitVec 63), NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x y) = (x.toNat == y.toNat)
```

公理闭包：空

## NativeBridge.int63_id_agrees

```lean
∀ (x : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.id_int x = x
```

公理闭包：空

## NativeBridge.int63_land_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y = x &&& y
```

公理闭包：propext, Quot.sound

## NativeBridge.int63_leb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y) = decide (x.toNat ≤ y.toNat)
```

公理闭包：空

## NativeBridge.int63_lesb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb x y) = decide (x.toInt ≤ y.toInt)
```

公理闭包：空

## NativeBridge.int63_lor_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y = x ||| y
```

公理闭包：propext, Quot.sound

## NativeBridge.int63_lsl_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x y = x <<< y.toNat
```

公理闭包：propext, Quot.sound

## NativeBridge.int63_lsr_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x y = x >>> y.toNat
```

公理闭包：propext, Quot.sound

## NativeBridge.int63_ltb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y) = decide (x.toNat < y.toNat)
```

公理闭包：空

## NativeBridge.int63_ltsb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb x y) = decide (x.toInt < y.toInt)
```

公理闭包：空

## NativeBridge.int63_lxor_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y = x ^^^ y
```

公理闭包：propext, Quot.sound

## NativeBridge.int63_mod_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y = x % y
```

公理闭包：propext

## NativeBridge.int63_mul_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y = x * y
```

公理闭包：空

## NativeBridge.int63_sub_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y = x - y
```

公理闭包：空

## NativeBridge.int_mul_agrees

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) =
    NativeBridge.binaryIntTo x * NativeBridge.binaryIntTo y
```

公理闭包：propext, Quot.sound

## NativeBridge.int_of_binary_nat_agrees

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = ↑(NativeBridge.binaryNatTo n)
```

公理闭包：空

## NativeBridge.int_of_nat_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_nat n) = ↑(NativeBridge.natTo n)
```

公理闭包：propext, Quot.sound

## NativeBridge.int_opp_agrees

```lean
∀ (x : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.opp x) = -NativeBridge.binaryIntTo x
```

公理闭包：propext

## NativeBridge.int_to_nat_agrees

```lean
∀ (z : NativeBridge.RIntBinary),
  NativeBridge.natTo (Rocq.Corelib.BinNums.IntDef.Z.to_nat z) = (NativeBridge.binaryIntTo z).toNat
```

公理闭包：propext, Quot.sound

## NativeBridge.is_true_agrees

```lean
∀ (a : NativeBridge.RBool), Rocq.Corelib.Init.Datatypes.is_true a ↔ NativeBridge.boolTo a = true
```

公理闭包：空

## NativeBridge.length_agrees

```lean
∀ {A : Type u} (xs : NativeBridge.RList A),
  NativeBridge.natTo (Rocq.Corelib.Init.Datatypes.length A xs) = (NativeBridge.listTo xs).length
```

公理闭包：空

## NativeBridge.map_agrees

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (xs : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = List.map f (NativeBridge.listTo xs)
```

公理闭包：空

## NativeBridge.nat_add_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.add n m) = NativeBridge.natTo n + NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.nat_bitwise_agrees

```lean
∀ (op : NativeBridge.RBool → NativeBridge.RBool → NativeBridge.RBool) (f : Bool → Bool → Bool),
  (∀ (x y : NativeBridge.RBool), NativeBridge.boolTo (op x y) = f (NativeBridge.boolTo x) (NativeBridge.boolTo y)) →
    f false false = false →
      ∀ (n a b : NativeBridge.MN),
        NativeBridge.natTo (Rocq.Corelib.Init.Nat.bitwise op n a b) =
          Nat.bitwise f (NativeBridge.natTo a) (NativeBridge.natTo b) % 2 ^ NativeBridge.natTo n
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_compare_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare (NativeBridge.natTo n) (NativeBridge.natTo m)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_dependent_rec_agrees

```lean
∀ {P : Nat → Sort u} (z : P 0) (s : (n : Nat) → P n → P (n + 1)) (n : NativeBridge.MN),
  Rocq.Corelib.Init.Datatypes.nat.rec z (fun k r => s (NativeBridge.natTo k) r) n = Nat.rec z s (NativeBridge.natTo n)
```

公理闭包：空

## NativeBridge.nat_div2_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.natTo (Rocq.Corelib.Init.Nat.div2 n) = NativeBridge.natTo n / 2
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_div_agrees

```lean
∀ (x y : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.div x y) = NativeBridge.natTo x / NativeBridge.natTo y
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_div_native_agrees

```lean
∀ (x y : Nat), NativeBridge.natTo (Rocq.Corelib.Init.Nat.div (NativeBridge.natOf x) (NativeBridge.natOf y)) = x / y
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_double_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.natTo (Rocq.Corelib.Init.Nat.double n) = 2 * NativeBridge.natTo n
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_eqb_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (NativeBridge.natTo n == NativeBridge.natTo m)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_even_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.even n) = decide (NativeBridge.natTo n % 2 = 0)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_land_agrees

```lean
∀ (a b : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.land a b) = NativeBridge.natTo a &&& NativeBridge.natTo b
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_ldiff_agrees

```lean
∀ (a b : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.ldiff a b) =
    Nat.bitwise (fun x y => x && !y) (NativeBridge.natTo a) (NativeBridge.natTo b)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_leb_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (NativeBridge.natTo n ≤ NativeBridge.natTo m)
```

公理闭包：propext

## NativeBridge.nat_lor_agrees

```lean
∀ (a b : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.lor a b) = NativeBridge.natTo a ||| NativeBridge.natTo b
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_ltb_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (NativeBridge.natTo n < NativeBridge.natTo m)
```

公理闭包：propext

## NativeBridge.nat_lxor_agrees

```lean
∀ (a b : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.lxor a b) = NativeBridge.natTo a ^^^ NativeBridge.natTo b
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_max_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.max n m) = max (NativeBridge.natTo n) (NativeBridge.natTo m)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_min_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.min n m) = min (NativeBridge.natTo n) (NativeBridge.natTo m)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_modulo_agrees

```lean
∀ (x y : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.modulo x y) = NativeBridge.natTo x % NativeBridge.natTo y
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_modulo_native_agrees

```lean
∀ (x y : Nat), NativeBridge.natTo (Rocq.Corelib.Init.Nat.modulo (NativeBridge.natOf x) (NativeBridge.natOf y)) = x % y
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_mul_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.mul n m) = NativeBridge.natTo n * NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.nat_odd_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.odd n) = decide (NativeBridge.natTo n % 2 = 1)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_one_agrees

```lean
NativeBridge.natTo Rocq.Corelib.Init.Nat.one = 1
```

公理闭包：空

## NativeBridge.nat_pow_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.pow n m) = NativeBridge.natTo n ^ NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.nat_pred_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.natTo (Rocq.Corelib.Init.Nat.pred n) = NativeBridge.natTo n - 1
```

公理闭包：空

## NativeBridge.nat_rec_agrees

```lean
∀ {A : Sort u} (z : A) (s : Nat → A → A) (n : NativeBridge.MN),
  Rocq.Corelib.Init.Datatypes.nat.rec z (fun k r => s (NativeBridge.natTo k) r) n = Nat.rec z s (NativeBridge.natTo n)
```

公理闭包：空

## NativeBridge.nat_shiftl_agrees

```lean
∀ (n k : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.shiftl n k) = NativeBridge.natTo n <<< NativeBridge.natTo k
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_shiftr_agrees

```lean
∀ (n k : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.shiftr n k) = NativeBridge.natTo n >>> NativeBridge.natTo k
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_square_agrees

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.square n) = NativeBridge.natTo n * NativeBridge.natTo n
```

公理闭包：空

## NativeBridge.nat_sub_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.sub n m) = NativeBridge.natTo n - NativeBridge.natTo m
```

公理闭包：propext

## NativeBridge.nat_succ_agrees

```lean
∀ (n : NativeBridge.MN), NativeBridge.natTo (Rocq.Corelib.Init.Nat.succ n) = NativeBridge.natTo n + 1
```

公理闭包：空

## NativeBridge.nat_tail_add_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.tail_add n m) = NativeBridge.natTo n + NativeBridge.natTo m
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_tail_addmul_agrees

```lean
∀ (r n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.tail_addmul r n m) =
    NativeBridge.natTo r + NativeBridge.natTo n * NativeBridge.natTo m
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_tail_mul_agrees

```lean
∀ (n m : NativeBridge.MN),
  NativeBridge.natTo (Rocq.Corelib.Init.Nat.tail_mul n m) = NativeBridge.natTo n * NativeBridge.natTo m
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_testbit_agrees

```lean
∀ (a n : NativeBridge.MN),
  NativeBridge.boolTo (Rocq.Corelib.Init.Nat.testbit a n) = (NativeBridge.natTo a).testBit (NativeBridge.natTo n)
```

公理闭包：propext, Quot.sound

## NativeBridge.nat_two_agrees

```lean
NativeBridge.natTo Rocq.Corelib.Init.Nat.two = 2
```

公理闭包：空

## NativeBridge.nat_zero_agrees

```lean
NativeBridge.natTo Rocq.Corelib.Init.Nat.zero = 0
```

公理闭包：空

## NativeBridge.negb_agrees

```lean
∀ (a : NativeBridge.RBool), NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.negb a) = !NativeBridge.boolTo a
```

公理闭包：空

## NativeBridge.notT_agrees

```lean
∀ (A : Sort u), Rocq.Corelib.Init.Logic.notT A ↔ ∀ (a : A), False
```

公理闭包：propext

## NativeBridge.not_agrees

```lean
∀ (P : Prop), Rocq.Corelib.Init.Logic.not P ↔ ¬P
```

公理闭包：propext

## NativeBridge.nth_agrees

```lean
∀ {A : Type u} (n : NativeBridge.MN) (xs : NativeBridge.RList A) (d : A),
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (NativeBridge.listTo xs)[NativeBridge.natTo n]?.getD d
```

公理闭包：propext

## NativeBridge.option_map_agrees

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.optionTo (Rocq.Corelib.Init.Datatypes.option_map A B f x) = Option.map f (NativeBridge.optionTo x)
```

公理闭包：空

## NativeBridge.or_agrees

```lean
∀ (P Q : Prop), Rocq.Corelib.Init.Logic.or P Q ↔ P ∨ Q
```

公理闭包：空

## NativeBridge.orb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.orb a b) = (NativeBridge.boolTo a || NativeBridge.boolTo b)
```

公理闭包：空

## NativeBridge.peano_ge_agrees

```lean
∀ (n m : NativeBridge.MN), Rocq.Corelib.Init.Peano.ge n m ↔ NativeBridge.natTo n ≥ NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.peano_gt_agrees

```lean
∀ (n m : NativeBridge.MN), Rocq.Corelib.Init.Peano.gt n m ↔ NativeBridge.natTo n > NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.peano_le_agrees

```lean
∀ (n m : NativeBridge.MN), Rocq.Corelib.Init.Peano.le n m ↔ NativeBridge.natTo n ≤ NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.peano_lt_agrees

```lean
∀ (n m : NativeBridge.MN), Rocq.Corelib.Init.Peano.lt n m ↔ NativeBridge.natTo n < NativeBridge.natTo m
```

公理闭包：空

## NativeBridge.positive_add_agrees

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) =
    NativeBridge.positiveTo p + NativeBridge.positiveTo q
```

公理闭包：propext, Quot.sound

## NativeBridge.positive_add_carry_agrees

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) =
    NativeBridge.positiveTo p + NativeBridge.positiveTo q + 1
```

公理闭包：propext, Quot.sound

## NativeBridge.positive_mul_agrees

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul p q) =
    NativeBridge.positiveTo p * NativeBridge.positiveTo q
```

公理闭包：propext, Quot.sound

## NativeBridge.positive_of_succ_nat_agrees

```lean
∀ (n : NativeBridge.MN),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) = NativeBridge.natTo n + 1
```

公理闭包：propext, Quot.sound

## NativeBridge.positive_pred_double_agrees

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2 * NativeBridge.positiveTo p - 1
```

公理闭包：propext, Quot.sound

## NativeBridge.positive_succ_agrees

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = NativeBridge.positiveTo p + 1
```

公理闭包：propext, Quot.sound

## NativeBridge.positive_to_nat_agrees

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.natTo (Rocq.Corelib.BinNums.PosDef.Pos.to_nat p) = NativeBridge.positiveTo p
```

公理闭包：propext, Quot.sound

## NativeBridge.proj1_sig_agrees

```lean
∀ {A : Type u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P),
  Rocq.Corelib.Init.Specif.proj1_sig A P x = (NativeBridge.sigTo x).val
```

公理闭包：空

## NativeBridge.projT1_agrees

```lean
∀ {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.Init.Specif.projT1 A P x = (NativeBridge.sigmaTo x).fst
```

公理闭包：空

## NativeBridge.projT2_agrees

```lean
∀ {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.Init.Specif.projT2 A P x ≍ (NativeBridge.sigmaTo x).snd
```

公理闭包：空

## NativeBridge.repeat_agrees

```lean
∀ {A : Type u} (a : A) (n : NativeBridge.MN),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate (NativeBridge.natTo n) a
```

公理闭包：空

## NativeBridge.seq_agrees

```lean
∀ (start len : NativeBridge.MN),
  List.map NativeBridge.natTo (NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.seq start len)) =
    List.range' (NativeBridge.natTo start) (NativeBridge.natTo len)
```

公理闭包：空

## NativeBridge.skipn_agrees

```lean
∀ {A : Type u} (n : NativeBridge.MN) (xs : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) =
    List.drop (NativeBridge.natTo n) (NativeBridge.listTo xs)
```

公理闭包：空

## NativeBridge.snd_agrees

```lean
∀ {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.snd A B x = (NativeBridge.prodTo x).snd
```

公理闭包：空

## NativeBridge.source_eq_rect_agrees

```lean
∀ {A : Sort u} (x : A) (P : A → Sort v) (z : P x) (y : A) (h : NativeBridge.ME A x y),
  Rocq.Corelib.Init.Logic.eq_rect A x P z y h = ⋯ ▸ z
```

公理闭包：空

## NativeBridge.source_eq_rew_dep_agrees

```lean
∀ {A : Sort u} (x : A) (P : (a : A) → x = a → Sort v) (z : P x ⋯) (y : A) (h : NativeBridge.ME A x y),
  Rocq.Corelib.Init.Logic.eq_rew_dep A x (fun a e => P a ⋯) z y h = NativeBridge.nativeEqRewDep P z ⋯
```

公理闭包：空

## NativeBridge.source_eq_rew_fwd_dep_agrees

```lean
∀ {A : Sort u} (x y : A) (h : NativeBridge.ME A x y) (P : (a : A) → x = a → Sort v) (z : P y ⋯),
  Rocq.Corelib.Init.Logic.eq_rew_fwd_dep A x y h (fun a e => P a ⋯) z = NativeBridge.nativeEqFwdDep ⋯ P z
```

公理闭包：空

## NativeBridge.source_eq_rew_fwd_r_dep_agrees

```lean
∀ {A : Sort u} (x y : A) (h : NativeBridge.ME A x y) (P : (a : A) → a = y → Sort v) (z : P x ⋯),
  Rocq.Corelib.Init.Logic.eq_rew_fwd_r_dep A x y h (fun a e => P a ⋯) z = NativeBridge.nativeEqFwdRDep ⋯ P z
```

公理闭包：空

## NativeBridge.source_nat_rec_agrees

```lean
∀ {P : Nat → Type} (z : P 0) (s : (n : Nat) → P n → P (n + 1)) (n : NativeBridge.MN),
  Rocq.Corelib.Init.Datatypes.nat_rec (fun n => P (NativeBridge.natTo n)) z (fun k r => s (NativeBridge.natTo k) r) n =
    Nat.rec z s (NativeBridge.natTo n)
```

公理闭包：空

## NativeBridge.source_nat_rect_agrees

```lean
∀ {P : Nat → Type u} (z : P 0) (s : (n : Nat) → P n → P (n + 1)) (n : NativeBridge.MN),
  Rocq.Corelib.Init.Datatypes.nat_rect (fun n => P (NativeBridge.natTo n)) z (fun k r => s (NativeBridge.natTo k) r) n =
    Nat.rec z s (NativeBridge.natTo n)
```

公理闭包：空

## NativeBridge.true_agrees

```lean
Rocq.Corelib.Init.Logic.True ↔ True
```

公理闭包：空

## NativeBridge.xorb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.xorb a b) = (NativeBridge.boolTo a ^^ NativeBridge.boolTo b)
```

公理闭包：空