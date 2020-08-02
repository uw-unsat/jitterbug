-- nat helpers

namespace nat

lemma eq_zero_of_lt_one {n : nat} (h : n < 1) : n = 0 :=
begin
  apply eq_zero_of_le_zero,
  apply le_of_lt_succ h,
end

theorem sub_eq_zero_of_lt {n m : ℕ} (h : n < m) : n - m = 0 :=
  by { apply sub_eq_zero_of_le (le_of_lt h) }

theorem eq_sub_of_add_eq {a b c : ℕ} (h : a + c = b) : a = b - c :=
calc
  a = a + c - c : by rw nat.add_sub_cancel
... = b - c : by rw h

theorem sub_add_eq_add_sub {a b c : ℕ} (h : a ≥ b) : a - b + c = a + c - b :=
begin
  rw ← nat.sub_add_comm h,
end

theorem sub_sub_eq_add_sub {a b c : ℕ} (h : b ≥ c) : a - (b - c) = a + c - b :=
begin
  cases (le_or_gt b (a + c)) with h1 h1,
  { have h2 : b - c ≤ a,
    { apply @nat.le_of_add_le_add_right c,
      rw [nat.sub_add_cancel h],
      assumption },
    rw nat.sub_eq_iff_eq_add h2,
    rw ← nat.add_sub_assoc h,
    rw nat.sub_add_cancel h1,
    rw nat.add_sub_cancel },
  { rw nat.sub_eq_zero_of_lt h1,
    apply nat.sub_eq_zero_of_le,
    apply @nat.le_of_add_le_add_right c,
    rw nat.sub_add_cancel h,
    apply le_of_lt h1 }
end

theorem sub_sub_eq_sub_add {a b c : ℕ} (ab : a ≥ b) (bc : b ≥ c) : a - (b - c) = a - b + c :=
begin
  rw sub_sub_eq_add_sub bc,
  rw sub_add_eq_add_sub ab
end

lemma le_add_to_sub_le {x y z : ℕ} (h : x ≤ y + z) : x - y ≤ z :=
calc
  x - y ≤ y + z - y : by { apply nat.sub_le_sub_right h }
    ... = z : by { apply nat.add_sub_cancel_left }

lemma add_lt_to_lt_sub {x y z : ℕ} (h : x + y < z) : y < z - x :=
begin
  have h1 : x ≤ z,
  { apply le_of_lt, apply lt_of_le_of_lt (nat.le_add_right x y) h },
  have h2 : y + x < z - x + x,
  { rw [add_comm, nat.sub_add_cancel h1], assumption },
  apply lt_of_add_lt_add_right h2
end

theorem le_mul_of_pos_left {n k : ℕ} (h : k > 0) : n ≤ k * n :=
calc
  n = 1 * n : by rw one_mul
... ≤ k * n : by { apply mul_le_mul_right, apply succ_le_of_lt h }

lemma mul_add_div_right (x z : ℕ) {y : ℕ} (H : y > 0) : (x * y + z) / y = x + z / y :=
calc
  (x * y + z) / y = (z + x * y) / y : by simp
              ... = z / y + x : by { apply add_mul_div_right _ _ H }
              ... = x + z / y : by simp

theorem mul_add_mod_left (k x z : ℕ) : (k * x + z) % x = z % x :=
  by simp

lemma mul_add_mod_self_right (x y z : ℕ) : (x * y + z) % y = z % y :=
  by simp

theorem pow_add_mul (b n m : ℕ) : b^(n + m) = b^n * b^m :=
begin
  intros,
  induction m with m ih,
  { simp },
  { calc
    b^(n + nat.succ m) = b^(nat.succ (n + m)) : by simp
                   ... = b^(n + m) * b : by { apply nat.pow_succ }
                   ... = b^n * b^m * b : by { rw ih }
                   ... = b^n * (b^m * b) : by { apply mul_assoc }
                   ... = b^n * b^nat.succ m : by { rw nat.pow_succ }
  }
end

theorem dvd_pow_of_le (b : ℕ) {n m : ℕ} (h : m ≤ n) : b^m ∣ b^n :=
begin
  apply nat.dvd_of_mod_eq_zero,
  calc
    b^n % b^m = b^(n - m + m) % b^m : by { rw nat.sub_add_cancel h }
          ... = b^(n - m) * b^m % b^m : by { rw pow_add_mul }
          ... = 0 : by { rw mul_mod_left }
end

lemma dvd_pow_add_left (b n m : ℕ) : b^n ∣ b^(m + n) :=
  dvd_pow_of_le b (le_add_left n m)

lemma dvd_pow_add_right (b n m : ℕ) : b^n ∣ b^(n + m) :=
  dvd_pow_of_le b (le_add_right n m)

lemma pow_pred {b n : ℕ} (h₁ : b > 0) (h₂ : n > 0) : b^(n - 1) = b^n / b :=
begin
  cases n,
  { have : ¬ 0 > 0,
    apply gt_irrefl,
    contradiction },
  { simp [nat.pow_succ],
    rw nat.mul_div_left,
    assumption }
end

theorem pow_sub_div {b n m : ℕ} (h₁ : b > 0) (h₂ : m ≤ n) : b^(n - m) = b^n / b^m :=
begin
  induction m with m ih,
  { simp },
  { calc
      b^(n - nat.succ m) = b^(n - (m + 1)) : by simp
                     ... = b^(n - m - 1) : by { rw nat.sub_sub }
                     ... = b^(n - m) / b : by { rw pow_pred h₁, apply nat.sub_pos_of_lt, apply nat.lt_of_succ_le, assumption }
                     ... = b^n / b^m / b : by { rw ih, apply le_trans, apply nat.le_succ, assumption }
                     ... = b^n / (b^m * b) : by { apply nat.div_div_eq_div_mul }
                     ... = b^n / b^nat.succ m : by { rw nat.pow_succ }
  }
