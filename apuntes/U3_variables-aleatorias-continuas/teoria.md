# U3 — Generación de variables aleatorias y Montecarlo (TEORÍA)

> **Fuentes** (todas con capa de texto, extraídas con `pdftotext`):
> - `05_Generacion de Variables Aleatorias/Clase 3.pdf` (47 págs.) — inversión y convolución
> - `05_Generacion de Variables Aleatorias/Clase 4.pdf` (53 págs.) — composición y rechazo
> - `05_Generacion de Variables Aleatorias/6-Generación de Varialbles aleatorias NO-UNIFORMES.pdf` — fórmulas y ejemplos
> - `05_Generacion de Variables Aleatorias/TP3.pdf` — **21 actividades**
> - `04_Metodo Montecarlo/7-Método Montecarlo y Sistema de Colas.pdf`
> - `04_Metodo Montecarlo/Montecarlo-Ej-Proyecto.pdf` — nota técnica del curso-taller 2012
> - `04_Metodo Montecarlo/Distintas dotaciones.docx` — tablas de 4/5/6 operarios
> - `05_.../JUEGO DE LA INCERTIDUMBRE.docx` — vocabulario (azar, riesgo, incertidumbre)
>
> ⚠️ **Nota de método**: en estos PDF **muchas fórmulas son imágenes raster**, no texto. Se resolvieron renderizando las páginas. Donde no se pudo resolver, queda marcado.

---

## 1. El marco: cómo se genera una variable aleatoria

`[DATO]` **Coss Bu (2003, p.49)**, citado por la cátedra: un generador de números aleatorios **más** una función que los transforma en la distribución deseada.

```
R  →  G(R)  →  X
```
`R` = números aleatorios · `G(R)` = el algoritmo de transformación · `X` = la variable de la distribución buscada.

`[DATO]` La cátedra declara literalmente: *"Vamos a considerar cuatro métodos de generación de VA: **Método de inversión, Método de Composición, Método de Convolución, Método de Rechazo**."*

> **Los cuatro se desarrollan de verdad.** No son menciones al pasar.

---

## 2. Los cuatro métodos

### 2.1 Método de inversión `[DATO]`

**Idea**: como `0 ≤ F(x) ≤ 1`, se genera `R ~ U[0,1]` y se despeja.

```
R = F(x)   →   x = F⁻¹(R)
```

**Pseudocódigo de la cátedra**:
```
GENERAR R ~ U[0,1]
HACER x = F⁻¹(R)
SALIR x
```

**Ejemplo resuelto**: `f(x) = eˣ/(e−1)`, `0 ≤ x ≤ 1`
- `F(x) = (eˣ − 1)/(e − 1)`
- `x = F⁻¹(R) = ln[1 + (e−1)·R]`
- Para `R = 0.54` → **x = 0.6564** (verificado en MATLAB)

**Variante discreta** (Poisson `λ = 4`): se compara `R` contra la acumulada y se devuelve el primer `x` cuya `P(X ≤ x) ≥ R`. Para `R = 0.875` → **x = 6**.

**Condición**: `F` tiene que ser **invertible en forma cerrada**.
**Ventaja**: es **exacto** (no se rechaza nada) y consume **un solo `R` por valor generado**.

### 2.2 Método de composición `[DATO]`

`[DATO]` Coss Bu: *"la distribución de probabilidad `f(x)` se expresa como una combinación de varias distribuciones `fᵢ(x)` seleccionadas adecuadamente."*

```
f(x) = A₁f₁(x) + A₂f₂(x) + ⋯ + Aₙfₙ(x)      con ΣAᵢ = 1
```

**Procedimiento (7 pasos)**:
1. Dividir `f` en `n` sub-áreas `Aᵢ`.
2. Definir cada `fᵢ(x)`.
3. Expresar `f` como la mezcla.
4. Construir la **acumulada de las áreas**.
5. Generar **dos uniformes** `R₁, R₂`.
6. Con `R₁` sobre la acumulada de áreas → **elegir** `fᵢ(x)`.
7. Con `R₂` por inversión (o procedimiento especial) → **simular x** en la `fᵢ` elegida.

