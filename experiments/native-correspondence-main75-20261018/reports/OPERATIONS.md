# Specify the corresponding certificate for native operations

What is listed here is the actual equation/iff, and the common packaging interface is not counted as the implementation consistency of Lean with the same name API.

## NativeBridge.all_agrees

```lean
∀ {A : Sort u} (P : A → Prop), Rocq.Corelib.Init.Logic.all A P ↔ ∀ (x : A), P x
```

Axiom closure: empty

## NativeBridge.and_agrees

```lean
∀ (P Q : Prop), Rocq.Corelib.Init.Logic.and P Q ↔ P ∧ Q
```

Axiom closure: empty

## NativeBridge.andb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (NativeBridge.boolTo a && NativeBridge.boolTo b)
```

Axiom closure: empty

## NativeBridge.append_agrees

```lean
∀ {A : Type u} (xs ys : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = NativeBridge.listTo xs ++ NativeBridge.listTo ys
```

Axiom closure: empty

## NativeBridge.array_copy_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A),
  NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.copy A a) = NativeBridge.arrayTo a
```

Axiom closure: propext

## NativeBridge.array_default_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.default A a = (NativeBridge.arrayTo a).snd.snd
```

Axiom closure: propext

## NativeBridge.array_get_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63),
  Rocq.Corelib.Array.PrimArray.get A a i =
    if h : i.toNat < ↑(NativeBridge.arrayTo a).fst then (NativeBridge.arrayTo a).snd.fst[i.toNat]
    else (NativeBridge.arrayTo a).snd.snd
```

Axiom closure: propext, Classical.choice, Quot.sound

## NativeBridge.array_length_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.length A a = BitVec.ofNat 63 ↑(NativeBridge.arrayTo a).fst
```

Axiom closure: propext

## NativeBridge.array_make_length_agrees

```lean
∀ {A : Type u} (n : BitVec 63) (x : A),
  ↑(NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).fst = min n.toNat 4194303
```

Axiom closure: propext, Quot.sound

## NativeBridge.array_make_values_agrees

```lean
∀ {A : Type u} (n : BitVec 63) (x : A),
  (NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).snd.fst =
    Vector.replicate (↑(NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.make A n x)).fst) x
```

Axiom closure: propext, Classical.choice, Quot.sound

## NativeBridge.array_set_agrees

```lean
∀ {A : Type u} (a : Rocq.Corelib.Array.PrimArray.array A) (i : BitVec 63) (x : A),
  NativeBridge.arrayTo (Rocq.Corelib.Array.PrimArray.set A a i x) =
    ⟨(NativeBridge.arrayTo a).fst,
      ((NativeBridge.arrayTo a).snd.fst.setIfInBounds i.toNat x, (NativeBridge.arrayTo a).snd.snd)⟩
```

Axiom closure: propext, Classical.choice, Quot.sound

## NativeBridge.byteString_get_agrees

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (i : BitVec 63),
  Rocq.Corelib.Strings.PrimString.get s i =
    BitVec.ofNat 63
      (if h : i.toNat < ↑(NativeBridge.byteStringTo s).fst then (NativeBridge.byteStringTo s).snd[i.toNat] else 0).toNat
```

Axiom closure: propext, Classical.choice, Quot.sound

## NativeBridge.byteString_length_agrees

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimString.length s = BitVec.ofNat 63 ↑(NativeBridge.byteStringTo s).fst
```

Axiom closure: propext

## NativeBridge.compOpp_agrees

```lean
∀ (c : NativeBridge.RComparison),
  NativeBridge.comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp c) = (NativeBridge.comparisonTo c).swap
