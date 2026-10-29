import Mathlib.Data.Nat.Prime.Basic

/-!
# Conjectura de Beal — enunciado limpo

Fonte do enunciado: AMS, *Beal Prize* (prêmio de US$ 1 milhão de Andrew Beal):
se `A^x + B^y = C^z` com `A, B, C, x, y, z` inteiros positivos e `x, y, z > 2`,
então `A`, `B` e `C` têm um fator primo comum.

Só `ℕ`; nenhum axioma, `sorry` ou marcador. `OPEN_MATH = true`.
-/

namespace BealPrize

/-- O problema do prêmio Beal. -/
def Statement : Prop :=
  ∀ A B C x y z : ℕ, 0 < A → 0 < B → 0 < C → 2 < x → 2 < y → 2 < z →
    A ^ x + B ^ y = C ^ z → ∃ p : ℕ, p.Prime ∧ p ∣ A ∧ p ∣ B ∧ p ∣ C

/-- Teste 1: as hipóteses são satisfazíveis (2³ + 2³ = 2⁴), e nesse caso a conclusão vale. -/
example : 2 ^ 3 + 2 ^ 3 = 2 ^ 4 ∧ ∃ p : ℕ, p.Prime ∧ p ∣ 2 ∧ p ∣ 2 ∧ p ∣ 2 :=
  ⟨by decide, 2, Nat.prime_two, dvd_rfl, dvd_rfl, dvd_rfl⟩

/-- Teste 2: a condição `> 2` nos expoentes é necessária. Com expoente 2 o enunciado é FALSO
(3² + 4² = 5² e 3, 4, 5 não têm primo comum). Logo `Statement` não é trivial. -/
theorem exponent_two_fails :
    ¬ ∀ A B C x y z : ℕ, 0 < A → 0 < B → 0 < C → 1 < x → 1 < y → 1 < z →
      A ^ x + B ^ y = C ^ z → ∃ p : ℕ, p.Prime ∧ p ∣ A ∧ p ∣ B ∧ p ∣ C := by
  intro h
  obtain ⟨p, hp, h3, h4, -⟩ := h 3 4 5 2 2 2 (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)
  have h1 : p ∣ 1 := by
    have : p ∣ 4 - 3 := Nat.dvd_sub h4 h3
    simpa using this
  exact hp.one_lt.ne' (Nat.dvd_one.mp h1)

end BealPrize
