
import bv.lemmas

-- -- arithmetic

-- example : (-1) + (-1) = -(2 : bv 64) := rfl

-- example : -(-(1 : bv 64)) = 1 := rfl

-- example : (1 : bv 4) + 1 = 2 := rfl

-- example : (0x1234 : bv 16) * (0x5678 : bv 16) = (0x60 : bv 16) := rfl

-- example : -(1 : bv 64) / -1 = 1 := rfl
-- example : -(1 : bv 64) % -1 = 0 := rfl


-- -- bitwise

-- example : (8 : bv 4).sign_extend 4 = (248 : bv 8) := rfl

-- example : (8 : bv 4).msb = tt := rfl
-- example : (7 : bv 4).msb = ff := rfl
-- example : (3 : bv 4).lsb = tt := rfl
-- example : (6 : bv 4).lsb = ff := rfl

-- example : (1 : bv 4).or  2 = (3 : bv 4) := rfl
-- example : (1 : bv 4).and 2 = (0 : bv 4) := rfl


-- -- comparison

-- example : (-1 : bv 64).ule (-1) := dec_trivial
-- example : (-1 : bv 64).uge (-1) := dec_trivial

-- example : (-2 : bv 64).ult (-1) := dec_trivial
-- example : (-1 : bv 64).ugt (-2) := dec_trivial

-- example : (-(1 : bv 64)).sle (-1) := dec_trivial
-- example : (-(1 : bv 64)).sge (-1) := dec_trivial

-- example : (-(1 : bv 64)).slt 0    := dec_trivial
-- example : (-(0 : bv 64)).sgt (-1) := dec_trivial


-- repr

example : repr (  4 : bv 16) = "#x0004" := rfl
example : repr ( 10 : bv 16) = "#x000a" := rfl
example : repr (255 : bv 16) = "#x00ff" := rfl
example : repr (  7 : bv 3)  = "#b111"  := rfl
example : repr (  6 : bv 3)  = "#b110"  := rfl
-- example : repr (255 : bv 64) = "#x00000000000000ff" := rfl

-- example : repr ( 1234567 : bv 64) = "#x000000000012d687" := rfl
-- example : repr (-(1234567 : bv 64)) = "#xffffffffffed2979" := rfl

-- test all hex characters
example : repr (0x01 : bv 8) = "#x01" := rfl
example : repr (0x23 : bv 8) = "#x23" := rfl
example : repr (0x45 : bv 8) = "#x45" := rfl
example : repr (0x67 : bv 8) = "#x67" := rfl
example : repr (0x89 : bv 8) = "#x89" := rfl
example : repr (0xab : bv 8) = "#xab" := rfl
example : repr (0xcd : bv 8) = "#xcd" := rfl
example : repr (0xef : bv 8) = "#xef" := rfl


-- examples

-- swap with no temp var
-- http://smtlib.cs.uiowa.edu/examples.shtml
example {n : ℕ} (x₀ x₁ x₂ y₀ y₁ y₂ : bv n) :
  x₁ = x₀ + y₀ →
  y₁ = x₁ - y₀ →
  x₂ = x₁ - y₁ →
  x₂ = y₀ ∧ y₁ = x₀ :=
by intros; subst_vars; split; ring