```

Axiom closure: empty

## NativeBridge.ex2_agrees

```lean
∀ {A : Sort u} (P Q : A → Prop), Rocq.Corelib.Init.Logic.ex2 A P Q ↔ ∃ x, P x ∧ Q x
```

Axiom closure: empty

## NativeBridge.ex_agrees

```lean
∀ {A : Sort u} (P : A → Prop), Rocq.Corelib.Init.Logic.ex A P ↔ ∃ x, P x
```

Axiom closure: empty

## NativeBridge.false_agrees

```lean
Rocq.Corelib.Init.Logic.False ↔ False
```

Axiom closure: empty

## NativeBridge.firstn_agrees

```lean
∀ {A : Type u} (n : Nat) (xs : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.firstn A n xs) = List.take n (NativeBridge.listTo xs)
```

Axiom closure: empty

## NativeBridge.forall_list_agrees

```lean
∀ {A : Type u} (P : A → Prop) (xs : NativeBridge.RList A),
  Rocq.Corelib.Lists.ListDef.Forall A P xs ↔ ∀ (x : A), x ∈ NativeBridge.listTo xs → P x
```

Axiom closure: empty

## NativeBridge.fst_agrees

```lean
∀ {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.fst A B x = (NativeBridge.prodTo x).fst
```

Axiom closure: empty

## NativeBridge.iff_agrees

```lean
∀ (P Q : Prop), Rocq.Corelib.Init.Logic.iff P Q ↔ (P ↔ Q)
```

Axiom closure: propext

## NativeBridge.implb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.implb a b) = (!NativeBridge.boolTo a || NativeBridge.boolTo b)
```

Axiom closure: empty

## NativeBridge.inhabited_agrees

```lean
∀ (A : Sort u), Rocq.Corelib.Init.Logic.inhabited A ↔ Nonempty A
```

Axiom closure: empty

## NativeBridge.int63_add_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.add x y = x + y
```

Axiom closure: empty

## NativeBridge.int63_compare_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare x y) =
    if x.toNat < y.toNat then Ordering.lt else if y.toNat < x.toNat then Ordering.gt else Ordering.eq
```

Axiom closure: empty

## NativeBridge.int63_compares_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.comparisonTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compares x y) =
    if x.toInt < y.toInt then Ordering.lt else if y.toInt < x.toInt then Ordering.gt else Ordering.eq
```

Axiom closure: empty

## NativeBridge.int63_div_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.div x y = x / y
```

Axiom closure: propext

## NativeBridge.int63_eqb_agrees

```lean
∀ (x y : BitVec 63), NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.eqb x y) = (x.toNat == y.toNat)
```

Axiom closure: empty

## NativeBridge.int63_id_agrees

```lean
∀ (x : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.id_int x = x
```

Axiom closure: empty

## NativeBridge.int63_land_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land x y = x &&& y
```

Axiom closure: propext, Quot.sound

## NativeBridge.int63_leb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y) = decide (x.toNat ≤ y.toNat)
```

Axiom closure: empty

## NativeBridge.int63_lesb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lesb x y) = decide (x.toInt ≤ y.toInt)
```

Axiom closure: empty

## NativeBridge.int63_lor_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lor x y = x ||| y
```

Axiom closure: propext, Quot.sound

## NativeBridge.int63_lsl_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsl x y = x <<< y.toNat
```

Axiom closure: propext, Quot.sound

## NativeBridge.int63_lsr_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lsr x y = x >>> y.toNat
```

Axiom closure: propext, Quot.sound

## NativeBridge.int63_ltb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y) = decide (x.toNat < y.toNat)
```

Axiom closure: empty

## NativeBridge.int63_ltsb_agrees

```lean
∀ (x y : BitVec 63),
  NativeBridge.boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltsb x y) = decide (x.toInt < y.toInt)
```

Axiom closure: empty

## NativeBridge.int63_lxor_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.lxor x y = x ^^^ y
```

Axiom closure: propext, Quot.sound

## NativeBridge.int63_mod_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mod x y = x % y
```

Axiom closure: propext

## NativeBridge.int63_mul_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.mul x y = x * y
```

Axiom closure: empty

## NativeBridge.int63_sub_agrees

```lean
∀ (x y : BitVec 63), Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.sub x y = x - y
```

