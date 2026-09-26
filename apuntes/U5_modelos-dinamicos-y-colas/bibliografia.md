# U5 — Bibliografía cruzada

> Qué dice la bibliografía sobre cada tema de U5, y **dónde se aparta de la cátedra**.

---

## 1. Cobertura por tema

| Tema de la cátedra | ¿Dónde está? |
|---|---|
| **Historia (Erlang 1909)** | `Fundamentals` §1.1: *"The pioneer investigator was the Danish mathematician A. K. Erlang"* · `Iversen` cap. 10: *"The first paper on queueing theory was published by Erlang in 1909 and dealt with … M/D/n"* |
| **Proceso de Poisson y tiempos exponenciales** | `Ross` §2.9 · `Walpole` §5.5 (`p(x; λt) = e^{−λt}(λt)ˣ/x!`) · `Fundamentals` cap. 2 |
| **Notación de Kendall** | `Taha` e `Iversen` (extendido) usan **6 campos** como la cátedra. `Gross` y `Banks` usan 5. Ver §2.1 |
| **M/M/1 — balance y `Pᵢ = (1−ρ)ρⁱ`** | **`Fundamentals` §3.1**: deriva **balance global (eq. 3.1)** y **balance detallado (eq. 3.5)**, y llega a `pₙ = (1−ρ)ρⁿ` con `ρ = λ/μ < 1` (**eq. 3.9**) — **es exactamente la derivación de la clase 6** |
| **Ley de Little** | `Fundamentals` `L = λW` · `Iversen` eq. 3.20 · `Teletraffic Handbook` eq. 5.20 |
| **`B(K) = ρ^K`** | `Fundamentals`: `Pr{N ≥ n} = ρⁿ`. ⚠️ Ver §2.3 |
| **M/M/∞ y M/G/∞** | `Taha` (M/M/∞): *"la cual es Poisson con media Ls = r. Como era de esperarse, **Lq y Wq son cero** porque es una instalación de autoservicio"* · `Fundamentals` §3.7 (M/M/∞) y §6.2 (M/G/∞) |
| **Erlang tipo n** | `Fundamentals` §3.2.5 y §3.3. ⚠️ Ver §2.4 |
| **QoS (HTB, CIR/MIR, PFIFO/BFIFO, SFQ, PCQ)** | ⚠️ **NO ESTÁ EN NINGUNA FUENTE.** Ver §2.5 |
| **RED** | `RED_Floyd.pdf` (Floyd & Jacobson, 1993) — **la única pieza de QoS cubierta** |

---

## 2. Discrepancias con la cátedra

### 2.1 La notación de Kendall: quién usa cuántos campos

| Fuente | Campos | Notación |
|---|---|---|
| **Cátedra** | **6** | `A \| B \| X \| Y \| Z \| V` |
| **`Taha`** | **6** | `a/b/c/d/e/f` — *"Este autor agregó el último elemento, el símbolo f, en 1968"*. Ejemplo: `(M/D/10):(GD/20/∞)` |
| **`Iversen`** (extendido) | **6** | `A/B/n/K/S/X` |
| `Gross`/`Fundamentals` | 5 | `A/B/X/Y/Z` |
| `Banks` | 5 | `A/B/c/N/K` (disciplina asumida FIFO) |
| `Teletraffic Handbook` | 3 | `A/B/n` |
| `Iversen` (base) | 3 | `A/B/n` |

`[INFERENCIA]` **La cátedra NO está sola en usar 6 campos**: coincide con **Taha** y con **Iversen extendido**. Pero **`Gross` —la fuente que la propia cátedra cita para el M/M/1— usa 5**. O sea: la cátedra **toma la deducción de Gross y la notación de Taha/iversen**.

⚠️ **Además, el orden de Taha es distinto**: en Taha la **disciplina es el 4.º campo** (`d`), no el 5.º. Si te piden "escriba la notación de Kendall de 6 campos", aclarar que **el orden depende del autor** te cubre.

### 2.2 La notación de las medidas
- **Cátedra**: `E[L]`, `W[S]`, `W[Q]`, `E[L_q]`.
- `Gross`: `L`, `W`, `Lq`, `Wq`.
- `Banks`: `L`, `LQ`, `w`, `wQ`.
- `Taha`: `Ls`, `Lq`, `Ws`, `Wq`.
- `Iversen`/`Teletraffic`: `A` para el tráfico ofrecido.

`[INFERENCIA]` Son **las mismas cantidades**. Pero si en el oral escribís `W[S]` y el corrector espera `w`, o al revés, conviene **aclarar la notación al empezar la respuesta**. Es gratis y te cubre.

