# U6 — Bibliografía cruzada

> Qué dice la bibliografía sobre cada tema de U6, y **dónde se aparta de la cátedra**.
> Este es el cruce **más importante de todos**, porque U6 es el bloque de mayor peso y porque acá la cátedra se aparta del estándar.

---

## 1. Mapa de legibilidad

| Archivo | Págs. | Qué es | Nota |
|---|---|---|---|
| `Diseno_y_analisis_de_experimentos_Dougla.pdf` | 700 | **Montgomery**, *Diseño y análisis de experimentos*, 2.ª ed. español (Limusa–Wiley, 2004) | **La referencia central.** Capa de texto OCR con algo de ruido (`2k` → `2:`, `π` → `n`) |
| `Walpole.pdf` | 816 | Walpole, Myers & Myers | Texto limpio. Notación **distinta** a Montgomery y a la cátedra |
| `Optimizacion de una RS utilizando JMP.pdf` | 7 | G. Figueroa Preciado, *Mosaicos Matemáticos* N.º 11, 2003 | Ejemplo CCD/RSM resuelto con JMP |

`[DATO]` **Desplazamiento de páginas**: en Montgomery, `página PDF = página impresa + 14`. En Walpole, `+ 22`.

---

## 2. ⚠️⚠️ La trampa central, ahora con precisión

### 2.1 Lo que **SÍ** es estándar

| Fórmula de la cátedra | Veredicto |
|---|---|
| **`fc = T²/N`** | ✅ **Estándar.** Montgomery usa el mismo término, sin nombrarlo: `SST = ΣΣy_ij² − y..²/N` (eq. 3-8) y `SSTratamientos = (1/n)Σy_i.² − y..²/N` (eq. 3-9). **El término restado `y..²/N` ES el `fc` de la cátedra** |
| **`F = VI/VD`** (caso unifactorial balanceado) | ✅ **Numéricamente estándar.** `VI = SS_entre/(k−1) = MSTr` y `VD = SS_dentro/(N−k) = MSE` → `F = MSTr/MSE`. **Coincide** |
| **`R² = SSR/SST`** | ✅ Idéntico (Montgomery eq. 10-26) |
| **`F = (SSR/k)/(SSE/(n−k−1))`** | ✅ **Idéntico** (Montgomery eq. 10-22, Tabla 10-6). **Los grados de libertad coinciden**. Para k=2, n=9: `F_0,05;2;6 = 5,143` ✓ |
| **Modelo de 1.º y 2.º orden de RSM** | ✅ Idénticos (Montgomery eq. 11-1 y 11-2) |
| **"Ascenso a la loma / descenso al valle"** | ✅ Montgomery §11-2, literal: *"ascenso más pronunciado" / "descenso más pronunciado"* |

### 2.2 Lo que **NO** es estándar — y por qué es peligroso

#### `F = Máx Varianza / Mín Varianza` ⚠️

`[DATO]` En el **caso unifactorial balanceado** coincide numéricamente con el estándar. **Pero el planteo es peligroso:**

- El `F` estándar es **siempre** `MSTr / MSE`: **tratamiento en el numerador, error en el denominador**. Es asimétrico por construcción.
- `Máx/Mín` **no es asimétrico**: si la varianza de error resultara **mayor** que la de tratamiento, `Máx/Mín` **invierte el cociente** y produce un **`F` grande espurio** — es decir, **te sugeriría significación donde no la hay**.

`[DATO]` Montgomery y Walpole **nunca** definen el `F` así. El único cociente `s₁²/s₂²` legítimo es el **test de igualdad de varianzas** (Montgomery §2-6), cuya hipótesis nula es la **igualdad de varianzas**, no la igualdad de medias.

**Conclusión**: `Máx/Mín` **funciona por casualidad** en el ejemplo balanceado, y **falla conceptualmente** como regla general.

#### El método multifactorial D/E ⚠️⚠️

`[DATO]` El algoritmo de la cátedra (restar el mínimo → tablas D1/D2/D3 → tablas E1/E2/E3 → **varianzas por factor y por par** → **ordenar** para nombrar el factor y la interacción "más significativos") **no calcula ningún cociente `F`**.

