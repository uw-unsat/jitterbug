import tactic.basic
import tactic.linarith.frontend
import tactic.ring_exp

namespace bv.helper
open nat

lemma pow2_succ (n : ℕ) : 2^(succ n) = 2 * 2^n :=
by simp [pow_succ, mul_comm]

lemma pow2_pos (n : ℕ) : 2^n > 0 :=
pow_pos two_pos n

@[simp]
lemma bit_div_two (b : bool) (n : ℕ) : bit b n / 2 = n :=
by rw [← nat.div2_val, nat.div2_bit]

@[simp]
lemma bit_mod_two (b : bool) (n : ℕ) : bit b n % 2 = cond b 1 0 :=
by rw [nat.mod_two_of_bodd, nat.bodd_bit]

lemma int.sub_mod_self (a b : ℤ) :
  (a - b) % b = a % b :=
by simp [int.sub_mod, int.mod_self]

end bv.helper
