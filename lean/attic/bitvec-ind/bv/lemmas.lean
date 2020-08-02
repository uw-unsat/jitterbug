
import .basic
import .helper

namespace num

@[simp]
lemma bodd_to_nat (n : num) : num.bodd n = nat.bodd n :=
begin
  cases n with n,
  { refl },
  { cases n; simp [num.bodd]; refl }
end

@[simp]
lemma div2_to_nat (n : num) : (n.div2 : ℕ) = nat.div2 n :=
begin
  cases n with n,
  { refl },
  { cases n; simp [num.div2]; refl }
end

end num

namespace bv
open nat
open bv.helper

section conversion

variable {n : ℕ}

theorem to_nat_le (v : bv n) : v.to_nat ≤ 2^n - 1 :=
begin
  induction v with b n v ih; simp [bv.to_nat],
  apply le_trans (nat.bit_le_bit1 _ ih) (le_of_eq _),
  apply bit1_pow2_sub_one
end

theorem to_nat_lt (v : bv n) : v.to_nat < 2^n :=
calc
  v.to_nat ≤ 2^n - 1 : by apply to_nat_le
       ... < 2^n : by apply sub_lt (pow2_pos n) one_pos

@[simp]
lemma to_nat_mod_eq (v : bv n) : v.to_nat % (2^n) = v.to_nat :=
by { apply mod_eq_of_lt, apply to_nat_lt }

@[simp]
theorem of_num_of_nat (n : ℕ) : ∀ (a : num), bv.of_num n a = bv.of_nat n a :=
begin
  induction n with n ih; intros,
  { refl },
  { dsimp [bv.of_num, bv.of_nat],
    simp [ih] }
end

@[simp]
theorem to_num_to_nat {n : ℕ} (v : bv n) : (v.to_num : ℕ) = v.to_nat :=
begin
  induction v with b _ v ih,
  { refl },
  { dsimp [bv.to_num, bv.to_nat],
    simp [num.bit_to_nat],
    rw ih }
end

theorem to_of_nat (n a : ℕ) : (bv.of_nat n a).to_nat = a % 2^n :=
begin
  revert a,
  induction n with n ih; intros; simp [bv.of_nat, bv.to_nat],
  rw ih,
  rw mod_pow_succ two_pos,
  rw [bit_val, div2_val, mod_two_of_bodd]
end

@[simp]
theorem of_to_nat (v : bv n) : bv.of_nat n v.to_nat = v :=
begin
  induction v with b n v ih,
  { refl },
  { cases b; simp [bit, bv.of_nat, bv.to_nat, ih] }
end

theorem to_nat_inj (v₁ v₂ : bv n) : v₁.to_nat = v₂.to_nat ↔ v₁ = v₂ :=
⟨λ h, function.left_inverse.injective of_to_nat h, congr_arg _⟩

lemma to_int_of_to_nat (v : bv n) :
   v.to_int = if v.to_nat < 2^(n - 1) then v.to_nat else v.to_nat - 2^n :=
begin
  cases v with b₁ _ v; try { refl },
  revert b₁,
  induction v with b₂ n v ih; intros,
  { cases b₁; refl },
  { simp [bv.to_int],
    rw [ih, ← bit0_pow2], clear ih,
    simp [bv.to_nat],

    cases lt_or_ge (bit b₂ v.to_nat) (2^n) with h h,
    { simp [h],
      rw if_pos,
      apply bit_lt_bit0 _ h },
    { rw if_neg; try { apply not_lt_of_ge h },
      rw if_neg,
      { cases b₁; cases b₂; simp [int.bit_val, bit_val]; ring },
      { apply not_lt_of_ge,
        apply bit0_le_bit _ h } } }
end

lemma of_to_int (v : bv n) :
  bv.of_int n v.to_int = v :=
begin
  cases v with b₁ n v; try { refl },
  revert b₁,
  induction v with b₂ n v ih; intros,
  { cases b₁; refl },
  { simp [bv.of_int, bv.to_int, ih] }
end

theorem to_int_inj (v₁ v₂ : bv n) : v₁.to_int = v₂.to_int ↔ v₁ = v₂ :=
⟨λ h, function.left_inverse.injective of_to_int h, congr_arg _⟩

lemma of_int_mod (n : ℕ) (a : ℤ) :
  bv.of_int n a = bv.of_int n (a % 2^n) :=
