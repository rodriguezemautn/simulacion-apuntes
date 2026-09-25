# U2 — Formulario

> Todo `[DATO]` del material de la cátedra (`TomaDeDatos.md` y `numerosAleatorios.md`).

## Bondad de ajuste

### Estadístico Chi-cuadrado

$$X^2 = \sum_{i=1}^{m} \frac{(FO_i - FE_i)^2}{FE_i}$$

`FO` = frecuencia observada · `FE` = frecuencia esperada.

**Criterio**: si `X²_calculado < X²_crítico` → **no se rechaza H₀** (los datos siguen la distribución propuesta).

### Regla de Sturges — número de intervalos

$$k = \lfloor 1 + \log_2 M \rfloor$$

`M` = cantidad de datos. *Ej. con M = 30*: `k = ⌊1 + 4.906⌋ = 5`

### Longitud del intervalo

$$L = \frac{\text{máx}(x_i) - \text{mín}(x_i)}{k}$$

### Frecuencia esperada

$$FE_i = \text{Prob}_i \times M$$

### Requisitos
- **FE ≥ 5** en cada clase (si no, **reagrupar**)
- Muestra recomendada: **75–100** valores

### Grados de libertad (versión de la cátedra)
$$gl = k - 1$$
> ⚠️ El material usa `k−1` **sin descontar parámetros estimados**. El estándar es `k − 1 − m`.

---

## Generación de números aleatorios

### Congruencial Lineal (GCL)
$$x_{n+1} = (a\,x_n + c) \bmod m$$
Período máximo = **m**.

### Condiciones de calidad (5)
1. Uniformemente distribuidos
2. Estadísticamente independientes
3. Reproducibles
4. Período largo
5. Eficiencia computacional

### Otros métodos
- **Cuadrados medios**: elevar al cuadrado un número de 4 cifras y tomar las **cifras del medio**
- **Producto medio**: multiplicar **dos semillas** y tomar las cifras del medio
- **Constante multiplicativa**: multiplicar por una **constante** y tomar las cifras del medio

---

## Distribuciones — densidades, acumuladas y generación

> `[VERIFICAR]` Formalmente, la **generación de variables aleatorias por distribución** es contenido de **U3** (variables aleatorias continuas). Se deja acá porque el material de U2 ya las incluye.

| Distribución | Densidad / Probabilidad | Acumulada | Generación (transformada inversa) |
|---|---|---|---|
| **Exponencial** | `f(x) = λe^(−λx)`, `x > 0` | `F(x) = 1 − e^(−λx)` | `x = −(1/λ)·ln(1 − R)` |
| **Uniforme** | `f(x) = 1/(b−a)`, `a ≤ x ≤ b` | `F(x) = (x−a)/(b−a)` | `x = a + (b−a)·R` |
| **Poisson** | `f(k) = e^(−λ)·λ^k / k!`, `k ∈ ℕ` | — | Se evalúa para cada `k` y se construye la acumulada |
| **Normal** | `f(x) = 1/(σ√(2π)) · e^(−(x−μ)²/(2σ²))` | — | Parámetros: `μ`, `σ` |
| **Triangular** | `2(x−a)/((b−a)(c−a))` para `a ≤ x ≤ c` ; `2(b−x)/((b−a)(b−c))` para `c ≤ x ≤ b` | — | Parámetros: mín `a`, máx `b`, moda `c` |
| **Gamma** | `f(x) = λ^k·x^(k−1)·e^(−λx) / Γ(k)` | — | Parámetros: tasa `λ`, forma `k` |

`R` = número aleatorio uniforme en (0,1).

### Propiedades de las variables aleatorias
- **Discretas**: `0 ≤ p(xᵢ) ≤ 1` · `Σ p(xᵢ) = 1`
- **Continuas**: `f(x) ≥ 0` · `∫ f(x)dx = 1` (de −∞ a ∞)

---

## Métodos de bondad de ajuste que menciona la cátedra
- **Chi-Cuadrado**
- **Kolmogorov-Smirnov**
- **Anderson-Darling**

---

## Parámetros estimados por el método de los momentos
- **Exponencial**: `λ = 1/x̄` *(del ejemplo: `x̄ = 13.55` → `λ = 0.0738`)*
