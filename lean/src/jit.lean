
import tactic.tauto

/-!
This file contains the metatheory of JIT correctness.

The main theorems are forward_simulation and backward_simulation, proved based
on the following two sets of axioms.

Two axioms are assumed to be correct (e.g., ensured by the Linux kernel):

* wf_terminates: a program that passes the checker terminates.

* emit_correct: the output of the JIT contains the output of individual parts.

Three axioms about the correctness of individal parts of the JIT are expected
to be proved separately in SMT:

* prologue_correct: running the emitted prologue from the initial target state
  reaches a target state that relates to the initial source state.

* per_insn_correct: running the emitted target code preserves the relation
  between source and target states and produces the same trace.

* epilogue_correct: running the emitted epilogue from a target state that
  relates to the final source state reaches the final target state.

## References

* Xavier Leroy. A formally verified compiler back-end. Journal of Automated
  Reasoning, 43(4):363--446, December 2009.
-/

namespace machine
section machine

  parameters {CONTEXT EVENT NONDET INPUT RESULT PC STATE INSN : Type}

  -- A trace is a list of externally visible events.
  def TRACE : Type := list EVENT
  instance : has_append TRACE := ⟨list.append⟩

  -- Get program counter of machine.
  parameter pc_of : STATE → PC

  -- Step a given instruction, producing new state and trace.
  parameter step_insn : NONDET → INSN → STATE → (STATE × TRACE)

  -- Whether the state is an inital state
  parameter initial_state : CONTEXT → INPUT → STATE → Prop

  -- This mimics the final state.
  parameter result_of : STATE → option RESULT

  -- Code is a partial map from PC to instruction.  We intentionally avoid
  -- using a list and favor this more abstract representation.
  def CODE : Type := PC → option INSN

  -- Step from code[pc]. Yields none if no instruction at PC.
  -- does nothing if state already final.
  def step (oracle : NONDET) (code : CODE) (s : STATE) : option (STATE × TRACE) :=
    match result_of s with
    | none :=
      match code (pc_of s) with
      | none := none
      | some insn := some (step_insn oracle insn s)
      end
    | some _ := some (s, [])
    end

  -- A standard way to define reachable states.
  inductive star (oracle : NONDET) (code : CODE) : STATE → STATE → TRACE → Prop
  | refl :
    ∀ (a : STATE),
      star a a []
  | step :
    ∀ (a b c : STATE) (tr₁ tr₂ : TRACE),
      step oracle code a = some (b, tr₁) →
      star b c tr₂ →
      star a c (tr₁ ++ tr₂)

  -- A safe state can always fetch an instruction from any reachable state,
  -- or it's the final state
  def safe (oracle : NONDET) (code : CODE) (s1 : STATE) : Prop :=
    ∀ s2 tr,
      star oracle code s1 s2 tr →
      (∃ insn, code (pc_of s2) = some insn) ∨ (∃ res, result_of s2 = some res)

  -- If you can take one step, you can show star.
  lemma star_one :
    ∀ (oracle : NONDET) (code : CODE) (a b : STATE) (tr : TRACE),
      step oracle code a = some (b, tr) →
      star oracle code a b tr :=
  begin
    intros,
    rw ← list.append_nil tr,
    constructor,
    { assumption },
    { constructor }
  end

  -- Star is transitive for fixed code and appending traces.
  lemma star_trans :
    ∀ (oracle : NONDET) (code : CODE) (a b : STATE) (tr₁ : TRACE),
      star oracle code a b tr₁ →
      ∀ (c : STATE) (tr₂ : TRACE),
        star oracle code b c tr₂ →
        star oracle code a c (tr₁ ++ tr₂) :=
  begin
    intros oracle code _ _ _ Hab,
    induction Hab with _ _ _ _ _ _ _ _ Hab_ih; intros; simp,
    { assumption },
    { constructor,
      { assumption },
      { apply Hab_ih,
        assumption } }
  end

  -- c1 is a subset of c2 if any instruction c1 has is also in c2.
  def subset (c1 c2 : CODE) : Prop :=
    ∀ (idx : PC) (insn : INSN),
      c1 idx = some insn →
      c2 idx = some insn
  local infix ` <+ ` := subset

  lemma step_subset :
    ∀ (oracle : NONDET) (code₁ code₂ : CODE) (s1 s2 : STATE) (tr : TRACE),
      step oracle code₁ s1 = some (s2, tr) →
      code₁ <+ code₂ →
      step oracle code₂ s1 = some (s2, tr) :=
  begin
    intros _ _ _ _ _ _ H1 H2,
    simp [step, subset] at *,
    cases A : (result_of s1); rw A at *; rw ← H1;
      dsimp [step._match_1]; refl <|> skip,
    cases h : (code₁ (pc_of s1)) with insn,
    case option.none {
      dsimp [step._match_1] at H1,
      rw h at H1,
      contradiction,
    },
    case option.some {
      specialize H2 (pc_of s1) insn h,
      rewrite H2,
    },
  end

  -- If you can star given some code, you can always
  -- add more code and preserve star.
  lemma star_subset :
    ∀ (oracle : NONDET) (code₁ code₂ : CODE) (s1 s2 : STATE) (tr : TRACE),
      star oracle code₁ s1 s2 tr →
      code₁ <+ code₂ →
      star oracle code₂ s1 s2 tr :=
  begin
    intros _ _ _ _ _ _ H1 _,
    induction H1,
    { apply star.refl, },
    econstructor,
    { apply step_subset, all_goals {assumption}, },
    assumption,
  end

  lemma final_step :
    ∀ (oracle : NONDET) (s : STATE) (c : CODE) (r : RESULT),
      result_of s = some r →
      ∀ (s' : STATE) (tr : TRACE),
        step oracle c s = some (s', tr) →
        tr = [] ∧ s' = s :=
  begin
    intros _ _ _ _ h1 _ _ h2,
    simp [step] at h2,
    rw h1 at h2,
    simp [step._match_1] at h2,
    split; cc,
  end

  lemma final_star :
    ∀ (oracle : NONDET) (s : STATE) (c : CODE) (r : RESULT),
      result_of s = some r →
      ∀ (s' : STATE) (tr : TRACE),
        star oracle c s s' tr →
        tr = [] ∧ s' = s :=
  begin
    intros _ _ _ _ h1 _ _ h2,
    induction h2 with s2 s1 s2 s3 tr1 tr2 h3 h4 IH, cc,
    have : tr1 = [] ∧ s2 = s1,
      by { apply final_step; assumption <|> skip, from h1 },
    cases this, subst this_left, subst this_right, simp, cc,
  end

  -- A final state is always safe.
  lemma final_safe :
    ∀ oracle code s1 res,
      result_of s1 = some res →
      safe oracle code s1 :=
  begin
    dsimp [safe, machine.safe], intros, right,
    induction a_1,
    existsi res, assumption,
    apply a_1_ih,
    dsimp [machine.step] at *,
    rw a at *,
    cases a_1_a_1,
    assumption,
  end

  -- A safe state can always take a step if it's not final.
  lemma safe_self :
    ∀ (oracle : NONDET) (code : CODE) (s : STATE),
      safe oracle code s →
      result_of s = none →
      ∃ (insn : INSN),
        code (pc_of s) = some insn :=
  begin
    intros,
    dsimp [safe] at *,
    specialize a s [] (by constructor),
    cases a, assumption,
    cases a, rw a_h at *,
    contradiction,
  end

  -- A safe state is still safe after one step.
  lemma safe_step :
    ∀ (oracle : NONDET) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE),
      safe oracle code s₁ →
      step oracle code s₁ = some (s₂, tr) →
      safe oracle code s₂ :=
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
    ∀ (oracle : NONDET) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE),
      safe oracle code s₁ →
      star oracle code s₁ s₂ tr →
      safe oracle code s₂ :=
  begin
    intros,
    induction a_1, by assumption,
    apply a_1_ih,
    apply safe_step; assumption,
  end

  -- If a state is safe, and it was obtained by taking a step,
  -- then the state it stepped from is also safe.
  lemma safe_step_backwards :
    ∀ (oracle : NONDET) (code : CODE) (s₁ s₂ : STATE) (tr : TRACE),
      safe oracle code s₂ →
      step oracle code s₁ = some (s₂, tr) →
      safe oracle code s₁ :=
  begin
    intros,
    dsimp [safe], intros,
    revert s₂,
    induction a_2; intros,
    dsimp [step, machine.step] at *,
    cases h4 : (result_of a_2); rw h4 at *; dsimp [step._match_1] at *,
    cases h5 : (code (pc_of a_2)); rw h5 at *,
    contradiction,
    left,
    existsi val, reflexivity,
    cases a_1,
    right, existsi val, reflexivity,
    dsimp [step] at *,
    rw a_1 at *,
    cases a_2_a_1,
    let x := safe_star _ _ _ oracle code _ _ _ a a_2_a_2,
    dsimp [safe] at x,
    apply x,
    apply machine.star.refl,
  end

  -- A state that eventually terminates is always safe.
  lemma terminates_safe :
    ∀ oracle code s1 s2 tr res,
      star oracle code s1 s2 tr →
      result_of s2 = some res →
      safe oracle code s1 :=
  begin
    intros,
    induction a,
    apply final_safe; assumption,
    apply safe_step_backwards; try{assumption},
    apply a_ih, assumption,
  end

end machine
end machine

-- Re-declare infix notation outside of machine scope.
local infix ` <+ ` := machine.subset

constants CONTEXT EVENT NONDET INPUT RESULT : Type

def TRACE : Type := @machine.TRACE EVENT

noncomputable instance : has_append TRACE := ⟨list.append⟩

-- This models the behavior of the source language.

namespace source

  constants INSN PC STATE : Type
  constant pc_of : STATE → PC
  constant step_insn : NONDET → INSN → STATE → (STATE × TRACE)
  constant result_of : STATE → option RESULT
  constant initial_state : CONTEXT → INPUT → STATE → Prop

  def CODE : Type := @machine.CODE PC INSN
  noncomputable def step := machine.step pc_of step_insn result_of
  definition star := machine.star pc_of step_insn result_of
  definition safe := machine.safe pc_of step_insn result_of

  -- This captures the guarantees of the checker: a well-formed program passes
  -- the checker.
  constant wf : CONTEXT → CODE → Prop

  -- A well-formed program terminates.
  --
  -- This is assumed to hold.
  axiom wf_terminates :
    ∀ (ctx : CONTEXT) (oracle : NONDET) (s : STATE) (i : INPUT) (code : CODE),
      wf ctx code →
      initial_state ctx i s →
      ∃ (s' : STATE) (tr : TRACE) (res : RESULT),
        star oracle code s s' tr ∧
        result_of s' = some res

  -- Well-formed code from the initial state is safe.
  lemma wf_safe :
    ∀ (ctx : CONTEXT) (s : STATE) (code : CODE) (i : INPUT),
      wf ctx code →
      ∀ (oracle : NONDET),
        initial_state ctx i s →
        safe oracle code s :=
  begin
    intros,
    cases (wf_terminates ctx oracle s i code (by assumption) (by assumption)),
    cases h,
    cases h_h,
    cases h_h_h,
    apply machine.terminates_safe; assumption,
  end

end source

-- This models the behavior of the target language.

namespace target

  constants INSN PC STATE : Type
  constant pc_of : STATE → PC
  constant step_insn : NONDET → INSN → STATE → (STATE × TRACE)
  constant result_of : STATE → option RESULT
  constant initial_state : CONTEXT → INPUT → STATE → Prop

  def CODE : Type := @machine.CODE PC INSN
  noncomputable def step := machine.step pc_of step_insn result_of
  def star := machine.star pc_of step_insn result_of

end target

-- This models the JIT implementation.

namespace jit

  -- Emit target code for a single source instruction.
  constant emit_insn : CONTEXT → source.CODE → source.PC → option target.CODE

  constant emit_prologue : CONTEXT → source.CODE → target.CODE

  constant emit_epilogue : CONTEXT → source.CODE → target.CODE

  -- Emit target code for an entire source program, including
  -- epilogue and prologue.
  constant emit : CONTEXT → source.CODE → option target.CODE

  -- If the JIT suceeds for an entire source program,
  -- it must have succeeded for each (valid) source instruction,
  -- and the produced code must contain the prologue and epilogue.
  --
  -- This is assumed to hold.
  axiom emit_correct :
    ∀ (ctx : CONTEXT) (code_S : source.CODE) (code_T : target.CODE),
      source.wf ctx code_S →
      jit.emit ctx code_S = some code_T →
      (∀ (i : source.PC) (insn : source.INSN),
        code_S i = some insn →
        ∃ (f_T : target.CODE),
          jit.emit_insn ctx code_S i = some f_T ∧ f_T <+ code_T) ∧
      emit_prologue ctx code_S <+ code_T ∧
      emit_epilogue ctx code_S <+ code_T

end jit

-- JIT correctness

-- This relates source and target states, parameterized by a JIT context.
constant related : CONTEXT → source.STATE → target.STATE → Prop
notation s1 `~[`:50 ctx `]` s2:50 := related ctx s1 s2

-- Running the prologue from an initial state produces a target
-- state related to the initial source state (with no trace).
--
-- This is proved in SMT.
axiom prologue_correct :
  ∀ (oracle : NONDET) (ctx : CONTEXT) (t1 : target.STATE) (s1 : source.STATE) (i : INPUT) (code_S : source.CODE),
    source.wf ctx code_S →
    target.initial_state ctx i t1 →
    source.initial_state ctx i s1 →
    ∃ (t2 : target.STATE),
      target.star oracle (jit.emit_prologue ctx code_S) t1 t2 [] ∧
      s1 ~[ctx] t2

-- If the source state has reached a result, then executing
-- the epilogue in a related target state reaches a state
-- with the same result (and no trace).
--
-- This is proved in SMT.
axiom epilogue_correct :
  ∀ (oracle : NONDET) (ctx : CONTEXT) (code_S : source.CODE) (s1 : source.STATE) (t1 : target.STATE),
    source.wf ctx code_S →
    s1 ~[ctx] t1 →
    (∃ res, source.result_of s1 = some res) →
    ∃ (t2 : target.STATE),
      target.star oracle (jit.emit_epilogue ctx code_S) t1 t2 [] ∧
      source.result_of s1 = target.result_of t2

-- If the JIT produces some code for one source instruction,
-- then starting from related source and target states,
-- stepping the source instruction is related to some
-- state reachable from the target state, for the jited code.
--
-- This is proved in SMT.
axiom per_insn_correct :
  ∀ (oracle : NONDET) (ctx : CONTEXT) (i : source.PC) (code_S : source.CODE)
    (f_T : target.CODE) (σ_S σ_S' : source.STATE) (σ_T : target.STATE)
    (tr : TRACE) (code_T : target.CODE),
      source.wf ctx code_S →
      jit.emit_insn ctx code_S i = some f_T →
      σ_S ~[ctx] σ_T →
      source.pc_of σ_S = i →
      source.step oracle code_S σ_S = some (σ_S', tr) →
      ∃ (σ_T' : target.STATE),
        target.star oracle f_T σ_T σ_T' tr ∧ σ_S' ~[ctx] σ_T'

lemma star_src_correct :
  ∀ (ctx : CONTEXT) (oracle : NONDET) (code_S : source.CODE) (σ_S σ_S' : source.STATE) (tr : TRACE),
    source.wf ctx code_S →
    source.safe oracle code_S σ_S →
    source.star oracle code_S σ_S σ_S' tr →
    ∀ (σ_T : target.STATE) (code_T : target.CODE),
      σ_S ~[ctx] σ_T →
      jit.emit ctx code_S = some code_T →
      ∃ (σ_T' : target.STATE),
        target.star oracle code_T σ_T σ_T' tr ∧ σ_S' ~[ctx] σ_T' :=
begin
  intros _ _ _ _ _ _ wf_S safe_S star_S,
  induction star_S with s1 s1 s2 s3 tr1 tr2 step_S star_S' IH,
  { intros _ _ related emitted,
    existsi σ_T, split, constructor, assumption, },
  intros _ _ related emitted,

  -- Handle the case where s1 is a final state. If it is, it steps to itself and
  -- the target state can take zero steps.
  cases hresult : (source.result_of s1),
  tactic.swap,
  { dsimp [machine.step] at *,
    rw hresult at *,
    cases step_S,
    cases step_S,
    apply IH; assumption,
  },

  have hinsn : ∃ insn, code_S (source.pc_of s1) = some insn,
  {
    apply machine.safe_self; assumption,
  },
  cases hinsn with insn hinsn,

  have hemit : ∃ f_T, jit.emit_insn ctx code_S (source.pc_of s1) = some f_T ∧ f_T <+ code_T,
  {
    let c := jit.emit_correct,
    specialize c _ _ _ (by assumption) _,
    cases c,
    apply c_left; assumption,
    apply emitted,
  },
  cases hemit with f_T hemit,
  cases hemit with hemit_left hemit_right,

  have hstep_T : ∃ t2, target.star oracle f_T σ_T t2 tr1 ∧ s2 ~[ctx] t2,
  {
    apply per_insn_correct; assumption <|> refl,
  },

  cases hstep_T with t2 hstep_T,
  cases hstep_T with hstep_T_left hstep_T_right,

  have hstar_T : ∃ t3, target.star oracle code_T t2 t3 tr2 ∧ s3 ~[ctx] t3,
  {
    apply IH; try{assumption},
    apply machine.safe_step; assumption,
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
  ∀ (ctx : CONTEXT) (oracle : NONDET) (code_S : source.CODE) (σ_S σ_S' : source.STATE) (tr : TRACE) (i : INPUT) (res : RESULT),
    source.wf ctx code_S →
    source.initial_state ctx i σ_S →
    source.star oracle code_S σ_S σ_S' tr →
    source.result_of σ_S' = some res →
    ∀ (σ_T : target.STATE) (code_T : target.CODE),
      target.initial_state ctx i σ_T →
      jit.emit ctx code_S = some code_T →
      ∃ (σ_T' : target.STATE),
        target.star oracle code_T σ_T σ_T' tr ∧
        target.result_of σ_T' = some res :=
begin
  intros _ _ _ _ _ _ _ _ H1 Hinitial_S H2 H3 _ _ H4 H5,

  -- Construct the prologue star
  have hprologue : ∃ t2, target.star oracle (jit.emit_prologue ctx code_S) σ_T t2 [] ∧
                         σ_S ~[ctx] t2,
  { apply prologue_correct; by assumption, },
  cases hprologue with t2 hprologue,
  cases hprologue,

  -- construct the regular instr star using the lemma defined above
  have hstar : ∃ t3, target.star oracle code_T t2 t3 tr ∧ σ_S' ~[ctx] t3,
  {
    apply star_src_correct; try{assumption},
    apply source.wf_safe; assumption,
  },
  cases hstar with t3 hstar,
  cases hstar with hstar_left hstar_right,

  -- construct the epilogue star
  have hepilogue : ∃ t4, target.star oracle (jit.emit_epilogue ctx code_S) t3 t4 [] ∧ source.result_of σ_S' = target.result_of t4,
  {
    apply epilogue_correct, by assumption, from hstar_right,
    existsi res, from H3,
  },
  cases hepilogue with t4 hepilogue,
  cases hepilogue,

  -- Now we can glue all the steps together

  existsi t4,
  split, tactic.swap,
  {
    -- Handle the easy case first: prove the results match
    rewrite ← hepilogue_right,
    rewrite H3,
  },

  -- Get the code to run in the target and show code_T is a superset of each component
  let ec := jit.emit_correct,
  specialize ec ctx code_S code_T (by assumption) (by assumption),
  cases ec with ec_insn ec,
  cases ec with ec_prologue ec_epilogue,

  -- Run the prologue
  change tr with (list.nil ++ tr),
  apply machine.star_trans,
  {
    apply machine.star_subset,
    apply hprologue_left,
    apply ec_prologue,
  },

  -- Run the middle
  rewrite ← list.append_nil tr,
  apply machine.star_trans,
  {
    assumption,
  },

  -- Run the epilogue
  apply machine.star_subset, tactic.swap, from ec_epilogue,
  assumption,
end

lemma target_deterministic :
  ∀ (oracle : NONDET) (code : target.CODE) (s1 s2 : target.STATE)
    (tr : TRACE) (res : RESULT),
    target.star oracle code s1 s2 tr →
    target.result_of s2 = some res →
    ∀ (s2' : target.STATE) (tr' : TRACE) (res' : RESULT),
      target.star oracle code s1 s2' tr' →
      target.result_of s2' = some res' →
      (tr = tr' ∧ s2 = s2') :=
begin
  intros _ _ _ _ _ _ h1 h2,
  induction h1 with s' s' s'' s''' tr1 tr2 h1 h3 IH,
  { intros _ _ _ h4 h5,
    have : tr' = [] ∧ s2' = s',
      by {apply machine.final_star, from h2, all_goals{assumption}},
    cc,
  },
  { intros _ _ _ h4 h5,
    cases h4 with _ _ _ h4_b h4_tr₁ h4_tr₂,
    { have : tr1 = [] ∧ s'' = s',
        by { apply machine.final_step, from h5, all_goals{assumption}},
      cases this, subst this_left, subst this_right,
      simp,
      apply IH; tauto,
    },
    { have : (tr1 = h4_tr₁), by cc, subst this,
      have : (s'' = h4_b), by cc, subst this,
      suffices : tr2 = h4_tr₂ ∧ s''' = s2', by tauto,
      apply IH; tauto,
    } }
end

lemma source_target_deterministic :
  ∀ (ctx : CONTEXT) (oracle : NONDET) (code_S : source.CODE) (σ_S σ_S' : source.STATE) (tr : TRACE)
    (i : INPUT) (res : RESULT),
    source.wf ctx code_S →
    source.initial_state ctx i σ_S →
    source.star oracle code_S σ_S σ_S' tr →
    source.result_of σ_S' = some res →
    ∀ (code_T : target.CODE) (σ_T σ_T' : target.STATE)
      (tr' : TRACE) (res' : RESULT),
      target.initial_state ctx i σ_T →
      jit.emit ctx code_S = some code_T →
      target.star oracle code_T σ_T σ_T' tr' →
      target.result_of σ_T' = some res' →
      (tr = tr' ∧ res = res') :=
begin
  intros _ _ _ _ _ _ _ _ WF HinitS h1 h2 _ _ _ _ _ HinitT h3 h4 h5,
  let x := forward_simulation,
  specialize x ctx oracle code_S σ_S σ_S' tr i res (by assumption)
    (by assumption) (by assumption) (by assumption) σ_T code_T (by assumption)
    (by assumption),
  cases x with T H,
  cases H,
  suffices : tr = tr' ∧ T = σ_T', by { split; cc },
  apply target_deterministic; assumption,
end

-- The behavior of the jited target code is allowed by the source program.
theorem backward_simulation :
  ∀ (ctx : CONTEXT) (code_S : source.CODE) (code_T : target.CODE)
    (oracle : NONDET) (σ_T σ_T' : target.STATE) (σ_S : source.STATE) (tr : TRACE) (i : INPUT) (res : RESULT),
    source.wf ctx code_S →
    target.initial_state ctx i σ_T →
    jit.emit ctx code_S = some code_T →
    target.star oracle code_T σ_T σ_T' tr →
    target.result_of σ_T' = some res →
    source.initial_state ctx i σ_S →
    ∃ (σ_S' : source.STATE),
      source.star oracle code_S σ_S σ_S' tr ∧
      source.result_of σ_S' = some res :=
begin
  intros,
  let x := source.wf_terminates,
  specialize x ctx oracle σ_S i code_S (by assumption) (by assumption),
  cases x with s' x,
  cases x with tr' x,
  cases x with res' H,
  existsi s',
  cases H,
  suffices : tr' = tr ∧ res' = res, by cc,
  apply source_target_deterministic; assumption,
end

theorem bisimulation :
  ∀ (ctx : CONTEXT) (code_S : source.CODE) (code_T : target.CODE)
    (oracle : NONDET) (σ_S : source.STATE) (σ_T : target.STATE) (tr : TRACE) (i : INPUT) (res : RESULT),
    source.wf ctx code_S →
    jit.emit ctx code_S = some code_T →
    source.initial_state ctx i σ_S →
    target.initial_state ctx i σ_T →

    ((∃ (σ_T' : target.STATE),
      target.star oracle code_T σ_T σ_T' tr ∧
      target.result_of σ_T' = some res)
    ↔
    (∃ (σ_S' : source.STATE),
      source.star oracle code_S σ_S σ_S' tr ∧
      source.result_of σ_S' = some res)) :=
begin
  intros,
  split; intros,
  { cases a_4,
    cases a_4_h,
    apply backward_simulation; assumption,
  },
  { cases a_4,
    cases a_4_h,
    apply forward_simulation; assumption,
  },
end
