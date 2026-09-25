# U2 — Toma de datos, bondad de ajuste y números aleatorios (TEORÍA)

> **Fuentes**:
> - `02_Toma de Datos/TomaDeDatos.md` — *Ajuste de distribuciones — Toma de datos*, presentado por **Francisco Roqué y Leslie Monges** `[DATO]`
> - `03_Generacion de Num Aleatorios/numerosAleatorios.md` — transcripción de **`Clase2.pdf`**, **`3-Numeros Aleatorios.pdf`** y **`4-Aplicaciones de Simulación.pdf`** `[DATO]`
> - `02_Toma de Datos/Clase1.pdf` y `03_.../Clase2.pdf` → **sí tienen capa de texto** (17 KB y 33 KB); se pueden extraer si hace falta
> - TPs: `tp1.md` (TP1), `TP2.md` (TP2)
> - `[VERIFICAR]` `Distribuciones-VA-Bondad de Ajuste.pdf` es **imagen** (223 chars): sin OCR no es legible

---

## 1. Naturaleza de la simulación (repaso que la cátedra vuelve a dar acá)

- `[DATO]` **Shannon (1975)**: *"el proceso de diseñar y desarrollar un modelo computarizado de un sistema o proceso y llevar a cabo experimentos con este modelo con el propósito de comprender el comportamiento del sistema y/o evaluar diversas estrategias en su operación."*
- `[DATO]` **Banks et al. (2010)**: *"la simulación es la imitación de la operación de un proceso o sistema del mundo real a lo largo del tiempo. Involucra la generación de una **historia artificial** de un sistema y la observación de esa historia artificial para extraer inferencias sobre las características operativas del sistema real."*
- `[DATO]` La definición de "ciencia y arte de diseñar un modelo…" se repite acá (coincide con U1).

### Cuándo usamos la simulación `[DATO]` (3 casos)
1. **Los modelos matemáticos son insuficientes** — muchos sistemas reales son tan complejos que es virtualmente imposible resolverlos matemáticamente.
2. **Se requiere experimentación segura** — experimentar en el sistema real sería costoso, peligroso o impracticable.
3. **Análisis de escenarios** — evaluar estrategias y configuraciones sin riesgo.

### El caso del supermercado `[DATO]`
Problema: el dueño quiere optimizar la atención y decidir si agrega cajas y/o personal.
- **Solución 1 — Experimentación directa ❌**: sacar una caja para probar, o agregar 5 cajas. *Problema*: riesgo de pérdida de clientes y dinero.
- **Solución 2 — Modelado ✅**: representar el sistema lo más parecido posible, experimentar seguro, decidir informado.

`[INFERENCIA]` Este ejemplo es la versión aplicada del cuadro de U1 (sistema real vs modelo): sirve para arrancar el oral justificando por qué se simula.

---

## 2. Toma de datos

`[DATO]` El primer paso es identificar **cuáles son las variables aleatorias del modelo**.

### Métodos de relevamiento `[DATO]`
**Observación directa vs indirecta.** El material baja a la práctica con captura de **tráfico de red**:
- `tcpdump -s0 -i eth3 udp port 5060 and host 1.1.1.1 -w nombre_captura.cap`

| Flag | Significado |
|---|---|
| `-s` | SNAPLEN (limita el tamaño de captura) |
| `-i` | interfaz de red |
| `5060/UDP` | señalización de telefonía IP (**protocolo SIP**) |
| `host` | IP del servidor de interés |
| `-w` | salida en formato `.cap` para análisis posterior |

Casos de captura que da el material: **proxy SIP** (llamadas), **consultas DNS**, **requerimientos HTTP/HTTPS**.

### Ejemplo completo: supermercado `[DATO]`
1. **Recolección**: registrar cada cuánto llega un cliente a la fila (**tiempo entre llegadas**) y cuánto tarda en irse. **Recopilar al menos 100 datos durante una hora.**
2. **Análisis**: determinar a qué distribución se ajustan mejor.

---

## 3. Selección de distribuciones

- `[DATO]` La selección de una distribución apropiada es **paso esencial de todo proceso de simulación**.
- `[DATO]` **Por qué importa**: si la distribución no se ajusta a la muestra, el modelo dará **valores carentes de sentido y poco realistas**.
- `[DATO]` Distribuciones comunes: **exponencial, normal, chi-cuadrado, Poisson**.
- `[DATO]` Herramientas de verificación: **EasyFit** y la **prueba de bondad del ajuste** hecha a mano.

