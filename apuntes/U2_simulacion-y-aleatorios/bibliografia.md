# U2 — Bibliografía cruzada

> Qué dice la bibliografía sobre cada tema de U2, y **dónde se aparta de la cátedra**.

---

## 1. Cobertura por tema

| Tema de la cátedra | ¿Dónde está? |
|---|---|
| **Toma de datos** | `Barcelo` pp. 80–90 (**240 observaciones**, la mejor) · `Simulacion_de_sistemas` §3.1 |
| **Técnica de captura (tcpdump/SIP/DNS)** | ⚠️ **NO está en ninguna fuente** — es propia de la cátedra |
| **Selección de distribuciones** | `Barcelo` pp. 82–90 (histograma → cv → exponencial → gamma) |
| **Chi-cuadrado** | `Barcelo` eq. 2.5 `c² = Σ(Nⱼ − Npⱼ)²/Npⱼ` · `Librodesimulacion` (ejemplo completo: **χ² = 0.3, gl 4, crítico 9.49**) · `Simulacion_de_sistemas` |
| **Kolmogorov-Smirnov** | **Solo `Librodesimulacion` 2.2.1.2**, con procedimiento y ejemplo (**D = 0.17316** vs **0.242**) |
| **Anderson-Darling** | ⚠️ **NO está en ningún libro en español**. Solo aparece en `TestU01-Paper` (fuera de la cátedra) |
| **H₀ / H₁** | `Librodesimulacion` y `Simulacion_de_sistemas` |
| **Requisito FE ≥ 5** | ⚠️ **NO está en los libros**. Viene de **Yates (1934)** |
| **Regla de Sturges** | **Solo `Barcelo` p. 82** |
| **Condiciones de calidad del generador** | ⚠️ **Ninguna fuente da las 5 de la cátedra**. Ver §2 |
| **GCL y período completo** | `Barcelo` §2.2.4 con las **condiciones de Hull-Dobell** textuales · `Librodesimulacion` 2.1.1/2.1.2 con las reglas de Knuth |
| **Cuadrados medios** | `Barcelo` §2.2.2 (von Neumann, 1951) |
| **Producto medio y constante multiplicativa** | ⚠️ **NO están en ninguna fuente** |

---

## 2. Discrepancias con la cátedra

### 2.1 ⚠️ La atribución a Yates está a medias
`[DATO]` La cátedra rotula el reagrupamiento por FE < 5 como *"**Corrección por Continuidad (Yates, 1934)**"*.

Pero la **corrección por continuidad de Yates es otra cosa**: para tablas 2×2, **restar ½ a las desviaciones absolutas antes de elevar al cuadrado** (Yates 1934, p. 222).

`[DATO]` Lo que **sí** está en ese paper es el criterio FE ≥ 5, y en la **introducción**, no como resultado:
> *"it has been customary to regard x² as sufficiently accurate if no cell has an expectancy of less than 5."* (p. 217)

`[INFERENCIA]` **La cita es medio correcta**: el paper es el correcto, pero **el nombre del método no**. Si en el oral te piden "explique la corrección de Yates", la respuesta correcta es la de la tabla 2×2, **no** el reagrupamiento. Tenerlo claro te puede salvar de un papelón.

### 2.2 El requisito FE ≥ 5 y Sturges no salen de los libros de la cátedra
`[DATO]` Ni el FE ≥ 5 ni Sturges figuran en los textos en español del directorio.
- **FE ≥ 5** → fuente primaria: **Yates (1934)**.
- **Sturges** → única fuente: **`Barcelo` p. 82**, y con un **caveat importante**: Barcelo cita a Law & Kelton diciendo que las reglas empíricas *"no funcionan demasiado bien"*, y en su propio ejemplo usa **25 clases** cuando las reglas sugerían 9–10.

`[INFERENCIA]` Dos reglas que la cátedra usa como si fueran estándar son, en realidad, **convenciones** con origen y crítica. Saberlo es material de oral.

### 2.3 Las condiciones de calidad: cinco versiones distintas

