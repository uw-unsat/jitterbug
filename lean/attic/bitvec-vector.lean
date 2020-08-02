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

-- This file uses bitvec in the Lean library, which is a vector of bools.

import data.bitvec
import data.vector
import ..natutil


namespace list

section ops

variable {α : Type}

lemma take_nil (i : ℕ) :
  take i (@nil α) = (@nil α) :=
by { induction i; simp }

lemma take_full {i : ℕ} {l : list α} (h : i ≥ length l) :
  take i l = l :=
begin
  revert i,
  induction l with hd tl ih; intros,
  { rw take_nil },
  { rw [length_cons] at h,
    have hj : exists j, i = nat.succ j,
    { existsi nat.pred i,
      rw nat.succ_pred_eq_of_pos,
      apply nat.lt_of_succ_le,
      apply le_trans (nat.le_add_left _ _) h },
    cases hj with j hj,
    subst i,
    simp,
    rw ih,
    rw nat.add_one at h,
    apply nat.le_of_succ_le_succ h }
end

lemma take_append : ∀ (i : ℕ) (l₁ l₂ : list α), take i (l₁ ++ l₂) = (take i l₁) ++ (take (i - length l₁) l₂) :=
begin
  intro,
  induction i with i ih; intros,
  { simp },
  { cases l₁ with hd tl; simp,
    rw ih,
    rw add_comm,
    rw nat.add_one,
    rw nat.succ_sub_succ_eq_sub }
end

lemma take_append_left : ∀ {i : ℕ} (l₁ l₂ : list α) (h : i ≤ length l₁), take i (l₁ ++ l₂) = take i l₁ :=
begin
  intros,
  rw take_append,
  have hsub : i - length l₁ = 0,
  { apply nat.sub_eq_zero_of_le h },
  simp [hsub]
end

lemma drop_nil (i : ℕ) :
  drop i (@nil α) = (@nil α) :=
by { induction i; simp }

lemma drop_full {i : ℕ} {l : list α} (h : i ≥ length l) :
  drop i l = nil :=
begin
  apply eq_nil_of_length_eq_zero,
  rw length_drop,
  apply nat.sub_eq_zero_of_le h
end

lemma drop_append : ∀ (i : ℕ) (l₁ l₂ : list α), drop i (l₁ ++ l₂) = (drop i l₁) ++ (drop (i - length l₁) l₂) :=
begin
  intro,
  induction i with i ih; intros,
  { simp },
  { cases l₁ with hd tl; simp,
    rw ih,
    rw add_comm,
    rw nat.add_one,
    rw nat.succ_sub_succ_eq_sub }
end

lemma drop_append_left : ∀ {i : ℕ} (l₁ l₂ : list α) (h : i ≤ length l₁), drop i (l₁ ++ l₂) = (drop i l₁) ++ l₂ :=
begin
  intros,
  rw drop_append,
  have hsub : i - length l₁ = 0,
  { apply nat.sub_eq_zero_of_le h },
  simp [hsub]
end

lemma take_drop_cancel : ∀ (i : ℕ) (l : list α), take i l ++ drop i l = l :=
begin
  intro,
  induction i with i ih; intros,
  { simp },
  { cases l; simp,
    apply ih }
end

end ops

section accumr₂

variables {α β γ φ σ : Type}

lemma map_accumr₂_append :
  ∀ (f : α → β → σ → σ × φ)
    {x₁ x₂ : list α}
    {y₁ y₂ : list β}
    {n₁ n₂ : ℕ}
    (hx₁ : length x₁ = n₁) (hy₁ : length y₁ = n₁)
    (hx₂ : length x₂ = n₂) (hy₂ : length y₂ = n₂)
    (c : σ),
  map_accumr₂ f (x₁ ++ x₂) (y₁ ++ y₂) c =
  let r := map_accumr₂ f x₂ y₂ c,
      q := map_accumr₂ f x₁ y₁ r.1 in
    (q.1, q.2 ++ r.2) :=
begin
  intros,
  simp,
  revert x₁ x₂ y₁ y₂ n₂ hx₁ hy₁ hx₂ hy₂ c,
  induction n₁ with n₁ ih; intros,
  { have : x₁ = [], { apply eq_nil_of_length_eq_zero hx₁ }, subst x₁,
    have : y₁ = [], { apply eq_nil_of_length_eq_zero hy₁ }, subst y₁,
    simp [map_accumr₂] },
  { cases x₁ with a x₁, { contradiction },
    cases y₁ with b y₁, { contradiction },
    rw [nat.succ_eq_add_one, length_cons] at *,
    have hx₁ : length x₁ = n₁, { apply add_right_cancel hx₁ },
    have hy₁ : length y₁ = n₁, { apply add_right_cancel hy₁ },
    rw cons_append a,
    rw cons_append b,
    simp [map_accumr₂],
    rw (ih hx₁ hy₁ hx₂ hy₂) }
end

end accumr₂

end list


namespace vector

section ops

variable {α : Type}
variable {n : ℕ}

lemma eq_of_append {n m : ℕ} {x₁ y₁ : vector α n} {x₂ y₂ : vector α m} (h₁ : x₁ = y₁) (h₂ : x₂ = y₂) :
  vector.append x₁ x₂ = vector.append y₁ y₂ := by { simp [h₁, h₂] }

def cong {a b : ℕ} (h : a = b) : vector α a → vector α b
| ⟨x, p⟩ := ⟨x, h ▸ p⟩