---

## 4. Prueba de bondad del ajuste

- `[DATO]` Es una técnica estadística que determina si un modelo de distribución puede representar con buena exactitud un conjunto de datos experimentales.
- `[DATO]` Fundamentación citada: usa un **test chi-cuadrado** y verifica la concordancia entre datos experimentales y modelos teóricos (**Papoulis, 2002**).

### Los 9 pasos del proceso `[DATO]`
1. Obtener **estadísticas descriptivas** (media, mediana, varianza…).
2. Construir una **tabla de frecuencias**.
3. Construir un **histograma** o diagrama de dispersión.
4. **Suponer** un comportamiento probabilístico.
5. Elegir un **método de bondad de ajuste** (**Chi-Cuadrado, Kolmogorov-Smirnov, Anderson-Darling**).
6. Definir la **prueba de hipótesis**: **H₀** = los datos siguen la distribución propuesta · **H₁** = no la siguen.
7. **Aplicar el método** y calcular el estadístico.
8. **Comparar con el valor crítico** de tabla.
9. **Aceptar o rechazar H₀**.

### Requisitos `[DATO]`
- **Cada clase debe contener al menos 5 datos** (FE ≥ 5).
- **Muestra recomendada: al menos 75–100 valores.**

### Corrección por continuidad `[DATO]`
- Si alguna clase queda con **FE < 5**, hay **errores de aproximación** → **reagrupar** hasta cumplir FE ≥ 5.
- Se cita la **corrección de Yates (1934)**.

### Ejemplo resuelto: ajuste a exponencial `[DATO]`
Datos: muestra de **30 datos**, α = 0.05 y α = 0.01.

| Paso | Resultado |
|---|---|
| Modelo teórico | `f(x) = λe^(−λx)`, `x ≥ 0` |
| Media experimental | `x̄ = 13.55` |
| Parámetro | `λ = 1/x̄ = 0.0738` |
| Distribución resultante | `f(x) = 0.0738·e^(−0.0738x)` |
| Acumulada | `F(x) = 1 − e^(−0.0738x)` |
| **Sturges** | `k = ⌊1 + log₂M⌋ = ⌊1 + log₂30⌋ = 5` |
| Longitud de intervalo | `L = (máx − mín)/k = (80.56 − 0.06)/5 = 16.1` |

Tabla original (antes de reagrupar):

| Intervalo | Prob. | FO | FE |
|---|---|---|---|
| [0–16.16] | 0.6966 | 21 | 20.898 |
| (16.16–32.26] | 0.2109 | 6 | 6.327 |
| (32.26–48.36] | 0.0643 | 1 | 1.929 |
| (48.36–64.46] | 0.0196 | 0 | 0.588 |
| (64.46–80.56] | 0.0086 | 2 | 0.258 |

→ Las clases 3, 4 y 5 tienen **FE < 5** → **se reagrupan** en 2 clases:

| Intervalo | Prob. | FO | FE |
|---|---|---|---|
| [0–16.16] | 0.6966 | 21 | 20.898 |
| >16.16 | 0.3034 | 9 | 9.102 |

**Estadístico**: `X₀² = Σ((FOᵢ − FEᵢ)²/FEᵢ) = 0.00164`
**Valor crítico**: para `k−1 = 2−1 = 1` gl y α = 0.05 → `X²₁;₀.₀₅ = 3.841`
**Conclusión**: `0.00164 < 3.841` → **no se rechaza H₀** → los datos pueden representarse con una exponencial de `λ = 0.0738` al 95 % de confianza.

### Comparación de distribuciones (EasyFit) `[DATO]`
| # | Distribución | Chi-cuadrado | Rango |
|---|---|---|---|
| 1 | Exponencial | 0.00168 | 2 |
| 2 | **Exponential (2P)** | **0.00144** | **1** |
| 3 | Uniform | N/A | – |
| 4 | Weibull | 0.37026 | 4 |
| 5 | Weibull (3P) | 0.00914 | 3 |
| 6 | Erlang | No hay ajuste | – |
| 7 | Erlang (3P) | No hay ajuste | – |

→ **La Exponencial (2P) da el mejor ajuste** (estadístico más bajo).

> ⚠️ **TRAMPA 1 — los grados de libertad.** El material calcula `gl = k − 1 = 1` **sin descontar los parámetros estimados**. El criterio estadístico estándar es `gl = k − 1 − m` (m = parámetros estimados de los datos). Acá, con `k = 2` y `λ` estimada de la media, el estándar daría **0 grados de libertad**.
> **Cómo rendirlo**: contestá con la versión de la cátedra (`k − 1`). Si te repreguntan en el oral, mostrá que sabés el matiz — eso te posiciona, no te hunde.

