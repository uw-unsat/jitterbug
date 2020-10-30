
import tactic.tauto

/-!
This file contains the metatheory of JIT correctness.

The main theorem is interpreter_equivalence, proved based on the following two sets of axioms.

Two axioms are assumed to be correct (e.g., ensured by the Linux kernel):

* ctx_correctness: the JIT computes a correct JIT context for the source program

* layout_consistency: the output of the JIT contains the output of individual parts.

Three axioms about the correctness of individal parts of the JIT are expected
to be proved separately in SMT:

* prologue_correct: running the emitted prologue from the initial target state reaches a target
  state that relates to the initial source state.

* per_insn_correct: running the emitted target code preserves the relation between source and
  target states and produces the same trace.

* epilogue_correct: running the emitted epilogue from a target state that relates to the final
  source state reaches the final target state.

## References

* Xavier Leroy. A formally verified compiler back-end. Journal of Automated
  Reasoning, 43(4):363--446, December 2009.
-/

namespace machine
section machine

  parameters {CONTEXT EVENT ORACLE INPUT OUTPUT PC STATE INSN : Type}

  -- A trace is a list of externally visible events.
  definition TRACE : Type := list EVENT
  instance : has_append TRACE := ⟨list.append⟩

  -- Get program counter of machine.
  parameter pc_of : STATE → PC

  -- Step a given instruction, producing new state and trace.
  parameter step_insn : ORACLE → INSN → STATE → option (STATE × TRACE)

  -- Code is a partial map from PC to instruction.  We intentionally avoid
  -- using a list and favor this more abstract representation.
  definition CODE : Type := PC → option INSN

  -- Whether the state is an inital state.
  parameter initial : STATE → CONTEXT → INPUT → Prop

  -- Whether the state is a final state.
  parameter final : STATE → OUTPUT → Prop

  inductive step (nd : ORACLE) (code : CODE) (σ : STATE) : STATE → TRACE → Prop
  -- Can take a step if there exists an instruction to execute and the state is not final.
  | step_one :
      ∀ (insn : INSN) (σ' : STATE) (tr : TRACE),
        code (pc_of σ) = some insn →
        step_insn nd insn σ = some (σ', tr) →
        (¬ ∃ (r : OUTPUT), final σ r) →
        step σ' tr
  -- Final states step to themselves.
  | step_final :
      ∀ (o : OUTPUT),
        final σ o →
        step σ []

  -- Step behaves like a function.
  lemma step_deterministic :
    ∀ (nd : ORACLE) (code : CODE) (s s1' s2' : STATE) (tr1 tr2 : TRACE),
      step nd code s s1' tr1 →
      step nd code s s2' tr2 →
      (s1' = s2' ∧ tr1 = tr2) :=
  begin
    intros _ _ _ _ _ _ _ S1 S2,
    cases S1 with S1_insn B C S1_code S1_dostep S1_notfinal S1_r S2_final;
    cases S2 with S2_insn J K S2_code S2_dostep S2_notfinal S2_r S2_final,
    { rw S1_code at *,
      cases S2_code,
      rw S1_dostep at *,
      cases S2_dostep, by tauto,
    },
    { exfalso, apply S1_notfinal,
      existsi S2_r, by assumption,
    },
    { exfalso, apply S2_notfinal,
      existsi S1_r, by assumption,
    },
    { by tauto, },
  end

  -- A standard way to define reachable states.
  inductive star (nd : ORACLE) (code : CODE) : STATE → STATE → TRACE → Prop
  | refl :
    ∀ (a : STATE),
      star a a []
  | step :
    ∀ (a b c : STATE) (tr₁ tr₂ : TRACE),
      step nd code a b tr₁ →
      star b c tr₂ →
      star a c (tr₁ ++ tr₂)

  -- A safe state can always fetch an instruction from any reachable state,
  -- or it's the final state
  definition safe (nd : ORACLE) (code : CODE) (σ : STATE) : Prop :=
    ∀ (σ' : STATE) (tr : TRACE),
      star nd code σ σ' tr →
      (∃ (insn : INSN), code (pc_of σ') = some insn) ∨ (∃ (o : OUTPUT), final σ' o)

  -- If you can take one step, you can show star.
  lemma star_one :
    ∀ (nd : ORACLE) (code : CODE) (a b : STATE) (tr : TRACE),
      step nd code a b tr →
      star nd code a b tr :=
  begin
    intros,
    rw ← list.append_nil tr,
    constructor,
    { assumption },
    { constructor }
  end

  -- Star is transitive for fixed code and appending traces.
  lemma star_trans :
    ∀ (nd : ORACLE) (code : CODE) (a b : STATE) (tr₁ : TRACE),
      star nd code a b tr₁ →
      ∀ (c : STATE) (tr₂ : TRACE),
        star nd code b c tr₂ →
        star nd code a c (tr₁ ++ tr₂) :=
  begin
    intros nd code _ _ _ Hab,
    induction Hab with _ _ _ _ _ _ _ _ Hab_ih; intros; simp,
    { assumption },
    { constructor,
      { assumption },
      { apply Hab_ih,
        assumption } }
  end

  -- c1 is a subset of c2 if any instruction c1 has is also in c2.
  definition subset (c1 c2 : CODE) : Prop :=
    ∀ (idx : PC) (insn : INSN),
      c1 idx = some insn →
      c2 idx = some insn
  local infix ` <+ ` := subset

  lemma step_subset :
    ∀ (nd : ORACLE) (code₁ code₂ : CODE) (s1 s2 : STATE) (tr : TRACE),
      step nd code₁ s1 s2 tr →
      code₁ <+ code₂ →
      step nd code₂ s1 s2 tr :=
  begin
    intros _ _ _ _ _ _ H1 H2,
    cases H1 with H1_insn _ _ H1_a H1_a_1 H1_a_2 _ H1_a,
    { apply step.step_one,
      apply H2,
      from H1_a,
      by assumption,
      by assumption },
    { apply step.step_final,
      from H1_a }
  end

  -- If you can star given some code, you can always
  -- add more code and preserve star.
  lemma star_subset :
    ∀ (nd : ORACLE) (code₁ code₂ : CODE) (s1 s2 : STATE) (tr : TRACE),
      star nd code₁ s1 s2 tr →
      code₁ <+ code₂ →
      star nd code₂ s1 s2 tr :=
  begin
    intros _ _ _ _ _ _ H1 _,
    induction H1,
    { apply star.refl, },
    econstructor,
    { apply step_subset, all_goals {assumption}, },
    assumption,
  end

  lemma final_step :
    ∀ (nd : ORACLE) (s : STATE) (c : CODE) (o : OUTPUT),
      final s o →
      ∀ (s' : STATE) (tr : TRACE),
        step nd c s s' tr →
        tr = [] ∧ s' = s :=
  begin
    intros _ _ _ _ h1 _ _ h2,
    cases h2 with _ _ _ h2_a h2_a_1 h2_a_2 _ h2_a,
    { exfalso, apply h2_a_2,
      existsi o, by assumption },
    { cc }
  end

  lemma final_star :
    ∀ (nd : ORACLE) (s : STATE) (c : CODE) (o : OUTPUT),
      final s o →
      ∀ (s' : STATE) (tr : TRACE),
        star nd c s s' tr →
        (tr = [] ∧ s' = s) :=
  begin
    intros _ _ _ _ h1 _ _ h2,
    induction h2 with s2 s1 s2 s3 tr1 tr2 h3 h4 IH, cc,
    have : tr1 = [] ∧ s2 = s1,
      by { apply final_step; assumption <|> skip, from h1 },
    cases this, subst this_left, subst this_right, simp, cc,
  end

  -- A final state is always safe.
  lemma final_safe :
    ∀ (nd : ORACLE) (code : CODE) (s : STATE) (o : OUTPUT),
      final s o →
      safe nd code s :=
  begin
    dsimp [safe, machine.safe], intros _ _ _ _ a _ _ a_1, right,
    induction a_1 with _ _ _ _ _ _ a_1_a a_1_a_1,
    { existsi o, by assumption },
    { apply a_1_ih,
      cases a_1_a with _ _ _ a_1_a_a a_1_a_a_1 a_1_a_a_2 _ a_1_a_a,
      { exfalso, apply a_1_a_a_2,
        existsi o,
        assumption },
      { assumption } }
  end

  -- A safe state can always take a step if it's not final.
  lemma safe_self :
    ∀ (nd : ORACLE) (code : CODE) (s : STATE),
      safe nd code s →
      (¬ ∃ (o : OUTPUT), final s o) →
      ∃ (insn : INSN),
        code (pc_of s) = some insn :=
  begin
    intros _ _ _ a a_1,
    dsimp [safe] at *,
    specialize a s [] (by constructor),
    cases a with insn a,
    by assumption,
    cases a with res res_final,
    exfalso, apply a_1, existsi res, by assumption,
  end

  -- A safe state is still safe after one step.
  lemma safe_step :
    ∀ (nd : ORACLE) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE),
      safe nd code s₁ →
      step nd code s₁ s₂ tr →
      safe nd code s₂ :=
  begin
    intros _ _ _ _ _ H1 _,
    simp [safe] at *,
    intros _ _ _,
    specialize H1 _ (tr ++ tr_1),
    apply H1,
    constructor; assumption,
  end

  -- Safety is preserved across an arbitrary number of steps.
  lemma safe_star :
    ∀ (nd : ORACLE) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE),
      safe nd code s₁ →
      star nd code s₁ s₂ tr →
      safe nd code s₂ :=
  begin
    intros _ _ _ _ _ a a_1,
    induction a_1, by assumption,
    apply a_1_ih,
    apply safe_step; assumption,
  end

  -- If a state is safe, and it was obtained by taking a step,
  -- then the state it stepped from is also safe.
  lemma safe_step_backwards :
    ∀ (nd : ORACLE) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE),
      safe nd code s₂ →
      step nd code s₁ s₂ tr →
      safe nd code s₁ :=
  begin
    intros _ _ _ _ _ a a_1,
    simp [safe] at *, intros _ _ a_2,
    cases a_2 with _ _ _ _ _ _ a_2_a a_2_a_1,
    { cases a_1,
      left, existsi a_1_insn, by assumption,
      right, existsi a_1_o, by assumption },
    { apply a,
      suffices h : a_2_b = s₂,
      rw h at *,
      { rw h at *,
        by assumption },
      cases (step_deterministic _ _ _ _ code _ _ _ _ _ a_2_a a_1),
      by assumption,
    },
  end

  -- A state that eventually terminates is always safe.
  lemma terminates_safe :
    ∀ (nd : ORACLE) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE) (o : OUTPUT),
      star nd code s₁ s₂ tr →
      final s₂ o →
      safe nd code s₁ :=
  begin
    intros _ _ _ _ _ _ a a_1,
    induction a,
    apply final_safe; assumption,
    apply safe_step_backwards; try{assumption},
    apply a_ih, assumption,
  end

  -- Holds if the code always terminates
  definition always_terminates (code : CODE) : Prop :=
    ∀ (ctx : CONTEXT) (nd : ORACLE) (s : STATE) (i : INPUT),
      initial s ctx i →
      ∃ (s' : STATE) (tr : TRACE) (o : OUTPUT),
        star nd code s s' tr ∧
        final s' o

  -- A program which always terminates is same from the initial state.
  lemma always_terminates_safe :
    ∀ (ctx : CONTEXT) (s : STATE) (code : CODE) (i : INPUT),
      always_terminates code  →
      ∀ (nd : ORACLE),
        initial s ctx i →
        safe nd code s :=
  begin
    intros _ _ _ _ a _ a_1,
    dsimp [always_terminates] at *,
    specialize a ctx nd s i a_1,
    cases a with _ a,
    cases a with _ a,
    cases a with _ a,
    cases a with _ a,
    apply machine.terminates_safe; assumption,
  end

end machine
end machine

-- Re-declare infix notation outside of machine scope.
local infix ` <+ ` := machine.subset

constants CONTEXT EVENT ORACLE INPUT OUTPUT : Type

definition TRACE : Type := @machine.TRACE EVENT

noncomputable instance : has_append TRACE := ⟨list.append⟩

-- This models the behavior of the source language.

namespace source

  constants INSN PC STATE : Type
  constant pc_of : STATE → PC
  constant step_insn : ORACLE → INSN → STATE → option (STATE × TRACE)
  constant final : STATE → OUTPUT → Prop
  constant initial : STATE → CONTEXT → INPUT → Prop

  axiom initial_inhabited : ∀ (i : INPUT) (ctx : CONTEXT), ∃ (s : STATE), initial s ctx i

  definition step := machine.step pc_of step_insn final
  definition star := machine.star pc_of step_insn final
  definition safe := machine.safe pc_of step_insn final

  @[simp] definition always_terminates := machine.always_terminates pc_of step_insn initial final
  definition CODE : Type := @machine.CODE PC INSN

  -- This captures whether a JIT context is well-formed for a particular source BPF program.
  constant wf : CONTEXT → CODE → Prop

end source

-- This models the behavior of the target language.

namespace target

  constants INSN PC STATE : Type
  constant pc_of : STATE → PC
  constant step_insn : ORACLE → INSN → STATE → option (STATE × TRACE)
  constant final : STATE → OUTPUT → Prop
  definition CODE : Type := @machine.CODE PC INSN
  constant initial : STATE → CONTEXT → INPUT → Prop

  definition step := machine.step pc_of step_insn final
  @[reducible] definition star := machine.star pc_of step_insn final

  -- Whether the architectural invariants hold for some state
  -- w.r.t an initial state
  constant arch_safe : STATE → STATE → Prop

  -- Inductive form of arch safety, depends on ctx.
  constant arch_safe_inv : CONTEXT → STATE → STATE → Prop

  -- The output of a final state is uniquely determined by the state.
  axiom output_deterministic :
    ∀ (s : STATE) (o₁ o₂ : OUTPUT),
      final s o₁ →
      final s o₂ →
      o₁ = o₂

end target

-- This models the JIT implementation.

namespace jit

  -- Emit target code for a single source instruction.
  constant emit_insn : CONTEXT → source.INSN → source.PC → option target.CODE

  constant emit_prologue : CONTEXT → option target.CODE

  constant emit_epilogue : CONTEXT → option target.CODE

  -- Emit target code for an entire source program, including BPF checker, prologue, and epilogue.
  constant compile : CONTEXT → source.CODE → option target.CODE

  -- If the JIT suceeds for an entire source program,
  -- it must have succeeded for each (valid) source instruction,
  -- and the produced code must contain the prologue and epilogue.
  --
  -- This is assumed to hold.
  axiom layout_consistency :
    ∀ (ctx : CONTEXT) (code_S : source.CODE) (code_T : target.CODE),
      source.wf ctx code_S →
      jit.compile ctx code_S = some code_T →
      (∀ (i : source.PC) (insn : source.INSN),
        code_S i = some insn →
        ∃ (frag_T : target.CODE),
          jit.emit_insn ctx insn i = some frag_T ∧ frag_T <+ code_T) ∧
      (∃ (frag_T : target.CODE), jit.emit_prologue ctx = some frag_T ∧ frag_T <+ code_T) ∧
      (∃ (frag_T : target.CODE), jit.emit_epilogue ctx = some frag_T ∧ frag_T <+ code_T)

end jit

-- JIT correctness

-- This relates source and target states, parameterized by a JIT context.
constant related : CONTEXT → source.STATE → target.STATE → Prop
notation s1 `~[`:50 ctx `]` s2:50 := related ctx s1 s2

-- Running the prologue from an initial state produces a target state related to the initial source
-- state (with no trace).
--
-- This is proved in SMT.
axiom prologue_correct :
  ∀ (nd : ORACLE) (ctx : CONTEXT) (σ_T : target.STATE) (σ_S : source.STATE) (i : INPUT)
    (code_S : source.CODE) (code_T : target.CODE),
      source.wf ctx code_S →
      target.initial σ_T ctx i →
      source.initial σ_S ctx i →
      jit.emit_prologue ctx = some code_T →
      ∃ (σ_T' : target.STATE),
        target.star nd code_T σ_T σ_T' [] ∧
        σ_S ~[ctx] σ_T' ∧
        target.arch_safe_inv ctx σ_T σ_T'

-- If the source state has reached a OUTPUT, then executing the epilogue in a related target state
-- reaches a state with the same OUTPUT (and no trace).
--
-- This is proved in SMT.
axiom epilogue_correct :
  ∀ (nd : ORACLE) (ctx : CONTEXT) (code_S : source.CODE) (code_T : target.CODE) (σ_S : source.STATE)
    (init_T σ_T : target.STATE) (o : OUTPUT),
    source.wf ctx code_S →
    σ_S ~[ctx] σ_T →
    target.arch_safe_inv ctx init_T σ_T →
    source.final σ_S o →
    jit.emit_epilogue ctx = some code_T →
    ∃ (σ_T' : target.STATE),
      target.star nd code_T σ_T σ_T' [] ∧
      target.final σ_T' o ∧
      target.arch_safe init_T σ_T'

-- If the JIT produces some code for one source instruction, then starting from related source and
-- target states, stepping the source instruction is related to some state reachable from the
-- target state, for the jited code.
--
-- This is proved in SMT.
axiom per_insn_correct :
  ∀ (nd : ORACLE) (ctx : CONTEXT) (idx : source.PC) (code_S : source.CODE) (insn : source.INSN)
    (frag_T : target.CODE) (σ_S σ_S' : source.STATE) (init_T σ_T : target.STATE) (tr : TRACE)
    (code_T : target.CODE),
      source.wf ctx code_S →
      code_S idx = some insn →
      jit.emit_insn ctx insn idx = some frag_T →
      σ_S ~[ctx] σ_T →
      target.arch_safe_inv ctx init_T σ_T →
      source.pc_of σ_S = idx →
      source.step nd code_S σ_S σ_S' tr →
      ∃ (σ_T' : target.STATE),
        target.star nd frag_T σ_T σ_T' tr ∧ σ_S' ~[ctx] σ_T' ∧ target.arch_safe_inv ctx init_T σ_T'

lemma star_src_correct :
  ∀ (ctx : CONTEXT) (nd : ORACLE) (code_S : source.CODE) (σ_S σ_S' : source.STATE) (tr : TRACE),
    source.wf ctx code_S →
    source.safe nd code_S σ_S →
    source.star nd code_S σ_S σ_S' tr →
    ∀ (init_T σ_T : target.STATE) (code_T : target.CODE),
      σ_S ~[ctx] σ_T →
      target.arch_safe_inv ctx init_T σ_T →
      jit.compile ctx code_S = some code_T →
      ∃ (σ_T' : target.STATE),
        target.star nd code_T σ_T σ_T' tr ∧
        σ_S' ~[ctx] σ_T' ∧
        target.arch_safe_inv ctx init_T σ_T' :=
begin
  intros _ _ _ _ _ _ wf_S safe_S star_S,
  induction star_S with s1 s1 s2 s3 tr1 tr2 step_S star_S' IH,
  { intros _ _ _ related archinv emitted,
    existsi σ_T, split, constructor, split; assumption, },
  intros _ _ _ related archinv emitted,

  -- Handle the case where s1 is a final state. If it is, it steps to itself and
  -- the target state can take zero steps.
  cases step_S with insn _ _ code_at do_step not_final r is_final,
  tactic.swap,
  { apply IH; assumption, },

  have hemit : ∃ f_T, jit.emit_insn ctx insn (source.pc_of s1) = some f_T ∧ f_T <+ code_T,
  {
    cases (jit.layout_consistency ctx code_S code_T wf_S emitted),
    apply left; assumption,
  },
  cases hemit with f_T hemit,
  cases hemit with hemit_left hemit_right,

  have hstep_T : ∃ t2, target.star nd f_T σ_T t2 tr1 ∧ s2 ~[ctx] t2 ∧ target.arch_safe_inv ctx init_T t2,
  {
    apply per_insn_correct; try{assumption <|> reflexivity},
    constructor; assumption,
  },

  cases hstep_T with t2 hstep_T,
  cases hstep_T with hstep_T_left hstep_T_right,

  have hstar_T : ∃ t3, target.star nd code_T t2 t3 tr2 ∧ s3 ~[ctx] t3 ∧ target.arch_safe_inv ctx init_T t3,
  {
    cases hstep_T_right,
    apply IH; try{assumption},
    apply machine.safe_step,
    from safe_S,
    constructor; assumption,
  },

  cases hstar_T with t3 hstar_T,
  cases hstar_T with hstar_T_left hstar_T_right,

  existsi t3,
  split, tactic.swap, assumption,

  apply machine.star_trans; try{assumption},

  apply machine.star_subset; assumption,
end

-- The behavior of the source program is implemented by the jited target code.
theorem forward_simulation :
  ∀ (ctx : CONTEXT) (nd : ORACLE) (code_S : source.CODE) (σ_S σ_S' : source.STATE) (tr : TRACE) (i : INPUT)
    (o : OUTPUT),
      source.wf ctx code_S →
      source.initial σ_S ctx i →
      source.always_terminates code_S →
      source.star nd code_S σ_S σ_S' tr →
      source.final σ_S' o →
      ∀ (σ_T : target.STATE) (code_T : target.CODE),
        target.initial σ_T ctx i →
        jit.compile ctx code_S = some code_T →
        ∃ (σ_T' : target.STATE),
          target.star nd code_T σ_T σ_T' tr ∧
          target.final σ_T' o ∧
          target.arch_safe σ_T σ_T' :=
begin
  intros _ _ _ _ _ _ _ _ wf_S Hinitial_S terminates_S H2 H3 _ _ H4 H5,

  -- Get the code to run in the target and show code_T is a superset of each component
  cases (jit.layout_consistency ctx code_S code_T wf_S H5) with ec_insn ec,
  cases ec with ec_prologue ec_epilogue,

  cases ec_prologue with prologue prologue_subseteq,
  cases prologue_subseteq with prologue_eq prologue_subseteq,
  cases ec_epilogue with epilogue epilogue_subseteq,
  cases epilogue_subseteq with epilogue_eq epilogue_subseteq,

  -- Construct the prologue star
  have hprologue : ∃ t2, target.star nd prologue σ_T t2 [] ∧
                         σ_S ~[ctx] t2 ∧ target.arch_safe_inv ctx σ_T t2,
  { apply prologue_correct; try{assumption},
   },
  cases hprologue with t2 hprologue,
  cases hprologue,

  -- construct the regular instr star using the lemma defined above
  have hstar : ∃ t3, target.star nd code_T t2 t3 tr ∧ σ_S' ~[ctx] t3 ∧ target.arch_safe_inv ctx σ_T t3,
  {
    cases hprologue_right,
    apply star_src_correct; try{assumption},
    apply machine.always_terminates_safe; try{assumption},
  },
  cases hstar with t3 hstar,
  cases hstar with hstar_left hstar_right,

  -- construct the epilogue star
  have hepilogue : ∃ t4, target.star nd epilogue t3 t4 [] ∧ target.final t4 o ∧ target.arch_safe σ_T t4,
  {
    cases hstar_right,
    apply epilogue_correct; by assumption,
  },
  cases hepilogue with t4 hepilogue,
  cases hepilogue,

  -- Now we can glue all the steps together

  existsi t4,
  split, tactic.swap, split,
  cases hepilogue_right with hepilogue_right regs_same,
  by assumption,

  cases hepilogue_right, by assumption,

  -- Run the prologue
  change tr with (list.nil ++ tr),
  apply machine.star_trans,
  {
    apply machine.star_subset,
    apply hprologue_left,
    assumption,
  },

  -- Run the middle
  rewrite ← list.append_nil tr,
  apply machine.star_trans,
  {
    assumption,
  },

  -- Run the epilogue
  apply machine.star_subset,
  from hepilogue_left,
  assumption,
end

lemma target_deterministic :
  ∀ (nd : ORACLE) (code : target.CODE) (σ σ'₁ : target.STATE) (tr₁ : TRACE) (o₁ : OUTPUT),
    target.star nd code σ σ'₁ tr₁ →
    target.final σ'₁ o₁ →
    ∀ (σ'₂ : target.STATE) (tr₂ : TRACE) (o₂ : OUTPUT),
      target.star nd code σ σ'₂ tr₂ →
      target.final σ'₂ o₂ →
      (tr₁ = tr₂ ∧ σ'₁ = σ'₂ ∧ o₁ = o₂) :=
begin
  intros _ _ _ _ _ _ h1 h2,
  induction h1 with s' s' s'' s''' tr1 tr2 h1 h3 IH,
  { intros _ _ _ h4 h5,

    have : tr₂ = [] ∧ σ'₂ = s',
     { apply machine.final_star, tactic.swap,
       from h4,
       from h2,
     },
    cases this,
    rw this_right at *,
    rw this_left at *,
    have : o₁ = o₂, apply target.output_deterministic; try{assumption},
    cc,
  },
  { intros _ _ _ h4 h5,
    cases h4 with _ _ _ h4_b h4_tr₁ h4_tr₂ h4_a h4_a_1,
    { have : tr1 = [] ∧ s'' = s',
        by { apply machine.final_step, from h5, all_goals{assumption}},
      cases this, subst this_left, subst this_right,
      simp,
      apply IH; tauto,
    },
    { cases (machine.step_deterministic _ _ _ _ code _ _ _ _ _ h4_a h1),
      rw left at *,
      rw right at *,
      suffices : tr2 = h4_tr₂ ∧ s''' = σ'₂ ∧ o₁ = o₂, by tauto,
      apply IH; tauto,
    } }
end

lemma source_target_deterministic :
  ∀ (ctx : CONTEXT) (nd : ORACLE) (code_S : source.CODE) (σ_S σ_S' : source.STATE) (tr_S : TRACE) (i : INPUT)
    (o_S : OUTPUT),
      source.wf ctx code_S →
      source.initial σ_S ctx i →
      source.always_terminates code_S →
      source.star nd code_S σ_S σ_S' tr_S →
      source.final σ_S' o_S →
      ∀ (code_T : target.CODE) (σ_T σ_T' : target.STATE) (tr_T : TRACE) (o_T : OUTPUT),
        target.initial σ_T ctx i →
        jit.compile ctx code_S = some code_T →
        target.star nd code_T σ_T σ_T' tr_T →
        target.final σ_T' o_T →
        (tr_S = tr_T ∧ o_S = o_T ∧ target.arch_safe σ_T σ_T') :=
begin
  intros _ _ _ _ _ _ _ _ wf_S HinitS Sterminates h1 h2 _ _ _ _ _ HinitT h3 h4 h5,
  let x := forward_simulation,
  specialize x ctx nd code_S σ_S σ_S' tr_S i o_S (by assumption)
    (by assumption) (by assumption) (by assumption) (by assumption) σ_T code_T (by assumption)
    (by assumption),
  cases x with T H,
  cases H with H1 H2,
  cases H2,
  suffices : tr_S = tr_T ∧ T = σ_T',
  { cases this with left right,
    rw left at *,
    rw right at *,
    split, by reflexivity,
    split; try{assumption},
    apply target.output_deterministic; by assumption,
  },

  have : tr_S = tr_T ∧ T = σ_T' ∧ o_S = o_T, apply target_deterministic; assumption,
  cc,
end

-- The behavior of the jited target code is allowed by the source program.
lemma backward_simulation :
  ∀ (ctx : CONTEXT) (code_S : source.CODE) (code_T : target.CODE) (nd : ORACLE) (σ_T σ_T' : target.STATE)
    (σ_S : source.STATE) (tr : TRACE) (i : INPUT) (o : OUTPUT),
      source.wf ctx code_S →
      source.always_terminates code_S →
      target.initial σ_T ctx i →
      jit.compile ctx code_S = some code_T →
      target.star nd code_T σ_T σ_T' tr →
      target.final σ_T' o →
      source.initial σ_S ctx i →
      ∃ (σ_S' : source.STATE),
        source.star nd code_S σ_S σ_S' tr ∧
        source.final σ_S' o ∧
        target.arch_safe σ_T σ_T' :=
begin
  intros _ _ _ _ _ _ _ _ _ _ wf_S terminates_S a a_1 a_2 a_3 a_4,
  let y := terminates_S,
  dsimp [source.always_terminates] at *,
  specialize terminates_S ctx nd σ_S i a_4,
  cases terminates_S with s' x,
  cases x with tr' x,
  cases x with res' H,
  existsi s',
  cases H,
  suffices : tr' = tr ∧ res' = o ∧ target.arch_safe σ_T σ_T',
  { cases this with left right, rw left at *,
    cases right with left right, rw left at *, rw right at *,
    repeat{split <|> assumption},
  },

  apply source_target_deterministic; assumption,
end

theorem arch_safety :
  ∀ (ctx : CONTEXT) (nd : ORACLE) (code_S : source.CODE) (code_T : target.CODE) (σ_T σ_T' : target.STATE)
    (i : INPUT) (o : OUTPUT) (tr : TRACE),
      source.wf ctx code_S →
      source.always_terminates code_S →
      jit.compile ctx code_S = some code_T →
      target.initial σ_T ctx i →
      target.star nd code_T σ_T σ_T' tr →
      target.final σ_T' o →
      target.arch_safe σ_T σ_T' :=
begin
  intros _ _ _ _ _ _ _ _ _ wf_S sterm comp tinit tstar tfinal,
  let y := sterm,

  dsimp [source.always_terminates, machine.always_terminates] at *,
  specialize sterm ctx nd,
  cases (source.initial_inhabited i ctx) with σ_S sinit,
  specialize sterm σ_S i sinit,
  cases sterm with σ_S' sterm,
  cases sterm with tr2 sterm,
  cases sterm with res2 sterm,
  cases sterm with sstar sfinal,
  cases (forward_simulation ctx nd code_S σ_S σ_S' tr2 i res2 wf_S sinit y sstar sfinal σ_T code_T tinit comp)
    with σ_T2' forward,

  cases forward,
  cases forward_right,
  have : tr = tr2 ∧ σ_T' = σ_T2' ∧ o = res2, apply target_deterministic; assumption,
  cc,
end

theorem interpreter_equivalence :
  ∀ (ctx : CONTEXT) (nd : ORACLE) (code_S : source.CODE) (code_T : target.CODE) (σ_S : source.STATE)
    (σ_T : target.STATE) (i : INPUT) (o : OUTPUT) (tr : TRACE),
      source.wf ctx code_S →
      source.always_terminates code_S →
      jit.compile ctx code_S = some code_T →
      source.initial σ_S ctx i →
      target.initial σ_T ctx i →
      ((∃ (σ_S' : source.STATE),
        source.star nd code_S σ_S σ_S' tr ∧
        source.final σ_S' o)
      ↔
      (∃ (σ_T' : target.STATE),
        target.star nd code_T σ_T σ_T' tr ∧
        target.final σ_T' o)) :=
begin
  intros _ _ _ _ _ _ _ _ _ wf_S sterm comp inits initt,
  split; intros a,
  { cases a with σ_S' a,
    cases a with sstar sfinal,
    cases (forward_simulation ctx nd code_S σ_S σ_S' tr i o _ _ _ sstar sfinal σ_T code_T _ _)
      with σ_T' a,
    cases a with tstar a,
    cases a with tfinal tinv,
    existsi σ_T', cc,
    all_goals{assumption},
  },
  { cases a with σ_T' a,
    cases a with tstar tfinal,
    cases (backward_simulation ctx code_S code_T nd σ_T σ_T' _ _ _ _ _ _ _ _ _ _ _) with σ_S' a; repeat{any_goals{assumption}},
    cases a with sstar a,
    cases a with sfinal inv,
    existsi σ_S',
    cc,
  },
end
