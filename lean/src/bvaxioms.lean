import bv.lemmas

/-
Theorems for bitvector axiomatization:

* mulhu_comm, mul_decomp: implement 64-bit multiplication using 32-bit operations;
* urem_of_sub_mul_udiv: implement urem using sub, mul, and udiv.
-/

open nat
open bv
open bv.helper


-- mulhu represents the upper bits of the result of a 2n-bit multiplication,
-- by zero-extending two n-bit operands.  For example, it can be used to model
-- the behavior of RISC-V's mulhu instruction, or that of x86's mul instruction
-- (usually the value in the rDX register).

def mulhu {n : ℕ} (v₁ v₂ : bv n) : bv n :=
  drop n ((zero_extend n v₁) * (zero_extend n v₂))

-- mulhu is commutative

theorem mulhu_comm {n : ℕ} (v₁ v₂ : bv n) : mulhu v₁ v₂ = mulhu v₂ v₁ :=
by simp [mulhu, mul_comm]


-- 64-bit mul can be decomposed into 32-bit operations:
-- x * y = (mulhu(y[31:0], x[31:0]) + x[31:0] * y[63:32] + x[63:32] * y[31:0]))
--       ⊕ (x[31:0] * y[31:0])
--
-- One may implement 64-bit multiplication on 32-bit architectures this way.

private lemma mod_pow_add_right_div_self (a b n m : ℕ) :
  a % b^(n + m) / b^n = a / b^n % b^m :=
by rw [pow_add, nat.mod_mul_right_div_self]

private lemma mod_pow_add_right_mod_self (a b n m : ℕ) :
  a % b^(n + m) % b^n = a % b^n :=
begin
  apply nat.mod_mod_of_dvd,
  apply pow_dvd_pow; omega
end

lemma drop_mul_concat {n : ℕ} (x₁ x₀ y₁ y₀ : bv n) :
  drop n ((concat x₁ x₀) * (concat y₁ y₀)) = mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀ :=
begin
  push_cast [← to_nat_inj, mulhu],
  simp [mod_pow_add_right_div_self],
  have hk : 2^n > 0 := pow2_pos _; generalize_hyp : 2^n = k at hk ⊢,
  calc (↑x₁ * k + ↑x₀) * (↑y₁ * k + ↑y₀) / k % k
      = (↑x₀ * ↑y₀ + (↑x₀ * ↑y₁ + ↑x₁ * ↑y₀ + ↑x₁ * ↑y₁ * k) * k) / k % k : by congr; ring
  ... = (↑x₀ * ↑y₀ / k + ↑x₀ * ↑y₁ + ↑x₁ * ↑y₀ + ↑x₁ * ↑y₁ * k) % k : by rw add_mul_div_right _ _ hk; ring
  ... = (↑x₀ * ↑y₀ / k + ↑x₀ * ↑y₁ + ↑x₁ * ↑y₀) % k : by rw add_mul_mod_self_right
end

lemma take_mul_concat {n : ℕ} (x₁ x₀ y₁ y₀ : bv n) :
  take n ((concat x₁ x₀) * (concat y₁ y₀)) = x₀ * y₀ :=
begin
  push_cast [← to_nat_inj],
  rw [mod_pow_add_right_mod_self, mul_mod],
  simp [add_mul_mod_self_right, add_comm]
end

theorem mul_decomp {n : ℕ} (x y : bv (n + n)) :
  let x₁ : bv n := x.drop n,
      x₀ : bv n := x.take n,
      y₁ : bv n := y.drop n,
      y₀ : bv n := y.take n in
    x * y = concat (mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀) (x₀ * y₀) :=
begin
  intros,
  rw ← drop_mul_concat x₁ x₀ y₁ y₀,
  rw ← take_mul_concat x₁ x₀ y₁ y₀,
  simp [concat_drop_take]
end

example (x y : bv 64) :
  let h63 : 63 < 64 := dec_trivial,
      h32 : 32 ≤ 63 := dec_trivial,
      h31 : 31 < 64 := dec_trivial,
      h0  :  0 ≤ 31 := dec_trivial,
      x₁ : bv 32 := x.extract 63 32 h63 h32,
      x₀ : bv 32 := x.extract 31 0  h31 h0,
      y₁ : bv 32 := y.extract 63 32 h63 h32,
      y₀ : bv 32 := y.extract 31 0  h31 h0 in
    x * y = concat (mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀) (x₀ * y₀) :=
begin
  intros _ _ _ _,
  have hi : ∀ v, extract 63 32 h63 h32 v = drop 32 v := by intros; ext ⟨_, _⟩; simp [extract, drop],
  have lo : ∀ v, extract 31 0  h31 h0  v = take 32 v := by intros; ext ⟨_, _⟩; simp [extract, take],
  rw [hi x, lo x, hi y, lo y],
  apply mul_decomp
end


-- urem can be computed using sub, mul, and udiv:
-- x % y = x - (x / y) * y
--
-- For example, arm64 doesn't have a urem instruction; one may compute urem
-- using udiv and msub (mul and sub).

theorem urem_eq_sub_mul_udiv {n : ℕ} (x y : bv n) :
  x % y = x - (x / y) * y :=
calc x % y
    = x % y + y * (x / y) - (x / y) * y : by ring
... = x - (x / y) * y : by rw urem_add_udiv
