# U3 — Formulario

> Todo `[DATO]` de las clases 3 y 4, `NO-UNIFORMES`, TP3 y el bloque de Montecarlo.

## Marco
```
R  →  G(R)  →  X
```

## Los cuatro métodos

| Método | Condición | Costo | Exacto |
|---|---|---|---|
| **Inversión** | `F` invertible en forma cerrada | **1 R** | Sí |
| **Composición** | `f` descomponible en `fᵢ` normalizadas | **2 R** | Sí |
| **Convolución** | `X = X₁+⋯+Xₙ`, `Xᵢ` i.i.d. | **n R** | Sí |
| **Rechazo** | `f` acotada en `[a,b]`, se conoce `M = máx f` | variable | No (descarta) |

### Inversión
```
R = F(x)   →   x = F⁻¹(R)
```

### Composición
```
f(x) = A₁f₁(x) + A₂f₂(x) + ⋯ + Aₙfₙ(x)      con ΣAᵢ = 1
```
7 pasos: dividir en áreas → definir `fᵢ` → expresar la mezcla → acumulada de áreas → generar `R₁, R₂` → elegir `fᵢ` con `R₁` → simular con `R₂`.

### Convolución
```
X = X₁ + X₂ + ⋯ + Xₙ        (Xᵢ i.i.d.)
T = −(1/λ)·Σ_{i=1}^{n} ln(1−Rᵢ)        (caso Erlang de exponenciales)
```

### Rechazo
```
1. R₁, R₂ ~ U[0,1]
2. x = a + (b−a)·R₁
3. f(x) = f[a + (b−a)·R₁]
4. Aceptar si  M·R₂ ≤ f(x);  si no, volver a 1

P(Aceptar) = 1 / [M·(b−a)]
Ejecuciones esperadas = M·(b−a)
```

---

## Generadores por distribución

| Distribución | Tipo | Método | Fórmula de generación |
|---|---|---|---|
| **Uniforme** `U(a,b)` | Continua | Inversión | `x = a + (b−a)·R` |
| **Exponencial** `λ` | Continua | Inversión | `x = −(1/λ)·Ln R` |
| **Empírica a trozos** | Continua | Inversión | `x = √(2R)` si `R ≤ 1/2` · `x = 2R` si `R > 1/2` |
| **Triangular** (pico `b`) | Continua | Composición | `R₁ < (b−a)/(c−a)` → `x = a + (b−a)·√R₂` |
| **Gamma** `G(k,λ)` | Continua | Convolución | Suma de `k` exponenciales |
| **Erlang** `E(k,λ)` | Continua | Convolución | Suma de `k` exponenciales; `k=1` → Exponencial |
| **Poisson** `λ` | **Discreta** | Inversión | Comparar `R` contra la acumulada `P(X≤x)` |
| **Weibull** | Continua | (TP3) | Inversión, fórmula no dada en clase |
| **Beta(3,4)** | Continua | (TP3) Rechazo | — |
| **Normal N(0,1)** | Continua | (TP3) Rechazo | Cota `−10 ≤ x ≤ 10`. **Box-Muller no se menciona** |

---

## Densidades y acumuladas usadas en clase

```
UNIFORME      f(x) = 1/(b−a)          F(x) = (x−a)/(b−a)
EXPONENCIAL   f(x) = λe^(−λx)         F(x) = 1 − e^(−λx)
eˣ/(e−1)      f(x) = eˣ/(e−1)         F(x) = (eˣ−1)/(e−1)   →  x = ln[1+(e−1)R]
EMPÍRICA      f = x (0≤x≤1)           F = x²/2
              f = 1/2 (1<x≤2)         F = x/2
GAMMA         f(x) = λe^(−λx)(λx)^(k−1)/Γ(k)      Γ(k) = (k−1)!
ERLANG        f(x) = λe^(−λx)(λx)^(k−1)/(k−1)!
POISSON       P(X=x) = e^(−λ)λˣ/x!
RECHAZO       f(x) = (1/2π)√(4−x²), −2≤x≤2   →  M = 1/π, eficiencia π/4 ≈ 0.785
```

## Poisson `λ = 4` — acumulada

| x | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|---|
| P(X≤x) | 0.0183 | 0.0915 | 0.238 | 0.4333 | 0.6286 | 0.7849 | 0.8891 | 0.9486 |

## Tabla empírica aditiva (discreta)

| Valor | 15 | 16 | 17 | 18 | 19 |
|---|---|---|---|---|---|
| Frecuencia | 10 | 25 | 30 | 25 | 10 |
| Probabilidad | 0.10 | 0.25 | 0.30 | 0.25 | 0.10 |
| **Acumulada** | 0.10 | 0.35 | 0.65 | 0.90 | 1.00 |

---

## Montecarlo

```
Cambio de variable:  g(y(R)) = f(R)·|dR/dy|
Deducción:           y(r) = G⁻¹(r)
```
`[DATO]` El deck **llega a la transformada inversa** y la llama Montecarlo.

## Colas e inventarios (aplicaciones del bloque)

```
Costo total (camiones) = Salarios + Espera
   Salarios = n·8·25 + 37.50·n·(horas extra)
   Espera   = 500·(tiempo depósito) + 100·(tiempo espera camión)

Inventario:
   Costo Ordenar    = (nº pedidos) × 100
   Costo Inventario = IP × 20/12
   Costo Faltante   = (unidades faltantes) × 50

Promedios:  Ip.30 = x·A/2   ·   X/A = (30−X)/B   ·   Ip = A²/[2(A+B)]
```

---

## ⚠️ Trampas del material

1. `"0 si a > x > b"` (densidad uniforme) — **lógicamente imposible**.
2. En el TP3, **Weibull** usa **dos parametrizaciones** distintas (#6 y #7).
3. **Erlang**: `(k,λ)` en clase vs `(α,β)` en el TP3 #13.
4. **Triangular**: falta la inversa de la rama `f₂`.
5. Inventario: `1149 × 20/12` figura como `$1918`; el real es `$1915`.
6. **No hay M|M|1 analítico** en estas clases, pese a citar a Gross et al.