lemma append_nil (x : vector α n) (y : vector α 0) : vector.append x y = x :=
begin
  cases x with x hx,
  cases y with y hy,
  apply vector.eq,
  have : y = list.nil,
  apply list.eq_nil_of_length_eq_zero hy,
  subst y,
  simp
end

lemma append_assoc {a b c : ℕ} (x : vector α a) (y : vector α b) (z : vector α c) :
  vector.append x (vector.append y z) = cong (add_assoc a b c) (vector.append (vector.append x y) z) :=
begin
  cases x with x hx,
  cases y with y hy,
  cases z with z hz,
  simp [append, cong]
end

theorem append_succ (v : vector α (nat.succ n)) :
∃ (xs : vector α n) (x : α),
v = vector.append xs (x :: nil) :=
begin
  existsi vector.remove_nth (fin.mk n (nat.lt_succ_self n)) v,
  existsi vector.nth v (fin.mk n (nat.lt_succ_self n)),
  cases v with v hv,
  apply vector.eq,
  simp [vector.nth, vector.remove_nth],
  revert n,
  induction v with hd tl ih; intros,
  { contradiction },
  { have htl : list.length tl = n,
    { rw list.length_cons at hv,
      rw nat.succ_eq_add_one at hv,
      apply nat.add_right_cancel hv,
    },
    cases n; simp [list.remove_nth],
    { have : tl = [],
      { apply list.eq_nil_of_length_eq_zero htl },
      subst tl,
      simp },
    { apply ih htl } }
end

lemma rev_induction {C : Π {m : ℕ}, vector α m → Prop} (v : vector α n)
    (hz : ∀ (v : vector α 0), C v)
    (hi : ∀ {m : ℕ} (v : vector α m) (a : α), C v → C (append v (a :: nil))) : C v :=
begin
  induction n with n ih,
  { apply hz },
  { have h : exists xs x, v = append xs (x::nil), by apply append_succ,
    cases h with xs h,
    cases h with x h,
    rw h,
    apply hi,
    apply ih }
end

theorem take_nil (i : ℕ) :
  take i nil = cong (eq.symm (nat.min_zero i)) (@nil α) :=
begin
  apply vector.eq,
  simp [list.take_nil],
  refl
end

theorem take_full {i : ℕ} (h : i ≥ n) (v : vector α n) :
  take i v = cong (eq.symm (min_eq_right h)) v :=
begin
  cases v with l hl,
  apply vector.eq,
  simp [take, cong],
  subst hl,
  apply list.take_full h
end

lemma min3 (i n m : ℕ) : min i n + min (i - n) m = min i (n + m) :=
begin
  cases (le_or_gt i n) with h1 h1,
  { rw min_eq_left h1,
    rw min_eq_left (le_trans h1 (nat.le_add_right _ _)),
    have hsub : i - n = 0,
    { rw nat.sub_eq_zero_iff_le, assumption },
    simp [hsub] },
  { rw min_eq_right_of_lt h1,
    cases (le_or_gt i (n + m)) with h2 h2,
    { rw min_eq_left h2,
      rw min_eq_left (nat.le_add_to_sub_le h2),
      rw nat.add_sub_of_le (le_of_lt h1) },
    { rw min_eq_right_of_lt h2,
      rw min_eq_right_of_lt (nat.add_lt_to_lt_sub h2) } }
end

theorem take_append {m : ℕ} (i : ℕ) (x : vector α n) (y : vector α m) :
  take i (append x y) = cong (min3 i n m) (append (take i x) (take (i - n) y)) :=
begin
  apply vector.eq,
  cases x with x hx,
  cases y with y hy,
  simp [append, take, cong],
  subst n,
  apply list.take_append
end

lemma min3_left {i : ℕ} (h : i ≤ n) (m : ℕ) : min i n = min i (n + m) :=
begin
  rw min_eq_left h,
  have hnm : i ≤ n + m,
  { apply le_trans h (nat.le_add_right _ _) },
  rw min_eq_left hnm
end

theorem take_append_left {i m : ℕ} (h : i ≤ n) (x : vector α n) (y : vector α m) :
  take i (append x y) = cong (min3_left h m) (take i x) :=
begin
  apply vector.eq,
  cases x,
  cases y,
  simp [append, take, cong],
  subst n,
  apply list.take_append_left _ _ h
end

theorem drop_nil (i : ℕ) :
  drop i nil = cong (eq.symm (nat.zero_sub i)) (@nil α) :=
begin
  apply vector.eq,
  simp [list.drop_nil],
  refl
end

theorem drop_full {i : ℕ} (h : i ≥ n) (v : vector α n) :
  drop i v = cong (eq.symm (nat.sub_eq_zero_of_le h)) nil :=
begin
  cases v with l hl,
  apply vector.eq,
  simp [drop, cong],
  subst hl,
  apply list.drop_full h
end

lemma drop3 (i n m : ℕ) : n - i + (m - (i - n)) = n + m - i :=
begin
  cases (le_or_gt i n) with h1 h1,
  { simp [nat.sub_eq_zero_of_le h1],
    rw ← nat.add_sub_assoc h1,
    simp },
  { simp [nat.sub_eq_zero_of_lt h1],
    rw nat.sub_sub_eq_add_sub (le_of_lt h1),
    simp }
end

theorem drop_append {m : ℕ} (i : ℕ) (x : vector α n) (y : vector α m) :
  drop i (append x y) = cong (drop3 i n m) (append (drop i x) (drop (i - n) y)) :=
begin
  apply vector.eq,
  cases x with x hx,
  cases y with y hy,
  simp [append, drop, cong],
  subst n,
  apply list.drop_append
end

