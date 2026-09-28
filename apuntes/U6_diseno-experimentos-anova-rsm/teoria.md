# U6 — Diseño de experiencias, ANOVA y superficie de respuesta (TEORÍA)

> **Fuentes** (todas con capa de texto):
> - `08_Diseño de Experiencias/9-Diseños de Experiencias.pdf` — capítulo de Shannon
> - `08_.../Diseño de experiencias.pdf` — apunte con el ejercicio de k=7 y el caso del router
> - `08_.../Superficie de Respuesta 2025.pdf`
> - `08_.../El proceso de simulación.pdf` y `08_.../DE-El proceso de simulación.pdf`
> - `09_Analisis de Varianza/11-Análisis de la Varianza.pdf`
> - `09_.../Diseño de experiencias - ANOVA.pdf`
> - `09_.../04-one-way-anova.pdf` y `04-two-way-(factorial)-anova.pdf` (guías de JMP)
> - `09_.../discovering-jmp-es.pdf` (218 págs., *Descubrir JMP*)
> - `09_.../Tabla-F.pdf` y `08_.../TablaF05.pdf` — valores críticos de Fisher
> - `08_.../TP6.pdf` (14 actividades) y `09_.../TP7.pdf` (5 actividades)
>
> ⚠️ **Esta es la unidad de mayor peso horario de la materia** (RA06 + RA07 = **22,5 h de 67,5**) y la que no tenías documentada.

---

## 1. Diseño de experimentos de simulación

### 1.1 Qué es `[DATO]`
`9-Diseños de Experiencias.pdf` (capítulo de Shannon, marcado *"Uso Personal"*) define:

> Un diseño de experimento de simulación por computadora es **un plan para comprar información**. El diseño determina **el análisis que se puede usar** y **el costo**.

### 1.2 Las tres preguntas que puede responder un diseño `[DATO]`
1. **Comparación de medias y varianzas** de alternativas → diseño **mono-factorial**.
2. **Efecto e importancia de las variables** → **ANOVA + regresión**.
3. **Búsqueda de valores óptimos** → **diseños secuenciales / de búsqueda** (RSM).

### 1.3 Modelo estructural vs modelo funcional `[DATO]`

| Modelo | Fórmula | Significado |
|---|---|---|
| **Estructural** | `Ns = ∏ qᵢ` | `k` factores con `qᵢ` niveles cada uno → **número de celdas** |
| **Funcional** | `Nf ≤ Ns` | las celdas **efectivamente medidas**. Es **completo** cuando `Nf = Ns` |

`[DATO]` Para un **diseño simétrico con repeticiones**, el total de corridas es:
```
N = p · q^k
```
donde `p` = cantidad de **repeticiones** (réplicas).

`[INFERENCIA]` Esa `p` es **lo único** que el material asocia a "réplicas". El resto del tratamiento de réplicas (warm-up, largo de corrida, estado estacionario) **no está desarrollado** — ver §7.

### 1.4 Cómo se elige un diseño `[DATO]`
Tres pasos: **(1) criterios → (2) sintetizar el modelo → (3) comparar con diseños estándar.**

Criterios: cantidad de factores · niveles (fijos/aleatorios, cuantitativos/cualitativos) · mediciones · interacciones · **límites de recursos** y precisión.

`[DATO]` **Principio de Pareto**: **20 % de los factores explican el 80 % del comportamiento**. Es la justificación del **cribado** (*screening*): no hace falta estudiar todo.

### 1.5 La variable dominante `[DATO]`
Comparando derivadas parciales se sabe **qué conviene ajustar** para reducir `N`:

```
∂N/∂p = q^k              ← sensibilidad a las repeticiones
∂N/∂q = p·k·q^(k−1)      ← sensibilidad a los niveles
∂N/∂k = p·q^k·ln q       ← sensibilidad a la cantidad de factores
```
La mayor de las tres **es la variable dominante del costo**.

### 1.6 Los diseños que se enseñan `[DATO]`
Mono-factorial · **factorial `2^k`** · **fraccional** · **cribado** · **superficie de respuesta**.

> ⚠️ `[DATO]` Los **diseños fraccionales** figuran en el programa (U6) pero en las diapositivas el desarrollo es **fino o ausente** (solo aparecen factoriales y CCD, y el "Cribado de efectos" de JMP).

---

## 2. El proceso de simulación — hay DOS versiones `[DATO]`