Axiom closure: empty

## NativeBridge.int_mul_agrees

```lean
∀ (x y : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) =
    NativeBridge.binaryIntTo x * NativeBridge.binaryIntTo y
```

Axiom closure: propext, Quot.sound

## NativeBridge.int_of_binary_nat_agrees

```lean
∀ (n : NativeBridge.RNatBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_N n) = ↑(NativeBridge.binaryNatTo n)
```

Axiom closure: empty

## NativeBridge.int_of_nat_agrees

```lean
∀ (n : Nat), NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.of_nat n) = ↑n
```

Axiom closure: propext, Quot.sound

## NativeBridge.int_opp_agrees

```lean
∀ (x : NativeBridge.RIntBinary),
  NativeBridge.binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.opp x) = -NativeBridge.binaryIntTo x
```

Axiom closure: propext

## NativeBridge.int_to_nat_agrees

```lean
∀ (z : NativeBridge.RIntBinary), Rocq.Corelib.BinNums.IntDef.Z.to_nat z = (NativeBridge.binaryIntTo z).toNat
```

Axiom closure: propext, Quot.sound

## NativeBridge.is_true_agrees

```lean
∀ (a : NativeBridge.RBool), Rocq.Corelib.Init.Datatypes.is_true a ↔ NativeBridge.boolTo a = true
```

Axiom closure: empty

## NativeBridge.length_agrees

```lean
∀ {A : Type u} (xs : NativeBridge.RList A), Rocq.Corelib.Init.Datatypes.length A xs = (NativeBridge.listTo xs).length
```

Axiom closure: empty

## NativeBridge.map_agrees

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (xs : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.map A B f xs) = List.map f (NativeBridge.listTo xs)
```

Axiom closure: empty

## NativeBridge.nat_add_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.add n m = n + m
```

Axiom closure: empty

## NativeBridge.nat_bitwise_agrees

```lean
∀ (op : NativeBridge.RBool → NativeBridge.RBool → NativeBridge.RBool) (f : Bool → Bool → Bool),
  (∀ (x y : NativeBridge.RBool), NativeBridge.boolTo (op x y) = f (NativeBridge.boolTo x) (NativeBridge.boolTo y)) →
    f false false = false → ∀ (n a b : Nat), Rocq.Corelib.Init.Nat.bitwise op n a b = Nat.bitwise f a b % 2 ^ n
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_compare_agrees

```lean
∀ (n m : Nat), NativeBridge.comparisonTo (Rocq.Corelib.Init.Nat.compare n m) = compare n m
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_div2_agrees

```lean
∀ (n : Nat), Rocq.Corelib.Init.Nat.div2 n = n / 2
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_div_agrees

```lean
∀ (x y : Nat), Rocq.Corelib.Init.Nat.div x y = x / y
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_double_agrees

```lean
∀ (n : Nat), Rocq.Corelib.Init.Nat.double n = 2 * n
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_eqb_agrees

```lean
∀ (n m : Nat), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.eqb n m) = (n == m)
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_even_agrees

```lean
∀ (n : Nat), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.even n) = decide (n % 2 = 0)
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_land_agrees

```lean
∀ (a b : Nat), Rocq.Corelib.Init.Nat.land a b = a &&& b
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_ldiff_agrees

```lean
∀ (a b : Nat), Rocq.Corelib.Init.Nat.ldiff a b = Nat.bitwise (fun x y => x && !y) a b
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_leb_agrees

```lean
∀ (n m : Nat), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.leb n m) = decide (n ≤ m)
```

Axiom closure: propext

## NativeBridge.nat_lor_agrees

```lean
∀ (a b : Nat), Rocq.Corelib.Init.Nat.lor a b = a ||| b
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_ltb_agrees

```lean
∀ (n m : Nat), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.ltb n m) = decide (n < m)
```

Axiom closure: propext

## NativeBridge.nat_lxor_agrees