theorem drop_append_left {m i : ℕ} (h : i ≤ n) (x : vector α n) (y : vector α m) :
  drop i (append x y) = cong (eq.symm (nat.sub_add_comm h)) (append (drop i x) y) :=
begin
  apply vector.eq,
  cases x with x hx,
  cases y with y hy,
  simp [append, drop, cong],
  subst n,
  apply list.drop_append_left _ _ h
end

end ops

section accumr₂

variables {α β γ φ σ : Type}

lemma map_accumr₂_zero (f : α → β → σ → σ × φ) (x : vector α 0) (y : vector β 0) (c : σ) :
  map_accumr₂ f x y c = (c, nil) :=
begin
  cases x with x hx,
  cases y with y hy,
  have : x = [], { apply list.eq_nil_of_length_eq_zero hx }, subst x,
  have : y = [], { apply list.eq_nil_of_length_eq_zero hy }, subst y,
  refl
end

lemma map_accumr₂_append :
  ∀ (f : α → β → σ → σ × φ)
    {n₁ n₂ : ℕ}
    (x₁ : vector α n₁) (x₂ : vector α n₂)
    (y₁ : vector β n₁) (y₂ : vector β n₂)
    (c : σ),
  map_accumr₂ f (append x₁ x₂) (append y₁ y₂) c =
  let r := map_accumr₂ f x₂ y₂ c,
      q := map_accumr₂ f x₁ y₁ r.1 in
    (q.1, append q.2 r.2) :=
begin
  intros,
  cases x₁ with x₁ hx₁,
  cases x₂ with x₂ hx₂,
  cases y₁ with y₁ hy₁,
  cases y₂ with y₂ hy₂,
  simp [append, map_accumr₂],

  have h : forall {α β : Type} (x y : prod α β) (h1 : x.1 = y.1) (h2 : x.2 = y.2), x = y,
  { intros, cases x, cases y,
    simp at *,
    congr; assumption },
  apply h; simp; clear h,
  { rw list.map_accumr₂_append f hx₁ hy₁ hx₂ hy₂ },
  { congr, rw list.map_accumr₂_append f hx₁ hy₁ hx₂ hy₂ }
end

end accumr₂

end vector


namespace bitvec
open vector

section conversion

lemma two_pos : 2 > 0 :=
  by { apply nat.succ_pos 1 }

lemma to_nat_ff : bitvec.to_nat (ff::nil) = 0 :=
  by simp [bits_to_nat_to_list, bits_to_nat, add_lsb]

lemma to_nat_tt : bitvec.to_nat (tt::nil) = 1 :=
  by simp [bits_to_nat_to_list, bits_to_nat, add_lsb]

lemma to_nat_lt_two (b : bool) : bitvec.to_nat (b::nil) < 2 :=
begin
  cases b; simp [to_nat_ff, to_nat_tt],
  { apply two_pos },
  { apply nat.lt_succ_self }
end

lemma to_nat_div_two (b : bool) : bitvec.to_nat (b::nil) / 2 = 0 :=
  nat.div_eq_of_lt (to_nat_lt_two b)

lemma to_nat_mod_two (b : bool) : bitvec.to_nat (b::nil) % 2 = bitvec.to_nat (b::nil) :=
  nat.mod_eq_of_lt (to_nat_lt_two b)

lemma eq_of_to_nat_bool : ∀ (b1 b2 : bool), bitvec.to_nat (b1::nil) = bitvec.to_nat (b2::nil) → b1 = b2 :=
begin
  intros,
  cases b1; cases b2; simp [to_nat_ff, to_nat_tt] at *; assumption
end

lemma even_ne_odd (n m : ℕ) : n * 2 ≠ 1 + m * 2 :=
begin
  intros,
  rw [add_comm, mul_comm n, mul_comm m],
  rw [← nat.bit1_val, ← nat.bit0_val],
  apply nat.bit0_ne_bit1
end

lemma odd_ne_even (n m : ℕ) : 1 + n * 2 ≠ m * 2 :=
begin
  intros,
  apply ne.symm,
  apply even_ne_odd
end

theorem eq_of_to_nat {n : ℕ} : ∀ (x y : bitvec n), x.to_nat = y.to_nat → x = y :=
begin
  induction n with n ih; intros,
  { simp [vector.eq_nil x, vector.eq_nil y] },
  { have hx : exists xs b, x = vector.append xs (b::nil),
    { apply append_succ },
    cases hx with v1 hx,
    cases hx with b1,
    subst x,

    have hy : exists ys b, y = vector.append ys (b::nil),
    { apply append_succ },
    cases hy with v2 hy,
    cases hy with b2 _,
    subst y,

    repeat { rw to_nat_append at * },

    have : v1 = v2,
    { apply ih,

      cases b1; cases b2; simp [to_nat_ff, to_nat_tt] at *,
      { apply nat.eq_of_mul_eq_mul_right two_pos; assumption },
      { have : false,
        apply even_ne_odd; assumption,
        contradiction },
      { have : false,
        apply odd_ne_even; assumption,
        contradiction },
      { apply nat.eq_of_mul_eq_mul_right two_pos,
        apply add_left_cancel; assumption } },
    subst v2,

    have : b1 = b2,
    { apply eq_of_to_nat_bool b1 b2,
      apply add_left_cancel; assumption },
    subst b2 }
end

theorem to_nat_zero (x : bitvec 0) : x.to_nat = 0 :=
begin
  cases x with x hx,
  have : x = [],
  { apply list.eq_nil_of_length_eq_zero; assumption },
  subst x,
  refl
end