**Costo**: **siempre dos números aleatorios** por valor generado.
**Condición**: `f` tiene que ser descomponible en `fᵢ` normalizadas y con inversa conocida.

### 2.3 Método de convolución `[DATO]`

`[DATO]` Banks et al. (2010, p.261): *"The probability distribution of a sum of two or more independent random variables is called a convolution… This technique can be applied to obtain Erlang variates and binomial variates."*

**Condición**: `X` se descompone como `X = X₁ + X₂ + ⋯ + Xₙ` con `Xᵢ` **i.i.d.**; se genera una muestra de cada `Xᵢ` y se suman.

**Ejemplo resuelto (M|M|1, μ = 14 paq/seg, estado k = 5)** — la latencia `Wₛ ~ Erlang tipo k`:
- Cada `Tᵢ ~ Exp(14)` → `F(tᵢ) = 1 − e^(−14tᵢ)` → por inversión `tᵢ = −ln(1−Rᵢ)/14`
- Entonces: **`T = −(1/14) · Σ_{i=1}^{5} ln(1−Rᵢ)`**
- Con `R = 0.861, 0.161, 0.541, 0.752, 0.324` → **T = 0.337 segundos**

`[DATO]` **Desventaja explícita**: *"tiene como inconveniente principal el ser excesivamente lento cuando n es elevado"*.
**Costo**: **n números aleatorios** por valor generado.

### 2.4 Método de rechazo `[DATO]`

**Hipótesis**: `f(x)` está **acotada** en `a ≤ x ≤ b`.

**Cuatro pasos**:
1. Generar `R₁, R₂ ~ U[0,1]`.
2. `x = a + (b−a)·R₁`.
3. Evaluar `f(x) = f[a + (b−a)R₁]`.
4. **Aceptar** si `M·R₂ ≤ f[a + (b−a)R₁]`; si no, **volver al paso 1**.

**Justificación**: se genera un punto `(x, y)` con `y ~ U[0,M]` y se acepta si cae **debajo de la curva**.

**Eficiencia** `[DATO]`:
```
P(Aceptar) = Área de f(x) / Área del rectángulo = 1 / [M·(b−a)]
Ejecuciones esperadas = M·(b−a)
```
Requiere conocer **`M = máx f`** en `[a,b]`. Cuanto más ajustado el rectángulo, mejor.

**Ejemplo resuelto**: `f(x) = (1/2π)√(4−x²)`, `−2 ≤ x ≤ 2`
- `M = f(0) = 1/π` · `b−a = 4`
- **Eficiencia = 1/(4/π) = π/4 ≈ 0.785**
- **Ejecuciones = 1.27**

---

## 3. Distribuciones y sus generadores

### Uniforme (continua) — inversión `[DATO]`
```
f(x) = 1/(b−a),  a ≤ x ≤ b
F(x) = (x−a)/(b−a)
x = a + (b−a)·R
```
⚠️ El deck escribe la segunda rama como *"0 si a > x > b"*, que **no tiene sentido lógico** (debería ser `x < a` o `x > b`).

### Exponencial (continua) — inversión `[DATO]`
```
f(x) = λe^(−λx),  x ≥ 0
F(x) = 1 − e^(−λx)
x = −(1/λ)·Ln R
```
`[DATO]` El paso clave del despeje: *"si `R` sigue una distribución uniforme, entonces `1−R` también"* → se reemplaza `1−R` por `R`.
⚠️ El deck escribe la integral como `∫₀ˣ λe^(−λx)dt` — usa `x` como límite **y** como variable de integración. Es un descuido de notación; la intención es correcta.

### Empírica (continua a trozos) — inversión `[DATO]`
```
f(x) = x        si 0 ≤ x ≤ 1
f(x) = 1/2      si 1 < x ≤ 2

F(x) = x²/2     si 0 ≤ x ≤ 1
F(x) = x/2      si 1 < x ≤ 2

x = √(2R)       si R ≤ 1/2
x = 2R          si R > 1/2
```
(En `R = 1/2` ambas ramas dan `x = 1`: la función es continua.)

