
import .basic
import .helper

namespace bv
open nat
open bv.helper

section fin
variable {n : ℕ}

@[simp]
lemma lsb_cons (b : bool) (v : bv n) : (cons b v).lsb = b :=
fin.cons_zero _ _

@[simp]
lemma tail_cons (b : bool) (v : bv n) : (cons b v).tail = v :=
fin.tail_cons _ _

@[simp]
lemma cons_lsb_tail (v : bv (n + 1)) : cons v.lsb v.tail = v :=
fin.cons_self_tail _

@[simp]
lemma msb_snoc (v : bv n) (b : bool) : (snoc v b).msb = b :=
fin.snoc_last _ _

@[simp]
lemma init_snoc (v : bv n) (b : bool) : (snoc v b).init = v :=
fin.init_snoc _ _

@[simp]
lemma snoc_init_msb (v : bv (n + 1)) : snoc v.init v.msb = v :=
fin.snoc_init_self _

lemma cons_snoc_eq_snoc_cons (b₁ : bool) (v : bv n) (b₂ : bool) :
  cons b₁ (snoc v b₂) = snoc (cons b₁ v) b₂ :=
fin.cons_snoc_eq_snoc_cons _ _ _

end fin

section list
variable {n : ℕ}

@[norm_cast, simp]
lemma nil_to_list (v : bv 0) : (v : list bool) = [] := rfl

@[norm_cast]
lemma cons_to_list (b : bool) (v : bv n) :
  (cons b v : list bool) = b :: (v : list bool) :=
by unfold_coes; simp [to_list, cons, list.of_fn_succ]

@[norm_cast]
lemma snoc_to_list : ∀ {n : ℕ} (v : bv n) (b : bool),
  (snoc v b : list bool) = (v : list bool) ++ [b]
| 0       _ _ := rfl
| (n + 1) v b := calc (v.snoc b : list bool)
      = (cons v.lsb (snoc v.tail b) : list bool) : by simp [cons_snoc_eq_snoc_cons]
  ... = (v.lsb :: v.tail : list bool) ++ [b] : by push_cast; simp [snoc_to_list]
  ... = (v : list bool) ++ [b] : by { norm_cast; simp }

@[simp]
lemma to_list_length {n : ℕ} (v : bv n) :
  (v : list bool).length = n :=
list.length_of_fn v