### 2.1 Versión clásica (`El proceso de simulación.pdf`)
```
Formulación del problema (metas/objetivos)
  → Definición del sistema
  → ¿Uso de simulación?
  → Formulación del modelo
  → Preparación de datos
  → Traslación del modelo
  → Validación  (con bucle si sale mal)
  → Planeación estratégica
  → Planeación táctica
  → Experimentación
  → Interpretación (con bucle si es inútil)
  → Implantación + Documento
```

### 2.2 Versión Shannon (`DE-El proceso de simulación.pdf`)
Más rica, **con realimentación**:
```
Establecer objetivos experimentales
  ↔ Planeación experimental preliminar
  ↔ Actualizar recursos y restricciones (tiempo, fondos)
Origen y formulación del problema → Definición del sistema
  → Desarrollar modelo y código → Verificar y validar
  → Desarrollar el plan y diseño experimental final
  → (decisión de usar simulación)
  → Implementar solución
  → Analizar resultados
  → Generar datos experimentales
  → Documentar resultados
```

`[INFERENCIA]` Estas **no son las 10 etapas de U1**. Son variantes del mismo proceso con distinto nivel de detalle. Si te piden "el proceso de simulación", **aclará cuál versión estás usando** — ese detalle te posiciona.

---

## 3. Superficie de respuesta (RSM)

### 3.1 Los dos modelos `[DATO]`
```
Primer orden:    z = f(λ, μ) = a + bλ + cμ
Segundo orden:   z = f(x, y) = a + bx + cy + dxy + ex² + fy²
```
`[DATO]` (`Superficie de Respuesta 2025.pdf`): se definen **factores**, **respuesta**, **función de respuesta** y **función predicha** `Y = β₀ + β₁x₁ + β₂x₂`.

### 3.2 Estimación y calidad `[DATO]`
- **Estimación**: por **regresión múltiple** (ecuaciones normales).
- **Gráficos**: de **contorno**.
- **Calidad del ajuste**: `R² = SSR/SST`
- **Significación**: `F = (SSR/k) / (SSE/(n−k−1))`

### 3.3 Ascenso a la loma, descenso al valle `[DATO]`
Nombres que usa la cátedra para la **búsqueda secuencial del óptimo** cuando la curvatura es pequeña: *"Ascenso a la loma o Descenso al Valle"*.

`[DATO]` Ejemplo de aplicación a inventarios:
```
TC = TC(C₁, C₂, C₃, f(D), g(LT), EOQ, ROP)
```
donde **EOQ** y **ROP** son las **variables de decisión controlables**.

### 3.4 Caso resuelto: router M|M|1 `[DATO]`
| Elemento | Valor |
|---|---|
| Factores | **λ** y **μ** |
| Respuesta | **latencia** |
| Región de diseño (3 niveles) | `30 ≤ λ ≤ 50` · `60 ≤ μ ≤ 80` |
| Puntos | **9** |
| Modelo ajustado | **`ẑ = 36.5 + 0.9x + 0.08y`** |
| `SSR` | 490.16 |
| `SST` | 680 |
| `SSE` | 189.83 |
| `R²` | **0.72** |
| `F` | **7.74** vs `F_0.05;2;6 = 5.143` → **regresión significativa** |
| Siguiente punto | descenso más rápido hacia **(30, 60)** |

### 3.5 Ejemplo de costo de un diseño mal elegido `[DATO]`
`Diseño de experiencias.pdf`: con **k = 7 factores, q = 4 niveles, p = 1000 repeticiones**:
```
N = 1000 · 4⁷ = 16.384 × 10⁶ corridas
t = N · t_u = 16.384 s = 4,55 h
Costo a 100 USD/h = 455 USD
```
**Variable dominante: `q`.**

`[INFERENCIA]` Es el ejemplo que justifica todo el capítulo: **el diseño es una decisión económica**, no un trámite.

---

## 4. ANOVA

### 4.1 La idea: descomponer la varianza `[DATO]`
`11-Análisis de la Varianza.pdf` (apunte estilo Shannon): la varianza total se descompone en **"entre muestras"** y **"dentro de muestras"**.

**Ejemplo base**: 20 valores en 4 grupos de 5.

| Fuente | SS | gl | Varianza |
|---|---|---|---|
| **Entre** | 70 | 3 (= 4−1) | **23.3** |
| **Dentro** | 46 | 16 (= 4×4) | **2.9** |
| **Total** | 116 | 19 | — |

**Test de Snedecor**: `F = 23.3 / 2.9 = 8.1`

### 4.2 El método abreviado de la cátedra `[DATO]`
```
fc = T²/N                       ← factor de corrección (T = suma total, N = nº de datos)
SS_total   = Σxᵢ² − fc
SS_entre   = ΣMᵢ²/n − fc        ← Mᵢ = media de cada grupo, n = tamaño del grupo
SS_dentro  = SS_total − SS_entre
```
`[DATO]` En el ejemplo: `fc = 320` → `SS_total = 116` · `SS_entre = 70` · `SS_dentro = 46`. ✓