```lean
∀ (a b : Nat), Rocq.Corelib.Init.Nat.lxor a b = a ^^^ b
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_max_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.max n m = max n m
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_min_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.min n m = min n m
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_modulo_agrees

```lean
∀ (x y : Nat), Rocq.Corelib.Init.Nat.modulo x y = x % y
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_mul_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.mul n m = n * m
```

Axiom closure: empty

## NativeBridge.nat_odd_agrees

```lean
∀ (n : Nat), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.odd n) = decide (n % 2 = 1)
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_one_agrees

```lean
Rocq.Corelib.Init.Nat.one = 1
```

Axiom closure: empty

## NativeBridge.nat_pow_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.pow n m = n ^ m
```

Axiom closure: empty

## NativeBridge.nat_pred_agrees

```lean
∀ (n : Nat), Rocq.Corelib.Init.Nat.pred n = n - 1
```

Axiom closure: empty

## NativeBridge.nat_shiftl_agrees

```lean
∀ (n k : Nat), Rocq.Corelib.Init.Nat.shiftl n k = n <<< k
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_shiftr_agrees

```lean
∀ (n k : Nat), Rocq.Corelib.Init.Nat.shiftr n k = n >>> k
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_square_agrees

```lean
∀ (n : Nat), Rocq.Corelib.Init.Nat.square n = n * n
```

Axiom closure: empty

## NativeBridge.nat_sub_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.sub n m = n - m
```

Axiom closure: propext

## NativeBridge.nat_succ_agrees

```lean
∀ (n : Nat), Rocq.Corelib.Init.Nat.succ n = n + 1
```

Axiom closure: empty

## NativeBridge.nat_tail_add_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.tail_add n m = n + m
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_tail_addmul_agrees

```lean
∀ (r n m : Nat), Rocq.Corelib.Init.Nat.tail_addmul r n m = r + n * m
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_tail_mul_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Nat.tail_mul n m = n * m
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_testbit_agrees

```lean
∀ (a n : Nat), NativeBridge.boolTo (Rocq.Corelib.Init.Nat.testbit a n) = a.testBit n
```

Axiom closure: propext, Quot.sound

## NativeBridge.nat_two_agrees

```lean
Rocq.Corelib.Init.Nat.two = 2
```

Axiom closure: empty

## NativeBridge.nat_zero_agrees

```lean
Rocq.Corelib.Init.Nat.zero = 0
```

Axiom closure: empty

## NativeBridge.negb_agrees

```lean
∀ (a : NativeBridge.RBool), NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.negb a) = !NativeBridge.boolTo a
```

Axiom closure: empty

## NativeBridge.notT_agrees

```lean
∀ (A : Sort u), Rocq.Corelib.Init.Logic.notT A ↔ ∀ (a : A), False
```

Axiom closure: propext

## NativeBridge.not_agrees

```lean
∀ (P : Prop), Rocq.Corelib.Init.Logic.not P ↔ ¬P
```

Axiom closure: propext

## NativeBridge.nth_agrees

```lean
∀ {A : Type u} (n : Nat) (xs : NativeBridge.RList A) (d : A),
  Rocq.Corelib.Lists.ListDef.nth A n xs d = (NativeBridge.listTo xs)[n]?.getD d
```

Axiom closure: propext

## NativeBridge.option_map_agrees

```lean
∀ {A : Type u} {B : Type v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A),
  NativeBridge.optionTo (Rocq.Corelib.Init.Datatypes.option_map A B f x) = Option.map f (NativeBridge.optionTo x)
```

Axiom closure: empty

## NativeBridge.or_agrees

```lean
∀ (P Q : Prop), Rocq.Corelib.Init.Logic.or P Q ↔ P ∨ Q
```

Axiom closure: empty

## NativeBridge.orb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.orb a b) = (NativeBridge.boolTo a || NativeBridge.boolTo b)
```

Axiom closure: empty

## NativeBridge.peano_ge_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Peano.ge n m ↔ n ≥ m
```

Axiom closure: empty

## NativeBridge.peano_gt_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Peano.gt n m ↔ n > m
```