`[DATO]` **Eso no aparece en ningún lado de Montgomery ni de Walpole.** Ordenar varianzas **no es un test de inferencia**: no hay hipótesis nula, no hay distribución de referencia, no hay nivel de significación.

**El ANOVA estándar de dos vías** (Montgomery Tabla 5-3; Walpole Tabla 14.2):

| Fuente | SS | gl | MS | **F** |
|---|---|---|---|---|
| A | SSA | a−1 | MSA = SSA/(a−1) | **F₀ = MSA/MSE** |
| B | SSB | b−1 | MSB = SSB/(b−1) | **F₀ = MSB/MSE** |
| AB | SSAB | (a−1)(b−1) | MSAB = SSAB/[(a−1)(b−1)] | **F₀ = MSAB/MSE** |
| Error | SSE | ab(n−1) | MSE = SSE/[ab(n−1)] | — |
| Total | SST | abn−1 | — | — |

**Un `F` por término**, cada uno contra el error. Esa es la diferencia de fondo.

### 2.3 El modelo estructural/funcional **no está en ningún libro** ⚠️

`[DATO]` `Ns = ∏qᵢ` y `Nf ≤ Ns` **no aparecen en Montgomery ni en Walpole** (búsqueda de `modelo estructural`, `modelo funcional`, `Ns`, `Nf`: cero resultados).

`[INFERENCIA]` Es **terminología de Shannon**, propia del material de simulación — y la cátedra la usa **como si fuera de manual**. Si te la piden, la única fuente es `9-Diseños de Experiencias.pdf`.

`[DATO]` Tampoco está **el principio de Pareto 20/80** como justificación del cribado, ni el **análisis de la variable dominante por derivadas parciales `∂N/∂p`, `∂N/∂q`, `∂N/∂k`**. Esos son **aportes propios del capítulo de Shannon**.

### 2.4 ⚠️ RSM: mismo modelo, **distinto diseño**
`[DATO]` Las fórmulas coinciden. Pero:
- La cátedra usa un **`3^k` completo** (9 puntos para k=2) en el ejemplo del router.
- Montgomery (§11-4.2) y el PDF de JMP usan **diseño central compuesto (CCD)**: factorial `2^k` + `2k` axiales + `nc` puntos centrales, o **Box-Behnken**.
- `[DATO]` **La cátedra no enseña CCD.** Los archivos CCD solo aparecen en los ejemplos de JMP (`Ejemplos JMP-20250606.zip`), no en la teoría.
- `[DATO]` El PDF de JMP agrega la regla de **rotabilidad** `α = (2^k)^{1/4}` = **1,414** para k=2 (coincide con Montgomery, `α = (nF)^{1/4}`).

### 2.5 ⚠️ Ruta de JMP: `Full Factorial` vs `Response Surface`
`[DATO]` Las guías de la cátedra (`04-two-way-(factorial)-anova.pdf`) usan `Macros > **Full Factorial**`.
`[DATO]` El camino **correcto para RSM** es `Analyze > Fit Model > Macros > **Response Surface**` (PDF de JMP, y es lo que Montgomery supone).
`[INFERENCIA]` **No es lo mismo.** `Full Factorial` arma el modelo factorial con interacción; `Response Surface` arma el **modelo de segundo orden con los términos cuadráticos**. Si armás el RSM con `Full Factorial` **te faltan los términos `x²` e `y²`**.

### 2.6 Colisiones de notación ⚠️

| Concepto | Cátedra | Montgomery | Walpole |
|---|---|---|---|
| Total de observaciones | `N = p·q^k` | `N = an` | `nk` |
| Repeticiones | **`p`** | `n` | `n` |
| Niveles | **`qᵢ`** | `a`, `b` | `a`, `b` |
| **Cantidad de FACTORES** | **`k`** | — | ⚠️ **`k` = cantidad de TRATAMIENTOS** |
| Varianza de tratamiento | `VI` | `MSTratamientos` | `s₁²` |
| Varianza de error | `VD` | `MSE` | `s²` |

