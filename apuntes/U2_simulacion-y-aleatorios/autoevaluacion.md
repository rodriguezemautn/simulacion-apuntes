# U2 — Autoevaluación

> **Formato real**: teoría a desarrollar, 5 puntos sorteados. U2 además tiene **cálculo**, así que el Punto 4 es numérico.
> Condiciones: **sin mirar**, a mano, y después **defendé cada respuesta en voz alta**.
> Tiempo sugerido: 60 minutos.

---

## Punto 1 — Toma de datos

¿Cuáles son las **variables aleatorias del modelo** y cómo se relevan?
Explique la diferencia entre **observación directa e indirecta** y dé **un ejemplo concreto de cada una** aplicado a la cátedra.

---

## Punto 2 — Selección de distribuciones

¿Por qué la selección de una distribución apropiada es un **paso esencial** de todo proceso de simulación?
¿Qué ocurre si la distribución elegida **no se ajusta** a la muestra?
Mencione las **distribuciones comunes** y las **herramientas de verificación** que usa la cátedra.

---

## Punto 3 — Bondad de ajuste

Explique el **proceso de bondad de ajuste**: enumere y explique sus pasos.
Defina **H₀** y **H₁**. Indique el **estadístico** de prueba y el **criterio de decisión**.
¿Qué **requisito** debe cumplir cada clase y **qué se hace** si no se cumple?
¿Cuál es el **tamaño de muestra** recomendado?

---

## Punto 4 — Ejercicio numérico

**Rehacé el ejemplo de la cátedra** y **verificá cada número**. No vale copiar la tabla: hay que recalcular.

**Datos**: muestra de **30 valores**. Media experimental **x̄ = 13.55**. Mínimo **0.06**, máximo **80.56**. Nivel de significación **α = 0.05**.

Calcule y justifique **cada paso**:
1. El **parámetro λ** de la distribución exponencial.
2. La **función de densidad** y la **función acumulada** resultantes.
3. El **número de intervalos** (regla de Sturges) y la **longitud** de cada intervalo.
4. La **probabilidad** de cada intervalo y la **frecuencia esperada**.
5. **Decidir qué hacer** con las clases cuya FE sea menor que 5.
6. El **estadístico chi-cuadrado**.
7. Los **grados de libertad** y el **valor crítico** de tabla.
8. La **conclusión**, en una oración.

---

## Punto 5 — Generación de números aleatorios

Enumere y explique las **condiciones que debe cumplir una generación de calidad**.
Describa los **métodos de generación** vistos.
Escriba la **fórmula del generador congruencial lineal** y explique:
- qué es el **período** y cuál es su **máximo**,
- la diferencia entre **mixto** y **multiplicativo**.

---

## Punto extra (preparalo igual)

**¿Cuándo usamos la simulación?** Enuncie los tres casos que da la cátedra y ejemplifique con el caso del supermercado.

---
---

> ## ⚠️ CORTÁ ACÁ
> Lo que sigue son **los criterios de corrección**. No los leas hasta haber escrito tus 5 respuestas completas.

---

## Criterios de corrección

### Punto 1 — Toma de datos
- **Primer paso**: identificar **cuáles son las variables aleatorias del modelo**.
- **Observación directa**: capturar los datos **en el propio sistema** (ejemplo de la cátedra: captura de tráfico con **`tcpdump`** — `-s` SNAPLEN, `-i` interfaz, `port 5060` = señalización **SIP**, `host` IP del servidor, `-w` salida `.cap`). Casos: **proxy SIP**, **consultas DNS**, **HTTP/HTTPS**.
- **Observación indirecta**: obtener los datos de **registros/fuentes existentes** en vez de medir en vivo.
- **Ejemplo del supermercado**: registrar **cada cuánto llega un cliente** (tiempo entre llegadas) y **cuánto tarda en irse**; **al menos 100 datos durante una hora**.
- *Se valora que menciones que el paso siguiente es determinar a qué distribución se ajustan.*

### Punto 2 — Selección de distribuciones
- Es **paso esencial** de todo proceso de simulación.
- Si **no se ajusta** a la muestra: el modelo produce **valores carentes de sentido y poco realistas**.
- **Distribuciones comunes**: exponencial, normal, chi-cuadrado, Poisson.
- **Herramientas**: **EasyFit** y la **prueba de bondad del ajuste** manual.

