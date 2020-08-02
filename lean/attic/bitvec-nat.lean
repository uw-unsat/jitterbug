-- Theorems for axiomatization:
-- bvmul_comm, bvmulhu_comm, bvmul_decomp, bvurem_of_bvsub_bvmul_bvudiv
--
-- The theorems prove that both bvmul and bvmulhu are commutative,
-- that 64-bit bvmul can be decomposed into 32-bit operations, and
-- that bvurem can be computed using bvsub, bvmul, and bvudiv.
--
-- They are used by bvaxiom.rkt to replace bitvector primitives with
-- uninterpreted functions.
--
-- One can check the proofs using the Lean theorem prover 3.x:
-- https://leanprover.github.io

-- This file represents a bitvec as a pair of nat and range.

import ..natutil


def bitvector (n : ℕ) := { x : ℕ // x < 2^n }

namespace bitvector

variable {n : ℕ}

instance decidable_eq : decidable_eq (bitvector n) :=
  by apply_instance

@[simp] def to_nat (v : bitvector n) : ℕ := v.1

theorem eq : ∀ (v₁ v₂ : bitvector n), to_nat v₁ = to_nat v₂ → v₁ = v₂
| ⟨_, _⟩ ⟨_, _⟩ rfl := rfl

@[reducible] def length (v : bitvector n) : ℕ := n

theorem modulus_pos : 0 < 2^n :=
have 0 < 2, by { apply nat.le_succ },
nat.pos_pow_of_pos n this.

theorem modulus_ge_one : 1 ≤ 2^n :=
by { apply modulus_pos }.

theorem modulus_le {n m : ℕ} : n ≤ m → 2^n ≤ 2^m :=
have 0 < 2, { apply nat.le_succ },
nat.pow_le_pow_of_le_right this.

theorem modulus_lt {n m : ℕ} : n < m → 2^n < 2^m :=
have 1 < 2, { apply nat.lt_succ_self },
nat.pow_lt_pow_of_lt_right this.

theorem modulus_le_add_right (n m : ℕ) : 2^m ≤ 2^(n + m) :=
begin
  apply modulus_le,
  apply nat.le_add_left
end

theorem umax_lt_modulus : 2^n - 1 < 2^n :=
begin
  apply nat.sub_lt_of_pos_le,
  apply nat.lt_succ_self,
  apply modulus_ge_one
end

theorem mod_modulus_range (x : ℕ) : x % 2^n < 2^n :=
nat.mod_lt x modulus_pos

theorem modulus_le_of_lt {x : ℕ}: x < 2^n → x ≤ 2^n - 1 :=
begin
  rw ← nat.add_le_to_le_sub _ modulus_ge_one,
  apply nat.succ_le_of_lt
end

theorem modulus_add_mul (n m : ℕ) : 2^(n + m) = 2^n * 2^m :=
  nat.pow_add_mul 2 n m

theorem modulus_sub_div {n m : ℕ} (H : m ≤ n) : 2^(n - m) = 2^n / 2^m :=
  (nat.pow_sub_div (nat.zero_lt_succ 1) H)

theorem modulus_sub_mul {n m : ℕ} (H : m ≤ n) : 2^n = 2^(n - m) * 2^m :=
calc
  2^n = 2^(n - m + m) : by rw nat.sub_add_cancel H
  ... = 2^(n - m) * 2^m : by rw modulus_add_mul

theorem modulus_dvd {n m : ℕ} (H : m ≤ n) : 2^m ∣ 2^n :=
begin
  apply nat.dvd_of_mod_eq_zero,
  rw modulus_sub_mul H,
  apply nat.mul_mod_left
end

def of_nat (n x : ℕ) : bitvector n :=
⟨ x % 2^n, by { apply mod_modulus_range } ⟩

@[reducible] protected def zero (n : ℕ) : bitvector n :=
⟨ 0, modulus_pos ⟩

@[reducible] protected def one (n : ℕ) : bitvector n :=
⟨ 1 % 2^n, mod_modulus_range 1 ⟩

@[reducible] protected def umax (n : ℕ) : bitvector n :=
⟨ 2^n - 1, umax_lt_modulus ⟩

instance : has_zero (bitvector n) := ⟨bitvector.zero n⟩
instance : has_one (bitvector n) := ⟨bitvector.one n⟩

protected def add (x y : bitvector n) : bitvector n := of_nat n (to_nat x + to_nat y)

instance : has_add (bitvector n) := ⟨bitvector.add⟩

protected lemma add_comm : ∀ a b : bitvector n, a + b = b + a :=
begin
  intros,
  unfold has_add.add,
  unfold bitvector.add,
  rw [add_comm]
end

protected lemma add_zero : ∀ a : bitvector n, a + 0 = a :=
begin
  intros,
  apply bitvector.eq,
  cases a,
  apply nat.mod_eq_of_lt,
  assumption
end

protected lemma zero_add (a : bitvector n) : 0 + a = a :=
bitvector.add_comm a 0 ▸ bitvector.add_zero a

protected lemma add_assoc : ∀ a b c : bitvector n, a + b + c = a + (b + c) :=
begin
  intros,
  apply bitvector.eq,
  cases a,
  cases b,
  cases c,
  unfold has_add.add,
  unfold bitvector.add of_nat,
  simp [nat.add_mod_self_right],
end

protected def mul (x y : bitvector n) : bitvector n := of_nat n (to_nat x * to_nat y)

instance : has_mul (bitvector n) := ⟨bitvector.mul⟩

protected lemma mul_comm : ∀ a b : bitvector n, a * b = b * a :=
begin
  intros,
  unfold has_mul.mul,
  unfold bitvector.mul,
  rw mul_comm
end

protected lemma mul_one : ∀ (a : bitvector n), a * 1 = a :=
begin
  intros,
  apply bitvector.eq,
  cases a,
  unfold has_mul.mul has_one.one,
  unfold bitvector.mul of_nat,
  simp,
  cases n,
  { simp at *,
    symmetry,
    apply nat.eq_zero_of_lt_one,
    assumption },
  { rw (@nat.mod_eq_of_lt 1),
    { simp,
      apply nat.mod_eq_of_lt,
      assumption },
    { calc
        1 = 2^0 : by simp
      ... < 2^(nat.succ n) : by { apply nat.pow_lt_pow_of_lt_right, apply nat.lt_succ_self, apply nat.zero_lt_succ }
    } }
end

protected lemma one_mul (a : bitvector n) : 1 * a = a :=
bitvector.mul_comm a 1 ▸ bitvector.mul_one a

protected lemma mul_assoc : ∀ a b c : (bitvector n), a * b * c = a * (b * c) :=
begin
  intros,
  apply bitvector.eq,
  cases a,
  cases b,
  cases c,
  unfold has_mul.mul,
  unfold bitvector.mul of_nat,
  simp [nat.mul_mod_self_left, nat.mul_mod_self_right, mul_assoc]
end

protected lemma distrib_left : ∀ a b c : (bitvector n), a * (b + c) = a * b + a * c :=
begin
  intros,
  apply bitvector.eq,
  cases a,
  cases b,
  cases c,
  unfold has_mul.mul has_add.add,
  unfold bitvector.mul bitvector.add of_nat,
  simp [nat.mul_mod_self_right, nat.left_distrib],
  rw nat.add_mod
end

protected lemma distrib_right (a b c : bitvector n) : (a + b) * c = a * c + b * c :=
begin
  rw [bitvector.mul_comm, bitvector.distrib_left],
  simp [bitvector.mul_comm]
end

protected def neg (x : bitvector n) : bitvector n := of_nat n (2^n - to_nat x)

instance : has_neg (bitvector n)  := ⟨bitvector.neg⟩

protected lemma add_left_neg : ∀ a : (bitvector n), -a + a = 0 :=
begin
  intros,
  apply bitvector.eq,
  cases a,
  unfold has_add.add has_neg.neg has_zero.zero,
  unfold bitvector.add bitvector.neg of_nat,
  simp,
  rw nat.add_mod_self_right,
  rw ← nat.add_sub_assoc,
  { rw ← nat.sub_add_eq_add_sub,
    { simp [nat.sub_self] },
    { apply le_refl } },
  { apply le_of_lt,
    assumption }
end

instance : comm_ring (bitvector n) :=
{ add            := bitvector.add,
  add_assoc      := bitvector.add_assoc,
  zero           := 0,
  zero_add       := bitvector.zero_add,
  add_zero       := bitvector.add_zero,
  neg            := bitvector.neg,
  add_left_neg   := bitvector.add_left_neg,
  add_comm       := bitvector.add_comm,
  mul            := bitvector.mul,
  mul_assoc      := bitvector.mul_assoc,
  one            := 1,
  one_mul        := bitvector.one_mul,
  mul_one        := bitvector.mul_one,
  left_distrib   := bitvector.distrib_left,
  right_distrib  := bitvector.distrib_right,
  mul_comm       := bitvector.mul_comm }

-- Don't use nat.sub, where x - y is defined to be 0 if x < y
protected def sub (x y : bitvector n) : bitvector n := bitvector.add x (bitvector.neg y)

instance : has_sub (bitvector n)  := ⟨bitvector.sub⟩

-- x % 0 = -1 (be careful: nat.div produces 0 in this case)
def udiv : bitvector n → bitvector n → bitvector n
| ⟨ x₁, p₁ ⟩ ⟨ x₂, p₂ ⟩ :=
  ⟨ if x₂ = 0 then 2^n - 1 else x₁ / x₂, by
    { cases x₂,
      { simp [umax_lt_modulus] },
      { rw [if_neg],
        { apply lt_of_le_of_lt, apply nat.div_le_self, assumption },
        { apply nat.succ_ne_zero } } } ⟩

-- x % 0 = x (nat.mod has the same behavior)
def urem : bitvector n → bitvector n → bitvector n
| ⟨ x₁, p₁ ⟩ ⟨ x₂, p₂ ⟩ :=
  ⟨ x₁ % x₂, by { apply lt_of_le_of_lt, apply nat.mod_le, assumption } ⟩

def zext {n m : ℕ} (H : n ≤ m) : bitvector n → bitvector m
| ⟨ x, p ⟩ :=
  ⟨ x, by { apply nat.lt_of_lt_of_le p, apply modulus_le H } ⟩

def concat {n m : ℕ} : bitvector n → bitvector m → bitvector (n + m)
| ⟨ x₁, p₁ ⟩ ⟨ x₂, p₂ ⟩ :=
  have x₁ * 2^m ≤ (2^n - 1) * 2^m, by { apply nat.mul_le_mul_right, apply modulus_le_of_lt p₁ },
  have x₁ * 2^m + x₂ < 2^(n + m), by calc
       x₁ * 2^m + x₂ ≤ (2^n - 1) * 2^m + x₂ : by { apply nat.add_le_add_right this }
                 ... = 2^(n + m) - 2^m + x₂ : by simp [nat.mul_sub_right_distrib, modulus_add_mul]
                 ... < 2^(n + m) - 2^m + 2^m : by { apply nat.add_lt_add_left p₂ }
                 ... = 2^(n + m) : by { apply nat.sub_add_cancel, apply modulus_le_add_right },
  ⟨ x₁ * 2^m + x₂, this ⟩

-- An alternative definition for extract.
def trunc (i m : ℕ) : bitvector n → bitvector m
| ⟨ x, p ⟩ :=
  ⟨ (x / 2^i) % 2^m, by { apply mod_modulus_range } ⟩

theorem concat_trunc {n m : ℕ} (x : bitvector (n + m)) : concat (trunc m n x) (trunc 0 m x) = x :=
begin
  apply bitvector.eq,
  cases x with x hx,
  unfold trunc,
  unfold concat,
  simp,
  rw @nat.mod_eq_of_lt _ (2^n),
  rw [mul_comm, nat.mod_add_div],
  rw nat.div_lt_iff_lt_mul,
  rw modulus_add_mul at hx,
  apply hx,
  apply modulus_pos
end

theorem trunc_concat {n m : ℕ} (x : bitvector n) (y : bitvector m) : trunc 0 m (concat x y) = y :=
begin
  apply bitvector.eq,
  cases x with x hx,
  cases y with y hy,
  unfold concat,
  unfold trunc,
  simp,
  rw nat.mod_eq_of_lt,
  apply hy
end

end bitvector


open bitvector
open nat

-- (bveq (bvmul (extract 31 0 x) (extract 31 0 y))
--       (extract 31 0 (bvmul x y)))

theorem mul_extract {n m : ℕ} (x y : bitvector n) (H : m ≤ n) :
  (trunc 0 m x) * (trunc 0 m y) = (trunc 0 m (x * y)) :=
begin
  apply bitvector.eq,
  cases x,
  cases y,
  unfold has_mul.mul,
  unfold bitvector.mul,
  unfold of_nat,
  unfold trunc,
  simp,
  rw ← mul_mod,
  rw dvd_mod_mod,
  apply modulus_dvd H,
end

theorem mullu_extract {n : ℕ} (x₁ x₀ y₁ y₀ : bitvector n) :
x₀ * y₀ =
trunc 0 n ((concat x₁ x₀) * (concat y₁ y₀)) :=
begin
  intros,
  rw ← mul_extract (concat x₁ x₀) (concat y₁ y₀),
  simp [trunc_concat],
  apply nat.le_add_right
end

theorem bvadd_of_nat (n a b : ℕ):
  bitvector.add (of_nat n a) (of_nat n b) = of_nat n (a + b) :=
begin
  apply bitvector.eq,
  unfold bitvector.add,
  unfold of_nat,
  simp,
  rw ← add_mod
end


-- common operations

def zext_double {n : ℕ} (x : bitvector n) : bitvector (n + n) :=
  zext (nat.le_add_right n n) x.

def bvmulhu {n : ℕ} (x y : bitvector n) : bitvector n :=
  trunc n n ((zext_double x) * (zext_double y)).

theorem bvmulhu_comm {n : ℕ} (x y : bitvector n) : bvmulhu x y = bvmulhu y x :=
begin
  unfold bvmulhu,
  rw mul_comm
end


-- (bveq (bvadd (extract 63 32 (bvmul (zero-extend x0 (bitvector 64))
--                                    (zero-extend y0 (bitvector 64))))
--              (bvadd (bvmul x0 y1)
--                     (bvmul x1 y0)))
--       (extract 63 32 (bvmul (concat x1 x0) (concat y1 y0))))

lemma mod_mul_div (x y : ℕ) : x % (y * y) / y = x / y % y :=
begin
  cases nat.eq_zero_or_pos y with h h,
  { rw h, rw nat.mod_zero, repeat { rw nat.div_zero } },
  calc
    x % (y * y) / y = (x % y + y * (x / y % y)) / y : by rw mod_mul
                ... = (x % y / y + x / y % y) : by rw nat.add_mul_div_left _ _ h
                ... = x / y % y : by simp [mod_div _ h]
end

lemma trunc_bvmul_zext {n : ℕ} {x y : bitvector n} :
trunc n n (bitvector.mul (zext_double x) (zext_double y)) = of_nat n ((to_nat x * to_nat y) / 2^n) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  unfold zext_double,
  unfold zext,
  unfold bitvector.mul,
  unfold of_nat,
  unfold trunc,
  simp,
  rw modulus_add_mul,
  rw mod_mul_div,
  rw mod_mod
end

lemma bvadd_bvmul {n : ℕ} (x y z w : bitvector n) :
bitvector.add (bitvector.mul x y) (bitvector.mul z w) = of_nat n (to_nat x * to_nat y + to_nat z * to_nat w) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  cases z with _ _,
  cases w with _ _,
  unfold bitvector.mul,
  unfold bitvector.add,
  unfold of_nat,
  simp,
  rw ← add_mod
end

lemma trunc_bvmul_high {n : ℕ} (x y : bitvector (n + n)) :
trunc n n (bitvector.mul x y) = of_nat n ((to_nat x * to_nat y) / 2^n) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  unfold bitvector.mul,
  unfold of_nat,
  unfold trunc,
  simp,
  rw modulus_add_mul,
  rw mod_mul_div,
  rw mod_mod
end

lemma mul_comm_3 (x y z : ℕ) : x * y * z = x * z * y :=
calc
  x * y * z = x * (y * z) : by rw mul_assoc
        ... = x * (z * y) : by rw mul_comm y z
        ... = x * z * y : by rw ← mul_assoc

lemma two_distrib {n : ℕ} (H : n > 0) (x y z w : ℕ):
(x + y * n) * (z + w * n) / n = y * w * n + (x * w + ((y * z) + (x * z / n))) :=
calc
  (x + y * n) * (z + w * n) / n = (y * n + x) * (w * n + z) / n : by rw [add_comm x, add_comm z]
                            ... = (y * n * (w * n) + x * (w * n) + (y * n * z + x * z)) / n : by rw [left_distrib, right_distrib, right_distrib]
                            ... = (y * w * n * n + x * (w * n) + (y * n * z + x * z)) / n : by rw [mul_comm_3 y n (w * n), ← mul_assoc]
                            ... = (y * w * n * n + (x * w * n + (y * n * z + x * z))) / n : by rw [add_assoc, ← mul_assoc]
                            ... = (y * w * n * n + (x * w * n + (y * z * n + x * z))) / n : by rw mul_comm_3 y n z
                            ... = y * w * n + (x * w + ((y * z) + (x * z / n))) : by rw [mul_add_div_right _ _ H, mul_add_div_right _ _ H, mul_add_div_right _ _ H]

lemma mulhu_extract {n : ℕ} (x₁ x₀ y₁ y₀ : bitvector n) :
(bvmulhu x₀ y₀) + (x₀ * y₁ + x₁ * y₀) =
trunc n n (bitvector.mul (concat x₁ x₀) (concat y₁ y₀)) :=
begin
  unfold bvmulhu,
  unfold has_add.add has_mul.mul,
  rw trunc_bvmul_zext,
  rw bvadd_bvmul,
  rw bvadd_of_nat,
  rw trunc_bvmul_high,
  cases x₀,
  cases x₁,
  cases y₀,
  cases y₁,
  unfold concat,
  unfold of_nat,
  apply bitvector.eq,
  simp,
  rw two_distrib modulus_pos,
  rw nat.mul_add_mod_self_right
end


-- (bveq (concat (bvadd (bvmulhu x0 y0)
--                      (bvadd (bvmul x0 y1) (bvmul x1 y0)))
--               (bvmul x0 y0))
--       (bvmul (concat x1 x0) (concat y1 y0)))

theorem bvmul_decomp' {n : ℕ} (x₁ x₀ y₁ y₀ : bitvector n) :
concat ((bvmulhu x₀ y₀) + (x₀ * y₁ + x₁ * y₀)) (x₀ * y₀) = (concat x₁ x₀) * (concat y₁ y₀) :=
begin
  intros,
  rw mulhu_extract,
  rw mullu_extract x₁ x₀ y₁ y₀,
  apply concat_trunc
end


-- (bveq (concat (bvadd (bvmulhu (extract 31 0 x) (extract 31 0 y))
--                      (bvadd (bvmul (extract 31 0 x) (extract 63 32 y))
--                             (bvmul (extract 63 32 x) (extract 31 0 y))))
--               (bvmul (extract 31 0 x) (extract 31 0 y)))
--       (bvmul x y))

theorem bvmul_decomp {n : ℕ} (x y : bitvector (n + n)) :
let x₀ := (trunc 0 n x),
    x₁ := (trunc n n x),
    y₀ := (trunc 0 n y),
    y₁ := (trunc n n y) in
concat ((bvmulhu x₀ y₀) + (x₀ * y₁ + x₁ * y₀)) (x₀ * y₀) = x * y :=
begin
  intros,
  simp [bvmul_decomp', concat_trunc]
end


-- x % y = x - (x / y) * y
-- One can also prove this using SMT in lemmas.rkt.

theorem bvurem_of_bvsub_bvmul_bvudiv {n : ℕ} (x y : bitvector n) :
  bitvector.urem x y = x - (bitvector.udiv x y) * y :=
begin
  apply bitvector.eq,
  cases x with x hx,
  cases y with y hy,
  unfold has_sub.sub has_mul.mul,
  unfold bitvector.urem,
  unfold bitvector.sub bitvector.add bitvector.neg,
  unfold bitvector.mul,
  unfold bitvector.udiv,
  unfold of_nat,
  simp,
  cases y,
  { simp, rw [nat.mod_eq_of_lt], assumption },
  { rw [if_neg],
    { generalize : nat.succ y = k,
      rw add_mod_self_right,
      have h : x / k * k < 2^n,
      { apply lt_of_le_of_lt, apply nat.div_mul_le_self, assumption },
      rw (nat.mod_eq_of_lt h),
      calc
        x % k = x - x / k * k : by { rw mul_comm, apply mod_sub_div }
          ... = (x - x / k * k) % 2^n : by { rw nat.mod_eq_of_lt, apply lt_of_le_of_lt, apply nat.sub_le, assumption }
          ... = (x - x / k * k + 2^n) % 2^n : by { rw nat.add_mod_right }
          ... = (x + 2^n - x / k * k) % 2^n : by { rw nat.sub_add_eq_add_sub, apply nat.div_mul_le_self }
          ... = (x + (2^n - x / k * k)) % 2^n : by { rw nat.add_sub_assoc, apply le_of_lt, assumption }
    },
    { apply nat.succ_ne_zero } }
end