begin
  rw int.mod_def,
  revert a,
  induction n with n ih; intro; simp [bv.of_int, pow_succ],
  split,
  { simp [sub_eq_add_neg] },
  { rw ih,
    simp [int.div2_val],
    repeat { rw [sub_eq_add_neg, neg_mul_eq_mul_neg] },
    rw mul_assoc,
    rw int.add_mul_div_left _ _ (ne_of_gt two_pos),
    rw ← pow_succ, norm_cast,
    rw [← int.shiftr_eq_div_pow a, add_comm n 1, int.coe_nat_add, int.shiftr_add],
    repeat { rw int.shiftr_eq_div_pow }, simp }
end

lemma of_int_modeq {n : ℕ} {a b : ℤ} (h : a ≡ b [ZMOD 2^n]) :
  bv.of_int n a = bv.of_int n b :=
begin
  rw [of_int_mod _ a, of_int_mod _ b],
  simp [int.modeq] at h, cc
end

lemma of_int_coe_nat (n a : ℕ) :
  bv.of_int n a = bv.of_nat n a :=
begin
  revert a,
  induction n with n ih; intro; simp [bv.of_nat, bv.of_int],
  simp [← ih, nat.div2_val, int.div2_val]
end

@[simp]
theorem to_nat_cong {n₁ n₂ : ℕ} (h : n₁ = n₂) (v : bv n₁) :
  (v.cong h).to_nat = v.to_nat := by subst h

private lemma test_bit_cong_eq {n₁ n₂ i : ℕ} (h : n₁ = n₂) (h₂ : i < n₂) : i < n₁ := h.symm ▸ h₂

theorem test_bit_cong {n₁ n₂ i : ℕ} (h : n₁ = n₂) (v : bv n₁) (h₂ : i < n₂) :
  (v.cong h).test_bit h₂ = v.test_bit (test_bit_cong_eq h h₂) := by subst h

lemma test_bit_to_nat {i : ℕ} (v : bv n) (h : i < n) :
  v.test_bit h = v.to_nat.test_bit i :=
begin
  revert i h,
  induction v with b n v ih; intros,
  { have hn := not_lt_zero i, contradiction },
  { cases i; simp [test_bit, bv.to_nat],
    rw [test_bit_succ, ih] }
end

theorem test_bit_inj (v₁ v₂ : bv n) : (∀ {i : ℕ} (h : i < n), v₁.test_bit h = v₂.test_bit h) ↔ v₁ = v₂ :=
begin
  split; try { cc },
  intro heq,
  induction n with n ih; cases v₁ with b₁ _ v₁; cases v₂ with b₂ _ v₂; try { refl },
  congr,
  { apply heq (zero_lt_succ _) },
  { apply ih; intros,
    apply heq (succ_lt_succ h) }
end

lemma msb_eq_ff_to_nat {n : ℕ} (v : bv n.succ) :
v.msb = ff ↔ v.to_nat < 2^n :=
begin
  cases v with b₁ _ v,
  revert b₁,
  induction v with b₂ n v ih; intros; simp [msb, bv.to_nat] at *,
  { cases b₁; simp [bit] },
  { rw [ih, ← bit0_pow2],
    split; intro h,
    { apply bit_lt_bit0 _ h },
    { rw ← @bit_lt_bit_iff _ _ b₁,
      apply lt_of_lt_of_le h,
      apply bit0_le_bit _ (le_refl _) } }
end

def hom_nat (f : Π {n : ℕ}, bv n → bv n) (g : ℕ → ℕ) : Prop :=
  ∀ {n : ℕ} (v : bv n), f v = bv.of_nat n (g v.to_nat)

def hom_nat₂ (f : Π {n : ℕ}, bv n → bv n → bv n) (g : ℕ → ℕ → ℕ) : Prop :=
  ∀ {n : ℕ} (v₁ v₂ : bv n), f v₁ v₂ = bv.of_nat n (g v₁.to_nat v₂.to_nat)

end conversion

section literals

variable {n : ℕ}

lemma zero_to_nat : @bv.to_nat n 0 = 0 :=
begin
  have h : 0 = repeat ff n := rfl,
  rw h, clear h,
  induction n with n ih,
  { refl },
  { simp [repeat, bv.to_nat],
    simp [ih] }
end

lemma one_to_nat : @bv.to_nat n 1 = if n = 0 then 0 else 1 :=
begin
  have h : 1 = bv.one n := rfl,
  simp [h, to_of_nat], clear h,
  cases n,
  { refl },
  { simp [bv.one, bv.to_nat],
    have hz : (bv.zero n).to_nat = 0 := zero_to_nat,
    rw hz,
    refl }
