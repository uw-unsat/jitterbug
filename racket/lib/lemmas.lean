-- Theorems for axiomatization:
-- bvmul_comm, bvmulhu_comm, bvmul_decomp
--
-- The theorems prove that both bvmul and bvmulhu are commutative,
-- and that 64-bit bvmul can be decomposed into 32-bit operations.
-- They are used by spec.rkt to replace bitvector primitives with
-- uninterpreted functions.
--
-- One can check the proofs using the Lean theorem prover 3.x:
-- https://leanprover.github.io


namespace nat

theorem eq_sub_of_add_eq {a b c : ℕ} (h : a + c = b) : a = b - c :=
calc
  a = a + c - c : by rw nat.add_sub_cancel
... = b - c : by rw h

theorem sub_add_eq_add_sub {a b c : ℕ} (h : a ≥ b) : a - b + c = a + c - b :=
calc
  a - b + c = c + (a - b) : by rw add_comm
        ... = c + a - b : by rw ← nat.add_sub_assoc h
        ... = a + c - b : by rw add_comm

theorem sub_sub_eq_sub_add {a b c : ℕ} (ab : a ≥ b) (bc : b ≥ c) : a - (b - c) = a - b + c :=
have a = a - b + c + (b - c), by calc
     a = a - b + b : by rw nat.sub_add_cancel ab
   ... = a - b + b + c - c : by rw nat.add_sub_cancel
   ... = a - b + c + b - c : by rw [add_assoc, add_comm b c, add_assoc]
   ... = a - b + c + (b - c) : by rw nat.add_sub_assoc bc,
begin
  rw nat.sub_eq_iff_eq_add,
  apply this,
  apply nat.le_trans (sub_le b c) ab,
end

theorem le_mul_of_pos_left {n k : ℕ} (h : k > 0) : n ≤ k * n :=
calc
  n = 1 * n : by rw one_mul
... ≤ k * n : by { apply mul_le_mul_right, apply succ_le_of_lt h }

theorem mul_add_mod_left (k x z : ℕ) : (k * x + z) % x = z % x :=
  by simp

end nat


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

theorem mod_modulus_range (x : ℕ) : x % 2^n < 2^n :=
nat.mod_lt x modulus_pos

theorem modulus_le_of_lt {x : ℕ}: x < 2^n → x ≤ 2^n - 1 :=
begin
  rw ← nat.add_le_to_le_sub _ modulus_ge_one,
  apply nat.succ_le_of_lt
end

-- Lean doesn't have many theorems about pow, so use shifts as a detour.

theorem modulus_add_mul (n m : ℕ) : 2^(n + m) = 2^n * 2^m :=
calc
  2^(n + m) = 1 * 2^(n + m) : by rw nat.one_mul
        ... = nat.shiftl 1 (n + m) : by rw nat.shiftl_eq_mul_pow
        ... = nat.shiftl (nat.shiftl 1 n) m : by rw nat.shiftl_add
        ... = nat.shiftl (2^n) m : by rw nat.one_shiftl
        ... = 2^n * 2^m : by rw nat.shiftl_eq_mul_pow

theorem modulus_sub_div {n m : ℕ} (H : m ≤ n) : 2^(n - m) = 2^n / 2^m :=
calc
  2^(n - m) = 1 * 2^(n - m) : by rw nat.one_mul
        ... = nat.shiftl 1 (n - m) : by rw nat.shiftl_eq_mul_pow
        ... = nat.shiftr (nat.shiftl 1 n) m : by rw nat.shiftl_sub _ H
        ... = nat.shiftr (2^n) m : by rw nat.one_shiftl
        ... = 2^n / 2^m : by rw nat.shiftr_eq_div_pow

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
⟨ 2^n - 1, by { apply nat.sub_lt_of_pos_le, apply nat.lt_succ_self, apply modulus_ge_one } ⟩

def bvadd (x y : bitvector n) : bitvector n := of_nat n (to_nat x + to_nat y)

theorem bvadd_comm (x y : bitvector n) : bvadd x y = bvadd y x :=
begin
  unfold bvadd,
  rw add_comm
end

theorem bvadd_zero_left (x : bitvector n) : bvadd (bitvector.zero n) x = x :=
begin
  apply bitvector.eq,
  cases x with _ hx,
  unfold bvadd,
  unfold of_nat,
  simp,
  apply nat.mod_eq_of_lt hx