### Triangular (continua) — **composición** `[DATO]`
Pico en `b`, altura `2/(c−a)`.
```
A₁ = (b−a)/(c−a)          A₂ = (c−b)/(c−a)
f₁(x) = 2/(b−a)² · (x−a)       F₁(x) = (x−a)²/(b−a)²
f₂(x) = −2/(c−b)² · (x−c)      F₂(x) = 1 − (x−c)²/(c−b)²
```
Si `R₁ < (b−a)/(c−a)` → simular `f₁`: **`x = a + (b−a)·√R₂`**

⚠️ **La inversa de `f₂` NO está escrita en el material.** El deck dice *"si la respuesta es negativa se simulan valores de la distribución `f₂(x)`"* y la página termina ahí. Por simetría sería `x = c − (c−b)·√(1−R₂)`, pero **la cátedra no lo da**.

### Gamma (continua) — suma de exponenciales `[DATO]`
```
f(x) = λe^(−λx)·(λx)^(k−1) / Γ(k),   x > 0, λ > 0
Γ(z) = ∫₀^∞ t^(z−1)e^(−t)dt    ·   Γ(1) = 1   ·   Γ(k) = (k−1)!
```
`[DATO]` **Una Gamma se puede expresar como la suma de `k` exponenciales independientes** → se genera por **convolución**. No se da fórmula de inversión.

### Erlang (continua) — convolución `[DATO]`
```
f(x) = λe^(−λx)·(λx)^(k−1) / (k−1)!,   x > 0
```
- Es un **caso particular de la Gamma** con `k` natural (`Γ(k) = (k−1)!`).
- Si **`k = 1` se reduce a la Exponencial** de parámetro `λ`.
- `[DATO]` Usos declarados: *"servicio masivo, tiempos de espera en modelos de colas (Queueing Theory)"* y tiempo hasta que ocurren `k` eventos.

### Poisson (DISCRETA) — inversión `[DATO]`
```
P(X = x) = e^(−λ)·λˣ / x!,   x = 0, 1, 2, …
```
Tabla acumulada para `λ = 4` autos/min:

| x | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|---|
| P(X≤x) | 0.0183 | 0.0915 | 0.238 | 0.4333 | 0.6286 | 0.7849 | 0.8891 | 0.9486 |

`R = 0.875` → **x = 6**.

### Weibull, Beta y Normal — **solo en el TP3, sin derivación en clase** `[DATO]`
- **Weibull**: `W(a;b)` con `f(x) = (a/b)(x/b)^(a−1)·e^(−(x/b)^a)`, `x ≥ 0` (a=2, b=3, R=0.247).
- **Beta**: `α=3, β=4` — se pide **por rechazo**.
- **Normal `N(0,1)`**: se pide **por rechazo**, acotando `−10 ≤ x ≤ 10`.
- ⚠️ **Box-Muller NO se menciona nunca.** La Normal **no se genera en clase**.

---

## 4. Distribuciones empíricas `[DATO]`

La cátedra usa el término **"empírica" con dos sentidos distintos**:

1. **Densidad continua a trozos** (la de la sección 3): `f(x) = x` en `[0,1]`, `f(x) = 1/2` en `(1,2]`. **No es una distribución basada en histograma**.
2. **Tabla de frecuencias relativas (discreta)** — del deck de Montecarlo: valores 15, 16, 17, 18, 19 con frecuencias 10, 25, 30, 25, 10 → probabilidades `0.1, 0.25, 0.3, 0.25, 0.1` → acumulada `0.1, 0.35, 0.65, 0.9, 1.0`. Se mapea un `R` equiprobable con la **"función de distribución aditiva"**.

`[DATO]` **Este segundo procedimiento es el que se usa en TODOS los ejemplos de colas e inventarios del bloque de Montecarlo.**

⚠️ No hay mención de **construcción de histogramas, interpolación ni bondad de ajuste** en estos archivos (aunque existe un `Bondad de Ajuste.xlsx` en la carpeta, no está referenciado por el TP3 ni por los decks).

---

## 5. Método de Montecarlo

### Definición `[DATO]`
> *"Bajo el nombre de Método de Montecarlo o Simulación de Montecarlo se agrupan una serie de procedimientos que analizan distribuciones de variables aleatorias usando **simulación de números aleatorios**."*

