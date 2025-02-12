import Mathlib.Data.Nat.Dist -- distance function
import Mathlib.Data.Nat.GCD.Basic -- gcd
import Mathlib.Data.Nat.ModEq -- modular arithmetic
import Mathlib.Data.Nat.Prime.Basic -- prime number stuff
import Mathlib.Data.Nat.Factors -- factors
import Mathlib.Tactic.NormNum.Prime -- a tactic for fast computations

open Nat

lemma l0 : dist 6 4 = 2 := rfl -- distance function

lemma l1 (a b : ℕ) : a ≠ b → dist a b > 0 := dist_pos_of_ne

lemma l2 (a b : ℕ) : gcd a b ∣ a ∧ gcd a b ∣ b := gcd_dvd a b

lemma l3 : lcm 6 4 = 12 := rfl

lemma l4 (a b : ℕ) : lcm a b = lcm b a := lcm_comm a b
lemma l5 (a b : ℕ) : gcd a b * lcm a b = a * b := gcd_mul_lcm a b

-- type the congruence symbol with \==

lemma l6 : 5 ≡ 8 [MOD 3] := rfl

-- nat.sqrt is integer square root (it rounds down).

#eval sqrt 1000047
-- returns 1000

lemma l7 (a : ℕ) : sqrt (a * a) = a := sqrt_eq a

lemma l8 (a b : ℕ) : sqrt a < b ↔ a < b * b := sqrt_lt

lemma l9 : Nat.Prime 59 := by decide

-- (The default instance is `nat.decidable_prime`, which can't be
-- used by `dec_trivial`, because the kernel would need to unfold
-- irreducible proofs generated by well-founded recursion.)

-- The tactic `norm_num`, amongst other things, provides faster primality testing.

lemma l10 : Nat.Prime 104729 := by
  norm_num

example (p : ℕ) : Nat.Prime p → p ≥ 2 := Prime.two_le

example (p : ℕ) : Nat.Prime p ↔ p ≥ 2 ∧ ∀ m, 2 ≤ m → m ≤ sqrt p → ¬ (m ∣ p) := prime_def_le_sqrt

example (p : ℕ) : Nat.Prime p → (∀ m, Coprime p m ∨ p ∣ m) := coprime_or_dvd_of_prime

-- minFac returns the smallest prime factor of n (or junk if it doesn't have one)

example : minFac 12 = 2 := rfl

-- `Nat.primeFactorsList n` is the prime factorization of `n`, listed in increasing order.
-- This doesn't seem to reduce, and apparently there has not been
-- an attempt to get the kernel to evaluate it sensibly.
-- But we can evaluate it in the virtual machine using #eval .

#eval primeFactorsList (2^32+1)
-- [641, 6700417]