end

def bvmul (x y : bitvector n) : bitvector n := of_nat n (to_nat x * to_nat y)

theorem bvmul_comm (x y : bitvector n) : bvmul x y = bvmul y x :=
begin
  unfold bvmul,
  rw mul_comm,
end

theorem bvmul_zero_right (x : bitvector n) : bvmul x (bitvector.zero n) = bitvector.zero n :=
begin
  apply bitvector.eq,
  unfold bvmul,
  unfold of_nat,
  simp
end

instance : has_zero (bitvector n) := ⟨bitvector.zero n⟩
instance : has_one (bitvector n)  := ⟨bitvector.one n⟩
instance : has_add (bitvector n)  := ⟨bitvector.bvadd⟩
instance : has_mul (bitvector n)  := ⟨bitvector.bvmul⟩

def bvneg (x : bitvector n) : bitvector n := of_nat n (2^n - to_nat x)

theorem bvneg_bvmul_umax_right (x : bitvector n) : bvneg x = bvmul x (bitvector.umax n) :=
begin
  apply bitvector.eq,
  cases x with x hx,
  unfold bvneg,
  unfold bvmul,
  unfold of_nat,
  simp,
  rw nat.mul_sub_left_distrib,
  simp,
  cases nat.eq_zero_or_pos x with h h,
  { simp [h] },
  { rw ← nat.mul_add_mod_left (x - 1),
    rw nat.mul_sub_right_distrib,
    rw one_mul,
    rw ← nat.add_sub_assoc (le_of_lt hx),
    rw nat.sub_add_cancel,
    apply nat.le_mul_of_pos_left h
  }
end

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

theorem mod_sub_div (x y : ℕ) : x % y = x - y * (x / y) :=
  have (x % y) + (y * (x / y)) = x, by { apply nat.mod_add_div },
  by { apply nat.eq_sub_of_add_eq this }

theorem mul_div_le_self : ∀ (m n : ℕ), n * (m / n) ≤ m :=
begin
  intros,
  rewrite mul_comm,
  apply nat.div_mul_le_self
end

theorem add_mod_self_left (x y z : ℕ) : (x % z + y) % z = (x + y) % z :=
  have hxz: z * (x / z) ≤ x, by { apply mul_div_le_self },
  have hxzy : z * (x / z) ≤ x + y, by { apply le_trans hxz, apply nat.le_add_right },
calc
  (x % z + y) % z = (x - z * (x / z) + y) % z : by rw mod_sub_div x z
              ... = (x + y - z * (x / z)) % z : by rw nat.sub_add_eq_add_sub hxz
              ... = (x + y) % z : by { apply nat.sub_mul_mod _ _ _ hxzy }

theorem add_mod_self_right (x y z : ℕ) : (x + y % z) % z = (x + y) % z :=
begin
  rw add_comm,
  rw add_mod_self_left,
  rw add_comm
end

theorem add_mod (x y z : ℕ) : (x + y) % z = (x % z + y % z) % z :=
calc
  (x + y) % z = (x % z + y) % z : by rw ← add_mod_self_left
          ... = (x % z + y % z) % z : by rw ← add_mod_self_right

theorem mul_mod_self_left (x y z : ℕ) : ((x % z) * y) % z = (x * y) % z :=
  have z * (x / z) ≤ x, by { apply mul_div_le_self },
  have z * (x / z) * y ≤ x * y, by { apply nat.mul_le_mul_right _ this },
  have h : z * (x / z * y) ≤ x * y, by { rw ← nat.mul_assoc, apply this },
calc
  ((x % z) * y) % z = ((x - z * (x / z)) * y) % z : by rw mod_sub_div x z
                ... = (x * y - z * ((x / z) * y)) % z : by simp [nat.mul_sub_right_distrib, nat.mul_assoc]
                ... = (x * y) % z : by { apply nat.sub_mul_mod _ _ _ h }

theorem mul_mod_self_right (x y z : ℕ) : (x * (y % z)) % z = (x * y) % z :=
calc
  (x * (y % z)) % z = ((y % z) * x) % z : by rw mul_comm
                ... = (y * x) % z : by rw mul_mod_self_left
                ... = (x * y) % z : by rw mul_comm