Es aplicable *"a cualquier tipo de problema, ya sea **estocástico o determinístico**"*. Motivo: problemas difíciles de resolver analíticamente pero dependientes de factores aleatorios.

### Historia `[DATO]`
- Nombre tomado de **Mónaco** ("la capital del juego de azar"); la ruleta como generador simple.
- Desarrollo sistemático hacia **1944**; uso real a partir del trabajo de la **bomba atómica** (difusión de neutrones).
- **Von Neumann y Ulam** perfeccionaron los métodos de "Ruleta rusa" y "división".
- Desarrollo sistemático por **Harris y Herman Kahn (1948)**.

### La deducción rigurosa (págs. 10–16) `[DATO]`
Parte de `R` uniforme `[0,1]` con `f(R) = 1`. Para un cambio de variable `y = y(R)`:
```
g(y(R)) = f(R)·|dR/dy|
P(R ≤ r) = P(y ≤ y(r))  →  ∫f = ∫g  →  r = G(y(r))  →  y(r) = G⁻¹(r)
```
**Conclusión**: generar `y = G⁻¹(r)` da una variable con densidad `g` y acumulada `G`.

⚠️ **Ojo**: esa conclusión **es exactamente el método de inversión**, con otro nombre. La cátedra **equipara "Método de Montecarlo" con la transformación inversa empírica**.

### Lo que NO está en estas clases `[DATO]`
**No hay** ley de grandes números, ni estimación del error, ni intervalos de confianza, ni reducción de varianza, ni ejemplos de estimación de π o de integración numérica. La única afirmación cuasi-GLN está en el juego de vocabulario: *"característica de un experimento que produce resultados diversos… pero cuyas frecuencias, **a la larga, tienden a establecerse hacia un valor límite**"*.

### Ejemplo numérico del curso-taller `[DATO]` (`Montecarlo-Ej-Proyecto.pdf`)
**No es un enunciado de proyecto de alumno**: es una nota técnica del *"CURSO-TALLER GESTIÓN DE PROYECTO CON SIMULACIÓN MONTECARLO (Buenos Aires, 06 al 15 de marzo de 2012)"*.

**Problema**: proyecto de tres actividades en serie A, B, C. Duraciones determinísticas 2, 3, 4 sem (= 9 sem). Rangos probabilísticos: A 1.5/2/4 · B 2/3/4 · C 2.5/4/6, ajustados con **triangulares**.

**Mecánica de Montecarlo**: *"En cada iteración el simulador toma valores al azar de cada una de las variables aleatorias de entrada… y los introduce en el modelo… resolviéndolo como si fuera un modelo determinístico."*

**Iteraciones de ejemplo**: A=3.3, B=2.6, C=5.2 → 11.1 · A=2.1, B=2.6, C=3.7 → 8.4

**Resultados (5000 iteraciones, software @RISK)**:

| Estadístico | Valor |
|---|---|
| Mínimo | 6.8973 |
| Máximo | 12.8139 |
| **Media** | **9.6667** |
| Desvío estándar | 0.9847 |
| Valores | 5000 |
| Banda del 90 % | 8.08 – 11.34 |

**Conclusión clave**: el plan nominal de 9 semanas tiene **26 % de probabilidad de cumplirse** (74 % de riesgo de excederse). Para 75 % de probabilidad se necesitan **10.32 semanas**.

⚠️ Advertencia explícita del material: **"Garbage In, Garbage Out."**

---

## 6. Aplicaciones de colas e inventarios (dentro del bloque de Montecarlo)

`[DATO]` **Ninguna se resuelve con fórmulas analíticas**: todas son **Montecarlo manual con tablas** (inversa empírica).

### 6.1 Descarga de camiones en un supermercado `[DATO]`
Datos: entregas nocturnas; **3 operarios**; turno de 8 h (23:00–7:30) con 30 min de descanso; salario **$25/h**, extra **$37,50/h**; costo de espera del camión **$100/h**; costo operativo del depósito **$500/h**.

Distribuciones empíricas: cantidad de camiones esperando al abrir (0:0.50, 1:0.25, 2:0.15, 3:0.10), tiempo entre llegadas (20–60 min en pasos de 5, probabilidades 0.02…0.03), y tiempo de servicio con 3 operarios (20–60 min, probabilidades 0.05…0.04).