end

lemma ones_to_nat : (bv.ones n).to_nat = 2^n - 1 :=
begin
  induction n with n ih,
  { refl },
  { dsimp [bv.ones, bv.to_nat, repeat, bit] at *,
    rw [ih, bit1_pow2_sub_one] }
end

end literals

section concatenation

lemma concat_def₁ {n₁ n₂ i : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) (h : i < n₁) :
  (concat v₁ v₂).test_bit (add_lt_add_right h _) = v₁.test_bit h :=
begin
  induction v₂ with b n₂ v₂ ih; try { refl },
  simp [concat, test_bit],
  apply ih
end

lemma concat_def₂ {n₁ n₂ i : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) (h : i < n₂) :
  (concat v₁ v₂).test_bit (lt_of_lt_of_le h (le_add_left _ _)) = v₂.test_bit h :=
begin
  revert n₁ v₁ i,
  induction v₂ with b n₂ v₂ ih; intros,
  { have hn := not_lt_zero i, contradiction },
  { cases i; try { refl },
    simp [concat, test_bit],
    apply ih }
end

lemma concat_to_nat {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) :
  (concat v₁ v₂).to_nat = v₁.to_nat * 2^n₂ + v₂.to_nat :=
begin
  revert n₁ v₁,
  induction v₂ with b n₂ v₂ ih; intros; simp [concat, bv.to_nat],
  simp [ih, bit_val, pow2_succ],
  ring
end

lemma zero_extend_to_nat (i : ℕ) {n : ℕ} (v : bv n) :
  (zero_extend i v).to_nat = v.to_nat :=
begin
  dsimp [zero_extend],
  simp [concat_to_nat, zero_to_nat]
end

end concatenation

section extraction

lemma drop_def {n₁ n₂ i : ℕ} (v : bv (n₁ + n₂)) (h : i < n₁) :
  (drop n₂ v).test_bit h = v.test_bit (add_lt_add_right h n₂) :=
begin
  revert h,
  induction n₂ with n₂ ih; intro h,
  { refl },
  { cases v with b _ v,
    simp [drop],
    rw ih,
    refl }
end

lemma take_def {n₁ n₂ i : ℕ} (v : bv (n₁ + n₂)) (h : i < n₂) :
  (take n₂ v).test_bit h = v.test_bit (lt_of_lt_of_le h (le_add_left _ _)) :=
begin
  revert i,
  induction n₂ with n₂ ih; intros i h,
  { have hn := not_lt_zero i, contradiction },
  { cases v with b _ v,
    cases i with i,
    { refl },
    { simp [take, test_bit],
      rw ih } }
end

private lemma extract_def_bit {n i j k : ℕ} (h₁ : i < n) (h₂ : j ≤ i) (h : k < i - j + 1) : j + k < n :=
begin
  apply lt_of_le_of_lt _ h₁,
  rw ← nat.add_sub_cancel' h₂,
  apply add_le_add_left (le_of_lt_succ h)
end

lemma extract_def {n i j k : ℕ} (h₁ : i < n) (h₂ : j ≤ i) (v : bv n) (h : k < i - j + 1) :
  (extract h₁ h₂ v).test_bit h = v.test_bit (extract_def_bit h₁ h₂ h) :=
begin
  simp [extract, take_def, drop_def, test_bit_cong],
  cc
end

lemma drop_to_nat {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)) :
  (drop n₂ v).to_nat = v.to_nat / 2^n₂ :=
begin
  induction n₂ with n₂ ih,
  { simp [drop] },
  { cases v with b _ v,
    simp [drop, bv.to_nat],
    rw ih,
    rw pow2_succ,
    rw ← nat.div_div_eq_div_mul,
    rw bit_div_two }
end

lemma take_to_nat {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)) :
  (take n₂ v).to_nat = v.to_nat % 2^n₂ :=
begin
  induction n₂ with n₂ ih,
  { simp [take, bv.to_nat] },
  { cases v with b _ v,
    simp [take, bv.to_nat],
    rw ih,
    rw nat.mod_pow_succ two_pos,
    rw [bit_div_two, bit_mod_two],
    rw bit_val }
end

lemma concat_drop_take {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)) :
  concat (drop n₂ v) (take n₂ v) = v :=
begin
  rw ← to_nat_inj,
  simp [concat_to_nat, drop_to_nat, take_to_nat],
  simp [add_comm, mod_add_div, mul_comm]