| Fuente | Cantidad | Cuáles |
|---|---|---|
| **Cátedra** | 5 | uniformes · independientes · reproducibles · período largo · eficiencia |
| `Librodesimulacion` | **6** | igual, pero **parte la eficiencia en dos**: *"generados de manera rápida"* y *"que no requiera gran capacidad de almacenamiento"* |
| `Barcelo` p. 106 | 3 | pasar una batería de tests · suficientes dígitos · eficiencia computacional |
| `Leemis-Parks` | 5 | *random · controllable · portable · efficient · documented* + partición en *streams* |
| `Efficient_PRNG_CUDA` | 2 | período largo (≥ n²) · buena calidad estadística |

`[INFERENCIA]` **No hay un estándar único.** La versión de la cátedra es razonable, pero si te piden "¿cuáles son las condiciones?" y respondés 5, podés recibir "yo tengo 6". No es un error tuyo: es que el criterio no está fijado.

### 2.4 ⚠️ Lehmer RECHAZA el método de cuadrados medios
`[DATO]` La cátedra presenta los cuadrados medios **neutralmente**, como un método más.

Pero **D. H. Lehmer** (la fuente original, en `DH-Lehmer.pdf`, p. 143) lo **desaconseja explícitamente**:
> *"this process cannot be recommended as a source of random digits."*

`[DATO]` Lehmer también señala que en la generalización `f(x) = ax + b` **el período es independiente de `b`** — *"nothing is gained by this generalization, since the period is independent of b"*.

`[INFERENCIA]` **Esto es oro para el oral**: si te preguntan por cuadrados medios, decir que el propio creador del generador congruencial lo descartó como fuente de dígitos aleatorios, y explicar por qué (colapso rápido a cero), te posiciona muy bien.

### 2.5 La fecha de Lehmer
- `Librodesimulacion` dice que Lehmer desarrolló el GCL *"en el año de 1940"*.
- `Barcelo` dice *"Lehmer en 1951"*.
- `[DATO]` La fuente primaria (`DH-Lehmer`, simposio Harvard 1949) muestra el **multiplicativo** `f(x) = ax mod m` (ENIAC, período 5.882.352 con `mod 10⁸+1`).

`[INFERENCIA]` Ambas fechas secundarias son imprecisas, y **el original es multiplicativo, no el GCL mixto general**. Si te piden "¿quién inventó el GCL y cuándo?", la respuesta más defendible es Lehmer, hacia 1949, en su forma multiplicativa.

### 2.6 Confirmación: la trampa de los grados de libertad es real
`[DATO]` `Librodesimulacion`, `Simulacion_de_sistemas` **y la cátedra usan `k − 1` para bondad de ajuste**. **Ninguno descuenta los parámetros estimados.**
`[INFERENCIA]` Esto **confirma** la Trampa 1 del `teoria.md`: la omisión no es un error de la cátedra aislado, es **lo que hacen todos los textos del directorio**. Respuesta correcta: contestá `k − 1` como la cátedra; mencioná el matiz en el oral.

---

## 3. Aportes que la cátedra NO da (fuera del programa)

- **`TestU01` (L'Ecuyer & Simard)**: baterías **SmallCrush / Crush / BigCrush**, con familias de tests (colisión, *birthday spacings*, pares cercanos, random-walk, complejidad lineal, rango de matrices). **Y algo que la cátedra nombra sin dar: la fórmula del estadístico Anderson-Darling**:
```
A²_N = −N − (1/N) · Σ(2j−1)·[ ln U_(j) + ln(1−U_(N+1−j)) ]
```
- **`MersenneTwister`**: período **2¹⁹⁹³⁷ − 1**, equidistribución en 623 dimensiones.
- **`Leemis-Parks`**: los criterios *portable* y *documented*, y la partición en *streams*.
- **`Barcelo`**: el ejemplo de 240 datos del peaje (ver §1) — mucho más realista que el de 30 datos de la cátedra.
- **`Librodesimulacion`**: batería de tests de aleatoriedad completa (corridas, huecos, póker, Yule, autocorrelación) con ejemplos.

---

## 4. Veredicto

**Usable para U2**: `Barcelo.pdf` (Sturges, χ², GCL con Hull-Dobell, el mejor ejemplo de toma de datos), `Librodesimulacion.pdf` (K-S completo, tests de aleatoriedad, GCL mixto/multiplicativo), `Simulacion_de_sistemas.pdf` (χ²), `Yates (1934).pdf` (**fuente primaria del FE ≥ 5**), y —fuera del programa— `TestU01`, `MersenneTwister`, `Leemis-Parks` y `DH-Lehmer`.