end

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

theorem dvd_mod_div (x y z : ℕ) (H : z ∣ y) : (x % y) / z = x / z % (y / z):=
match exists_eq_mul_right_of_dvd H with ⟨k, hk⟩ := calc
  (x % y) / z = (x % (z * k)) / z : by rw hk
          ... = (x - z * (k * (x / (z * k)))) / z : by rw [mod_sub_div, mul_assoc]
          ... = x / z - k * (x / (z * k)) : by { rw sub_mul_div,
                                                 rw [← mul_assoc z, mul_comm (z * k)],
                                                 apply div_mul_le_self }
          ... = x / z - k * (x / z / k) : by { rw nat.div_div_eq_div_mul }
          ... = x / z % k : by { rw ← mod_sub_div }
          ... = x / z % (y / z) : by { cases eq_zero_or_pos z with hz hz,
                                       { simp [hz] },
                                       { rw nat.div_eq_of_eq_mul_right hz hk } }
end

theorem mod_div (x : ℕ) {y : ℕ} (h : y > 0) : (x % y) / y = 0 :=
begin
  apply nat.div_eq_of_lt,
  apply nat.mod_lt _ h
end

-- pow of two

lemma pow2_succ (n : ℕ) : 2^(succ n) = 2 * 2^n :=
  by simp [pow_succ, mul_comm]

lemma two_pos : 2 > 0 :=
  by { apply succ_pos 1 }

lemma pow2_pos (n : ℕ) : 2^n > 0 :=
  by { apply pos_pow_of_pos _ two_pos }

lemma pow2_succ_gt (n : ℕ) : 2^(succ n) > 1 :=
calc
  2^(succ n) > (2^0) : by { apply nat.pow_lt_pow_of_lt_right,
                            apply nat.lt_succ_self,
                            apply nat.zero_lt_succ }
         ... = 1 : by simp

@[simp]
lemma one_div_two : 1 / 2 = 0 :=
  by { apply div_eq_of_lt (lt_succ_self 1) }

@[simp]
lemma one_mod_two : 1 % 2 = 1 :=
  by { apply mod_eq_of_lt (lt_succ_self 1) }

-- bit0/bit1

lemma bit_add_bit0 (b : bool) (n m : ℕ) : bit b n + bit0 m = bit b (n + m) :=
begin
  cases b; simp [bit],
  { rw norm_num.bit0_add_bit0 },
  { rw [← norm_num.bit1_add_bit0, add_comm] }
end

lemma bit0_add_bit (b : bool) (n m : ℕ) : bit0 n + bit b m = bit b (n + m) :=
begin
  cases b; simp [bit],
  { rw norm_num.bit0_add_bit0 },
  { rw [← norm_num.bit0_add_bit1, add_comm] }
end

lemma bit_div_two (b : bool) (n : ℕ) : bit b n / 2 = n :=
begin
  cases b; simp [bit],
  { rw bit0_val,
    rw nat.mul_div_cancel_left _ two_pos },
  { rw bit1_val,
    rw add_comm,
    simp [add_mul_div_left _ _ two_pos] }
end

lemma bit_mod_two (b : bool) (n : ℕ) : bit b n % 2 = cond b 1 0 :=
begin
  cases b; simp [bit],
  { rw bit0_val,
    rw mul_mod_right },
  { rw bit1_val,
    rw add_comm,
    simp [add_mul_mod_self_left] }
end

protected lemma bit0_le {n m : ℕ} (h : n ≤ m) : bit0 n ≤ bit0 m :=
add_le_add h h

protected lemma bit1_le {n m : ℕ} (h : n ≤ m) : bit1 n ≤ bit1 m :=
succ_le_succ (add_le_add h h)

lemma bit_le (b : bool) {n m : ℕ} (h : n ≤ m) : bit b n ≤ bit b m :=
begin
  cases b; simp [bit],
  { apply nat.bit0_le h },
  { apply nat.bit1_le h }
end

lemma bit_le_bit1 (b : bool) {n m : ℕ} (h : n ≤ m) : bit b n ≤ bit1 m :=
begin
  cases b; simp [bit],
  { apply le_of_lt, apply nat.bit0_lt_bit1 h },
  { apply nat.bit1_le h }
end

lemma bit_inj {b : bool} {n m : ℕ} (h : bit b n = bit b m) : n = m :=
begin
  cases b; simp [bit] at *,
  { apply nat.bit0_inj h },
  { apply nat.bit1_inj h }
end

lemma bodd_bit0 (n : ℕ) : bodd (bit0 n) = ff :=
by rw bit0_val; simp

lemma bodd_bit1 (n : ℕ) : bodd (bit1 n) = tt :=
by rw bit1_val; simp

lemma bit1_pow2_minus_one (n : ℕ) : bit1 (2^n - 1) = 2^(succ n) - 1 :=
calc
  bit1 (2^n - 1) = 2 * (2^n - 1) + 1 : by { rw bit1_val }
             ... = 2 * 2^n - 2 + 1 : by { rw nat.mul_sub_left_distrib, simp }
             ... = 2 * 2^n - (2 - 1) : by { rw nat.sub_sub_eq_sub_add,
                                            { apply @mul_le_mul_left 1 _ 2,
                                              apply pow2_pos },
                                            { apply le_succ } }
             ... = 2^(succ n) - 1 : by { rw [pow_succ, mul_comm] }

end nat