> ⚠️ **TRAMPA 2 — contradicción interna del material.** El mismo documento exige **muestra de al menos 75–100 valores**, y el ejemplo resuelto trabaja con **30 datos**. Si te toca el punto, mencioná el requisito de 75–100 y después resolvé con los datos que te den.

---

## 5. Generación de números aleatorios

### Condiciones para una generación de calidad `[DATO]` (5)
1. **Uniformemente distribuidos** — todos los valores entre los extremos deben estar representados.
2. **Estadísticamente independientes** — razonablemente distribuidos y mezclados.
3. **Reproducibles** — se debe poder repetir la secuencia.
4. **Período largo** — muchas secuencias sin repetición.
5. **Eficiencia computacional** — rápido y con bajo consumo de memoria.

### Métodos de generación `[DATO]` (4)
| Método | Cómo funciona |
|---|---|
| **Generador por cuadrados** | Se toma un número de 4 cifras, se eleva al cuadrado y se toman las **cifras del medio** |
| **Producto medio** | Dos **semillas** iniciales: se multiplican y se toman las cifras del medio |
| **Constante multiplicativa** | Una **constante** y una semilla: se multiplican y se toman las cifras del medio |
| **Congruencial Lineal (GCL)** | Recurrencia `x_{n+1} = (a·x_n + c) mod m` |

- `[DATO]` En el GCL el **período máximo es `m`**, bajo ciertas condiciones de la terna `(a, c, m)`.

### Conceptos previos de probabilidad `[DATO]`
- **Azar**: cualidad de un evento que no puede predecirse con certeza; los resultados varían pero **las frecuencias tienden a estabilizarse** en un valor límite.
- **Variable aleatoria**: función cuyos valores son números reales determinados por los resultados de un experimento.
  - **Discreta**: espacio muestral **numerable**; solo valores enteros. *Ej.: número de alumnos aprobados.*
  - **Continua**: espacio **no numerable**; valores enteros, fraccionarios e infinitos en un intervalo. *Ej.: concentración de plata en una muestra de mineral.*
- **PDF** (función de densidad): el **área bajo la curva** entre dos puntos es la probabilidad del intervalo.
- **CDF** (acumulada): probabilidad de que la VA tome un valor **menor o igual**.

**Propiedades** `[DATO]`:
- Discretas: `0 ≤ p(xᵢ) ≤ 1` y `Σ p(xᵢ) = 1`
- Continuas: `f(x) ≥ 0` y `∫ f(x)dx = 1` (de −∞ a ∞)

---

## 6. Aplicaciones de simulación `[DATO]`

- **Usos**: análisis de sistemas · diseño de sistemas · síntesis · entrenamiento.
- **Camión transportador**: se simulan los pesos de **5 tinas** para ver si exceden la capacidad del camión (**1 tonelada**); se usa la **transformada inversa** para generar los pesos; se comparan costos entre usar el camión actual y contratar un transportista adicional.
- **Estimación de π**: se generan puntos aleatorios en un cuadrado y se cuenta cuántos caen dentro del **cuarto de círculo**; la probabilidad se relaciona con π.

---

## 7. Notas para el examen

1. **Bondad de ajuste**: los **9 pasos** son una respuesta completa y ordenada. Memorizá la secuencia.
2. **Chi-cuadrado**: tené clara la fórmula `X² = Σ((FO−FE)²/FE)` y que **se rechaza H₀ cuando el calculado SUPERA el crítico**.
3. **Requisito FE ≥ 5** → si no se cumple, **se reagrupa**. Ese detalle se pregunta.
4. **Sturges**: `k = ⌊1 + log₂M⌋`. Aparece en el ejemplo y es fácil de olvidar.
5. **Las 5 condiciones de calidad** de un generador son una lista corta y redituable.
6. **GCL**: `x_{n+1} = (a x_n + c) mod m`, período máximo `m`.
7. **`[VERIFICAR]`** El "Modelo de simulación de sistema de urgencias en Simulink" que trae `TomaDeDatos.md` está basado en un **paper externo** (Casas Ortiz de Rosas & Tastaca Lugo, 2024), no necesariamente en material de cátedra. No lo tomes como fuente propia de la materia sin confirmar.
