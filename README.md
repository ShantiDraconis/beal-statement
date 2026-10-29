# Conjectura de Beal — enunciado formal em Lean 4 / Mathlib

Este repositório contém **o enunciado** do problema como uma proposição de Lean (`Prop`),
construída só com definições do Mathlib. **Não é uma solução**: o problema continua aberto
(`OPEN_MATH = true`).

- Enunciado: [`BealPrize/Statement.lean`](BealPrize/Statement.lean)
- Fonte do texto oficial: AMS, *Beal Prize* (prêmio de US$ 1 milhão de Andrew Beal)
- Mathlib: commit `8fe7ce475b056f0b266d7107893f2c4d772c712f` (28/10/2026), Lean `v4.36.0-rc2`
- Sem `axiom`, `sorry`, `native_decide`, marcadores (`:= True`) ou correspondências inventadas.

## Teste de não vacuidade (provado no kernel)

`exponent_two_fails`: com expoente 2 o enunciado é falso (3² + 4² = 5²), então a condição `x, y, z > 2` não é decorativa.

## Axiomas (`#print axioms`, saída real)

| Declaração | Axiomas |
|---|---|
| `BealPrize.Statement` | `[propext]` |
| `BealPrize.exponent_two_fails` | `[propext]` |

Só `propext`: o enunciado vive em `ℕ` e não toca em `ℝ`.

[`BealPrize/Audit.lean`](BealPrize/Audit.lean) fixa essas listas com `#guard_msgs`, e o CI roda
`lake build`: se surgir um axioma novo (ou `sorryAx`), a compilação falha.

## Compilar

```
lake exe cache get
lake build
```