end

lemma drop_concat {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) :
  drop n₂ (concat v₁ v₂) = v₁ :=
begin
  rw ← test_bit_inj; intros,
  rw [drop_def, concat_def₁]
end

lemma take_concat {n₁ n₂ : ℕ} (v₁ : bv n₁) (v₂ : bv n₂) :
  take n₂ (concat v₁ v₂) = v₂ :=
begin
  rw ← test_bit_inj; intros,
  rw [take_def, concat_def₂]
end

lemma drop_hom_to_nat {f g} (h : hom_nat f g) {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)) :
  (drop n₂ (f v)).to_nat = (g v.to_nat) / 2^n₂ % 2^n₁ :=
begin
  simp [h, drop_to_nat, to_of_nat],
  rw [nat.pow_add, mod_mul_left_div_self]
end

lemma drop_hom_to_nat₂ {f g} (h : hom_nat₂ f g) {n₁ n₂ : ℕ} (v₁ v₂ : bv (n₁ + n₂)) :
  (drop n₂ (f v₁ v₂)).to_nat = (g v₁.to_nat v₂.to_nat) / 2^n₂ % 2^n₁ :=
begin
  simp [h, drop_to_nat, to_of_nat],
  rw [nat.pow_add, mod_mul_left_div_self]
end

lemma take_hom_to_nat {f g} (h : hom_nat f g) {n₁ n₂ : ℕ} (v : bv (n₁ + n₂)) :
  (take n₂ (f v)).to_nat = (g v.to_nat) % 2^n₂ :=
begin
  simp [h, take_to_nat, to_of_nat],
  apply mod_mod_of_dvd,
  apply nat.pow_dvd_pow,
  apply nat.le_add_left
end

lemma take_hom_to_nat₂ {f g} (h : hom_nat₂ f g) {n₁ n₂ : ℕ} (v₁ v₂ : bv (n₁ + n₂)) :
  (take n₂ (f v₁ v₂)).to_nat = (g v₁.to_nat v₂.to_nat) % 2^n₂ :=
begin
  simp [h, take_to_nat, to_of_nat],
  apply mod_mod_of_dvd,
  apply nat.pow_dvd_pow,
  apply nat.le_add_left
end

private lemma extract_of_drop_cong {n j : ℕ} (h : j ≤ n) : succ n = n - j + 1 + j :=
by rw [add_assoc, add_comm 1, ← add_assoc, nat.sub_add_cancel h]

lemma extract_of_drop {n j : ℕ} (h : j ≤ n) (v : bv n.succ) :
  extract (lt_succ_self n) h v = drop j (v.cong (extract_of_drop_cong h)) :=
begin
  rw ← to_nat_inj,
  simp [extract, take_to_nat, drop_to_nat],
  rw mod_eq_of_lt,
  rw div_lt_iff_lt_mul _ _ (pow2_pos _),
  rw [← nat.pow_add, add_assoc, add_comm 1 j, ← add_assoc, nat.sub_add_cancel h],
  apply to_nat_lt
end

private lemma extract_of_take_cong {n i : ℕ} (h : i < n) : n = n - (i + 1) + (i + 1) :=
by rw nat.sub_add_cancel (succ_le_of_lt h)

lemma extract_of_take {n i : ℕ} (h : i < n) (v : bv n) :
  extract h i.zero_le v = take (i + 1) (v.cong (extract_of_take_cong h)) := rfl

end extraction

section bitwise

variable {n : ℕ}

lemma map_def (f : bool → bool) : ∀ (v : bv n) {i : ℕ} (h : i < n),
  (bv.map f v).test_bit h = f (v.test_bit h) :=
begin
  intro v,
  induction v with b n v ih; intros,
  { have hn := not_lt_zero i, contradiction },
  { cases i; simp [bv.map, test_bit, ih] }
end

lemma map₂_def (f : bool → bool → bool) : ∀ (v₁ v₂ : bv n) {i : ℕ} (h : i < n),
  (bv.map₂ f v₁ v₂).test_bit h = f (v₁.test_bit h) (v₂.test_bit h) :=
begin
  induction n with n ih; intros,
  { have hn := not_lt_zero i, contradiction },
  { cases v₁ with b₁ _ v₁,
    cases v₂ with b₂ _ v₂,
    cases i; simp [bv.map₂, test_bit, ih ] }
end