### 4.3 Caso unifactorial completo `[DATO]`
**Caso: efecto del ancho de banda sobre el throughput.** 4 grupos × 5 = **N = 20**, **T = 741**.

```
fc  = T²/N = 27454,05
VG_comp = Σxᵢ² − fc            = 12046,95      (gl = 19)   → VG = 634,05
VI_comp = ΣMᵢ²/n − fc          = 5392,55       (gl = k−1 = 3) → VI = 1797,51
VD      = (VG_comp − VI_comp)/(19 − 3) = 6654,4/16 = 415,19
F       = VI / VD = 1797,51 / 415,19 = 4,32
F_tabla = F_0,05;3;16 = 3,24
```
**`F > F_tabla` → se rechaza H₀** ("el ancho de banda no afecta la capacidad").

### 4.4 ⚠️ Caso multifactorial — el método PROPIO de la cátedra `[DATO]`
Este **no es el ANOVA estándar**. El procedimiento es:

1. **Restar el valor mínimo** a todos los datos.
2. Construir **tablas de influencia combinada** `D1`, `D2`, `D3` — **eliminando un factor por vez**.
3. Construir **tablas individuales** `E1`, `E2`, `E3` — un factor por vez.
4. Calcular **varianzas por factor** y **varianzas de cada par de interacciones**.

**Resultado del ejemplo**:
```
Varianzas individuales:  H = 1,85   T = 8,17    K = 1,24
Interacciones:          H·T = 12,66  H·K = 6,10  T·K = 2,16
```
→ Factor individual **más significativo: `T`** · interacción **más fuerte: `H·T`**.

`[INFERENCIA]` La lógica es: **la varianza mide la influencia**. Cuanto más varía el resultado al cambiar un factor, más importante es ese factor. Es un método **de comparación de dispersiones**, no de contraste de hipótesis.

### 4.5 ⚠️⚠️ EL MÉTODO ES IDIOSINCRÁTICO — leelo dos veces
`[DATO]` Dos rasgos que **NO son estándar**:

1. **Unifactorial**: la cátedra compara **`F = Máx Varianza / Mín Varianza`**.
2. **Multifactorial**: usa las **tablas D/E** y **reporta solo varianzas**, sin tabla de ANOVA con `F` por término.

`[INFERENCIA]` **El ANOVA estándar de dos vías** tiene: `SS_A`, `SS_B`, `SS_AB`, `SS_error`; grados de libertad `(a−1)`, `(b−1)`, `(a−1)(b−1)`, `ab(n−1)`; y **un `F` por término** comparado contra `F_crítico` de sus propios gl.

**Si en el final escribís el ANOVA estándar como si fuera el de la cátedra, te lo marcan mal aunque esté bien.** Escribí **su** método y, si el oral se abre, mostrá que conocés el estándar. Esa combinación es la que suma.

> ⚠️ Y ojo: la **tabla `F` de Fisher** que da la cátedra (`Tabla-F.pdf`, `TablaF05.pdf`) **sí es la estándar** — α = 0,05 y 0,10. Se usa para el caso unifactorial.

---

## 5. JMP — la herramienta que la cátedra prescribe

