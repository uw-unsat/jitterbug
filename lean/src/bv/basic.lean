import data.fin
import data.fintype.basic
import tactic.omega.main

/-!
# Fixed-size bitvectors

This file defines fixed-sized bitvectors following the SMT-LIB standard.

## References

* http://smtlib.cs.uiowa.edu/Theories/FixedSizeBitVectors.smt2
* http://smtlib.cs.uiowa.edu/Logics/QF_BV.smt2
-/

/--
The type of bitvectors.
-/
def bv (n : ℕ) := fin n → bool

namespace bv

section fin
variable {n : ℕ}

  def nil : bv 0 := fin.elim0

  instance nil_unique : unique (bv 0) :=
  fin.tuple0_unique _

  def cons (b : bool) (v : bv n) : bv (n + 1) := fin.cons b v
  def snoc (v : bv n) (b : bool) : bv (n + 1) := fin.snoc v b

  def init (v : bv (n + 1)) : bv n := fin.init v
  def tail (v : bv (n + 1)) : bv n := fin.tail v

  @[reducible]
  def lsb (v : bv (n + 1)) : bool := v 0
  def msb (v : bv (n + 1)) : bool := v (fin.last n)

  instance : decidable_eq (bv n) :=
  fintype.decidable_pi_fintype

  instance : fintype (bv n) :=
  pi.fintype

  instance : inhabited (bv n) :=
  pi.inhabited _

end fin

section list
  variable {n : ℕ}

  def to_list {n : ℕ} (v : bv n) : list bool :=
  list.of_fn v

  instance bv_to_list : has_coe (bv n) (list bool) :=
  ⟨to_list⟩

end list

section nat
  variable {n : ℕ}

  def of_nat : Π {n : ℕ}, ℕ → bv n
  | 0       _ := nil
  | (_ + 1) a := cons a.bodd (of_nat a.div2)

  def to_nat : Π {n : ℕ}, bv n → ℕ
  | 0       _ := 0
  | (_ + 1) v := nat.bit v.lsb v.tail.to_nat

  instance bv_to_nat : has_coe (bv n) ℕ :=
  ⟨to_nat⟩

  def of_int (a : ℤ) : bv n :=
  bv.of_nat (a % (2^n)).to_nat

  def to_int (v : bv n) : ℤ :=
  if (v : ℕ) < 2^(n - 1) then (v : ℕ) else (v : ℕ) - 2^n

end nat

section literals
  variable {n : ℕ}

  protected def zero : bv n :=
  λ _, ff

  instance : has_zero (bv n) :=
  ⟨bv.zero⟩

  protected def umax : bv n :=
  λ _, tt

  protected def one : Π {n : ℕ}, bv n
  | 0       := nil
  | (n + 1) := cons tt 0

  instance : has_one (bv n) :=
  ⟨bv.one⟩

  protected def smin : Π {n : ℕ}, bv n
  | 0       := nil
  | (n + 1) := bv.zero.snoc tt

  protected def smax : Π {n : ℕ}, bv n
  | 0       := nil
  | (n + 1) := bv.umax.snoc ff

end literals

section concatenation

  def concat {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) : bv (n₁ + n₂) :=
  λ ⟨i, h₁⟩, if h₂ : i < n₂ then v₂ ⟨i, h₂⟩ else v₁ ⟨i - n₂, by omega⟩

  def zero_extend {n : ℕ} (i : ℕ) (v : bv n) : bv (i + n) :=
  concat 0 v

  def sign_extend {n : ℕ} (i : ℕ) (v : bv (n + 1)) : bv (i + (n + 1)) :=
  concat (λ _, v.msb) v

end concatenation

section extraction

  def extract {n : ℕ} (i j : ℕ) (h₁ : i < n) (h₂ : j ≤ i) (v : bv n) : bv (i - j + 1) :=
  λ ⟨x, h⟩, v ⟨j + x, by omega⟩

  def drop {n₁ : ℕ} (n₂ : ℕ) (v : bv (n₁ + n₂)) : bv n₁ :=
  λ ⟨x, h⟩, v ⟨n₂ + x, by omega⟩

  def take {n₁ : ℕ} (n₂ : ℕ) (v : bv (n₁ + n₂)) : bv n₂ :=
  λ ⟨x, h⟩, v ⟨x, by omega⟩

end extraction

section bitwise
  variable {n : ℕ}

  def map (f : bool → bool) (v : bv n) : bv n :=
  λ i, f (v i)

  def map₂ (f : bool → bool → bool) (v₁ v₂ : bv n) : bv n :=
  λ i, f (v₁ i) (v₂ i)

  protected def not : bv n → bv n := map bnot
  protected def and : bv n → bv n → bv n := map₂ band
  protected def or  : bv n → bv n → bv n := map₂ bor
  protected def xor : bv n → bv n → bv n := map₂ bxor

end bitwise