lemma not_def : ∀ (v : bv n) {i : ℕ} (h : i < n),
  (bv.not v).test_bit h = bnot (v.test_bit h) := map_def bnot

lemma and_def : ∀ (v₁ v₂ : bv n) {i : ℕ} (h : i < n),
  (bv.and v₁ v₂).test_bit h = band (v₁.test_bit h) (v₂.test_bit h) := map₂_def band

lemma or_def : ∀ (v₁ v₂ : bv n) {i : ℕ} (h : i < n),
  (bv.or v₁ v₂).test_bit h = bor (v₁.test_bit h) (v₂.test_bit h) := map₂_def bor

lemma xor_def : ∀ (v₁ v₂ : bv n) {i : ℕ} (h : i < n),
  (bv.xor v₁ v₂).test_bit h = bxor (v₁.test_bit h) (v₂.test_bit h) := map₂_def bxor

lemma not_to_nat (v : bv n) :
  v.not.to_nat = 2^n - 1 - v.to_nat :=
begin
  apply eq.symm,
  rw nat.sub_eq_iff_eq_add (to_nat_le _),
  simp [bv.not],
  induction v with b n v ih; try { refl },
  simp [bv.map, bv.to_nat],
  rw [← bit1_pow2_sub_one, ih],
  cases b; simp [bit_val, bit1_val]; ring
end

lemma map₂_to_nat {f : bool → bool → bool} (h : f ff ff = ff) (v₁ v₂ : bv n) :
  (bv.map₂ f v₁ v₂).to_nat = bitwise f (v₁.to_nat) (v₂.to_nat) :=
begin
  induction n with n ih;
  cases v₁ with b₁ _ v₁;
  cases v₂ with b₂ _ v₂;
  simp [bv.map₂, bv.to_nat],
  rw [bitwise_bit h, ih]
end

lemma and_to_nat : ∀ (v₁ v₂ : bv n),
  (v₁.and v₂).to_nat = (v₁.to_nat).land (v₂.to_nat) := map₂_to_nat rfl

lemma or_to_nat : ∀ (v₁ v₂ : bv n),
  (v₁.or v₂).to_nat = (v₁.to_nat).lor (v₂.to_nat) := map₂_to_nat rfl

lemma xor_to_nat : ∀ (v₁ v₂ : bv n),
  (v₁.xor v₂).to_nat = (v₁.to_nat).lxor (v₂.to_nat) := map₂_to_nat rfl

end bitwise

section arithmetic

variable {n : ℕ}

lemma neg_def (v : bv n) :
  -v = bv.of_nat n (2^n - v.to_nat) :=
begin
  have h : -v = bv.neg v := rfl,
  simp [h, bv.neg, shiftl_eq_mul_pow]
end

lemma neg_def_int (v : bv n) :
  -v = bv.of_int n (-v.to_int) :=
begin
  rw [neg_def, ← of_int_coe_nat, to_int_of_to_nat],
  apply of_int_modeq,
  cases decidable.em (v.to_nat < 2^(n - 1)) with h h; simp [h];
  rw int.coe_nat_sub (le_of_lt (to_nat_lt _)); simp,
  calc
    (2^n : ℤ) - v.to_nat ≡ 0 - v.to_nat [ZMOD 2 ^ n] : by { apply int.modeq.modeq_sub; simp [int.modeq] }
                     ... = -v.to_nat : by simp
end

lemma neg_to_nat (v : bv n) :
  (-v).to_nat = if v.to_nat = 0 then 0 else 2^n - v.to_nat :=
begin
  simp [neg_def, to_of_nat, shiftl_eq_mul_pow],
  cases eq.decidable v.to_nat 0 with h h; simp [h],
  apply mod_eq_of_lt,
  apply sub_lt (pow2_pos _) (nat.pos_of_ne_zero h)
end

lemma add_def (v₁ v₂ : bv n) :
  v₁ + v₂ = bv.of_nat n (v₁.to_nat + v₂.to_nat) :=
begin
  have h : v₁ + v₂ = bv.add v₁ v₂ := rfl,
  simp [h, bv.add]
end

lemma add_to_nat (v₁ v₂ : bv n) :
  (v₁ + v₂).to_nat = (v₁.to_nat + v₂.to_nat) % 2^n :=
by simp [add_def, to_of_nat]

lemma sub_def (v₁ v₂ : bv n) :
  v₁ - v₂ = v₁ + -v₂ := rfl