### 5.1 Un factor `[DATO]` (`04-one-way-anova.pdf`)
```
Analyze > Fit Y by X
   Y = variable continua  ·  X = variable categórica
   → triángulo rojo > Means/Anova
   → Summary of Fit  +  tabla de ANOVA
```
- **H₀**: todas las medias son iguales.
- **Se rechaza H₀ cuando `Prob > F < 0,05`.**
- **Post-hoc**: triángulo rojo > **Compare Means** (cinco métodos, entre ellos *Each Pair Student's t* con círculos de comparación).

### 5.2 Dos factores `[DATO]` (`04-two-way-(factorial)-anova.pdf`)
```
Analyze > Fit Model
   Y continua  ·  dos variables categóricas
   → Macros > Full Factorial   (agrega efectos principales + interacción)
   → Effect Summary / Effect Tests
```
`[DATO]` **Regla de lectura que da la guía**: examinar **primero la interacción**; si **no es significativa, se quita**; si **se mantiene, los efectos principales deben permanecer**.

### 5.3 Los archivos de ejemplo `[DATO]`
| Archivo | Contenido |
|---|---|
| `ANOVA 1V.jmp` | **Potencia** con 5 niveles vs **Señal Rx** |
| `3x3 Factorial.jmp` | `X1 ∈ {30, 40, 50}` · `X2 ∈ {60, 70, 80}` bps · con `X1*X2` |
| **3 archivos CCD** | Response Surface Design, `X ∈ {30, 50}`, `Y ∈ {60, 80}` bps, **minimizando Z en seg**, con elección axial y puntos centrales |

`[DATO]` `discovering-jmp-es.pdf` (218 págs.) da el flujo completo en español: manejo de la grilla, *Analyze Relationships*, comparación de medias, **ANOVA con Fit Model + Full Factorial + Effect Tests**, regresión múltiple, **Graph Builder**, **prediction profiler** y gráficos de **contorno y superficie**.

---

## 6. La secuencia completa: ANOVA → DOE → RSM → optimización `[DATO]`

Es **explícita** en el material:
- **TP6** construye modelos factoriales / CCD / RSM y los ajusta por regresión.
- **TP7** pide aplicar el ANOVA correspondiente en **JMP** y, en la pregunta 5, **correr RSM + ANOVA sobre un router M|M|1 para minimizar la latencia**, presentando factores, respuestas, diseño, recolección de datos, factores e interacciones significativos, modelo ajustado, calidad/significación y **los puntos de la iteración siguiente**.

### TP6 — 14 actividades `[DATO]` ("CLASE 7: Metodología de Superficies de Respuesta")
Definiciones de diseño factorial, factores/niveles/respuesta/interacción/superficie/curvas de contorno con ejemplo de 3 niveles y 2 variables · número de corridas para 100 réplicas · utilidad de un diseño `2^k` · **factorial vs CCD** · costo de 8 variables × 3 niveles × 900 reps (1 ms/corrida, 110 USD/h) · **variable dominante** · definición de RSM con ejemplo disciplinar · objetivo y herramientas matemático-estadísticas · gráficos de contorno · **proceso secuencial** · regresión múltiple de 2.º orden no lineal · coeficiente de determinación múltiple · test de significación · **y un problema completo de RSM sobre un router M|M|1** (factores, respuesta, puntos en 3 niveles, ajuste `ẑ = a + bx + cy`, test F a α = 0,05, siguiente punto experimental).
**Referencias del TP6**: **Montgomery (2004)** y **Walpole (2012)**. **Herramienta: JMP.**

### TP7 — 5 actividades `[DATO]` ("CLASE 8")
1. Estudio unifactorial **ancho de banda / throughput** (datos dados).
2. El mismo **en JMP**, con análisis justificado.
3. **Potencia del transmisor vs señal recibida** (5 grupos × 5, PTX 5/12/20/27/32 dBm, datos crudos).
4. El mismo **en JMP**.
5. **Análisis crítico del router M|M|1** con resultados provistos.
**Bibliografía del TP7**: Figueroa Preciado (optimización con JMP), las páginas de ayuda de JMP (one-way, two-way, response surface), Montgomery y Walpole.

---

## 7. Notas para el examen

### Fórmulas que hay que tener
```
Ns = ∏ qᵢ                 (modelo estructural)
Nf ≤ Ns                   (modelo funcional; completo si Nf = Ns)
N = p · q^k               (diseño simétrico con p repeticiones)
∂N/∂p = q^k · ∂N/∂q = p·k·q^(k−1) · ∂N/∂k = p·q^k·ln q    (variable dominante)

fc = T²/N
SS_total  = Σxᵢ² − fc
SS_entre  = ΣMᵢ²/n − fc
SS_dentro = SS_total − SS_entre
F = VI/VD                 (test de Snedecor)

RSM 1.er orden:  z = a + bλ + cμ
RSM 2.º orden:   z = a + bx + cy + dxy + ex² + fy²
R² = SSR/SST
F = (SSR/k) / (SSE/(n−k−1))
```

### Errores y rarezas del material
1. **⚠️ El ANOVA manual de la cátedra NO es el estándar.** `F = Máx/Mín varianza` (unifactorial) y las tablas D/E (multifactorial) son **propios**. Responder el estándar = respuesta marcada mal.
2. **Las réplicas solo aparecen como `p`** en `N = p·q^k`.
3. **Diseños fraccionales**: anunciados, desarrollo fino o ausente.
4. **"Experimento físico vs por computadora"**: la frase del programa **no aparece textualmente** en las diapositivas; solo *"experimentos de simulación por computadora"*.

### No desarrollado pese a estar en el programa
**Warm-up, largo de corrida, terminación vs estado estacionario** · **diseños fraccionales y cribado** en profundidad · **"experimento físico vs por computadora"** como tal.
