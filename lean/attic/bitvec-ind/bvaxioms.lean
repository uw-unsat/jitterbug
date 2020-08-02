-- Theorems for axiomatization:
-- mulhu_comm, mul_decomp, urem_of_sub_mul_udiv

import bv.lemmas

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

lemma drop_mul_concat {n : ℕ} (x₁ x₀ y₁ y₀ : bv n) :
  drop n ((concat x₁ x₀) * (concat y₁ y₀)) = mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀ :=
begin
  rw ← to_nat_inj,
  simp [mulhu, drop_hom_to_nat₂ @bv.mul_def,
        concat_to_nat, zero_extend_to_nat, add_to_nat, mul_to_nat],

  have hk : 2^n > 0 := pow2_pos _; generalize_hyp : 2^n = k at hk ⊢,
  generalize : x₀.to_nat = a₀, generalize : x₁.to_nat = a₁,
  generalize : y₀.to_nat = b₀, generalize : y₁.to_nat = b₁,
  calc
        (a₁ * k + a₀) * (b₁ * k + b₀) / k % k
      = (a₀ * b₀ + (a₀ * b₁ + a₁ * b₀ + a₁ * b₁ * k) * k) / k % k : by congr; ring
  ... = (a₀ * b₀ / k + a₀ * b₁ + a₁ * b₀ + a₁ * b₁ * k) % k : by rw add_mul_div_right _ _ hk; ring
  ... = (a₀ * b₀ / k + a₀ * b₁ + a₁ * b₀) % k : by rw add_mul_mod_self_right
end

lemma take_mul_concat {n : ℕ} (x₁ x₀ y₁ y₀ : bv n) :
  take n ((concat x₁ x₀) * (concat y₁ y₀)) = x₀ * y₀ :=
begin
  rw ← to_nat_inj,
  simp [take_hom_to_nat₂ @bv.mul_def, concat_to_nat, mul_to_nat],
  rw mul_mod,
  simp [add_mul_mod_self_right, add_comm]
end

theorem mul_decomp {n : ℕ} (x y : bv (n + n)) :
  let x₁ : bv n := drop n x,
      x₀ : bv n := take n x,
      y₁ : bv n := drop n y,
      y₀ : bv n := take n y in
    x * y = concat (mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀) (x₀ * y₀) :=
begin
  intros,
  rw ← drop_mul_concat x₁ x₀ y₁ y₀,
  rw ← take_mul_concat x₁ x₀ y₁ y₀,
  simp [concat_drop_take]
end

example (x y : bv 64) :
  let i63 : 63 < 64 := dec_trivial,
      i32 : 32 ≤ 63 := dec_trivial,
      i31 : 31 < 64 := dec_trivial,
      i0  :  0 ≤ 31 := dec_trivial,
      x₁ : bv 32 := extract i63 i32 x,
      x₀ : bv 32 := extract i31 i0  x,
      y₁ : bv 32 := extract i63 i32 y,
      y₀ : bv 32 := extract i31 i0  y in
    x * y = concat (mulhu x₀ y₀ + x₀ * y₁ + x₁ * y₀) (x₀ * y₀) :=
begin
  intros _ _ _ _,
  have hi : ∀ v, extract i63 i32 v = drop 32 v := by simp [extract_of_drop],
  have lo : ∀ v, extract i31 i0  v = take 32 v := by simp [extract_of_take],
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
calc
  x % y = x % y + y * (x / y) - (x / y) * y : by ring
    ... = x - (x / y) * y : by rw urem_add_udiv