### Punto 3 — Bondad de ajuste
Los **9 pasos**:
1. Estadísticas descriptivas (media, mediana, varianza…).
2. Tabla de frecuencias.
3. Histograma o diagrama de dispersión.
4. **Suponer** un comportamiento probabilístico.
5. Elegir el método: **Chi-Cuadrado, Kolmogorov-Smirnov o Anderson-Darling**.
6. Prueba de hipótesis.
7. Aplicar el método y calcular el estadístico.
8. Comparar con el **valor crítico** de tabla.
9. **Aceptar o rechazar H₀.**

- **H₀**: los datos **siguen** la distribución propuesta. **H₁**: **no** la siguen.
- **Estadístico**: `X² = Σ((FOᵢ − FEᵢ)² / FEᵢ)`.
- **Criterio**: si `X²_calculado < X²_crítico` → **no se rechaza H₀**.
- **Requisito**: **FE ≥ 5** en cada clase. Si no se cumple → **reagrupar** las clases (corrección por continuidad, Yates 1934).
- **Muestra recomendada**: **75–100 valores**.

### Punto 4 — Ejercicio numérico (verificación paso a paso)

| Paso | Cálculo | Resultado |
|---|---|---|
| 1. Parámetro | `λ = 1/x̄ = 1/13.55` | **λ = 0.0738** |
| 2. Densidad / acumulada | `f(x) = 0.0738·e^(−0.0738x)` · `F(x) = 1 − e^(−0.0738x)` | — |
| 3. Sturges | `k = ⌊1 + log₂30⌋ = ⌊1 + 4.9069⌋` | **k = 5** |
| 3. Longitud | `L = (80.56 − 0.06)/5 = 80.50/5` | **L = 16.10** |
| 4. P del 1.º intervalo | `F(16.16) = 1 − e^(−1.1926)` | **0.6966** |
| 4. P del resto | `1 − 0.6966` | **0.3034** |
| 4. FE | `0.6966×30` y `0.3034×30` | **20.898** y **9.102** |
| 5. Reagrupación | Las clases 3, 4 y 5 daban FE < 5 → se agrupan con la 2.ª | 2 clases |
| 5. FO agrupadas | `21` y `6+1+0+2` | **21** y **9** |
| 6. Estadístico | `(21−20.898)²/20.898 + (9−9.102)²/9.102` | **X² = 0.00164** |
| 7. Grados de libertad | `k − 1 = 2 − 1` | **gl = 1** |
| 7. Valor crítico | `X²₁;₀.₀₅` | **3.841** |
| 8. Conclusión | `0.00164 < 3.841` → **no se rechaza H₀** | Los datos **pueden representarse con una exponencial de λ = 0.0738** al 95 % de confianza |

*Puntaje completo sólo si justifica el paso 5 (por qué reagrupa).*

> Recordatorio: la cátedra calcula `gl = k − 1`, **sin descontar parámetros estimados**. En el oral podés agregar que el criterio estándar sería `k − 1 − m` — eso suma, no resta.

### Punto 5 — Generación de números aleatorios

**Las 5 condiciones de calidad:**
1. **Uniformemente distribuidos** — todos los valores entre los extremos representados.
2. **Estadísticamente independientes** — bien mezclados.
3. **Reproducibles** — se puede repetir la secuencia.
4. **Período largo** — muchas secuencias sin repetir.
5. **Eficiencia computacional** — rápido y con poca memoria.

**Métodos:**
- **Cuadrados medios**: número de 4 cifras, al cuadrado, se toman las **cifras del medio**.
- **Producto medio**: dos **semillas**, se multiplican, cifras del medio.
- **Constante multiplicativa**: una **constante** y una semilla, cifras del medio.
- **Congruencial Lineal (GCL)**: `x_{n+1} = (a·x_n + c) mod m`.

**GCL:**
- **Período**: cantidad de números distintos antes de repetir la secuencia. **Máximo = m.**
- **Mixto**: `c ≠ 0`. **Multiplicativo**: `c = 0`.

### Punto extra — ¿Cuándo usamos la simulación?
1. **Los modelos matemáticos son insuficientes** — sistemas demasiado complejos para resolverse matemáticamente.
2. **Se requiere experimentación segura** — experimentar en el real sería costoso, peligroso o impracticable.
3. **Análisis de escenarios** — evaluar estrategias y configuraciones sin riesgo.

**Caso del supermercado**: la **experimentación directa** (sacar una caja, agregar 5) arriesga **pérdida de clientes y dinero**; el **modelado** permite experimentar seguro y decidir informado.