Axiom closure: empty

## NativeBridge.peano_le_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Peano.le n m ↔ n ≤ m
```

Axiom closure: empty

## NativeBridge.peano_lt_agrees

```lean
∀ (n m : Nat), Rocq.Corelib.Init.Peano.lt n m ↔ n < m
```

Axiom closure: empty

## NativeBridge.positive_add_agrees

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add p q) =
    NativeBridge.positiveTo p + NativeBridge.positiveTo q
```

Axiom closure: propext, Quot.sound

## NativeBridge.positive_add_carry_agrees

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.add_carry p q) =
    NativeBridge.positiveTo p + NativeBridge.positiveTo q + 1
```

Axiom closure: propext, Quot.sound

## NativeBridge.positive_mul_agrees

```lean
∀ (p q : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.mul p q) =
    NativeBridge.positiveTo p * NativeBridge.positiveTo q
```

Axiom closure: propext, Quot.sound

## NativeBridge.positive_of_succ_nat_agrees

```lean
∀ (n : Nat), NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.of_succ_nat n) = n + 1
```

Axiom closure: propext, Quot.sound

## NativeBridge.positive_pred_double_agrees

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = 2 * NativeBridge.positiveTo p - 1
```

Axiom closure: propext, Quot.sound

## NativeBridge.positive_succ_agrees

```lean
∀ (p : NativeBridge.RPositive),
  NativeBridge.positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.succ p) = NativeBridge.positiveTo p + 1
```

Axiom closure: propext, Quot.sound

## NativeBridge.positive_to_nat_agrees

```lean
∀ (p : NativeBridge.RPositive), Rocq.Corelib.BinNums.PosDef.Pos.to_nat p = NativeBridge.positiveTo p
```

Axiom closure: propext, Quot.sound

## NativeBridge.proj1_sig_agrees

```lean
∀ {A : Type u} {P : A → Prop} (x : Rocq.Corelib.Init.Specif.sig A P),
  Rocq.Corelib.Init.Specif.proj1_sig A P x = (NativeBridge.sigTo x).val
```

Axiom closure: empty

## NativeBridge.projT1_agrees

```lean
∀ {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.Init.Specif.projT1 A P x = (NativeBridge.sigmaTo x).fst
```

Axiom closure: empty

## NativeBridge.projT2_agrees

```lean
∀ {A : Type u} {P : A → Type v} (x : Rocq.Corelib.Init.Specif.sigT A P),
  Rocq.Corelib.Init.Specif.projT2 A P x ≍ (NativeBridge.sigmaTo x).snd
```

Axiom closure: empty

## NativeBridge.repeat_agrees

```lean
∀ {A : Type u} (a : A) (n : Nat), NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.repeat A a n) = List.replicate n a
```

Axiom closure: empty

## NativeBridge.seq_agrees

```lean
∀ (start len : Nat), NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.seq start len) = List.range' start len
```

Axiom closure: empty

## NativeBridge.skipn_agrees

```lean
∀ {A : Type u} (n : Nat) (xs : NativeBridge.RList A),
  NativeBridge.listTo (Rocq.Corelib.Lists.ListDef.skipn A n xs) = List.drop n (NativeBridge.listTo xs)
```

Axiom closure: empty

## NativeBridge.snd_agrees

```lean
∀ {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B),
  Rocq.Corelib.Init.Datatypes.snd A B x = (NativeBridge.prodTo x).snd
```

Axiom closure: empty

## NativeBridge.true_agrees

```lean
Rocq.Corelib.Init.Logic.True ↔ True
```

Axiom closure: empty

## NativeBridge.xorb_agrees

```lean
∀ (a b : NativeBridge.RBool),
  NativeBridge.boolTo (Rocq.Corelib.Init.Datatypes.xorb a b) = (NativeBridge.boolTo a ^^ NativeBridge.boolTo b)
```

Axiom closure: empty