section arithmetic
  variable {n : ℕ}

  protected def neg (v : bv n) : bv n :=
  of_nat (2^n - (v : ℕ))

  instance : has_neg (bv n) :=
  ⟨bv.neg⟩

  protected def add (v₁ v₂ : bv n) : bv n :=
  of_nat ((v₁ : ℕ) + (v₂ : ℕ))

  instance : has_add (bv n) :=
  ⟨bv.add⟩

  protected def sub (v₁ v₂ : bv n) : bv n :=
  v₁ + (-v₂)

  instance : has_sub (bv n) :=
  ⟨bv.sub⟩

  protected def mul (v₁ v₂ : bv n) : bv n :=
  of_nat ((v₁ : ℕ) * (v₂ : ℕ))

  instance : has_mul (bv n) :=
  ⟨bv.mul⟩

  protected def udiv (v₁ v₂ : bv n) : bv n :=
  if (v₂ : ℕ) = 0 then bv.umax else of_nat ((v₁ : ℕ) / (v₂ : ℕ))

  instance : has_div (bv n) :=
  ⟨bv.udiv⟩

  protected def urem (v₁ v₂ : bv n) : bv n :=
  if (v₂ : ℕ) = 0 then v₁ else of_nat ((v₁ : ℕ) % (v₂ : ℕ))

  instance : has_mod (bv n) :=
  ⟨bv.urem⟩

end arithmetic

section shift
  variable {n : ℕ}

  def shl (v₁ v₂ : bv n) : bv n :=
  of_nat ((v₁ : ℕ) * 2^(v₂ : ℕ))

  def lshr (v₁ v₂ : bv n) : bv n :=
  of_nat ((v₁ : ℕ) / 2^(v₂ : ℕ))

  def ashr (v₁ v₂ : bv (n + 1)) : bv (n + 1) :=
  match v₁.msb with
  | ff := v₁.lshr v₂
  | tt := (v₁.not.lshr v₂).not
  end

end shift

section comparison
  variable {n : ℕ}

  protected def ult (v₁ v₂ : bv n) : Prop :=
  (v₁ : ℕ) < (v₂ : ℕ)

  instance : has_lt (bv n) :=
  ⟨bv.ult⟩

  protected def ule (v₁ v₂ : bv n) : Prop :=
  v₁ < v₂ ∨ v₁ = v₂

  instance : has_le (bv n) :=
  ⟨bv.ule⟩

  @[reducible]
  protected def ugt (v₁ v₂ : bv n) : Prop :=
  v₂ < v₁

  @[reducible]
  protected def uge (v₁ v₂ : bv n) : Prop :=
  v₂ < v₁ ∨ v₁ = v₂

  instance decidable_ult : @decidable_rel (bv n) bv.ult :=
  λ _ _, by dsimp [bv.ult]; apply_instance

  instance decidable_ule : @decidable_rel (bv n) bv.ule :=
  λ _ _, by dsimp [bv.ule]; apply_instance

  protected def slt (v₁ v₂ : bv (n + 1)) : Prop :=
  (v₁.msb = tt ∧ v₂.msb = ff) ∨
  (v₁.msb = v₂.msb ∧ v₁ < v₂)

  protected def sle (v₁ v₂ : bv (n + 1)) : Prop :=
  (v₁.msb = tt ∧ v₂.msb = ff) ∨
  (v₁.msb = v₂.msb ∧ v₁ ≤ v₂)

  @[reducible]
  protected def sgt (v₁ v₂ : bv (n + 1)) : Prop :=
  v₂.slt v₁

  @[reducible]
  protected def sge (v₁ v₂ : bv (n + 1)) : Prop :=
  v₂.sle v₁

  instance decidable_slt : @decidable_rel (bv (n + 1)) bv.slt :=
  λ _ _, by dsimp [bv.slt]; apply_instance

  instance decidable_sle : @decidable_rel (bv (n + 1)) bv.sle :=
  λ _ _, by dsimp [bv.sle]; apply_instance

end comparison

private def bin_repr : Π {n : ℕ}, bv n → string
| 0       _ := ""
| (n + 1) v := bin_repr v.tail ++ cond v.lsb "1" "0"

private def hex_repr : Π {n : ℕ} (h : 4 ∣ n), bv n → string
| 0       _ _ := ""
| 1       h _ := absurd h dec_trivial
| 2       h _ := absurd h dec_trivial
| 3       h _ := absurd h dec_trivial
| (n + 4) h v := hex_repr (nat.dvd_add_self_right.mp h) (v.drop 4) ++
                 [(v.take 4 : ℕ).digit_char].as_string

private def repr {n : ℕ} (v : bv n) : string :=
if h : 4 ∣ n then "#x" ++ hex_repr h v else "#b" ++ bin_repr v

instance {n : ℕ} : has_repr (bv n) := ⟨repr⟩

end bv