theorem mul_mod (x y z : ℕ) : (x * y) % z = ((x % z) * (y % z)) % z :=
calc
  (x * y) % z = ((x % z) * y) % z : by rw mul_mod_self_left
          ... = ((x % z) * (y % z)) % z : by rw mul_mod_self_right

theorem mod_mul (x y z : ℕ) : x % (y * z) = x % y + y * ((x / y) % z) :=
  have x % (y * z) + y * z * (x / (y * z)) = x % y + y * ((x / y) % z) + y * z * (x / (y * z)), by calc
       x % (y * z) + y * z * (x / (y * z)) = x : by rw nat.mod_add_div
                                       ... = x % y + y * (x / y) : by rw nat.mod_add_div
                                       ... = x % y + y * ((x / y) % z + z * (x / y / z)) : by rw nat.mod_add_div (x / y)
                                       ... = x % y + y * ((x / y) % z) + y * z * (x / y / z) : by rw [left_distrib, add_assoc, mul_assoc]
                                       ... = x % y + y * ((x / y) % z) + y * z * (x / (y * z)) : by rw nat.div_div_eq_div_mul,
  by { apply nat.add_right_cancel this }

theorem mod_mod (x y : ℕ) : (x % y) % y = x % y :=
begin
  cases nat.eq_zero_or_pos y with h h,
  { rw h, simp [nat.mod_zero] },
  { apply nat.mod_eq_of_lt,
    apply nat.mod_lt,
    exact h }
end

theorem dvd_mod_mod (x y z : ℕ) (H : z ∣ y) : (x % y) % z = x % z :=
match exists_eq_mul_right_of_dvd H with ⟨k, hk⟩ := calc
  (x % y) % z = (x % (z * k)) % z : by rw hk
          ... = (x % z + z * ((x / z) % k)) % z : by rw mod_mul
          ... = (x % z) % z : by rw nat.add_mul_mod_self_left
          ... = x % z : by rw mod_mod
end

theorem mod_div (x : ℕ) {y : ℕ} (h : y > 0) : (x % y) / y = 0 :=
begin
  apply nat.div_eq_of_lt,
  apply nat.mod_lt _ h
end


open bitvector


-- (bveq (bvmul (extract 31 0 x) (extract 31 0 y))
--       (extract 31 0 (bvmul x y)))

theorem mul_extract {n m : ℕ} (x y : bitvector n) (H : m ≤ n) :
  bvmul (trunc 0 m x) (trunc 0 m y) = (trunc 0 m (bvmul x y)) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  unfold bvmul,
  unfold of_nat,
  unfold trunc,
  simp,
  rw ← mul_mod,
  rw dvd_mod_mod,
  apply modulus_dvd H,
end

theorem mullu_extract {n : ℕ} (x₁ x₀ y₁ y₀ : bitvector n) :
bvmul x₀ y₀ =
trunc 0 n (bvmul (concat x₁ x₀) (concat y₁ y₀)) :=
begin
  intros,
  rw ← mul_extract (concat x₁ x₀) (concat y₁ y₀),
  simp [trunc_concat],
  apply nat.le_add_right
end

theorem bvadd_of_nat (n a b : ℕ):
  bvadd (of_nat n a) (of_nat n b) = of_nat n (a + b) :=
begin
  apply bitvector.eq,
  unfold bvadd,
  unfold of_nat,
  simp,
  rw ← add_mod
end


-- common operations

def zext_double {n : ℕ} (x : bitvector n) : bitvector (n + n) :=
  zext (nat.le_add_right n n) x.

def bvmulhu {n : ℕ} (x y : bitvector n) : bitvector n :=
  trunc n n (bvmul (zext_double x) (zext_double y)).

theorem bvmulhu_comm {n : ℕ} (x y : bitvector n) : bvmulhu x y = bvmulhu y x :=
begin
  unfold bvmulhu,
  rw bvmul_comm
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
trunc n n (bvmul (zext_double x) (zext_double y)) = of_nat n ((to_nat x * to_nat y) / 2^n) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  unfold zext_double,
  unfold zext,
  unfold bvmul,
  unfold of_nat,
  unfold trunc,
  simp,
  rw modulus_add_mul,
  rw mod_mul_div,
  rw mod_mod
