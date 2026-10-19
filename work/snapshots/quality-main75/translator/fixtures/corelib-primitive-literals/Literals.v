From Corelib.Numbers.Cyclic.Int63 Require Import PrimInt63.
From Corelib.Floats Require Import PrimFloat.
Require Corelib.Strings.PrimString.
Require Corelib.Array.PrimArray.
Definition plus_zero : float := 0x0p+0%float.
Definition minus_zero : float := Eval cbv in PrimFloat.neg_zero.
Definition quiet_nan : float := Eval cbv in nan.
Definition pos_inf : float := Eval cbv in infinity.
Definition neg_inf : float := Eval cbv in neg_infinity.
Definition fraction : float := 0x1.8p-1%float.
Definition raw_bytes : PrimString.string := Eval cbv in
  PrimString.cat (PrimString.make 1%uint63 0%uint63)
    (PrimString.cat (PrimString.make 1%uint63 128%uint63)
      (PrimString.make 1%uint63 255%uint63)).
Definition small_array : PrimArray.array int := Eval cbv in
  @PrimArray.set int (@PrimArray.make int 2%uint63 7%uint63) 0%uint63 9%uint63.
