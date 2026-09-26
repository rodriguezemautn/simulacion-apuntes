# U3 — Recursos externos

> Complementos al material de cátedra. `[VERIFICADO]` = se leyó el contenido · `[IDENTIFICADO]` = solo título/URL.

---

## ⚠️ Advertencia: lo que la cátedra NO cubre

Estos recursos son **más completos que la cátedra** en dos puntos concretos. Ojo con el efecto:

1. **La cátedra NO enseña a generar la Normal.** El TP3 la pide **por rechazo** (#21), pero **Box-Muller no se menciona nunca** y la Normal no se genera en clase. Buena parte de la bibliografía externa arranca por ahí.
2. **La cátedra omite la inversa de la rama `f₂` de la triangular.** Los recursos externos la traen.

**Regla**: usá estos recursos para **entender**, pero respondé con **lo que da la cátedra**. Si en el oral mencionás Box-Muller sabiendo que no está en el programa, suma; si lo usás como si fuera contenido de la materia, confunde.

---

## Videos

### 1. `[VERIFICADO]` Inverse Transform Sampling — Data Science Concepts
- **Canal**: ritvikmath
- **URL**: https://www.youtube.com/watch?v=9ixzzPQWuAY
- **Idioma**: inglés (subtítulos automáticos disponibles)
- **Qué aporta**: es **la mejor pieza audiovisual** para el método de inversión. Deriva la transformación desde cero: parte de la CDF, plantea `F(T(U)) = U`, invierte, y llega al resultado general `T = F⁻¹`. Después lo aplica a la exponencial hasta obtener `x = −ln(1−u)/λ`, y explica **por qué `1−u` puede reemplazarse por `u`** (el mismo paso que hace la cátedra). Cierra generalizando: el método sirve para **cualquier** distribución con CDF invertible.
- **Por qué sirve**: es exactamente el Punto 1 del TP3 y el método más preguntable de la unidad. Si el paso `1−R → R` te genera dudas, acá se entiende de una.
- **Límite**: no cubre composición, convolución ni rechazo.

### 2. `[IDENTIFICADO]` Generación de variables aleatorias — Relaciones entre distribuciones
- **URL**: https://www.youtube.com/watch?v=MhqmlHJgaSc
- **Qué aporta**: solo se recuperó el título. Promete relaciones entre distribuciones (probablemente convolución/composición).
- **Estado**: no verificado. Ver recién si te falta intuición en convolución.

### 3. `[IDENTIFICADO]` ¿En qué consiste el Método Montecarlo?
- **URL**: https://www.youtube.com/watch?v=WJjDr67frtM
- **Qué aporta**: solo el título, en español. Introducción conceptual.
- **Límite**: los videos introductorios de Montecarlo suelen quedarse en lo conceptual y **no** tocan la deducción que da la cátedra (`g(y(R)) = f(R)|dR/dy|` → `y(r) = G⁻¹(r)`).

### 4. `[IDENTIFICADO]` Vídeo Pi: Método de MonteCarlo (GeoGebra)
- **URL**: https://www.geogebra.org/m/ys6ckznw
- **Qué aporta**: material interactivo/visual sobre estimación de π por Montecarlo. No es video de clase.
- **Por qué sirve**: la **estimación de π** sí aparece en el material de la cátedra (carpeta 03), así que este recurso tiene respaldo en el programa.

---

## Textos y recursos interactivos (acá está lo mejor)

### A. `[VERIFICADO]` Simulación de Procesos y Sistemas — §1.5 *Simular con la Transformada Inversa*
- **URL**: https://bookdown.org/content/944ffa0f-050e-47cb-afaa-4dff15a9ed00/transformadainversa.html
- **Qué aporta**: el algoritmo de la transformada inversa **en español, formalizado y separado por caso**:
  - **continuo**: generar `uᵢ ~ U(0,1)`, devolver `xᵢ = F⁻¹(uᵢ)`;
  - **discreto**: generar `uᵢ`, buscar el **menor `I`** tal que `uᵢ ≤ F(x_I)`, devolver `x_I`.
- **Por qué sirve**: la cátedra da la versión discreta de forma informal ("comparar `R` contra la acumulada"). Acá está el criterio exacto, que es lo que se pide en el TP3 #4 y #8c.
- **Límite**: orientado a R y Python, no a MATLAB.

### B. `[VERIFICADO]` Técnicas de Simulación y Remuestreo — Julián Costa (UDC)
- **URLs**: [inversión](https://rubenfcasal.github.io/simbook/inversion.html) · [aceptación-rechazo](https://rubenfcasal.github.io/simbook/AR.html) · [composición](https://rubenfcasal.github.io/simbook/composicion.html) · [libro completo (PDF)](https://rubenfcasal.github.io/simbook/Simulacion.pdf)
- **Qué aporta**: es la **columna vertebral teórica** de toda la unidad, en español universitario:
  - **§4.1 Inversión**: el resultado `U = F(X) ~ U(0,1)` y su recíproco `F⁻¹(U) ~ X`, con demostración.
  - **La tabla que te falta**: densidad, `F(x)`, `F⁻¹(U)` y **forma simplificada** para **Exponencial, Cauchy, Triangular, Pareto y Weibull**. *Esta tabla trae la inversa de la triangular que la cátedra omite.*
  - **§4.2 Aceptación-rechazo**: algoritmo de Von Neumann (1951), la condición `c·U·g(T) ≤ f(T)`, **la eficiencia `p = 1/c`** y el valor óptimo `c_opt = max f/g`. Confirma exactamente la definición de eficiencia que usa la cátedra.
  - **§4.4 Composición**: mixtura discreta con dos uniformes, tal como la enseña la cátedra.
  - **§5 Discretas**: transformación cuantil, tabla guía y **método de Alias** — que la cátedra **no** cubre.
  - **§7 Métodos Monte Carlo**: integración por Monte Carlo.
- **Por qué sirve**: si el oral se pone formal, acá están las demostraciones que la clase solo enuncia.

### C. `[VERIFICADO]` Wikipedia — Transformada inversa y Aceptación-rechazo
- **URLs**: [transformada inversa](https://es.wikipedia.org/wiki/Método_de_la_transformada_inversa) · [aceptación y rechazo](https://es.wikipedia.org/wiki/Método_de_aceptación_y_rechazo)
- **Qué aporta**: demostración del teorema (`F_X(x) = P[T(U) ≤ x] = T⁻¹(x)`), ejemplos (geométrica discreta, exponencial) y **el algoritmo general de rechazo con `M`**.
- **Por qué sirve**: la cátedra usa `M` como el máximo de `f` en `[a,b]`; Wikipedia usa `c·g(x)` como cota. Confirma que son equivalentes y te permite no confundirte si cambian la notación.

### D. `[VERIFICADO]` SIMULACIÓN UNIDAD I — Métodos (oocities)
- **URL**: https://www.oocities.org/tcaspon/simula/UNI4/uni4_01.htm
- **Qué aporta**: los cuatro métodos con la notación clásica, **más un método que la cátedra NO da**: generar la **Normal por convolución usando el Teorema Central del Límite** con **`n = 12`** uniformes (`Σ rᵢ − 6`). También menciona el **método directo** (Box-Muller) para la Normal.
- **Por qué sirve**: **es la respuesta más útil al hueco de la cátedra**. Si en el oral te preguntan "¿cómo generaría una Normal?", la cátedra no lo enseña — y este material te da **dos** formas de responder: convolución con n=12 o método directo.
- **Límite**: sitio viejo (oocities), sin fecha ni autoría clara. Tomalo como referencia conceptual, no como cita.

### E. `[VERIFICADO]` Estimación de π por Montecarlo (varios)
- **URLs**: [UIBCDF](https://www.uibcdf.org/Taller-Ciencia-Datos/semana_2/reto_2.html) · [Análisis y Decisión](https://analisisydecision.datanalytics.com/blog/simulacion-estimacion-de-pi-con-el-metodo-montecarlo/) · [ExcelHechoFácil](https://www.excelhechofacil.com/2016/11/pi-metodo-montecarlo.html)
- **Qué aporta**: la estimación de π paso a paso — cuarto de círculo de radio 1 sobre el cuadrado unitario, proporción de puntos adentro, `π ≈ 4·q/N`. El de **ExcelHechoFácil** lo hace **en Excel con VBA**, que es directamente aplicable si querés calcularlo sin MATLAB.
- **Por qué sirve**: la cátedra **menciona la estimación de π** en el material de la carpeta 03. Con esto podés explicar el método y **mostrar convergencia** (gráfico de `π` estimado en función de `N`), que es justo lo que las clases de Montecarlo **no** hacen.
- **Uso sugerido para el oral**: es la forma más rápida de explicar qué es Montecarlo en 30 segundos.

### F. `[IDENTIFICADO]` Platzi — Simulaciones de Montecarlo para aproximar π
- **URL**: https://platzi.com/cursos/programacion-estocastica/simulaciones-de-montecarlo-para-aproxima/
- **Qué aporta**: el π por Montecarlo **con criterio de parada estadístico**: se itera duplicando el número de agujas **hasta que el desvío estándar cae por debajo de `precisión/1.96`** (95 % de confianza).
- **Por qué sirve**: es **exactamente el concepto de "cuántas corridas necesito"** que la cátedra **no** desarrolla. Es una respuesta fuerte para el oral.

---

## Lo que descarté

- **Materiales de Python/NumPy con `np.random`**: usan generadores ya implementados; la cátedra pide implementar la inversa a mano.
- **Contenido en R del simbook como código**: sirve la teoría, pero el TP3 exige **MATLAB**.
- **Videos introductorios de Montecarlo sin matemática**: quedan en "es lanzar dados muchas veces" y no llegan a la deducción que pide la materia.

---

## Conclusión honesta

Para U3 **sí hay buen material**, mejor que para U1 y U2:

1. **Video**: el de **inverse transform sampling (ritvikmath)** es el único que explica de verdad un método completo. Es en inglés, pero vale.
2. **Texto**: el **simbook (B)** es el mejor recurso de toda la unidad — cubre inversión, rechazo, composición y discretas con rigor, y **trae la tabla de inversas que a la cátedra le falta**.
3. **Para el hueco de la Normal (D)**: convolución con `n = 12` o método directo. **No está en el programa**, pero te cubre una repregunta de oral.
4. **Para Montecarlo**: la estimación de π (**E**) y el criterio de parada (**F**) son lo que más te falta y lo que más te suma.