theorem to_nat_le {n : ℕ}
: ∀ (x : bitvec n), x.to_nat ≤ 2^n - 1 :=
begin
  induction n with n ih; intros,
  { simp [to_nat_zero] },
  { have hx : exists xs b, x = vector.append xs (b::nil),
    { apply append_succ },
    cases hx with v hx,
    cases hx with b,
    subst x,
    rw to_nat_append,
    rw nat.pow_succ,
    cases b; simp [to_nat_ff, to_nat_tt],
    { calc
        bitvec.to_nat v * 2 ≤ (2^n - 1) * 2 : by { apply nat.mul_le_mul_right, apply ih }
                        ... = 2^n * 2 - 2 : by { apply nat.mul_sub_right_distrib }
                        ... ≤ 2^n * 2 - 1 : by { apply nat.sub_le_sub_left, apply nat.le_succ }
    },
    { calc
        1 + bitvec.to_nat v * 2 ≤ 1 + (2^n - 1) * 2 : by { apply nat.add_le_add_left,
                                                           apply nat.mul_le_mul_right,
                                                           apply ih }
                            ... = 2^n * 2 - 2 + 1 : by { rw nat.mul_sub_right_distrib,
                                                         simp }
                            ... = 2^n * 2 - 1 : by { rw ← nat.sub_sub_eq_sub_add,
                                                     { apply nat.le_mul_of_pos_left,
                                                       apply nat.pos_pow_of_pos _ two_pos },
                                                     { apply nat.le_succ } }
    } }
end

theorem to_nat_lt {n : ℕ} (x : bitvec n) : x.to_nat < 2^n :=
begin
  apply lt_of_le_of_lt (to_nat_le x),
  apply nat.sub_lt _ nat.one_pos,
  apply nat.pos_pow_of_pos _ two_pos
end

theorem of_nat_to_nat {n : ℕ} (x : bitvec n)
: bitvec.of_nat n (bitvec.to_nat x) = x :=
begin
  apply eq_of_to_nat,
  rw to_nat_of_nat,
  apply nat.mod_eq_of_lt,
  apply to_nat_lt
end

theorem to_nat_cong {n m : ℕ} (h : n = m) (x : bitvec n) :
  bitvec.to_nat (vector.cong h x) = bitvec.to_nat x :=
begin
  cases x with x hx,
  refl
end

end conversion

lemma repeat_succ {α : Type}:
  ∀ (a : α) (n : ℕ), vector.repeat a (nat.succ n) = vector.append (repeat a n) (a :: nil) :=
begin
  intros,
  apply vector.eq,
  simp [vector.repeat],
  induction n; simp; assumption
end

lemma zero_of_nat {n : ℕ}: 0 = bitvec.of_nat n 0 :=
begin
  unfold has_zero.zero,
  induction n with n ih,
  { refl },
  { simp [bitvec.zero, repeat_succ, of_nat_succ] at *,
    rw ih }
end

lemma one_of_nat {n : ℕ}: 1 = bitvec.of_nat n 1 :=
begin
  unfold has_one.one,
  induction n with n ih,
  { refl },
  { simp [bitvec.one, repeat_succ, of_nat_succ],
    have h : 1 < 2,
    { apply nat.lt_succ_self },
    rw <- zero_of_nat,
    refl }
end

section add

variable {n : ℕ}

lemma adc_head_tail (x y : bitvec n) (c : bool) :
  adc x y c = let r := map_accumr₂ (λ x y c, (bitvec.carry x y c, bitvec.xor3 x y c)) x y c in r.1 :: r.2 :=
begin
  simp [adc],
  cases h : map_accumr₂ _ x y c,
  refl
end

def adc_zero (x y : bitvec 0) (c : bool) :
  adc x y c = c :: nil :=
begin
  rw adc_head_tail,
  simp [map_accumr₂_zero]
end

lemma adc_append : ∀ {n m : ℕ} (x₁ : bitvec n) (x₂ : bitvec m) (y₁ : bitvec n) (y₂ : bitvec m) (c : bool),
  adc (vector.append x₁ x₂) (vector.append y₁ y₂) c =
  let r := adc x₂ y₂ c,
      q := adc x₁ y₁ (head r) in
    head q :: vector.append (tail q) (tail r) :=
begin
  intros,
  repeat { rw adc_head_tail; simp },
  simp [head_cons, tail_cons],
  rw vector.map_accumr₂_append
end

lemma adc_to_nat : ∀ (x y : bitvec n) (c : bool),
  tail (adc x y c) = bitvec.of_nat n (x.to_nat + y.to_nat + cond c 1 0) :=
begin
  induction n with n ih; intros,
  { rw adc_zero,
    refl },
  { have hx : exists xs b, x = vector.append xs (b::nil),
    { apply append_succ },
    cases hx with v1 hx,
    cases hx with b1,
    subst x,

    have hy : exists xs b, y = vector.append xs (b::nil),
    { apply append_succ },
    cases hy with v2 hy,
    cases hy with b2,
    subst y,

    rw adc_append,
    simp,
    rw ih,
    simp,
    simp [head_cons, tail_cons],
    simp [of_nat_succ, to_nat_append],

    have h : ∀ (a b x y : ℕ), a + (x * 2 + (y * 2 + b)) = a + b + (x + y) * 2,
    { intros, simp [right_distrib] },
    rw h, clear h,
    apply vector.eq_of_append,
    { rw nat.add_mul_div_right _ _ two_pos,
      simp,
      congr,
      cases b1; cases b2; cases c; refl },
    { rw nat.add_mul_mod_self_right,
      cases b1; cases b2; cases c; refl } }
