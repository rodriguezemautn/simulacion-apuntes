# U3 — Bibliografía cruzada

> Qué dice la bibliografía sobre cada tema de U3, y **dónde se aparta de la cátedra**.

---

## 1. Cobertura por tema

| Tema de la cátedra | ¿Dónde está? |
|---|---|
| **Marco `R → G(R) → X`** | `Banks` §8.1: *"To generate a value X₁ with cdf F(x), a random number R₁ … is generated"* |
| **Inversión (continuo)** | `Ross` §5.1: *"we can generate a random variable X from the continuous distribution function F by generating a random number U and then setting X = F⁻¹(U)"* |
| **Inversión (discreto)** | `Ross` §4.1 — *discrete inverse transform method* |
| **Convolución** | `Banks` §8.3.2: *"The convolution method thus refers to adding together two or more random variables … This technique can be applied to obtain Erlang variates and binomial variates"* |
| **Rechazo** | `Ross` §4.4 (discreto) y §5.2 (continuo) · `Banks` §8.2 |
| **Triangular, empírica, Poisson, gamma, Erlang, Weibull** | **`Banks` es el mejor catálogo**: triangular §8.1.4, empírica §8.1.5/§8.1.7, Poisson §8.2.1, gamma §8.2.3, Erlang §8.3.2 (eq. 8.30) |
| **Montecarlo — definición e historia** | `Ross` §3.2 · `Papoulis` §7 |
| **Montecarlo — estimación de π** | `Ross` Ejemplo 3a: `P((X,Y) en el círculo) = Área círculo / Área cuadrado = π/4` |
| **Convergencia / error / nº de corridas / intervalos** | **Solo `Ross` §2.7 y §7.1–7.3.** Ver §3 |
| **Composición** | ⚠️ **Casi ausente.** Ver §2.1 |

---

## 2. Discrepancias con la cátedra

### 2.1 ⚠️ La composición: la cátedra le da un lugar que la bibliografía no le da
`[DATO]` La cátedra presenta la composición como **uno de los cuatro métodos** y la desarrolla con 7 pasos.
Pero:
- **`Banks` NO tiene sección de composición.** Solo convolución (§8.3.2).
- **`Ross` la relega a un ejercicio** del capítulo 5: *"The Composition Method … How could we generate a random variable having the distribution function F(x) = Σ pᵢFᵢ(x)"*.

`[INFERENCIA]` Es un **desbalance de énfasis** que conviene saber: si buscás "composición" en Banks o en Ross, no la vas a encontrar desarrollada. La fuente para ese método es **la clase**.

### 2.2 La eficiencia del rechazo: dos formulaciones equivalentes pero distintas
- **Cátedra**: `M·R₂ ≤ f(a + (b−a)R₁)`, con **`M = máximo de f en [a,b]`**. Eficiencia `1/[M(b−a)]`. Ejecuciones esperadas `M(b−a)`.
- **`Ross`**: aceptar *"if U < f(Y)/(c·g(Y))"*, con **`c = max f/g`**, y las iteraciones siguen una geométrica *"with mean c"*.

`[INFERENCIA]` Son **algebraicamente iguales** cuando `g` es la uniforme: `c = M(b−a)`. Pero **la `M` de la cátedra es el máximo de la densidad; la `c` de Ross es el máximo del cociente**. Si en el oral mezclás las dos definiciones, te van a repreguntar. Sabé que son lo mismo **y por qué**.

### 2.3 ⚠️ "Erlang tipo n" es condicional, no incondicional
`[DATO]` La cátedra (vía Gross) dice que el tiempo de procesamiento sigue `W[S] ~ Erlang(n+1, μ)`.

`[DATO]` Pero `Fundamentals` §3.2.5 precisa que eso vale **condicionado a la cantidad de clientes en el sistema**: *"the distribution of the time required for n completions … is the convolution of n exponential random variables. This is an Erlang type-n distribution"*.

`[DATO]` **El tiempo de permanencia incondicional en un M/M/1 es exponencial**, no Erlang: `W(t) = 1 − e^{−(μ−λ)t}` (Gross, eq. 3.31).

`[INFERENCIA]` **Trampa fina de oral**: si te preguntan "¿qué distribución tiene el tiempo en el sistema en un M/M/1?", la respuesta correcta es **exponencial**. Erlang aplica **condicionado a `n`**. La frase de la cátedra es válida pero incompleta.

### 2.4 El original de Lehmer es multiplicativo
Ver `U2/bibliografia.md` §2.5. `[DATO]` `DH-Lehmer.pdf` muestra `f(x) = ax mod m` — **multiplicativo**, no el mixto general.

---

## 3. El aporte más valioso: Ross §7 — **cuántas corridas y con qué confianza**

`[DATO]` **Esto es exactamente lo que la cátedra NO da.** La clase de Montecarlo deduce `y(r) = G⁻¹(r)` y termina; **no hay ley de grandes números, ni error, ni intervalos de confianza, ni criterio de parada**.

`[DATO]` **`Ross` §2.7**: desigualdad de Markov, de Chebyshev, **Ley Débil y Ley Fuerte de los Grandes Números**.

`[DATO]` **`Ross` §7.1 — regla de parada**, textual:
> *"Choose an acceptable value `d` for the standard deviation of the estimator. Generate at least **100 data values**. Continue generating data values one at a time and stopping when you have generated `k` values and `S/√k < d`."*

`[DATO]` **`Ross` §7.2 — intervalos de confianza**:
> *"θ will lie between `X̄ ± 1.96·S/√n`"* (al 95 %), con la variante para probabilidades de Bernoulli y **bootstrap** en §7.3.

`[INFERENCIA]` **Esto cierra el hueco más grande de U3.** Si te preguntan "¿cuándo paro de simular?", la cátedra no tiene respuesta. Ross sí, y es una respuesta que se puede escribir en dos líneas: **al menos 100 datos, y seguir hasta que `S/√k < d`**.

### Otros aportes fuera del programa
- **Reducción de varianza** (`Ross` cap. 8): variables antitéticas, de control, condicionamiento, muestreo por importancia, **números aleatorios comunes**. **Nada de esto está en la cátedra.**
- **Integración por Montecarlo** formal (`Papoulis` §7, eqs. 7-142 a 7-144).
- **Box-Muller / Wallace** (`Efficient_PRNG_CUDA`): la cátedra **no genera la Normal**; estos son los métodos formales.

---

## 4. Veredicto

**Usable para U3**:
1. **`Ross-Simulation ocr.pdf`** — imprescindible: inversión, rechazo, Montecarlo, LGN, **intervalos de confianza y regla de parada**. Es la fuente que cierra el hueco más grande de la unidad.
2. **`DESS-JBanks-4thEd.pdf`** — el mejor **catálogo de generación**: triangular, empírica, Poisson, gamma, Erlang por convolución.
3. `Papoulis.pdf` — solo su §7. El resto es teoría de probabilidad fuera del programa.