`[INFERENCIA]` **Ojo con `k`**: en la cátedra `k` es la **cantidad de factores**; en Walpole `k` es la **cantidad de tratamientos**. Confundirlos en un oral es un error fácil de cometer y difícil de justificar.

### 2.7 Lo que aporta Walpole (poco, pero útil)
`[DATO]` Walpole **no usa** el atajo `T²/N`; su notación es `STC` (total), `SCT`/`SCA`,`SCB`,`SC(AB)` (tratamientos) y `SCE` (error).
`[DATO]` Su capítulo 10.11 trae el **chi-cuadrado de bondad de ajuste** `χ² = Σ(oᵢ−eᵢ)²/eᵢ`, `v = k−1` — útil para **validar las distribuciones de entrada** de una simulación, cosa que la cátedra trata en U2 pero **no conecta con U6**.

---

## 3. Aportes que la cátedra NO da (fuera del programa)

Todo esto está en Montgomery o Walpole y **la cátedra no lo toca**:

- **Aleatorización y réplica verdadera** (Montgomery ch. 1 y 4) — la cátedra **nunca** discute aleatorización, ni la distinción réplica vs repetición.
- **Bloques**: diseño en bloques completos al azar (Montgomery ch. 4), confusión en `2^k` (ch. 7), bloqueo de corridas factoriales (§5-6).
- **Análisis de residuos** y adecuación del modelo (Montgomery §3-4, §5-3.3).
- **Test de falta de ajuste** (*lack of fit*) y error puro: `F₀ = MS_LOF / MS_PE` (Montgomery §6-6, §10-8). **El PDF de JMP lo reporta.**
- **Potencia, tamaño de muestra y curvas OC** (Montgomery §3-7, Tablas V–VI).
- **Comparaciones múltiples**: Tukey, Scheffé, Dunnett, contrastes ortogonales (Montgomery §3-5).
- **CCD, Box-Behnken, rotabilidad, CCD centrado en la cara, álgebra del paso en el ascenso más pronunciado** (Montgomery §11-2 y §11-4; PDF de JMP).
- **Significación por término vía Effect Tests / valores p** (JMP; Montgomery §10-4.2) — la cátedra **solo ordena varianzas**.
- **Codificación ±1, contrastes y algoritmo de Yates** (Montgomery ch. 6).
- **Fraccionales: resolución, aliasing, proyección** (Montgomery ch. 8; Walpole §15.6–15.9).
- **ANOVA no paramétrico** (Kruskal-Wallis, Montgomery §3-10).
- **Efectos aleatorios y componentes de varianza** (Montgomery ch. 12).

---

## 4. Veredicto

**Orden de uso para U6:**

1. **`Diseno_y_analisis_de_experimentos_Dougla.pdf` (Montgomery)** — la única referencia **completa y genuina**. Cap. 3 (unifactorial + tabla), cap. 5 (tabla de dos vías), caps. 6–8 (`2^k`, bloques, fracciones), cap. 10 (regresión y test `F`), cap. 11 (RSM). **Ojo: enseña la ruta ESTÁNDAR, así que corrige —no confirma— los métodos de la cátedra.**
2. **`Optimizacion de una RS utilizando JMP.pdf`** — el compañero directo para RSM con JMP: muestra la ruta correcta `Macros > Response Surface`, el CCD, la falta de ajuste y el mismo `F = MSR/MSE`.
3. **`Walpole.pdf`** — solo para contrastar notación (caps. 13–14) y para el χ² de bondad de ajuste (10.11).

### La regla para rendir
`[INFERENCIA]` **Contestá siempre con el método de la cátedra.** Pero tené presente esta distinción, porque es la que te hace quedar bien si el oral se abre:

- **`fc = T²/N`, `F = VI/VD` y el `F` de la regresión SON estándar** → no hay conflicto.
- **`F = Máx/Mín` como regla general y las tablas D/E NO son estándar** → son heurísticos de la cátedra.
- **`Ns = ∏qᵢ` / `Nf ≤ Ns` no están en ningún libro** → son de Shannon.

Decir "escribo el método de la cátedra; el estándar de Montgomery es `F = MSTr/MSE` con un `F` por término" te posiciona como alguien que **entiende**, no como alguien que repite.