end

end add

namespace bv

section ops

variable {n : ℕ}

def add (x y : bitvec n) := bitvec.of_nat n (x.to_nat + y.to_nat)

instance : has_add (bitvec n) := ⟨bv.add⟩

lemma add_of_nat (x y : bitvec n) : x + y = bitvec.of_nat n (x.to_nat + y.to_nat) := rfl

lemma add_of_nat_bits (x y : bitvec n) : x + y = bitvec.add x y :=
begin
  intros,
  simp [add_of_nat],
  unfold bitvec.add,
  rw adc_to_nat,
  refl
end

protected lemma add_comm (a b : bitvec n) : a + b = b + a :=
  by { simp [add_of_nat] }

protected lemma add_zero : ∀ a : bitvec n, a + 0 = a :=
begin
  intros,
  apply eq_of_to_nat,
  simp [add_of_nat, zero_of_nat],
  simp [to_nat_of_nat],
  apply nat.mod_eq_of_lt (to_nat_lt _)
end

protected lemma zero_add (a : bitvec n) : 0 + a = a :=
bv.add_comm a 0 ▸ bv.add_zero a

protected lemma add_assoc : ∀ a b c : bitvec n, a + b + c = a + (b + c) :=
begin
  intros,
  apply eq_of_to_nat,
  simp [add_of_nat],
  simp [to_nat_of_nat],
  simp [nat.add_mod_self_right]
end

protected def mul (x y : bitvec n) : bitvec n := bitvec.of_nat n (x.to_nat * y.to_nat)

instance : has_mul (bitvec n) := ⟨bv.mul⟩

lemma mul_of_nat (x y : bitvec n) : x * y = bitvec.of_nat n (x.to_nat * y.to_nat) := rfl

protected lemma mul_comm (a b : bitvec n) : a * b = b * a :=
by { simp [mul_of_nat, mul_comm] }

protected lemma mul_one : ∀ (a : bitvec n), a * 1 = a :=
begin
  intros,
  apply eq_of_to_nat,
  simp [mul_of_nat, one_of_nat],
  simp [to_nat_of_nat],
  cases n,
  { simp [to_nat_zero] },
  { rw (@nat.mod_eq_of_lt 1),
    { simp,
      apply nat.mod_eq_of_lt (to_nat_lt _) },
    { calc
        1 = 2^0 : by simp
      ... < 2^(nat.succ n) : by { apply nat.pow_lt_pow_of_lt_right, apply nat.lt_succ_self, apply nat.zero_lt_succ }
    } }
end

protected lemma one_mul (a : bitvec n) : 1 * a = a :=
bv.mul_comm a 1 ▸ bv.mul_one a

protected lemma mul_assoc : ∀ a b c : (bitvec n), a * b * c = a * (b * c) :=
begin
  intros,
  apply eq_of_to_nat,
  simp [mul_of_nat],
  simp [to_nat_of_nat],
  simp [nat.mul_mod_self_left, nat.mul_mod_self_right, mul_assoc]
end

protected lemma distrib_left : ∀ a b c : (bitvec n), a * (b + c) = a * b + a * c :=
begin
  intros,
  apply eq_of_to_nat,
  simp [add_of_nat, mul_of_nat],
  simp [to_nat_of_nat],
  simp [nat.mul_mod_self_right, nat.left_distrib],
  rw nat.add_mod
end

protected lemma distrib_right (a b c : bitvec n) : (a + b) * c = a * c + b * c :=
begin
  rw [bv.mul_comm, bv.distrib_left],
  simp [bv.mul_comm]
end

protected def neg (x : bitvec n) : bitvec n := bitvec.of_nat n (2^n - x.to_nat)

instance : has_neg (bitvec n)  := ⟨bv.neg⟩

lemma neg_of_nat (x : bitvec n) : -x = bitvec.of_nat n (2^n - x.to_nat) := rfl

protected lemma add_left_neg : ∀ a : (bitvec n), -a + a = 0 :=
begin
  intros,
  apply eq_of_to_nat,
  simp [neg_of_nat, add_of_nat, zero_of_nat],
  simp [to_nat_of_nat],
  rw nat.add_mod_self_right,
  rw ← nat.add_sub_assoc,
  { rw ← nat.sub_add_eq_add_sub,
    { simp [nat.sub_self] },
    { apply le_refl } },
  { apply le_of_lt,
    apply to_nat_lt }
end

instance : comm_ring (bitvec n) :=
{ add            := bv.add,
  add_assoc      := bv.add_assoc,
  zero           := 0,
  zero_add       := bv.zero_add,
  add_zero       := bv.add_zero,
  neg            := bv.neg,
  add_left_neg   := bv.add_left_neg,
  add_comm       := bv.add_comm,
  mul            := bv.mul,
  mul_assoc      := bv.mul_assoc,
  one            := 1,
  one_mul        := bv.one_mul,
  mul_one        := bv.mul_one,
  left_distrib   := bv.distrib_left,
  right_distrib  := bv.distrib_right,
  mul_comm       := bv.mul_comm }

-- Don't use nat.sub, where x - y is defined to be 0 if x < y
protected def sub (x y : bitvec n) : bitvec n := bv.add x (bv.neg y)

instance : has_sub (bitvec n)  := ⟨bv.sub⟩

lemma sub_of_nat (x y : bitvec n) : x - y = bitvec.of_nat n (x.to_nat + (2^n - y.to_nat)) :=
begin
  simp [bv.sub],
  simp [add_of_nat, neg_of_nat],
  simp [to_nat_of_nat],
  apply eq_of_to_nat,
  simp [to_nat_of_nat],
  rw nat.add_mod_self_right