**Costos con 3 operarios**:
```
Salarios      = 3·8·25 + 37.50·3·(1/6)        = $618,75
Espera        = 500·(8,67) + 100·(6,42)        = $4.977
COSTO TOTAL                                     = $5.595,75
```
**Conclusión**: el costo de espera **supera ampliamente** los salarios → conviene más personal.

`[DATO]` `Distintas dotaciones.docx` trae las tablas para **4, 5 y 6 operarios**. Con 4:
```
Salarios = 4·8·25 + 37.50·4·(1/4) = $837,50
Espera   = 500·(8,75) + 100·(0,83) = $4.458
TOTAL                               = $5.295,50
```
⚠️ Las páginas de 5 y 6 operarios son **solo imagen** y no se pudieron recuperar.

### 6.2 Sistema de inventarios `[DATO]`
Demanda mensual como distribución empírica (35→0.010 … 60→0.005); tiempo de entrega 1/2/3 meses con 0.30/0.40/0.30; **12 factores estacionales** (1.20, 1.00, 0.90, 0.80, 0.80, 0.70, 0.80, 0.90, 1.00, 1.20, 1.30, 1.40).
Costos: **ordenar $100/pedido** · **mantener $20/unidad/año** · **faltante $50/unidad**. Inventario inicial 150. Variables de decisión: **`q` (cantidad a ordenar)** y **`R` (nivel de reposición)**.

Simulación manual con `q = 200`, `R = 100`:
```
IP total          = 1149
Costo Ordenar     = 3 × $100          = $300
Costo Inventario  = 1149 × $20/12     = $1.918
Costo Faltante    = 59 × $50          = $2.950
COSTO TOTAL                            = $5.168
```
⚠️ **Error aritmético del material**: `1149 × 20/12 = $1.915`, no `$1.918`. El total de la diapositiva usa $1.918.

### 6.3 Promedios `[DATO]`
```
Ip.30 = x·A/2          X/A = (30−X)/B          Ip = A² / [2(A+B)]
```

> **Nota de duplicación**: este bloque de colas **no repite** el M|M|1 analítico de U5. Son modelos empíricos resueltos con tabla. El único puente conceptual es el mapeo `R → acumulada`.

---

## 7. TP3 — las 21 actividades `[DATO]`

**Herramienta obligatoria**: **MATLAB 8.5.0 (R2015a)**. No se pide Excel, ni EasyFit, ni Simul8.

| # | Actividad |
|---|---|
| 1 | Inversión para: 5e^(−5x) · U(1,8) · densidades a trozos · Poisson con `R=0.543` · trapecio. Determinar X para `R₁=0.2235, R₂=0.5614, R₃=0.8825` |
| 2 | `poissrnd()` — muestra de 1000 para Poisson(3) |
| 3 | Inversión para un triángulo en 60–100 con pico en 80 |
| 4 | Discreta `p = 0.20, 0.15, 0.25, 0.40`; X para `R = 0.413` y `R = 0.965` |
| 5 | `f(x) = eˣ/(e−1)` en `[0,1]`; muestra de 3 valores |
| 6 | Weibull `W(a;b)`; con a=2, b=3, `R = 0.247` |
| 7 | MTBF de una NIC IEEE 802.11 ~ Weibull; expresión general |
| 8 | Desde `Rᵢ = 0.184, Rⱼ = 0.696`: U(15,19) · exponencial media 5 · Poisson media 4 |
| 9 | Inversión para densidad a trozos; X para `R = 0.05` y `R = 0.987` |
| 10 | RED: pseudocódigo, `min_th = 20`, `max_th = 60`, `Pmáx = 1`; tamaño de buffer para probabilidad de descarte 0.9 |
| 11 | Erlang λ=25, k=3 por convolución; 4 observaciones |
| 12 | M\|M\|1 con μ=14, n=5; simular espera media |
| 13 | Algoritmo general de convolución Erlang(α,β) |
| 14 | Composición triangular; `R₁=0.716, R₂=0.872` |
| 15 | Composición: `f(x)=(x−2)/2` en 2≤x≤3 · `(2−x/3)/2` en 3<x≤6 |
| 16 | Composición para trapecio en `[2,9]` con plateau 5–6 |
| 17 | Composición: pico 0.5 en x=1, cae hasta x=4; `R=0.05` y `R=0.987` |
| 18 | Composición: `f(x)=mx²` en 0≤x≤1 · `−(m/2)x + (3/2)m` en 1<x≤3 |
| 19 | Beta(3,4) por rechazo; `Γ(n)=(n−1)!`; iteraciones esperadas y eficiencia |
| 20 | Rechazo para `f(x)=(1/2π)√(4−x²)`; eficiencia |
| 21 | Rechazo para `N(0,1)`; eficiencia; cota `−10 ≤ x ≤ 10` |