### 2.3 ⚠️ `B(K) = ρ^K` es la COLA de la distribución, no el bloqueo de M/M/1/K
`[DATO]` La cátedra da `B(K) = ρ^K` como "probabilidad de tener al menos K paquetes".
`[DATO]` Eso corresponde a la **cola de la distribución M/M/1** (`Pr{N ≥ n} = ρⁿ`, Gross). **NO** es la probabilidad exacta de bloqueo de un **M/M/1/K** con buffer finito, que es:
```
p_N = (1 − ρ)·ρ^N / (1 − ρ^(N+1))
```
(Taha; Gross §3.5)

`[INFERENCIA]` **Trampa de oral**: si te preguntan por un sistema con capacidad limitada, `ρ^K` está mal. Con buffer infinito (el caso de la clase, M/M/1 puro), `ρ^K` es la cola correcta.

### 2.4 ⚠️ "Erlang tipo n" es condicional
Ver `U3/bibliografia.md` §2.3. `[DATO]` Gross confirma Erlang tipo `(n+1)` y tipo `(n−c+1)` **condicionado a la cantidad de clientes en el sistema**. El tiempo de permanencia **incondicional** en M/M/1 es **exponencial** (`W(t) = 1 − e^{−(μ−λ)t}`, Gross eq. 3.31).

### 2.5 ⚠️ La QoS de la cátedra NO está en la bibliografía
`[DATO]` Grep sobre **HTB, CBQ, CIR, MIR, PFIFO, BFIFO, SFQ, PCQ** en todo `Bibliografia/`: **cero resultados**. Lo único cubierto es **RED** (`RED_Floyd.pdf`).

`[INFERENCIA]` **Todo el bloque de QoS de la cátedra (HTB, CIR/MIR, PFIFO/BFIFO, SFQ, PCQ) es material propio de Roqué, sin respaldo bibliográfico en este directorio.** Es el contenido más "cátedra-dependiente" de U5. Para esa parte, la única fuente es el deck `QoS.pdf`.

### 2.6 Nomenclatura `s` vs `c`
`[DATO]` La cátedra dice **M/M/s** o **M/M/K**; los libros dicen **M/M/c** (Gross, Banks, Iversen, Taha) o **M/M/n** (Iversen, Teletraffic).
`[INFERENCIA]` Es lo mismo. Pero si te piden "M/M/K (Erlang-C)" y el libro dice "M/M/c", no te confundas: **K en la cátedra = c en los libros**.

---

## 3. Aportes que la cátedra NO da (fuera del programa)

`[DATO]` Todo esto está en la bibliografía y **la cátedra solo lo nombra**:

| Modelo | Fórmula / fuente |
|---|---|
| **M/M/K (Erlang-C)** | `Fundamentals` §3.3, eq. 3.40: `C(c, r) ≡ 1 − Wq(0)` |
| **Erlang-B (pérdida)** | `Fundamentals` eq. 3.55: `B(c,r) = (r^c/c!) / Σ(rⁱ/i!)` · `Iversen`: `E_{2,n}(A)` |
| **M/M/1/K y M/M/c/K** | `Taha` §18.6; `Gross` §3.5 — probabilidades exactas de estado y **tasa de arribo efectiva `λ_eff`** |
| **M/G/1 (Pollaczek-Khintchine)** | `Taha`: `Ls = λE{t} + λ²(E²{t}+var{t}) / (2(1−λE{t}))` · `Iversen`: `W = A·s/(2(1−A))·ε`, con **factor de forma `ε`** |
| **Prueba de la Ley de Little y sus límites** | `Fundamentals`, Teorema 1.1 |
| **La psicología de la espera (Maister)** | `Fundamentals` |

`[INFERENCIA]` Si en el oral te toca **M/M/K**, la cátedra espera que **plantees el modelo** (Kendall + balance). Si además citás **Erlang-C** y sabés que **no está en el programa**, sumás; si lo tirás como si fuera contenido de la clase, te pueden preguntar de dónde salió.

---

## 4. Veredicto

**Usable para U5**:
1. **`Fundamentals_of_queueing_theory.pdf`** — **el núcleo**: Kendall (5 campos), **la derivación de M/M/1 por balance global y detallado**, Erlang-C, Erlang-B, M/G/1, Erlang tipo n. **Es la fuente de la clase 6**, con el rigor que el deck no muestra.
2. **`Taha.pdf`** — **en español** y con **notación de 6 campos**, la más cercana a la cátedra. Trae M/M/1/K, M/M/c y M/M/∞ con ejemplos resueltos.
3. **`Iversen.pdf`** — notación extendida de 6 campos, Erlang delay/loss, P-K.
4. **`Teletraffic engineering Handbook.pdf`** — complemento: prueba de Little, Erlang.
5. **`RED_Floyd.pdf`** — **la única pieza de QoS** con respaldo bibliográfico.

**Sin respaldo bibliográfico** (solo la cátedra): HTB/CBQ, CIR/MIR, PFIFO/BFIFO, SFQ, PCQ.