lemma sub_to_nat (v₁ v₂ : bv n) :
  (v₁ - v₂).to_nat = if v₂.to_nat ≤ v₁.to_nat then v₁.to_nat - v₂.to_nat else 2^n + v₁.to_nat - v₂.to_nat :=
begin
  simp [sub_def, add_to_nat, neg_to_nat],
  cases eq.decidable v₂.to_nat 0 with hz hz; simp [hz],
  rw [← nat.add_sub_assoc (le_of_lt (to_nat_lt _)), add_comm],
  cases le_or_gt v₂.to_nat v₁.to_nat with hcmp hcmp,
  { rw [if_pos]; try { assumption },
    rw nat.add_sub_assoc hcmp,
    rw add_mod_left,
    apply mod_eq_of_lt,
    apply lt_of_le_of_lt (sub_le _ _) (to_nat_lt _) },
  { rw [if_neg]; try { apply not_le_of_gt hcmp },
    apply mod_eq_of_lt,
    rw nat.sub_lt_right_iff_lt_add,
    { apply add_lt_add_left hcmp },
    { apply le_of_lt,
      apply lt_of_lt_of_le (to_nat_lt _),
      apply nat.le_add_right } }
end

lemma mul_def (v₁ v₂ : bv n) :
  v₁ * v₂ = bv.of_nat n (v₁.to_nat * v₂.to_nat) :=
begin
  have h : v₁ * v₂ = bv.mul v₁ v₂ := rfl,
  simp [h, bv.mul]
end

lemma mul_to_nat (v₁ v₂ : bv n) :
  (v₁ * v₂).to_nat = (v₁.to_nat * v₂.to_nat) % 2^n :=
by simp [mul_def, to_of_nat]

private lemma to_def_eq_zero_to_nat (v : bv n) :
  v.to_def = 0 ↔ v.to_nat = 0 :=
by simp [← num.to_nat_inj]

lemma udiv_def (v₁ v₂ : bv n) :
  v₁ / v₂ = if v₂.to_nat = 0 then bv.ones n else bv.of_nat n (v₁.to_nat / v₂.to_nat) :=
begin
  have h : v₁ / v₂ = bv.udiv v₁ v₂ := rfl,
  simp [h, bv.udiv, to_def_eq_zero_to_nat],
end

-- note that a % 0 = 0 for nat (rather than 2^n - 1)
lemma udiv_to_nat (v₁ v₂ : bv n) :
  (v₁ / v₂).to_nat = if v₂.to_nat = 0 then 2^n - 1 else (v₁.to_nat / v₂.to_nat) :=
begin
  simp [udiv_def],
  cases (nat.decidable_eq v₂.to_nat 0) with h h; simp [h],
  { rw [to_of_nat],
    apply mod_eq_of_lt,
    apply lt_of_le_of_lt (nat.div_le_self _ _) (to_nat_lt _) },
  { apply ones_to_nat }
end

lemma urem_def (v₁ v₂ : bv n) :
  v₁ % v₂ = if v₂.to_nat = 0 then v₁ else bv.of_nat n (v₁.to_nat % v₂.to_nat) :=
begin
  have h : v₁ % v₂ = bv.urem v₁ v₂ := rfl,
  simp [h, bv.urem, to_def_eq_zero_to_nat],
end

-- drop the zero case as a % 0 = a for nat
lemma urem_to_nat (v₁ v₂ : bv n) :
  (v₁ % v₂).to_nat = v₁.to_nat % v₂.to_nat :=
begin
  simp [urem_def],
  cases (nat.decidable_eq v₂.to_nat 0) with h h; simp [h],
  rw [to_of_nat],
  apply mod_eq_of_lt,
  apply lt_of_le_of_lt (mod_le _ _) (to_nat_lt _)
end

theorem urem_add_udiv (v₁ v₂ : bv n) :
  v₁ % v₂ + v₂ * (v₁ / v₂) = v₁ :=
begin
  rw ← to_nat_inj,
  rw [add_to_nat, urem_to_nat, mul_to_nat, udiv_to_nat],
  cases (nat.decidable_eq v₂.to_nat 0) with h h; simp [h],
  simp [nat.mod_add_div]
end

end arithmetic

section ring

variable {n : ℕ}

protected lemma add_comm (v₁ v₂ : bv n) : v₁ + v₂ = v₂ + v₁ :=
by { rw ← to_nat_inj, simp [add_to_nat, add_comm] }

