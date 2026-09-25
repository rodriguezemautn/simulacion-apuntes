# U5 — Formulario (solo lo que usa la cátedra)

> Todas `[DATO]` de las clases 5 y 6. La versión importa: acá van las de **la cátedra**, no las del manual.

## Notación de Kendall (6 campos)

```
A | B | X | Y | Z | V
```
`A`=interarribos (`M`/`D`/`G`) · `B`=servicio (`M`/`D`/`G`) · `X`=nº servidores · `Y`=capacidad (se omite si ∞) · `Z`=disciplina (`FCFS`/`LCFS`/`SIRO`/`GD`) · `V`=nº de colas/canales.

> La notación de los libros tiene 5 campos. **La cátedra usa 6.**

## Relaciones básicas

| Fórmula | Significado |
|---|---|
| `E[A] = 1/λ` | Tiempo medio entre arribos |
| `E[S] = 1/μ` | Tiempo medio de servicio |
| `ρ = λ/(kμ)` | Intensidad de tráfico (**k** = nº de servidores) |
| `ρ < 1` | Condición de estabilidad (obligatoria) |

## M|M|1

| Fórmula | Significado |
|---|---|
| `P_0 = 1 − ρ` | Probabilidad de sistema vacío |
| `P_i = (1 − ρ)·ρ^i` | Probabilidad de i clientes en el sistema |
| `E[L] = ρ/(1 − ρ)` | Nº medio de clientes en el sistema |
| `W[S] = E[L]/λ` | Tiempo medio en el sistema |
| `W[Q] = W[S] − E[S]` | Tiempo medio en la cola |
| `B(K) = ρ^K` | P(al menos K paquetes en el sistema) |

## Ley de Little

```
E[L] = λ · W[S]
```
También por subsistemas: **`E[L_q] = λ · W[Q]`**

Y por definición de espera: `W[S] = W[Q] + E[S]`

## M|M|∞ (y M|G|∞)

| Fórmula | Significado |
|---|---|
| `P_i = e^(−ρ) · ρ^i / i!` | Estados con distribución **Poisson** de media `ρ` |
| `E[L] = ρ` | Nº medio de clientes |
| `W[S] = 1/μ` | Tiempo medio en el sistema |
| `W[Q] = 0` | No hay espera |
| `E[L_q] = 0` | No hay cola |

## Derivaciones de balance (para el pizarrón)

**M|M|1**
- Balance local: `P_i = (λ/μ)^i · P_0`
- Balance global: `ΣP_i = 1` → `P_0 = 1 − ρ`
- Resultado: `P_i = (1 − ρ)·ρ^i`

**M|M|∞**
- `λ_i = λ` · `μ_i = i·μ` → `P_i = (λ/μ)^i / i! · P_0`
- `Σ ρ^i/i! = e^ρ` → `P_0 = e^(−ρ)`
- Resultado: `P_i = e^(−ρ)·ρ^i / i!`

## Referencias que cita la cátedra

- Little & Graves (2008) — Ley de Little
- Gross et al. (2018) — p.88 Erlang tipo n · pp.108-109 M|G|∞
- Walpole — proceso de Poisson
- Iversen — teletráfico
- Varela (1982) — definición de teoría de colas

## Lo que NO hay que recitar de memoria

`[DATO]` La cátedra **no derivó** M/M/K (Erlang-C), M/M/1/K ni M/G/1. Se plantean por Kendall + balance, no por fórmula cerrada.