end

-- x % 0 = -1 (be careful: nat.div produces 0 in this case)
protected def udiv (x y : bitvec n) : bitvec n := bitvec.of_nat n (if y.to_nat = 0 then 2^n - 1 else (x.to_nat / y.to_nat))

-- x % 0 = x (nat.mod has the same behavior)
protected def urem (x y : bitvec n) : bitvec n := bitvec.of_nat n (x.to_nat % y.to_nat)

lemma to_nat_append_lt {m : ℕ} (x : bitvec n) (y : bitvec m) :
  y.to_nat + x.to_nat * 2^m < 2^(n + m) :=
calc
  y.to_nat + x.to_nat * 2^m ≤ y.to_nat + (2^n - 1) * 2^m : by { apply nat.add_le_add_left, apply nat.mul_le_mul_right, apply to_nat_le }
                        ... < 2^m + (2^n - 1) * 2^m : by { apply nat.add_lt_add_right (to_nat_lt _) }
                        ... = 2^m + (2^n * 2^m - 2^m) : by { simp [nat.mul_sub_right_distrib] }
                        ... = 2^n * 2^m : by { rw nat.add_sub_of_le, apply nat.le_mul_of_pos_left, apply nat.pos_pow_of_pos _ two_pos }
                        ... = 2^(n + m) : by { rw [nat.pow_add_mul] }

lemma append_of_nat {m : ℕ} (x : bitvec n) (y : bitvec m) :
  vector.append x y = bitvec.of_nat (n + m) (x.to_nat * 2^m + y.to_nat) :=
begin
  apply eq_of_to_nat,
  simp [to_nat_of_nat],

  rw nat.mod_eq_of_lt (to_nat_append_lt _ _),

  revert n x,
  induction m with m ih; intros,

  { simp [to_nat_zero, append_nil] },

  { have hy : exists ys b, y = vector.append ys (b::nil),
    { apply append_succ },
    cases hy with v hy,
    cases hy with b,
    subst y,

    rw append_assoc,
    simp [to_nat_cong, to_nat_append],
    rw ih,
    simp [nat.pow_succ],

    generalize : bitvec.to_nat (b :: nil) = s,
    generalize : bitvec.to_nat v = t,
    generalize : bitvec.to_nat x = u,
    simp [nat.pow_succ],
    rw [right_distrib, mul_assoc] }
end

def zext {m : ℕ} (h : n ≤ m) (x : bitvec n) : bitvec m :=
  vector.cong (nat.sub_add_cancel h) (vector.append 0 x)

lemma zext_of_nat {m : ℕ} (h : n ≤ m) (x : bitvec n) :
  zext h x = bitvec.of_nat m x.to_nat :=
begin
  unfold zext,
  apply eq_of_to_nat,
  simp [append_of_nat, zero_of_nat],
  simp [to_nat_of_nat, to_nat_cong],
  rw [nat.add_sub_of_le h]
end

def concat {m : ℕ} (x : bitvec n) (y : bitvec m) : bitvec (n + m) := vector.append x y

lemma concat_of_nat {m : ℕ} (x : bitvec n) (y : bitvec m) :
  concat x y = bitvec.of_nat (n + m) (x.to_nat * 2^m + y.to_nat) :=
append_of_nat x y

-- specialized version of extract

def extract_hi {m : ℕ} (h : m ≤ n) (x : bitvec n) : bitvec m :=
  cong (min_eq_left h) (take m x)

lemma extract_hi_of_nat {m : ℕ} (h : m ≤ n) (x : bitvec n) :
  extract_hi h x = bitvec.of_nat m (x.to_nat / 2^(n - m)) :=
begin
  unfold extract_hi,

  apply eq_of_to_nat,
  simp [to_nat_of_nat, to_nat_cong],

  have hrange : x.to_nat / 2^(n - m) < 2^m,
  { rw nat.div_lt_iff_lt_mul _ _ (nat.pos_pow_of_pos _ two_pos),
    rw ← nat.pow_add_mul,
    rw nat.add_sub_of_le h,
    apply to_nat_lt },
  rw nat.mod_eq_of_lt hrange,
  clear hrange,

  revert m x,
  induction n with n ih; intros,
  { have : m = 0,
    { apply nat.eq_zero_of_le_zero h },
    subst m,
    simp [to_nat_zero] },
  { cases lt_or_eq_of_le h with hlt,
    { have hx : exists xs b, x = vector.append xs (b::nil),
      { apply append_succ },
      cases hx with v hx,
      cases hx with b,
      subst x,

      have hle : m ≤ n,
      { apply nat.le_of_lt_succ hlt },

      rw take_append_left hle,
      simp [to_nat_cong, to_nat_append],
      rw ih _ hle,

      have heq : nat.succ n - m = n - m + 1,
      { rw nat.succ_eq_add_one,
        rw nat.sub_add_eq_add_sub hle },
      simp [heq],
      simp [nat.pow_add_mul],
      rw ← nat.div_div_eq_div_mul,
      rw nat.mul_add_div_right _ _ two_pos,
      simp [to_nat_div_two]
    },
    { subst m,
      rw take_full h,
      simp [nat.sub_self, to_nat_cong] } }
end

def extract_lo {m : ℕ} (h : m ≤ n) (x : bitvec n) : bitvec m :=
  vector.cong (nat.sub_sub_self h) (vector.drop (n - m) x)

