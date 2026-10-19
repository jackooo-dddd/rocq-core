import Init.Data.BitVec.Basic
import Init.Data.Ord.Basic

/-!
Unsigned finite-word operations without propositional-extensionality dependencies.
The division/remainder definitions use Nat's total computational operations.
Bitwise operations inspect exactly w low bits by structural recursion on w.
No source axiom or proof of a Corelib theorem is introduced.
-/
namespace Rocq2Lean.PrimInt63

def udiv (w : Nat) (x y : BitVec w) : BitVec w :=
  BitVec.ofNat w (x.toNat / y.toNat)

def umod (w : Nat) (x y : BitVec w) : BitVec w :=
  BitVec.ofNat w (x.toNat % y.toNat)

def bitwise (f : Bool → Bool → Bool) : Nat → Nat → Nat → Nat
  | 0, _, _ => 0
  | w + 1, x, y =>
      (if f (x % 2 == 1) (y % 2 == 1) then 1 else 0) +
        2 * bitwise f w (x / 2) (y / 2)

def land (w : Nat) (x y : BitVec w) : BitVec w :=
  BitVec.ofNat w (bitwise Bool.and w x.toNat y.toNat)

def lor (w : Nat) (x y : BitVec w) : BitVec w :=
  BitVec.ofNat w (bitwise Bool.or w x.toNat y.toNat)

def lxor (w : Nat) (x y : BitVec w) : BitVec w :=
  BitVec.ofNat w (bitwise Bool.xor w x.toNat y.toNat)

/-- Two's-complement reduction without proof-bearing Int-to-BitVec helpers. -/
def ofSigned (w : Nat) : Int → BitVec w
  | .ofNat n => BitVec.ofNat w n
  | .negSucc n => BitVec.ofNat w (2^w - ((n + 1) % 2^w))

def sdiv (w : Nat) (x y : BitVec w) : BitVec w :=
  ofSigned w (Int.tdiv x.toInt y.toInt)

def smod (w : Nat) (x y : BitVec w) : BitVec w :=
  ofSigned w (Int.tmod x.toInt y.toInt)

def lsl (w : Nat) (x y : BitVec w) : BitVec w :=
  if y.toNat < w then BitVec.ofNat w (Nat.shiftLeft x.toNat y.toNat)
  else BitVec.ofNat w 0

def lsr (w : Nat) (x y : BitVec w) : BitVec w :=
  if y.toNat < w then BitVec.ofNat w (Nat.shiftRight x.toNat y.toNat)
  else BitVec.ofNat w 0

/-- Rocq interprets a shift amount with the sign bit set as negative and returns zero.
For nonnegative amounts, saturation at the width avoids unbounded computation and
preserves the source's zero/sign-fill result for large shifts. -/
def asr (w : Nat) (x y : BitVec w) : BitVec w :=
  if y.toInt < 0 then BitVec.ofNat w 0
  else ofSigned w (Int.shiftRight x.toInt (min y.toNat w))

def eqb (w : Nat) (x y : BitVec w) : Bool := x.toNat == y.toNat
def ltb (w : Nat) (x y : BitVec w) : Bool := x.toNat < y.toNat
def leb (w : Nat) (x y : BitVec w) : Bool := x.toNat ≤ y.toNat
def ltsb (w : Nat) (x y : BitVec w) : Bool := x.toInt < y.toInt
def lesb (w : Nat) (x y : BitVec w) : Bool := x.toInt ≤ y.toInt

def compare (w : Nat) (x y : BitVec w) : Ordering :=
  if x.toNat < y.toNat then .lt else if y.toNat < x.toNat then .gt else .eq

def compares (w : Nat) (x y : BitVec w) : Ordering :=
  if x.toInt < y.toInt then .lt else if y.toInt < x.toInt then .gt else .eq

def leadingZeros : Nat → Nat → Nat
  | 0, _ => 0
  | w + 1, n => if n < 2^w then leadingZeros w n + 1 else 0

def trailingZeros : Nat → Nat → Nat
  | 0, _ => 0
  | w + 1, n => if n % 2 == 0 then trailingZeros w (n / 2) + 1 else 0

def head0 (w : Nat) (x : BitVec w) : BitVec w :=
  BitVec.ofNat w (leadingZeros w x.toNat)

def tail0 (w : Nat) (x : BitVec w) : BitVec w :=
  BitVec.ofNat w (trailingZeros w x.toNat)

def addmuldiv (w : Nat) (p x y : BitVec w) : BitVec w :=
  lor w (lsl w x p) (lsr w y (BitVec.sub (BitVec.ofNat w w) p))

universe u

def addc (w : Nat) (R : Type u) (c0 c1 : BitVec w → R) (x y : BitVec w) : R :=
  if x.toNat + y.toNat < 2^w then c0 (BitVec.add x y) else c1 (BitVec.add x y)
def addcarryc (w : Nat) (R : Type u) (c0 c1 : BitVec w → R) (x y : BitVec w) : R :=
  let z := BitVec.ofNat w (x.toNat + y.toNat + 1)
  if x.toNat + y.toNat + 1 < 2^w then c0 z else c1 z
def subc (w : Nat) (R : Type u) (c0 c1 : BitVec w → R) (x y : BitVec w) : R :=
  if y.toNat ≤ x.toNat then c0 (BitVec.sub x y) else c1 (BitVec.sub x y)
def subcarryc (w : Nat) (R : Type u) (c0 c1 : BitVec w → R) (x y : BitVec w) : R :=
  let z := BitVec.sub (BitVec.sub x y) (BitVec.ofNat w 1)
  if y.toNat < x.toNat then c0 z else c1 z

def mulc (w : Nat) (R : Type u) (pair : BitVec w → BitVec w → R) (x y : BitVec w) : R :=
  let p := x.toNat * y.toNat
  pair (BitVec.ofNat w (p / 2^w)) (BitVec.ofNat w p)
def diveucl (w : Nat) (R : Type u) (pair : BitVec w → BitVec w → R) (x y : BitVec w) : R :=
  pair (udiv w x y) (umod w x y)
def div21 (w : Nat) (R : Type u) (pair : BitVec w → BitVec w → R) (xh xl y : BitVec w) : R :=
  if xh.toNat < y.toNat then
    let n := xh.toNat * 2^w + xl.toNat
    pair (BitVec.ofNat w (n / y.toNat)) (BitVec.ofNat w (n % y.toNat))
  else pair (BitVec.ofNat w 0) (BitVec.ofNat w 0)


end Rocq2Lean.PrimInt63