protected lemma add_zero (v : bv n) : v + 0 = v :=
begin
  rw ← to_nat_inj,
  simp [add_to_nat, zero_to_nat]
end

protected lemma zero_add (v : bv n) : 0 + v = v :=
  bv.add_comm v 0 ▸ bv.add_zero v

protected lemma add_assoc (v₁ v₂ v₃ : bv n) : v₁ + v₂ + v₃ = v₁ + (v₂ + v₃) :=
begin
  rw ← to_nat_inj,
  simp [add_to_nat],
  simp [add_mod_mod, add_comm, add_assoc]
end

protected lemma add_left_neg (v : bv n) : -v + v = 0 :=
begin
  rw ← to_nat_inj,
  rw [add_to_nat, neg_to_nat, zero_to_nat],
  cases eq.decidable v.to_nat 0 with h h; simp [h],
  rw nat.sub_add_cancel; simp,
  apply le_of_lt (to_nat_lt _)
end

protected lemma mul_comm (v₁ v₂ : bv n) : v₁ * v₂ = v₂ * v₁ :=
by { rw ← to_nat_inj, simp [mul_to_nat, mul_comm] }

protected lemma mul_one (v : bv n) : v * 1 = v :=
begin
  rw ← to_nat_inj,
  simp [mul_to_nat, one_to_nat],
  cases eq.decidable n 0 with h h; simp [h],
  subst n,
  cases v, refl
end

protected lemma one_mul (v : bv n) : 1 * v = v :=
  bv.mul_comm v 1 ▸ bv.mul_one v

protected lemma mul_assoc (v₁ v₂ v₃ : bv n) : v₁ * v₂ * v₃ = v₁ * (v₂ * v₃) :=
begin
  rw ← to_nat_inj,
  simp [mul_to_nat],
  rw [mul_mod _ v₃.to_nat, mod_mod, ← mul_mod],
  rw [mul_mod v₁.to_nat, mod_mod, ← mul_mod],
  rw mul_assoc
end

protected lemma distrib_left (v₁ v₂ v₃ : bv n) : v₁ * (v₂ + v₃) = v₁ * v₂ + v₁ * v₃ :=
begin
  rw ← to_nat_inj,
  simp [add_to_nat, mul_to_nat],
  rw [mul_mod v₁.to_nat, mod_mod, ← mul_mod],
  rw nat.left_distrib
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

lemma shl_def (v₁ v₂ : bv n) :
  v₁.shl v₂ = bv.of_nat n (v₁.to_nat * 2^v₂.to_nat) :=
by simp [bv.shl, shiftl_eq_mul_pow]

lemma shl_to_nat (v₁ v₂ : bv n) :
  (v₁.shl v₂).to_nat = v₁.to_nat * (2^v₂.to_nat) % 2^n :=
by rw [shl_def, to_of_nat]

lemma shl_above (v₁ v₂ : bv n) (h : n ≤ v₂.to_nat) :
  v₁.shl v₂ = 0 :=
begin
  rw ← to_nat_inj,
  simp [shl_to_nat, zero_to_nat],
  apply mod_eq_zero_of_dvd,
  apply dvd_trans _ (dvd_mul_left _ _),
  apply nat.pow_dvd_pow _ h
end

lemma lshr_def (v₁ v₂ : bv n) :
  v₁.lshr v₂ = bv.of_nat n (v₁.to_nat / 2^v₂.to_nat) :=
by simp [bv.lshr, shiftl_eq_mul_pow]

lemma lshr_to_nat (v₁ v₂ : bv n) :
  (v₁.lshr v₂).to_nat = v₁.to_nat / (2^v₂.to_nat) :=
begin
  rw [lshr_def, to_of_nat],
  apply mod_eq_of_lt,
  apply lt_of_le_of_lt (nat.div_le_self _ _) (to_nat_lt _)
end

lemma lshr_above (v₁ v₂ : bv n) (h : n ≤ v₂.to_nat) :
  v₁.lshr v₂ = 0 :=
begin
  rw ← to_nat_inj,
  simp [lshr_to_nat, zero_to_nat],
  apply div_eq_of_lt,
  apply lt_of_lt_of_le (to_nat_lt _),
  apply pow_le_pow_of_le_right two_pos h
end

end bitwise

section order

variable {n : ℕ}

lemma ult_to_nat (v₁ v₂ : bv n) :
  v₁.ult v₂ = (v₁.to_nat < v₂.to_nat) :=
