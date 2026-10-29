import BealPrize.Statement

/-!
# Auditoria de axiomas

Cada `#guard_msgs` fixa a saída de `#print axioms`. Se aparecer qualquer axioma diferente
(inclusive `sorryAx`), a compilação falha.

`Classical.choice`, quando aparece, vem do Mathlib: `#print axioms Real` já dá
`[propext, Classical.choice, Quot.sound]` (idem `ℂ`, `Polynomial ℕ`, `Turing.TM2`).
-/

/-- info: 'BealPrize.Statement' depends on axioms: [propext] -/
#guard_msgs in #print axioms BealPrize.Statement

/-- info: 'BealPrize.exponent_two_fails' depends on axioms: [propext] -/
#guard_msgs in #print axioms BealPrize.exponent_two_fails