lemma extract_lo_of_nat {m : ℕ} (h : m ≤ n) (x : bitvec n) :
  extract_lo h x = bitvec.of_nat m (x.to_nat) :=
begin
  unfold extract_lo,

  apply eq_of_to_nat,
  simp [to_nat_of_nat, to_nat_cong],

  revert m x,
  induction n with n ih; intros,

  { have : m = 0,
    { apply nat.eq_zero_of_le_zero h },
    subst m,
    simp [to_nat_zero] },

  { cases m,
    { rw drop_full,
      { simp [to_nat_cong, to_nat_zero] },
      { apply le_refl } },
    { rw nat.succ_sub_succ_eq_sub,

      have hx : exists xs b, x = vector.append xs (b::nil),
      { apply append_succ },
      cases hx with v hx,
      cases hx with b,
      subst x,

      rw drop_append_left (nat.sub_le _ _),
      simp [to_nat_cong],
      simp [to_nat_append],

      have hle : m ≤ n,
      { apply nat.le_of_succ_le_succ h },
      rw ih _ hle,

      rw nat.mod_pow_succ two_pos,
      rw nat.mul_add_div_right _ _ two_pos,
      rw nat.mul_add_mod_left,
      simp [to_nat_div_two, to_nat_mod_two, mul_comm] } }
end

theorem concat_extract {n m : ℕ} (x : bitvec (n + m)) :
  concat (extract_hi (nat.le_add_right n m) x) (extract_lo (nat.le_add_left m n) x) = x :=
begin
  cases x,
  apply vector.eq,
  simp [concat, extract_hi, extract_lo, take, drop, cong],
  rw nat.add_sub_cancel,
  apply list.take_drop_cancel
end

-- extract and mul

lemma extract_lo_mul_of_nat {n m : ℕ} (h : m ≤ n) (x y : bitvec n) :
  extract_lo h (x * y) = bitvec.of_nat m (x.to_nat * y.to_nat) :=
begin
  apply eq_of_to_nat,
  simp [extract_lo_of_nat, mul_of_nat],
  simp [to_nat_of_nat],
  rw nat.dvd_mod_mod,
  apply nat.dvd_pow_of_le _ h,
end

lemma extract_hi_mul_of_nat {n m : ℕ} (h : m ≤ n) (x y : bitvec n) :
  extract_hi h (x * y) = bitvec.of_nat m (x.to_nat * y.to_nat / (2^(n - m))) :=
begin
  apply eq_of_to_nat,
  simp [extract_hi_of_nat, mul_of_nat],
  simp [to_nat_of_nat],
  generalize : x.to_nat * y.to_nat = a,
  calc
    a % 2^n / 2^(n - m) % 2^m = (a - 2^n * (a / 2^n)) / 2^(n - m) % 2^m : by { simp [nat.mod_sub_div] }
                          ... = (a - 2^(n - m + m) * (a / 2^n)) / 2^(n - m) % 2^m : by { rw nat.sub_add_cancel h }
                          ... = (a - 2^(n - m) * (2^m * (a / 2^n))) / 2^(n - m) % 2^m : by { rw [nat.pow_add_mul], rw mul_assoc }
                          ... = (a / 2^(n - m) - 2^m * (a / 2^n)) % 2^m : by { rw nat.sub_mul_div,
                                                                               rw [← mul_assoc, ← nat.pow_add_mul],
                                                                               rw nat.sub_add_cancel h,
                                                                               rw mul_comm,
                                                                               apply nat.div_mul_le_self }
                          ... = a / 2^(n - m) % 2^m : by { apply nat.sub_mul_mod,
                                                           rw mul_comm,
                                                           rw ← nat.le_div_iff_mul_le _ _ (nat.pos_pow_of_pos _ two_pos),
                                                           rw nat.div_div_eq_div_mul,
                                                           rw ← nat.pow_add_mul,
                                                           rw nat.sub_add_cancel h }
end

end ops

end bv

end bitvec


-- theorems

open bitvec
open bitvec.bv


-- bvmulhu

lemma le_add_self (n : ℕ): n ≤ n + n :=
  nat.le_add_right n n

def bvmulhu {n : ℕ} (x y : bitvec n) : bitvec n :=
  let h := le_add_self n in
  extract_hi h ((zext h x) * (zext h y)).

theorem bvmulhu_comm {n : ℕ} (x y : bitvec n) : bvmulhu x y = bvmulhu y x :=
by { simp [bvmulhu, mul_comm] }


-- lower bits

lemma extract_lo_mul_concat {n m : ℕ} (x₁ : bitvec m) (x₀ : bitvec n) (y₁ : bitvec m) (y₀ : bitvec n) :
extract_lo (nat.le_add_left n m) ((concat x₁ x₀) * (concat y₁ y₀)) = x₀ * y₀ :=
begin
  apply eq_of_to_nat,
  simp [concat_of_nat, extract_lo_of_nat, mul_of_nat],
  simp [to_nat_of_nat],
  rw ← nat.mul_mod,
  rw nat.dvd_mod_mod,
  { rw nat.mul_mod,
    simp [nat.add_mul_mod_self_right],
    rw ← nat.mul_mod },
  { apply nat.dvd_pow_add_right }
end


-- upper bits

lemma extract_hi_mul_concat {n : ℕ} (x₁ x₀ y₁ y₀ : bitvec n) :
  extract_hi (le_add_self n) ((concat x₁ x₀) * (concat y₁ y₀)) = bvmulhu x₀ y₀ + (x₀ * y₁ + x₁ * y₀) :=