begin
  have h : v₁.to_def < v₂.to_def ↔ v₁.to_nat < v₂.to_nat,
  { simp [← num.lt_to_nat] },
  unfold bv.ult, rw h
end

lemma ule_to_nat (v₁ v₂ : bv n) :
  v₁.ule v₂ = (v₁.to_nat ≤ v₂.to_nat) :=
begin
  rw [bv.ule, ← to_nat_inj, ult_to_nat],
  rw [le_iff_eq_or_lt, or_comm]
end

protected lemma ule_refl (v : bv n): v.ule v :=
by simp [bv.ule]

protected lemma ule_trans (v₁ v₂ v₃ : bv n) :
  v₁.ule v₂ → v₂.ule v₃ → v₁.ule v₃ :=
begin
  repeat { rw ule_to_nat },
  apply le_trans
end

protected lemma ule_antisymm (v₁ v₂ : bv n) :
  v₁.ule v₂ →
  v₂.ule v₁ →
  v₁ = v₂ :=
begin
  repeat { rw ule_to_nat },
  rw ← to_nat_inj,
  apply le_antisymm
end

protected lemma ule_total (v₁ v₂ : bv n) :
  v₁.ule v₂ ∨ v₂.ule v₁ :=
by simp [ule_to_nat, le_total]

protected lemma ult_iff_ule_not_ule (v₁ v₂ : bv n) :
  v₁.ult v₂ ↔ v₁.ule v₂ ∧ ¬ v₂.ule v₁ :=
begin
  rw ult_to_nat,
  repeat { rw ule_to_nat },
  apply lt_iff_le_not_le
end

@[priority 101]
instance unsigned : decidable_linear_order (bv n) :=
{ le               := bv.ule,
  decidable_le     := bv.decidable_ule,
  le_refl          := bv.ule_refl,
  le_trans         := bv.ule_trans,
  le_antisymm      := bv.ule_antisymm,
  le_total         := bv.ule_total,
  lt               := bv.ult,
  decidable_lt     := bv.decidable_ult,
  lt_iff_le_not_le := bv.ult_iff_ule_not_ule }

lemma slt_to_int (v₁ v₂ : bv n.succ) :
  v₁.slt v₂ = (v₁.to_int < v₂.to_int) :=
begin
  simp [bv.slt, to_int_of_to_nat],
  simp [← msb_eq_ff_to_nat],
  cases v₁.msb; cases v₂.msb; simp [ult_to_nat];
  try { apply le_of_lt }; apply lt_of_lt_of_le _ (int.coe_zero_le _);
  simp; norm_cast; apply to_nat_lt
end

lemma sle_iff_eq_or_slt (v₁ v₂ : bv n.succ) :
  v₁.sle v₂ = (v₁ = v₂ ∨ v₁.slt v₂) :=
begin
  simp [bv.sle, bv.slt, bv.ule],
  cases eq.decidable v₁ v₂ with h h; simp [h]
end

lemma sle_to_int (v₁ v₂ : bv n.succ) :
  v₁.sle v₂ = (v₁.to_int ≤ v₂.to_int) :=
begin
  rw [sle_iff_eq_or_slt, slt_to_int, ← to_int_inj],
  rw le_iff_eq_or_lt
end

protected lemma sle_refl (v : bv n.succ) :
  v.sle v :=
by simp [bv.sle, bv.ule]

protected lemma sle_trans (v₁ v₂ v₃ : bv n.succ) :
  v₁.sle v₂ →
  v₂.sle v₃ →
  v₁.sle v₃ :=
begin
  simp [sle_to_int],
  apply le_trans
end

protected lemma sle_antisymm (v₁ v₂ : bv n.succ) :
  v₁.sle v₂ →
  v₂.sle v₁ →
  v₁ = v₂ :=
begin
  intros h1 h2,
  cases h1; cases h2; try { cc },
  cases h1, cases h2,
  apply bv.ule_antisymm; assumption
end

protected lemma sle_total (v₁ v₂ : bv n.succ) :
  v₁.sle v₂ ∨ v₂.sle v₁ :=
by simp [sle_to_int, le_total]

protected lemma slt_iff_sle_not_sle (v₁ v₂ : bv n.succ) :
  v₁.slt v₂ ↔ v₁.sle v₂ ∧ ¬ v₂.sle v₁ :=
begin
  rw slt_to_int,
  repeat { rw sle_to_int },
  apply lt_iff_le_not_le
end

@[priority 100]
instance signed : decidable_linear_order (bv n.succ) :=
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