@[norm_cast]
lemma to_list_nth_le {n : ℕ} {v : bv n} (i : ℕ) (h h') :
  (v : list bool).nth_le i h' = v ⟨i, h⟩ :=
list.nth_le_of_fn' v h'

@[norm_cast]
theorem to_list_inj (v₁ v₂ : bv n) :
  (v₁ : list bool) = (v₂ : list bool) ↔ v₁ = v₂ :=
begin
  split; intro h; try { cc },
  ext ⟨i, _⟩,
  rw [← @to_list_nth_le _ v₁, ← @to_list_nth_le _ v₂]; try { simpa },
  congr, cc
end

@[ext]
lemma heq_ext {n₁ n₂ : ℕ} (h : n₁ = n₂) {v₁ : bv n₁} {v₂ : bv n₂} :
  (∀ (i : fin n₁), v₁ i = v₂ ⟨i.val, h ▸ i.2⟩) → v₁ == v₂ :=
by simp [fin.heq_fun_iff h]

theorem heq_iff_to_list {n₁ n₂ : ℕ} (h : n₁ = n₂) {v₁ : bv n₁} {v₂ : bv n₂} :
  v₁ == v₂ ↔ (v₁ : list bool) = (v₂ : list bool) :=
by induction h; simp [heq_iff_eq, to_list_inj]

end list

section nat
variable {n : ℕ}

@[norm_cast, simp]
lemma nil_to_nat (v : bv 0) : (v : ℕ) = 0 := rfl

@[norm_cast]
lemma cons_to_nat (b : bool) (v : bv n) :
  (cons b v : ℕ) = nat.bit b (v : ℕ) :=
by unfold_coes; simp [to_nat]

lemma to_nat_of_lsb_tail (v : bv (n + 1)) :
  (v : ℕ) = nat.bit v.lsb (v.tail : ℕ) := rfl

@[norm_cast]
lemma snoc_to_nat : ∀ {n : ℕ} (v : bv n) (b : bool),
  (snoc v b : ℕ) = (v : ℕ) + 2^n * cond b 1 0
| 0       _ b := by cases b; refl
| (n + 1) v b := calc (snoc v b : ℕ)
      = (cons v.lsb (snoc v.tail b) : ℕ) : by simp [cons_snoc_eq_snoc_cons]
  ... = 2 * (snoc v.tail b : ℕ) + cond v.lsb 1 0 : by push_cast [bit_val]
  ... = 2 * (v.tail : ℕ) + cond v.lsb 1 0 + 2^(n + 1) * cond b 1 0 : by rw snoc_to_nat; ring_exp
  ... = (v : ℕ) + 2^(n + 1) * cond b 1 0 : by rw ← bit_val; norm_cast; simp

lemma to_nat_le : ∀ {n : ℕ} (v : bv n),
  (v : ℕ) ≤ 2^n - 1
| 0       _ := by refl
| (n + 1) v := calc (v : ℕ)
      = (v.init : ℕ) + 2^n * cond v.msb 1 0 : by norm_cast; simp
  ... ≤ 2^n - 1 + 2^n * cond v.msb 1 0 : by mono
  ... ≤ 2^n - 1 + 2^n : by cases v.msb; simp
  ... = 2^(n + 1) - 1 : by rw ← nat.sub_add_comm (pow2_pos _); ring_exp

lemma to_nat_lt (v : bv n) :
  (v : ℕ) < 2^n :=
calc v.to_nat
    ≤ 2^n - 1 : to_nat_le _
... < 2^n : sub_lt (pow2_pos _) one_pos

@[simp]
lemma to_nat_mod_eq (v : bv n) :
  (v : ℕ) % 2^n = (v : ℕ) :=
by { apply mod_eq_of_lt, apply to_nat_lt }

@[norm_cast]
lemma to_of_nat : ∀ (n a : ℕ),
  (@of_nat n a : ℕ) = a % 2^n
| 0       _ := by simp [of_nat]
| (n + 1) a := calc (@of_nat (n + 1) a : ℕ)
      = bit a.bodd ↑(@of_nat n a.div2) : by norm_cast
  ... = bit a.bodd (a.div2 % 2^n) : by rw to_of_nat
  ... = 2 * (a / 2 % 2^n) + a % 2 : by rw [bit_val, div2_val, mod_two_of_bodd]
  ... = a % 2^(n + 1) : by rw nat.mod_pow_succ two_pos

@[simp]
lemma of_to_nat : ∀ {n : ℕ} (v : bv n),
  bv.of_nat (v : ℕ) = v
| 0       _ := dec_trivial
| (n + 1) v := calc of_nat (v : ℕ)
    = of_nat (cons v.lsb v.tail : ℕ) : by simp
... = v : by push_cast; rw [of_nat, nat.bodd_bit, nat.div2_bit]; simp [of_to_nat]

@[norm_cast]
theorem to_nat_inj (v₁ v₂ : bv n) :
  (v₁ : ℕ) = (v₂ : ℕ) ↔ v₁ = v₂ :=
⟨λ h, function.left_inverse.injective of_to_nat h, congr_arg _⟩

lemma to_int_mod_eq (v : bv n) :
  v.to_int % 2^n = (v : ℕ) :=
begin
  simp [to_int],
  cases decidable.em ((v : ℕ) < 2^(n - 1)) with h h; simp [h, int.sub_mod_self];
  norm_cast; simp; congr
end

lemma of_to_int (v : bv n) :
  bv.of_int v.to_int = v :=
by simp [of_int, to_int_mod_eq]

theorem to_int_inj (v₁ v₂ : bv n) :
  v₁.to_int = v₂.to_int ↔ v₁ = v₂ :=
⟨λ h, function.left_inverse.injective of_to_int h, congr_arg _⟩

lemma msb_eq_ff_iff (v : bv (n + 1)) :
v.msb = ff ↔ (v : ℕ) < 2^n :=
begin
  rw [← snoc_init_msb v],
  push_cast,
  cases v.msb; simp,
  apply to_nat_lt
end

end nat

section literals

variable {n : ℕ}

@[norm_cast, simp]
lemma zero_to_nat : ∀ {n : ℕ}, ((0 : bv n) : ℕ) = 0
| 0       := rfl
| (n + 1) := calc ((0 : bv (n + 1)) : ℕ)
    = (cons ff (0 : bv n) : ℕ) : by push_cast; refl
... = 0 : by push_cast; simp [zero_to_nat]

@[norm_cast]
lemma umax_to_nat : ∀ {n : ℕ}, ((bv.umax : bv n) : ℕ) = 2^n - 1
| 0       := rfl
| (n + 1) := calc ((bv.umax : bv (n + 1)) : ℕ)
      = ((cons tt (bv.umax : bv n)) : ℕ) : by push_cast; refl
  ... = 2 * (2^n - 1 + 1) - 1: by push_cast [bit_val, umax_to_nat]; ring
  ... = 2^(n + 1) - 1 : by rw [nat.sub_add_cancel (pow2_pos _)]; ring_exp

@[norm_cast, simp]
lemma one_to_nat : ((1 : bv (n + 1)) : ℕ) = 1 :=
calc ((1 : bv (n + 1)) : ℕ)
    = ((cons tt (0 : bv n)) : ℕ) : rfl
... = 1: by push_cast; simp [bit_val]

@[norm_cast]
lemma smin_to_nat : ((bv.smin : bv (n + 1)) : ℕ) = 2^n :=
calc ((bv.smin : bv (n + 1)) : ℕ)
    = ((snoc (0 : bv n) tt) : ℕ) : rfl
... = 2^n : by push_cast; simp

@[norm_cast]
lemma smax_to_nat : ((bv.smax : bv (n + 1)) : ℕ) = 2^n - 1 :=
calc ((bv.smax : bv (n + 1)) : ℕ)
    = ((snoc (bv.umax : bv n) ff) : ℕ) : rfl
... = 2^n - 1 : by push_cast; simp

end literals

section concatenation

@[norm_cast]
lemma concat_to_list {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) :
  (concat v₁ v₂ : list bool) = ↑v₂ ++ ↑v₁ :=
begin
  apply list.ext_le,
  { simp [add_comm] },
  { intros i h₁ h₂,
    simp at h₁ h₂,
    rw to_list_nth_le _ h₁,
    cases decidable.em (i < n₂) with hlt hlt; simp [hlt, concat],
    { rw [list.nth_le_append, to_list_nth_le]; simpa },
    { rw [list.nth_le_append_right, to_list_nth_le]; simp; omega } }
end

lemma concat_nil {n₁ : ℕ} (v₁ : bv n₁) (v₂ : bv 0) :
  v₁.concat v₂ = v₁ :=
by push_cast [← to_list_inj]; simp

lemma concat_cons {n₁ n₂ : ℕ} (v₁ : bv n₁) (b : bool) (v₂ : bv n₂) :
  v₁.concat (cons b v₂) = cons b (v₁.concat v₂) :=
by push_cast [← to_list_inj]; simp

@[norm_cast]
lemma concat_to_nat : ∀ {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂),
  (concat v₁ v₂ : ℕ) = v₁ * 2^n₂ + v₂
| _ 0        _  _ := by simp [concat_nil]
| _ (n₂ + 1) v₁ v₂ := calc (v₁.concat v₂ : ℕ)
      = ↑(v₁.concat (cons v₂.lsb v₂.tail)) : by simp
  ... = ↑(cons v₂.lsb (v₁.concat v₂.tail)) : by rw concat_cons
  ... = v₁ * 2^(n₂ + 1) + ↑(cons v₂.lsb v₂.tail) : by push_cast [bit_val, concat_to_nat]; ring_exp
  ... = v₁ * 2^(n₂ + 1) + v₂ : by simp

@[simp]
lemma zero_extend_to_nat (i : ℕ) {n : ℕ} (v : bv n) :
  (v.zero_extend i : ℕ) = v :=
by dsimp [zero_extend]; push_cast; simp

end concatenation

section extraction
variables {n₁ n₂ : ℕ}

@[norm_cast]
lemma extract_to_list {n : ℕ} (i j : ℕ) (h₁ : i < n) (h₂ : j ≤ i) (v : bv n) :
(v.extract i j h₁ h₂ : list bool) = ((v : list bool).take (i + 1)).drop j :=
begin
  apply list.ext_le,
  { simp, rw min_eq_left; omega },
  { intros,
    rw [← list.nth_le_drop, ← list.nth_le_take],
    repeat { rw to_list_nth_le },
    simp [extract], all_goals { simp at *; omega } }
end

@[norm_cast]
lemma drop_to_list (v : bv (n₁ + n₂)) :
(v.drop n₂ : list bool) = (v : list bool).drop n₂ :=
begin
  apply list.ext_le,
  { simp },
  { intros,
    rw ← list.nth_le_drop,
    repeat { rw to_list_nth_le },
    simp [drop], all_goals { simp at *; omega } }
end

@[norm_cast]
lemma take_to_list (v : bv (n₁ + n₂)) :
(v.take n₂ : list bool) = (v : list bool).take n₂ :=
begin
  apply list.ext_le,
  { simp },
  { intros,
    rw ← list.nth_le_take,
    repeat { rw to_list_nth_le },
    simp [take], all_goals { simp at *; omega } }
end

lemma drop_zero {n : ℕ} (v : bv n) :
  drop 0 v = v :=
by push_cast [← to_list_inj]; simp

lemma drop_cons {n₁ n₂ : ℕ} (b : bool) (v : bv (n₁ + n₂)) :
  drop (n₂ + 1) (cons b v) = drop n₂ v :=
by push_cast [← to_list_inj]; simp

@[norm_cast]
lemma drop_to_nat : ∀ {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)),
  (drop n₂ v : ℕ) = (v : ℕ) / 2^n₂