begin
  apply eq_of_to_nat,

  simp [bvmulhu],
  -- rewrite extract_hi of mul before other operations
  simp [extract_hi_mul_of_nat],
  simp [zext_of_nat, concat_of_nat],
  simp [to_nat_of_nat, nat.add_sub_cancel],

  have hlt : forall (x : bitvec n), x.to_nat < 2^(n + n),
  { intros,
    apply lt_of_lt_of_le (to_nat_lt _),
    apply nat.pow_le_pow_of_le_right two_pos,
    apply le_add_self },
  repeat { rw nat.mod_eq_of_lt (hlt _) },
  clear hlt,

  repeat { rw nat.mod_eq_of_lt (to_nat_append_lt _ _) },

  simp [left_distrib, right_distrib],
  have heq : forall (a b c d e f k : ℕ),
    a * (b * k) + (c * k * d + e * k * f) = k * (a * b + c * d + e * f),
  { intros,
    calc
      a * (b * k) + (c * k * d + e * k * f) = k * (a * b) + c * k * d + e * k * f : by { rw ← mul_assoc a b k, simp [mul_comm] }
                                        ... = k * (a * b) + k * c * d + k * e * f : by { simp [mul_comm] }
                                        ... = k * (a * b) + k * (c * d) + k * (e * f) : by { simp [mul_assoc] }
                                        ... = k * (a * b + c * d + e * f) : by { simp [left_distrib] }
   },
  rw heq,
  clear heq,
  rw nat.add_mul_div_left _ _ (nat.pos_pow_of_pos _ two_pos),

  have heq2 : forall (a b c d e k : ℕ),
    a + (b + c + d * (e * k)) = a + b + c + d * e * k,
  { intros, simp [mul_assoc] },
  rw heq2,
  clear heq2,
  rw nat.add_mul_mod_self_right,

  simp [add_of_nat, mul_of_nat],
  simp [to_nat_of_nat],

  -- rewrite the inner one first
  rw ← nat.add_mod (x₀.to_nat * y₁.to_nat),
  -- rwrite the outer one next
  rw ← nat.add_mod
end


-- combine upper and lower bits

theorem bvmul_decomp_concat {n : ℕ} (x₁ x₀ y₁ y₀ : bitvec n) :
  (concat x₁ x₀) * (concat y₁ y₀) = concat ((bvmulhu x₀ y₀) + (x₀ * y₁ + x₁ * y₀)) (x₀ * y₀) :=
begin
  intros,
  rw ← extract_lo_mul_concat x₁ x₀ y₁ y₀,
  rw ← extract_hi_mul_concat x₁ x₀ y₁ y₀,
  rw concat_extract
end


-- (bveq (concat (bvadd (bvmulhu (extract 31 0 x) (extract 31 0 y))
--                      (bvadd (bvmul (extract 31 0 x) (extract 63 32 y))
--                             (bvmul (extract 63 32 x) (extract 31 0 y))))
--               (bvmul (extract 31 0 x) (extract 31 0 y)))
--       (bvmul x y))

theorem bvmul_decomp {n : ℕ} (x y : bitvec (n + n)) :
  let h := le_add_self n,
      x₁ := extract_hi h x,
      x₀ := extract_lo h x,
      y₁ := extract_hi h y,
      y₀ := extract_lo h y in
    x * y = concat ((bvmulhu x₀ y₀) + (x₀ * y₁ + x₁ * y₀)) (x₀ * y₀) :=
begin
  intros,
  rw ← bvmul_decomp_concat,
  simp [concat_extract]
end


-- x % y = x - (x / y) * y
-- One can also prove this using SMT in lemmas.rkt.

theorem bvurem_of_bvsub_bvmul_bvudiv {n : ℕ} (x y : bitvec n) :
  bv.urem x y = x - (bv.udiv x y) * y :=
begin
  apply eq_of_to_nat,
  simp [sub_of_nat, mul_of_nat],
  unfold bv.urem,
  unfold bv.udiv,
  simp [to_nat_of_nat],
  cases (y.to_nat) with y,
  { simp },
  { rw [if_neg],
    { generalize : nat.succ y = k,
      have hmod : x.to_nat % k < 2^n,
      { apply lt_of_le_of_lt, apply nat.mod_le, apply to_nat_lt },
      simp [nat.mod_eq_of_lt hmod],
      have hdiv : x.to_nat / k < 2^n,
      { apply lt_of_le_of_lt, apply nat.div_le_self, apply to_nat_lt },
      simp [nat.mod_eq_of_lt hdiv],
      have h : x.to_nat / k * k < 2^n,
      { apply lt_of_le_of_lt, apply nat.div_mul_le_self, apply to_nat_lt },
      simp [nat.mod_eq_of_lt h],
      calc
        x.to_nat % k = x.to_nat - x.to_nat / k * k : by { rw mul_comm, apply nat.mod_sub_div }
                 ... = (x.to_nat - x.to_nat / k * k) % 2^n : by { rw nat.mod_eq_of_lt, apply lt_of_le_of_lt, apply nat.sub_le, apply to_nat_lt }
                 ... = (x.to_nat - x.to_nat / k * k + 2^n) % 2^n : by { rw nat.add_mod_right }
                 ... = (x.to_nat + 2^n - x.to_nat / k * k) % 2^n : by { rw nat.sub_add_eq_add_sub, apply nat.div_mul_le_self }
                 ... = (x.to_nat + (2^n - x.to_nat / k * k)) % 2^n : by { rw nat.add_sub_assoc, apply le_of_lt, assumption }
    },
    { apply nat.succ_ne_zero } }
end