**Entregable**: código MATLAB y/o pseudocódigo, más los valores de X para los `R` dados, las eficiencias y las iteraciones esperadas. **El PDF no define formato de informe, fecha ni rúbrica.**

---

## 8. Notas para el examen

### Fórmulas que hay que tener
```
R = F(x)  →  x = F⁻¹(R)
x = a + (b−a)·R                            (uniforme)
x = −(1/λ)·Ln R                            (exponencial)
x = ln[1 + (e−1)R]                         (densidad eˣ/(e−1))
x = √(2R)  (R≤1/2)  ·  x = 2R  (R>1/2)     (empírica a trozos)
T = −(1/14)·Σ ln(1−Rᵢ)                     (Erlang por convolución)
f(x) = A₁f₁ + ⋯ + Aₙfₙ ,  ΣAᵢ = 1          (composición)
M·R₂ ≤ f[a + (b−a)R₁]                      (rechazo)
P(Aceptar) = 1/[M(b−a)]  ·  Ejecuciones = M(b−a)
```

### Errores y usos no estándar de la cátedra
1. **Densidad uniforme**: la segunda rama está escrita *"0 si a > x > b"* — **lógicamente imposible**.
2. **Integral de la CDF exponencial**: usa `x` como límite y como variable de integración.
3. **"Montecarlo" = inversión empírica.** El propio deck deduce `y(r) = G⁻¹(r)`, que **es** la transformada inversa. Confunde una **familia de técnicas** con **un generador**.
4. **Triangular**: deriva la inversa de `f₁` pero **omite la de `f₂`**.
5. **Weibull**: el TP3 usa **dos parametrizaciones distintas** (`W(a;b)` en #6 y `(α,β)` en #7).
6. **Erlang**: en las clases es `(k, λ)`; en el TP3 #13 es `(α, β)`.
7. **Inventario**: `1149 × 20/12` está puesto como `$1918`; el valor real es `$1915`.
8. **No hay M|M|1 analítico**: Gross et al. se cita para justificar la latencia Erlang, pero **no se desarrolla ninguna fórmula cerrada** de colas (L, Lq, W, Wq).

### Anunciado pero NO desarrollado en estas clases
Generación de la **Normal** (solo un ejercicio de rechazo en el TP3) · **Box-Muller** · teoría de **Weibull** y **Beta** · generación **discreta arbitraria** (teoría) · **construcción de histogramas y bondad de ajuste** · **convergencia / TCL / intervalos de confianza / error** para Montecarlo · **reducción de varianza** · ejemplos de **π o integración numérica** · **colas analíticas (M|M|1)**.

### Contenido en imagen no recuperable
`JUEGO DE LA INCERTIDUMBRE.docx` (las parejas del juego no están conectadas en el original, así que la clave no es recuperable) · las páginas de **5 y 6 operarios** de `Distintas dotaciones.docx`.

---

## 9. Nota de encuadre

`[INFERENCIA]` El programa analítico declara U3 como *"Variables aleatorias continuas: uniforme, normal, exponencial y Poisson; generación de estas a partir de la uniforme; distribuciones empíricas"*. El material real de las carpetas 04–05 va **bastante más allá**: cubre **cuatro métodos de generación completos** y todo el **bloque de Montecarlo con aplicaciones de colas e inventarios**. Y **Montecarlo no figura como unidad** en el programa analítico, aunque RA03 lo exige explícitamente y el material lo desarrolla de punta a punta.