| _ 0        _ := by simp [drop_zero]
| _ (n₂ + 1) v := by
  { rw [← cons_lsb_tail v, drop_cons, drop_to_nat],
    push_cast,
    simp [pow2_succ, ← nat.div_div_eq_div_mul] }

lemma take_zero {n : ℕ} (v : bv n) :
  take 0 v = nil :=
dec_trivial

lemma take_cons {n₁ n₂ : ℕ} (b : bool) (v : bv (n₁ + n₂)) :
  take (n₂ + 1) (cons b v) = cons b (take n₂ v) :=
by push_cast [← to_list_inj]; simp

@[norm_cast]
lemma take_to_nat : ∀ {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)),
  (take n₂ v : ℕ) = (v : ℕ) % 2^n₂
| _ 0        _ := by simp [take_zero]
| _ (n₂ + 1) v := by
  { rw [← cons_lsb_tail v, take_cons],
    push_cast,
    simp [take_to_nat, mod_pow_succ two_pos, ← bit_val] }

lemma concat_drop_take {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)) :
  concat (drop n₂ v) (take n₂ v) = v :=
by push_cast [← to_list_inj]; simp [list.take_append_drop]

lemma drop_concat {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) :
  drop n₂ (concat v₁ v₂) = v₁ :=
by push_cast [← to_list_inj]; simp [list.drop_left']

lemma take_concat {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) :
  take n₂ (concat v₁ v₂) = v₂ :=
by push_cast [← to_list_inj]; simp [list.take_left']

end extraction

section bitwise

variable {n : ℕ}

@[norm_cast]
lemma not_to_nat (v : bv n) :
  (v.not : ℕ) = 2^n - 1 - v :=
begin
  apply symm,
  rw [nat.sub_eq_iff_eq_add (to_nat_le _),
      nat.sub_eq_iff_eq_add (pow2_pos _)],
  apply symm,
  induction n with n ih; try { refl },
  calc (v.not : ℕ) + v + 1
      = bit (!v.lsb) v.tail.not + bit v.lsb v.tail + 1 : rfl
  ... = 2 * (v.tail.not + v.tail + 1) : by cases v.lsb; simp [bit_val]; ring
  ... = 2^(n + 1) : by rw ih; ring_exp
end

@[norm_cast]
lemma map₂_to_nat {f : bool → bool → bool} (h : f ff ff = ff) : ∀ {n : ℕ} (v₁ v₂ : bv n),
  (map₂ f v₁ v₂ : ℕ) = nat.bitwise f ↑v₁ ↑v₂
| 0       _  _ := by simp
| (n + 1) v₁ v₂ := calc ↑(map₂ f v₁ v₂)
    = nat.bit (f v₁.lsb v₂.lsb) ↑(map₂ f v₁.tail v₂.tail) : rfl
... = nat.bitwise f (nat.bit v₁.lsb ↑(v₁.tail)) (nat.bit v₂.lsb ↑(v₂.tail)) : by rw [map₂_to_nat, nat.bitwise_bit h]
... = nat.bitwise f ↑v₁ ↑v₂ : by norm_cast; simp

@[norm_cast]
lemma and_to_nat : ∀ (v₁ v₂ : bv n),
  (v₁.and v₂ : ℕ) = nat.land ↑v₁ ↑v₂ := map₂_to_nat rfl

@[norm_cast]
lemma or_to_nat : ∀ (v₁ v₂ : bv n),
  (v₁.or v₂ : ℕ) = nat.lor ↑v₁ ↑v₂ := map₂_to_nat rfl

@[norm_cast]
lemma xor_to_nat : ∀ (v₁ v₂ : bv n),
  (v₁.xor v₂ : ℕ) = nat.lxor ↑v₁ ↑v₂ := map₂_to_nat rfl

end bitwise

section arithmetic

variable {n : ℕ}

@[norm_cast]
lemma neg_to_nat (v : bv n) :
  (((-v) : bv n) : ℕ)  = if (v : ℕ) = 0 then 0 else 2^n - v :=
begin
  have h : -v = bv.neg v := rfl,
  push_cast [h, bv.neg],
  cases eq.decidable (v : ℕ) 0 with h h; simp [h],
  apply mod_eq_of_lt,
  apply sub_lt (pow2_pos _) (nat.pos_of_ne_zero h)
end

@[norm_cast]
lemma add_to_nat (v₁ v₂ : bv n) :
  ((v₁ + v₂ : bv n) : ℕ) = ((v₁ : ℕ) + (v₂ : ℕ)) % 2^n :=
begin
  have h : v₁ + v₂ = bv.add v₁ v₂ := rfl,
  push_cast [h, bv.add]
end

@[norm_cast]
lemma sub_to_nat (v₁ v₂ : bv n) :
  ((v₁ - v₂ : bv n) : ℕ) = if (v₂ : ℕ) ≤ (v₁ : ℕ) then (v₁ : ℕ) - (v₂ : ℕ) else 2^n + (v₁ : ℕ) - (v₂ : ℕ) :=
begin
  have h : v₁ - v₂ = v₁ + -v₂ := rfl,
  push_cast [h],
  cases eq.decidable (v₂ : ℕ) 0 with hz hz; simp [hz],
  rw [← nat.add_sub_assoc (le_of_lt (to_nat_lt _)), add_comm],
  have h₁ := to_nat_lt v₁,
  have h₂ := to_nat_lt v₂,
  cases decidable.em ((v₂ : ℕ) ≤ (v₁ : ℕ)) with hcmp hcmp; simp [hcmp],
  { rw nat.add_sub_assoc hcmp,
    rw add_mod_left,
    apply mod_eq_of_lt,
    omega },
  { apply mod_eq_of_lt,
    omega }
end

@[norm_cast]
lemma mul_to_nat (v₁ v₂ : bv n) :
  ((v₁ * v₂ : bv n) : ℕ) = ((v₁ : ℕ) * (v₂ : ℕ)) % 2^n :=
begin
  have h : v₁ * v₂ = bv.mul v₁ v₂ := rfl,
  push_cast [h, bv.mul]
end

-- note that a % 0 = 0 for nat (rather than 2^n - 1)
@[norm_cast]
lemma udiv_to_nat (v₁ v₂ : bv n) :
  ((v₁ / v₂ : bv n) : ℕ) = if (v₂ : ℕ) = 0 then 2^n - 1 else (v₁ / v₂ : ℕ) :=
begin
  have h : v₁ / v₂ = bv.udiv v₁ v₂ := rfl,
  push_cast [h, bv.udiv],
  cases nat.decidable_eq (v₂ : ℕ) 0 with h h; simp [h],
  apply mod_eq_of_lt,
  apply lt_of_le_of_lt (nat.div_le_self _ _) (to_nat_lt _)
end

-- drop the zero case as a % 0 = a for nat
@[norm_cast]
lemma urem_to_nat (v₁ v₂ : bv n) :
  ((v₁ % v₂ : bv n) : ℕ) = (v₁ % v₂ : ℕ) :=
begin
  have h : v₁ % v₂ = bv.urem v₁ v₂ := rfl,
  push_cast [h, bv.urem],
  cases nat.decidable_eq (v₂ : ℕ) 0 with h h; simp [h],
  apply mod_eq_of_lt,
  apply lt_of_le_of_lt (mod_le _ _) (to_nat_lt _)
end

theorem urem_add_udiv (v₁ v₂ : bv n) :
  v₁ % v₂ + v₂ * (v₁ / v₂) = v₁ :=
begin
  push_cast [← to_nat_inj],
  cases nat.decidable_eq (v₂ : ℕ) 0 with h h; simp [h],
  simp [nat.mod_add_div]
end

end arithmetic

section ring

variable {n : ℕ}

protected lemma add_comm (v₁ v₂ : bv n) : v₁ + v₂ = v₂ + v₁ :=
by push_cast [← to_nat_inj, add_comm]

protected lemma add_zero (v : bv n) : v + 0 = v :=
by push_cast [← to_nat_inj]; simp

protected lemma zero_add (v : bv n) : 0 + v = v :=
  bv.add_comm v 0 ▸ bv.add_zero v

protected lemma add_assoc (v₁ v₂ v₃ : bv n) : v₁ + v₂ + v₃ = v₁ + (v₂ + v₃) :=
by push_cast [← to_nat_inj]; simp [add_assoc]

protected lemma add_left_neg (v : bv n) : -v + v = 0 :=
begin
  push_cast [← to_nat_inj],
  cases eq.decidable (v : ℕ) 0 with h h; simp [h],
  rw nat.sub_add_cancel; simp,
  apply le_of_lt (to_nat_lt _)
end

protected lemma mul_comm (v₁ v₂ : bv n) : v₁ * v₂ = v₂ * v₁ :=
by push_cast [← to_nat_inj, mul_comm]

protected lemma mul_one (v : bv n) : v * 1 = v :=
by cases n; push_cast [← to_nat_inj]; simp

protected lemma one_mul (v : bv n) : 1 * v = v :=
bv.mul_comm v 1 ▸ bv.mul_one v

protected lemma mul_assoc (v₁ v₂ v₃ : bv n) : v₁ * v₂ * v₃ = v₁ * (v₂ * v₃) :=
begin
  push_cast [← to_nat_inj],
  conv_lhs { rw [mul_mod, mod_mod, ← mul_mod] },
  conv_rhs { rw [mul_mod, mod_mod, ← mul_mod] },
  rw mul_assoc
end

protected lemma distrib_left (v₁ v₂ v₃ : bv n) : v₁ * (v₂ + v₃) = v₁ * v₂ + v₁ * v₃ :=
begin
  push_cast [← to_nat_inj],
  conv_lhs { rw [mul_mod, mod_mod, ← mul_mod] },
  simp [nat.left_distrib]
end

protected lemma distrib_right (v₁ v₂ v₃ : bv n) : (v₁ + v₂) * v₃ = v₁ * v₃ + v₂ * v₃ :=
begin
  rw [bv.mul_comm, bv.distrib_left],
  simp [bv.mul_comm]
end

instance : comm_ring (bv n) :=
{ add            := bv.add,
  add_comm       := bv.add_comm,
  add_assoc      := bv.add_assoc,
  zero           := 0,
  zero_add       := bv.zero_add,
  add_zero       := bv.add_zero,
  neg            := bv.neg,
  add_left_neg   := bv.add_left_neg,
  mul            := bv.mul,
  mul_comm       := bv.mul_comm,
  mul_assoc      := bv.mul_assoc,
  one            := 1,
  one_mul        := bv.one_mul,
  mul_one        := bv.mul_one,
  left_distrib   := bv.distrib_left,
  right_distrib  := bv.distrib_right }

end ring

section bitwise

variable {n : ℕ}

@[norm_cast]
lemma shl_to_nat (v₁ v₂ : bv n) :
  (v₁.shl v₂ : ℕ) = (v₁ : ℕ) * (2^(v₂ : ℕ)) % 2^n :=
by push_cast [shl]

lemma shl_above (v₁ v₂ : bv n) (h : n ≤ v₂.to_nat) :
  v₁.shl v₂ = 0 :=
begin
  push_cast [← to_nat_inj],
  apply mod_eq_zero_of_dvd,
  apply dvd_trans _ (dvd_mul_left _ _),
  apply pow_dvd_pow _ h
end

@[norm_cast]
lemma lshr_to_nat (v₁ v₂ : bv n) :
  (v₁.lshr v₂ : ℕ) = (v₁ : ℕ) / 2^(v₂ : ℕ) :=
begin
  push_cast [lshr],
  apply mod_eq_of_lt,
  apply lt_of_le_of_lt (nat.div_le_self _ _) (to_nat_lt _)
end

lemma lshr_above (v₁ v₂ : bv n) (h : n ≤ v₂.to_nat) :
  v₁.lshr v₂ = 0 :=
begin
  push_cast [← to_nat_inj],
  apply div_eq_of_lt,
  apply lt_of_lt_of_le (to_nat_lt _),
  apply pow_le_pow_of_le_right two_pos h
end

end bitwise

section order

variable {n : ℕ}

@[norm_cast]
lemma ult_to_nat (v₁ v₂ : bv n) :
  ((v₁ : ℕ) < (v₂ : ℕ)) = (v₁ < v₂) := rfl

@[norm_cast]
lemma ule_to_nat (v₁ v₂ : bv n) :
  ((v₁ : ℕ) ≤ (v₂ : ℕ)) ↔ (v₁ ≤ v₂) :=
begin
  rw [le_iff_eq_or_lt, or_comm],
  norm_cast
end

protected lemma ule_refl (v : bv n) : v ≤ v :=
by simp [← ule_to_nat]

protected lemma ule_trans (v₁ v₂ v₃ : bv n) :
  v₁ ≤ v₂ → v₂ ≤ v₃ → v₁ ≤ v₃ :=
begin
  simp [← ule_to_nat],
  apply le_trans
end

protected lemma ule_antisymm (v₁ v₂ : bv n) :
  v₁ ≤ v₂ →
  v₂ ≤ v₁ →
  v₁ = v₂ :=
begin
  simp [← ule_to_nat, ← to_nat_inj],
  apply le_antisymm
end

protected lemma ule_total (v₁ v₂ : bv n) :
  v₁ ≤ v₂ ∨ v₂ ≤ v₁ :=
by simp [← ule_to_nat, le_total]

protected lemma ult_iff_ule_not_ule (v₁ v₂ : bv n) :
  v₁ < v₂ ↔ v₁ ≤ v₂ ∧ ¬ v₂ ≤ v₁ :=
begin
  rw ← ult_to_nat,
  repeat { rw ← ule_to_nat },
  apply lt_iff_le_not_le
end

@[priority 101]
instance unsigned : linear_order (bv n) :=
{ le               := bv.ule,
  decidable_le     := bv.decidable_ule,
  le_refl          := bv.ule_refl,
  le_trans         := bv.ule_trans,
  le_antisymm      := bv.ule_antisymm,
  le_total         := bv.ule_total,
  lt               := bv.ult,
  decidable_lt     := bv.decidable_ult,
  lt_iff_le_not_le := bv.ult_iff_ule_not_ule }

lemma slt_to_int (v₁ v₂ : bv (n + 1)) :
  v₁.to_int < v₂.to_int = v₁.slt v₂ :=
begin
  simp [bv.slt, to_int, ← msb_eq_ff_iff],
  have h₁ := to_nat_lt v₁,
  have h₂ := to_nat_lt v₂,
  cases v₁.msb; cases v₂.msb; simp [← ult_to_nat]; linarith
end

protected lemma sle_iff_eq_or_slt (v₁ v₂ : bv (n + 1)) :
  v₁.sle v₂ = (v₁ = v₂ ∨ v₁.slt v₂) :=
begin
  simp [bv.sle, bv.slt, le_iff_eq_or_lt],
  cases eq.decidable v₁ v₂ with h h; simp [h]
end

lemma sle_to_int (v₁ v₂ : bv (n + 1)) :
  (v₁.to_int ≤ v₂.to_int) = v₁.sle v₂ :=
by rw [le_iff_eq_or_lt, to_int_inj, slt_to_int, bv.sle_iff_eq_or_slt]

protected lemma sle_refl (v : bv (n + 1)) :
  v.sle v :=
by simp [bv.sle, bv.ule_refl]

protected lemma sle_trans (v₁ v₂ v₃ : bv (n + 1)) :
  v₁.sle v₂ →
  v₂.sle v₃ →
  v₁.sle v₃ :=
begin
  simp [← sle_to_int],
  apply le_trans
end

protected lemma sle_antisymm (v₁ v₂ : bv (n + 1)) :
  v₁.sle v₂ →
  v₂.sle v₁ →
  v₁ = v₂ :=
begin
  simp [bv.sle],
  finish
end

protected lemma sle_total (v₁ v₂ : bv (n + 1)) :
  v₁.sle v₂ ∨ v₂.sle v₁ :=
by simp [← sle_to_int, le_total]

protected lemma slt_iff_sle_not_sle (v₁ v₂ : bv (n + 1)) :
  v₁.slt v₂ ↔ v₁.sle v₂ ∧ ¬ v₂.sle v₁ :=
begin
  rw ← slt_to_int,
  repeat { rw ← sle_to_int },
  apply lt_iff_le_not_le
end

@[priority 100]
instance signed : linear_order (bv (n + 1)) :=
{ le               := bv.sle,
  decidable_le     := bv.decidable_sle,
  le_refl          := bv.sle_refl,
  le_trans         := bv.sle_trans,
  le_antisymm      := bv.sle_antisymm,
  le_total         := bv.sle_total,
  lt               := bv.slt,
  decidable_lt     := bv.decidable_slt,
  lt_iff_le_not_le := bv.slt_iff_sle_not_sle }

end order

end bv