end

lemma bvadd_bvmul {n : ℕ} (x y z w : bitvector n) :
bvadd (bvmul x y) (bvmul z w) = of_nat n (to_nat x * to_nat y + to_nat z * to_nat w) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  cases z with _ _,
  cases w with _ _,
  unfold bvmul,
  unfold bvadd,
  unfold of_nat,
  simp,
  rw ← add_mod
end

lemma trunc_bvmul_high {n : ℕ} (x y : bitvector (n + n)) :
trunc n n (bvmul x y) = of_nat n ((to_nat x * to_nat y) / 2^n) :=
begin
  apply bitvector.eq,
  cases x with _ _,
  cases y with _ _,
  unfold bvmul,
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

theorem mul_add_div_right (x z : ℕ) {y : ℕ} (H : y > 0) : (x * y + z) / y = x + z / y :=
begin
  rw add_comm,
  rw nat.add_mul_div_right _ _ H,
  rw add_comm
end

theorem mul_add_mod_self_right (x y z : ℕ) : (x * y + z) % y = z % y :=
begin
  rw add_comm,
  apply nat.add_mul_mod_self_right
end

lemma two_distrib (x y z w n : ℕ) (H : n > 0):
(x + y * n) * (z + w * n) / n = y * w * n + (x * w + ((y * z) + (x * z / n))) :=
calc
  (x + y * n) * (z + w * n) / n = (y * n + x) * (w * n + z) / n : by rw [add_comm x, add_comm z]
                            ... = (y * n * (w * n) + x * (w * n) + (y * n * z + x * z)) / n : by rw [left_distrib, right_distrib, right_distrib]
                            ... = (y * w * n * n + x * (w * n) + (y * n * z + x * z)) / n : by rw [mul_comm_3 y n (w * n), ← mul_assoc]
                            ... = (y * w * n * n + (x * w * n + (y * n * z + x * z))) / n : by rw [add_assoc, ← mul_assoc]
                            ... = (y * w * n * n + (x * w * n + (y * z * n + x * z))) / n : by rw mul_comm_3 y n z
                            ... = y * w * n + (x * w + ((y * z) + (x * z / n))) : by rw [mul_add_div_right _ _ H, mul_add_div_right _ _ H, mul_add_div_right _ _ H]

theorem mulhu_extract {n : ℕ} (x₁ x₀ y₁ y₀ : bitvector n) :
bvadd (bvmulhu x₀ y₀) (bvadd (bvmul x₀ y₁) (bvmul x₁ y₀)) =
trunc n n (bvmul (concat x₁ x₀) (concat y₁ y₀)) :=
begin
  unfold bvmulhu,
  rw trunc_bvmul_zext,
  rw bvadd_bvmul,
  rw bvadd_of_nat,
  rw trunc_bvmul_high,
  cases x₀ with _ _,
  cases x₁ with _ _,
  cases y₀ with _ _,
  cases y₁ with _ _,
  unfold concat,
  unfold of_nat,
  apply bitvector.eq,
  simp,
  rw two_distrib,
  rw mul_add_mod_self_right,
  apply modulus_pos
end


-- (bveq (concat (bvadd (bvmulhu x0 y0)
--                      (bvadd (bvmul x0 y1) (bvmul x1 y0)))
--               (bvmul x0 y0))
--       (bvmul (concat x1 x0) (concat y1 y0)))

theorem bvmul_decomp' {n : ℕ} (x₁ x₀ y₁ y₀ : bitvector n) :
concat (bvadd (bvmulhu x₀ y₀)
              (bvadd (bvmul x₀ y₁) (bvmul x₁ y₀)))
       (bvmul x₀ y₀) = bvmul (concat x₁ x₀) (concat y₁ y₀) :=
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
--       (bvmul (extract 31 0 x) (extract 31 0 y)))

theorem bvmul_decomp {n : ℕ} (x y : bitvector (n + n)) :
concat (bvadd (bvmulhu (trunc 0 n x) (trunc 0 n y))
              (bvadd (bvmul (trunc 0 n x) (trunc n n y))
                     (bvmul (trunc n n x) (trunc 0 n y))))
       (bvmul (trunc 0 n x) (trunc 0 n y)) = bvmul x y :=
by simp [bvmul_decomp', concat_trunc]
