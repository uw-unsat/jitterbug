
import data.num.basic
import data.num.bitwise

/-!
# Fixed-size bitvectors

This file defines fixed-sized bitvectors following the SMT-LIB standard.

## Implementation notes

Operations are defined over num to enable efficient computation (e.g.,
using dec_trivial).  Lemmas and theorems are proved over nat.

## References

* http://smtlib.cs.uiowa.edu/Theories/FixedSizeBitVectors.smt2
* http://smtlib.cs.uiowa.edu/Logics/QF_BV.smt2
-/

/--
The type of bitvectors.

We have considered two alternatives:

* a pair of nat and range: { x : ℕ // x < 2^n }
* a pair of list and length: { l : list bool // l.length = n }

We choose to use an inductive type because it simplifies reasoning in
both nat and bits.
-/
@[derive decidable_eq]
inductive bv : ℕ → Type
| nil  : bv 0
| cons : bool → Π {n : ℕ}, bv n → bv n.succ

protected def num.bodd : num → bool
| 0                          := ff
| 1                          := tt
| (num.pos (pos_num.bit0 _)) := ff
| (num.pos (pos_num.bit1 _)) := tt

namespace bv

section conversion

  -- Keep the LSB bit at head, making it easier for induction (compared to
  -- keeping the MSB bit at head).

  protected def of_num : Π (n : ℕ), num → bv n
  | 0       _ := nil
  | (n + 1) a := cons a.bodd (of_num n a.div2)

  protected def to_num : Π {n : ℕ}, bv n → num
  | ._ nil        := 0
  | ._ (cons b v) := num.bit b v.to_num

  protected def of_nat : Π (n : ℕ), ℕ → bv n
  | 0       _ := nil
  | (n + 1) a := cons a.bodd (of_nat n a.div2)

  protected def to_nat : Π {n : ℕ}, bv n → ℕ
  | ._ nil        := 0
  | ._ (cons b v) := nat.bit b v.to_nat

  -- The bitvector operations are defined using of_def, to_def, and pow2_def.
  -- We choose num for definitions for efficient computation (see dec_trivial
  -- in tests) and prove theorems over nat.
  @[simp] protected def of_def   := bv.of_num
  @[simp] protected def to_def   := @bv.to_num
  @[simp] protected def pow2_def := num.shiftl 1

  -- Convert a bitvector to a different type but with the same width.
  @[reducible]
  protected def cong {n₁ n₂ : ℕ} (h : n₁ = n₂) : bv n₁ → bv n₂
  | v₁ := eq.rec_on h v₁

  def lsb : Π {n : ℕ}, bv n.succ → bool
  | _ (cons b _) := b

  def msb : Π {n : ℕ}, bv n.succ → bool
  | 0       (cons b nil) := b
  | (_ + 1) (cons _ v)   := v.msb

  protected def of_int : Π (n : ℕ), ℤ → bv n
  | 0       _ := nil
  | (n + 1) a := cons a.bodd (of_int n a.div2)

  -- Convert a bitvector to int in [-2^(n-1), 2^(n-1)-1].
  protected def to_int : Π {n : ℕ}, bv n → ℤ
  | 0       nil          := 0
  | 1       (cons b nil) := cond b (-1) 0
  | (_ + 1) (cons b v)   := int.bit b v.to_int

  def test_bit : Π {i n : ℕ}, i < n → bv n → bool
  | i       0 h nil        := absurd h (nat.not_lt_zero i)
  | 0       _ _ (cons b _) := b
  | (_ + 1) _ h (cons _ v) := test_bit (nat.lt_of_succ_lt_succ h) v

end conversion

section literals

  def repeat (b : bool) : Π (n : ℕ), bv n
  | 0       := nil
  | (n + 1) := cons b (repeat n)

  protected def zero (n : ℕ) : bv n := repeat ff n

  protected def ones (n : ℕ) : bv n := repeat tt n

  protected def one : Π (n : ℕ), bv n
  | 0       := nil
  | (n + 1) := cons tt (bv.zero n)

  instance (n : ℕ) : inhabited (bv n) := ⟨bv.zero n⟩
  instance (n : ℕ) : has_zero (bv n) := ⟨bv.zero n⟩
  instance (n : ℕ) : has_one (bv n)  := ⟨bv.one n⟩

end literals

section concatenation

  def concat {n₁ : ℕ} (v₁ : bv n₁) : Π {n₂ : ℕ}, bv n₂ → bv (n₁ + n₂)
  | ._ nil          := v₁
  | ._ (cons b₂ v₂) := cons b₂ (concat v₂)

  def zero_extend (i : ℕ) {n : ℕ} (v : bv n) : bv (i + n) :=
    concat 0 v

  def sign_extend (i : ℕ) {n : ℕ} (v : bv n.succ) : bv (i + n.succ) :=
    concat (repeat v.msb i) v

end concatenation

section extraction

  def drop {n₁ : ℕ} : Π (n₂ : ℕ), bv (n₁ + n₂) → bv n₁
  | 0        v          := v
  | (n₂ + 1) (cons _ v) := drop n₂ v

  def take {n₁ : ℕ} : Π (n₂ : ℕ), bv (n₁ + n₂) → bv n₂
  | 0        _          := nil
  | (n₂ + 1) (cons b v) := cons b (take n₂ v)

  private lemma extract_cong {n i j : ℕ} (h₁ : i < n) (h₂ : j ≤ i) :
    n = n - (i + 1) + (i - j + 1) + j :=
  calc
    n = n - (i + 1) + (i + 1) : by rw nat.sub_add_cancel h₁
  ... = n - (i + 1) + (i - j + j) + 1 : by rw [nat.add_assoc, nat.sub_add_cancel h₂]
  ... = n - (i + 1) + (i - j + 1) + j : by { simp [nat.add_assoc, nat.add_comm j 1] }

  def extract {n i j : ℕ} (h₁ : i < n) (h₂ : j ≤ i) (v : bv n) : bv (i - j + 1) :=
    take (i - j + 1) (drop j (v.cong (extract_cong h₁ h₂)))

end extraction

section bitwise

  variable {n : ℕ}

  protected def map (f : bool → bool) : Π {n : ℕ}, bv n → bv n
  | ._ nil        := nil
  | ._ (cons b v) := cons (f b) (map v)

  protected def map₂ (f : bool → bool → bool) : Π {n : ℕ}, bv n → bv n → bv n
  | ._ nil          nil          := nil
  | ._ (cons b₁ v₁) (cons b₂ v₂) := cons (f b₁ b₂) (map₂ v₁ v₂)

  protected def not (v : bv n) : bv n := bv.map bnot v
  protected def and (v₁ v₂ : bv n) : bv n := bv.map₂ band v₁ v₂
  protected def or (v₁ v₂ : bv n) : bv n := bv.map₂ bor v₁ v₂
  protected def xor (v₁ v₂ : bv n) : bv n := bv.map₂ bxor v₁ v₂

end bitwise

section arithmetic

  variable {n : ℕ}

  protected def neg (v : bv n) : bv n :=
    bv.of_def n (bv.pow2_def n - v.to_def)

  protected def add (v₁ v₂ : bv n) : bv n :=
    bv.of_def n (v₁.to_def + v₂.to_def)

  protected def sub (v₁ v₂ : bv n) : bv n :=
    bv.add v₁ (bv.neg v₂)

  protected def mul (v₁ v₂ : bv n) : bv n :=
    bv.of_def n (v₁.to_def * v₂.to_def)

  protected def udiv (v₁ v₂ : bv n) : bv n :=
    if v₂.to_def = 0 then bv.ones n else bv.of_def n (v₁.to_def / v₂.to_def)

  protected def urem (v₁ v₂ : bv n) : bv n :=
    if v₂.to_def = 0 then v₁ else bv.of_def n (v₁.to_def % v₂.to_def)

  instance : has_neg (bv n) := ⟨bv.neg⟩
  instance : has_add (bv n) := ⟨bv.add⟩
  instance : has_sub (bv n) := ⟨bv.sub⟩
  instance : has_mul (bv n) := ⟨bv.mul⟩
  instance : has_div (bv n) := ⟨bv.udiv⟩
  instance : has_mod (bv n) := ⟨bv.urem⟩

end arithmetic

section shift

  variable {n : ℕ}

  def shl (v₁ v₂ : bv n) : bv n :=
    bv.of_def n (v₁.to_def * (bv.pow2_def v₂.to_def))

  def lshr (v₁ v₂ : bv n) : bv n :=
    bv.of_def n (v₁.to_def / (bv.pow2_def v₂.to_def))

  def ashr (v₁ v₂ : bv n.succ) : bv n.succ :=
    cond v₁.msb (v₁.not.lshr v₂).not (v₁.lshr v₂)

end shift

section comparison

  variable {n : ℕ}

  protected def ult (v₁ v₂ : bv n) : Prop :=
    v₁.to_def < v₂.to_def

  protected def ule (v₁ v₂ : bv n) : Prop :=
    v₁.ult v₂ ∨ v₁ = v₂

  @[reducible]
  protected def ugt (v₁ v₂ : bv n) : Prop :=
    v₂.ult v₁

  @[reducible]
  protected def uge (v₁ v₂ : bv n) : Prop :=
    v₂.ult v₁ ∨ v₁ = v₂

  instance decidable_ult : @decidable_rel (bv n) bv.ult :=
    λ _ _, by dsimp [bv.ult]; apply_instance

  instance decidable_ule : @decidable_rel (bv n) bv.ule :=
    λ _ _, by dsimp [bv.ule]; apply_instance

  protected def slt (v₁ v₂ : bv n.succ) : Prop :=
    (v₁.msb = tt ∧ v₂.msb = ff) ∨
    (v₁.msb = v₂.msb ∧ v₁.ult v₂)

  protected def sle (v₁ v₂ : bv n.succ) : Prop :=
    (v₁.msb = tt ∧ v₂.msb = ff) ∨
    (v₁.msb = v₂.msb ∧ v₁.ule v₂)

  @[reducible]
  protected def sgt (v₁ v₂ : bv n.succ) : Prop :=
    v₂.slt v₁

  @[reducible]
  protected def sge (v₁ v₂ : bv n.succ) : Prop :=
    v₂.sle v₁

  instance decidable_slt : @decidable_rel (bv n.succ) bv.slt :=
    λ _ _, by dsimp [bv.slt]; apply_instance

  instance decidable_sle : @decidable_rel (bv (n + 1)) bv.sle :=
    λ _ _, by dsimp [bv.sle]; apply_instance

end comparison

private def bin_repr : Π {n : ℕ}, bv n → string
| ._ nil        := string.empty
| ._ (cons b v) := bin_repr v ++ (cond b "1" "0")

private def hex_repr : Π {n : ℕ}, bv n → string
| _ (cons b₁ (cons b₂ (cons b₃ (cons b₄ v)))) :=
  hex_repr v ++ [(cons b₁ (cons b₂ (cons b₃ (cons b₄ nil)))).to_nat.digit_char].as_string
| 0 _ := ""
| 1 _ := "?"
| 2 _ := "?"
| 3 _ := "?"

private def repr {n : ℕ} (v : bv n) : string :=
   if n % 4 = 0 then "#x" ++ hex_repr v else "#b" ++ bin_repr v

instance (n : ℕ) : has_repr (bv n) := ⟨repr⟩

end bv
