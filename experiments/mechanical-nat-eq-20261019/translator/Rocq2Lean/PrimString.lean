import Init.Data.BitVec.Basic
import Init.Data.Ord.Basic

/-! Rocq primitive strings are bounded byte sequences, including embedded NULs.
This model keeps byte semantics independent of Lean's UTF-8 String type. -/
namespace Rocq2Lean.PrimString

def maxLength : Nat := 16777211

structure Rep where
  size : Fin (maxLength + 1)
  value : Fin size.val → BitVec 8

def boundedSize (n : Nat) : Fin (maxLength + 1) :=
  if h : n < maxLength + 1 then ⟨n, h⟩
  else ⟨maxLength, Nat.lt_succ_self maxLength⟩

def read (s : Rep) (i : Nat) : BitVec 8 :=
  if h : i < s.size.val then s.value ⟨i, h⟩ else BitVec.ofNat 8 0

def make (n c : BitVec 63) : Rep :=
  ⟨boundedSize n.toNat, fun _ => BitVec.ofNat 8 c.toNat⟩

def length (s : Rep) : BitVec 63 := BitVec.ofNat 63 s.size.val
def get (s : Rep) (i : BitVec 63) : BitVec 63 := BitVec.ofNat 63 (read s i.toNat).toNat

def sub (s : Rep) (off len : BitVec 63) : Rep :=
  ⟨boundedSize (min len.toNat (s.size.val - off.toNat)),
   fun i => read s (off.toNat + i.val)⟩

def cat (a b : Rep) : Rep :=
  ⟨boundedSize (a.size.val + b.size.val),
   fun i => if i.val < a.size.val then read a i.val else read b (i.val - a.size.val)⟩

def compareBytes (a b : Rep) : Nat → Nat → Ordering
  | 0, _ => if a.size.val < b.size.val then .lt else if b.size.val < a.size.val then .gt else .eq
  | fuel + 1, i =>
      let x := (read a i).toNat
      let y := (read b i).toNat
      if x < y then .lt else if y < x then .gt else compareBytes a b fuel (i + 1)

def compare (a b : Rep) : Ordering := compareBytes a b (min a.size.val b.size.val) 0

def lookup : List (BitVec 8) → Nat → BitVec 8
  | [], _ => BitVec.ofNat 8 0
  | x :: _, 0 => x
  | _ :: xs, n + 1 => lookup xs n

def ofBytes (xs : List (BitVec 8)) : Rep :=
  ⟨boundedSize xs.length, fun i => lookup xs i.val⟩

end Rocq2Lean.PrimString
