
-- import .jit
-- import bv.basic

-- @[reducible] def Event : Type := unit
-- @[reducible] def Nondet : Type := unit
-- @[reducible] def Result : Type := bv 64

-- def Trace : Type := @machine.TRACE Event

-- namespace BPF

--   @[derive decidable_eq]
--   inductive Reg : Type
--   | R0 : Reg
--   | R1 : Reg
--   -- etc.

--   @[derive decidable_eq]
--   inductive Insn : Type
--   | MOV64_Reg : Reg → Reg → Insn
--   | EXIT : Insn

--   @[reducible] def PC : Type := bv 64
--   def Regs : Type := Reg → bv 64

--   def update (regs : Regs) (r : Reg) (val : bv 64) : Regs :=
--     λ x,
--       ite (x = r) val (regs x)

--   structure State : Type :=
--   mk :: (pc : PC) (regs : Regs) (result : option (bv 64))

--   def init_state : State :=
--     State.mk 0 (λ _, 0) option.none

--   @[reducible] def pc_of : State → PC := State.pc
--   @[reducible] def result_of : State → option Result := State.result

--   def Code : Type := @machine.CODE PC Insn

--   -- Lift a list of instructions to an abstract CODE map
--   def liftCode (c: list Insn) : Code :=
--     λ (p : PC),
--       let n : ℕ := bv.to_nat p in
--       list.nth c n

--   def step_insn (n : Nondet) (i : Insn) (s : State) : State × Trace :=
--     let (State.mk pc regs _) := s in
--       match i with
--       | Insn.MOV64_Reg dst src :=
--         ({regs := update regs dst (regs src), pc := pc + 1, ..s}, [])
--       | Insn.EXIT :=
--         ({result := regs Reg.R0, ..s}, [])
--       end

--   def step := machine.step pc_of step_insn
--   def star := machine.step pc_of step_insn

-- end BPF

-- namespace rv32

--   @[derive decidable_eq]
--   inductive Reg : Type
--   | S1
--   | S2
--   | A0
--   | A1

--   @[derive decidable_eq]
--   inductive Insn : Type
--   | addi : Reg → Reg → bv 12 → Insn

--   @[reducible] def PC : Type := bv 32
--   def Regs : Type := Reg → bv 32

--   def Code : Type := @machine.CODE PC Insn

--   structure State : Type :=
--   mk :: (pc : PC) (regs : Regs)

--   @[reducible] def pc_of : State → PC := State.pc

--   def result_of (s : State) : option Result :=
--     let regs := State.regs s in
--       option.some (bv.concat (regs Reg.A1) (regs Reg.A0))

--   def step_insn (n : Nondet) (i : Insn) (s : State) : State × Trace :=
--     let (State.mk pc regs) := s in
--       match i with
--       | Insn.addi dst src imm :=
--         ({pc := pc + 4, ..s}, [])
--       end

--   def step := machine.step pc_of step_insn
--   def star := machine.step pc_of step_insn

-- end rv32

-- namespace rv32_jit

--   def Context : Type := unit

--   def regmap (r : BPF.Reg) : rv32.Reg × rv32.Reg :=
--     match r with
--     | BPF.Reg.R0 := (rv32.Reg.S2, rv32.Reg.S1)
--     | BPF.Reg.R1 := (rv32.Reg.A1, rv32.Reg.A0)
--     end

--   def phi_reg (s : rv32.State) (r : BPF.Reg) : bv 64 :=
--     let (hi, lo) := regmap r in
--     let regs := (rv32.State.regs s) in
--       bv.concat (regs hi) (regs lo)

--   def phi_pc (c : Context) (r : BPF.PC) : rv32.PC :=
--     bv.take 32 (4 * r)

--   def emit_insn (c : Context) (src : BPF.Code) (idx : BPF.PC) : option rv32.Code :=
--     match src idx with
--     | option.some (BPF.Insn.MOV64_Reg dst src) := option.none
--     | option.some (BPF.Insn.EXIT) := option.none
--     | option.none := option.none
--     end

--   def emit_prologue (c : Context) : rv32.Code := λ x, option.none

--   def emit_epilogue (c : Context) : rv32.Code := λ x, option.none

--   def related (c : Context) (s : BPF.State) (t : rv32.State) : Prop :=
--     (∀ (r : BPF.Reg),
--       (BPF.State.regs s) r = phi_reg t r) ∧
--     phi_pc c (BPF.State.pc s) = (rv32.State.pc t)

-- end rv32_jit
