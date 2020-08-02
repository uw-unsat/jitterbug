-- nat helpers

import data.nat.basic
import data.num.basic
import data.num.lemmas
import data.int.modeq
import tactic.ring

namespace bv.helper
open nat

lemma pow2_succ (n : ℕ) : 2^(succ n) = 2 * 2^n :=
by simp [nat.pow_succ, mul_comm]

lemma pow2_pos (n : ℕ) : 2^n > 0 :=
pos_pow_of_pos _ two_pos

lemma pow2_succ_gt (n : ℕ) : 2^(succ n) > 1 :=
calc
  2^(succ n) > (2^0) : by { apply nat.pow_lt_pow_of_lt_right,
                            apply nat.lt_succ_self,
                            apply nat.zero_lt_succ }
         ... = 1 : by simp

lemma bit_div_two (b : bool) (n : ℕ) : bit b n / 2 = n :=
begin
  cases b; simp [bit_val],
  simp [add_comm, add_mul_div_left _ _ two_pos, div_eq_of_lt]
end

lemma bit_mod_two (b : bool) (n : ℕ) : bit b n % 2 = cond b 1 0 :=
begin
  cases b; simp [bit_val],
  simp [add_comm, add_mul_mod_self_left, mod_eq_of_lt]
end

lemma bit0_pow2 (n : ℕ): bit0 (2^n) = 2^n.succ :=
by rw [pow2_succ, bit0_val (2^n)]

lemma bit1_pow2_sub_one (n : ℕ) : bit1 (2^n - 1) = 2^n.succ - 1 :=
calc
  bit1 (2^n - 1) = 2 * (2^n - 1) + 1 : by rw bit1_val
             ... = 2^n.succ - 2 + 1 : by simp [nat.mul_sub_left_distrib, pow2_succ]
             ... = 2^n.succ - 1 : by { rw ← nat.sub_sub_assoc; try { simp },
                                       apply pow2_succ_gt }

end bv.helper
