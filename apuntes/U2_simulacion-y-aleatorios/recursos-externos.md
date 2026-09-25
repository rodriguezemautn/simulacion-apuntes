# U2 — Recursos externos

> Complementos al material de cátedra. La cátedra manda; esto **refuerza**.
> `[VERIFICADO]` = se leyó el contenido · `[IDENTIFICADO]` = solo título/URL.

---

## ⚠️ Advertencia central antes de mirar cualquier video de chi-cuadrado

**Casi todo el material en español sobre "prueba chi-cuadrado" trata sobre tablas de contingencia y prueba de INDEPENDENCIA, no sobre BONDAD DE AJUSTE.**

- **Bondad de ajuste** (lo de la cátedra): ¿*esta muestra* sigue *esta distribución teórica*? Una sola variable, se compara FO contra FE calculada integrando la distribución.
- **Independencia** (lo que abunda en YouTube): ¿*dos variables* están asociadas? Tabla de contingencia, FO contra FE = (total fila × total columna)/total.

Comparten la fórmula `Σ(FO−FE)²/FE`, pero **el planteo es distinto**. Si en el final respondés un problema de ajuste como si fuera de contingencia, perdés el punto.

---

## Videos

### 1. `[VERIFICADO]` Prueba de chi-cuadrado de Pearson — **bondad de ajuste** (Pearson / MyLab)
- **URL**: https://mediaplayer.pearsoncmg.com/assets/les7e_sl_10_01
- **Qué aporta**: es de los **pocos** que desarrolla **bondad de ajuste de verdad**. Narrado en español, explica: H₀/H₁, el requisito de que **cada frecuencia esperada sea al menos 5**, la fórmula del estadístico, **`gl = k − 1`** (k = número de categorías) y el criterio de rechazo. Trae un ejemplo completo resuelto (400 residentes, distribución de edades, concluye **no rechazar H₀**).
- **Por qué sirve**: coincide con la cátedra en todo, **incluido `gl = k − 1`**.
- **Límite**: no es YouTube; es el reproductor de Pearson. No cubre el caso de **parámetros estimados** de los datos.

### 2. `[VERIFICADO]` La prueba CHI CUADRADO en Excel — El Tío Estadístico
- **URL**: https://www.youtube.com/watch?v=ZyPrsSR7Abc
- **Qué aporta**: resolución **muy clara y paso a paso** de una chi-cuadrado en Excel, con el caso del Titanic (891 pasajeros). Explica FREQ.ABS, frecuencias esperadas, el estadístico, los grados de libertad y el valor crítico.
- **⚠️ Ojo**: es **independencia** (clase × supervivencia), **no bondad de ajuste**. Sirve para entender la mecánica de la fórmula y el uso de Excel, no para responder el punto de la cátedra.
- **Límite**: incluye Cramér's V, que **no** entra en el programa.

### 3. `[VERIFICADO]` Ejemplo manual de prueba de Chi Cuadrada — Loren Yuleisy Mota Lizardo
- **URL**: https://www.youtube.com/watch?v=g38_hP5ZDZk
- **Qué aporta**: resolución **a mano** de una chi-cuadrado (tabla de contingencia, religión por tipo de colegio). Muestra el cálculo manual completo de FO, FE, estadístico, grados de libertad y comparación con la tabla.
- **⚠️ Ojo**: también es **independencia**, no ajuste. Y es un video de un estudiante, no material docente: menos pulido.
- **Sirve para**: ver el cálculo a mano, que es como te lo pueden pedir en el final.

### 4. `[IDENTIFICADO]` Cómo programar un GENERADOR DE NÚMEROS ALEATORIOS — MoureDev TV
- **URL**: https://www.youtube.com/watch?v=sMCSE5qupQo
- **Qué aporta**: implementa un generador **desde cero**, apoyándose en la **hora del sistema** (microsegundos/nanosegundos) y módulo. Explica bien **por qué se llaman "seudoaleatorios"** y por qué no existe la aleatoriedad pura.
- **⚠️ Ojo**: **no usa los métodos de la cátedra** (cuadrados medios, producto medio, constante multiplicativa, GCL). Es otro enfoque.
- **Sirve para**: entender el **concepto** de determinismo + semilla, que es la idea que la cátedra evalúa.

### 5. `[IDENTIFICADO]` Generación de variables aleatorias — Relaciones entre distribuciones
- **URL**: https://www.youtube.com/watch?v=MhqmlHJgaSc
- **Qué aporta**: solo se pudo recuperar el título. Por el nombre, apunta a **U3**, no a U2.
- **Estado**: no verificado. Revisar recién en U3.

---

## Textos y recursos interactivos (acá está lo mejor)

### A. `[VERIFICADO]` OpenStax — *Introducción a la estadística*, §11.2 **Prueba de bondad de ajuste**
- **URL**: https://openstax.org/books/introducci%C3%B3n-estad%C3%ADstica/pages/11-2-prueba-de-bondad-de-ajuste
- **Qué aporta**: es **exactamente el tema de la cátedra**, en español y con ejemplos resueltos paso a paso (ausentismo estudiantil, cantidad de televisores por familia). Explica el estadístico, los grados de libertad `k − 1`, el **valor p** y la decisión. Trae una nota clave: **"si una frecuencia esperada es menor que 5, combiná esa categoría con la siguiente"** — el mismo criterio de **reagrupación** que usa la cátedra.
- **Por qué sirve**: es el complemento escrito más alineado de todo lo que encontré.

### B. `[VERIFICADO]` OpenStax — §11.7 **Laboratorio: bondad de ajuste chi-cuadrado**
- **URL**: https://openstax.org/books/introducci%C3%B3n-estad%C3%ADstica/pages/11-7-laboratorio-1-bondad-de-ajuste-de-chi-cuadrado
- **Qué aporta**: un laboratorio guiado que **casualmente replica el ejemplo de la cátedra**: se toman **recibos de supermercado**, se prueban las distribuciones **uniforme y exponencial**, y se usa **`1/x̄` como parámetro de decaimiento**. Pide calcular cuantiles, frecuencias observadas y esperadas, el estadístico, el valor p y la decisión.
- **Por qué sirve**: es el mismo ejercicio (supermercado + exponencial + `λ = 1/x̄`) que da Roqué. Hacerlo te deja el método automatizado.

### C. `[VERIFICADO]` probabilidadyestadistica.net — *Prueba de bondad de ajuste*
- **URL**: https://www.probabilidadyestadistica.net/prueba-de-bondad-de-ajuste/
- **Qué aporta**: teoría + **ejercicio resuelto paso a paso** (ventas de tres productos). Confirma el criterio: **se rechaza H₀ cuando el estadístico calculado supera el crítico**.
- **Límite**: el ejemplo es con proporciones dadas, no con distribución estimada de datos.

### D. `[VERIFICADO]` Técnicas de Simulación y Remuestreo — Julián Costa (UDC), capítulos 2.1 y 4.1–4.2
- **URL**: https://rubenfcasal.github.io/simbook/gen-cong.html
- **Qué aporta**: material universitario serio en español sobre:
  - **Generadores congruenciales lineales**: `x_i = (a·x_{i−1} + c) mod m`, `u_i = x_i/m`; **mixto** (c ≠ 0) vs **multiplicativo** (c = 0, Lehmer 1951); condiciones de **período completo** (Hull y Dobell).
  - **Problemas reales**: el generador **RANDU** de IBM y la **estructura reticular**; el teorema de Marsaglia sobre hiperplanos.
  - **Método de inversión** y **aceptación-rechazo** (Von Neumann, 1951), con la eficiencia `p = 1/c`.
- **Por qué sirve**: da el **porqué** de las condiciones de calidad que la cátedra solo enumera. Ideal para el oral.

### E. `[VERIFICADO]` Modelos de Simulación — Abel Ranni, *Números Aleatorios y Pseudoaleatorios*
- **URL**: https://abelranni.github.io/modelos-de-simulacion/docs/Introduccion/01.02_numeros_pseudoaleatorios
- **Qué aporta**: muy alineado con la cátedra. Distingue **GCL mixto** y **multiplicativo**, explica **semilla**, **módulo**, **período**, y **período completo** con el **teorema completo** (m = 2^g, a = 1 + 4k, c y m primos relativos…) y un ejemplo verificado con `m = 16, a = 5, c = 3, Z₀ = 7`.
- **Por qué sirve**: es el complemento más directo de la sección de GCL de la cátedra, que en el material es de una sola línea.

### F. `[VERIFICADO]` Wikipedia — *Generador lineal congruencial*
- **URL**: https://es.wikipedia.org/wiki/Generador_lineal_congruencial
- **Qué aporta**: parámetros de GCL reales usados por bibliotecas, el caso RANDU, y la advertencia de que **un GCL no sirve para Montecarlo de alta calidad** por correlación serial.
- **Sirve para**: el oral (limitaciones) y para conectar con U4 (Montecarlo).

### G. `[VERIFICADO]` Wikipedia — *Método de la transformada inversa* y *Método de aceptación y rechazo*
- **URLs**: https://es.wikipedia.org/wiki/Método_de_la_transformada_inversa · https://es.wikipedia.org/wiki/Método_de_aceptación_y_rechazo
- **Qué aporta**: los dos métodos de generación de variables con desarrollo formal. **Formalmente son U3**, pero el material de U2 ya los toca.
- **Sirve para**: dejar los métodos cerrados antes de U3.

### H. `[VERIFICADO]` MERLOT / UPV — *Laboratorio virtual: método congruencial*
- **URL**: https://www.merlot.org/merlot/viewMaterial.htm?id=772940183
- **Qué aporta**: laboratorio **interactivo** donde se cargan `a`, `b`, `m` y la semilla `x₀`, y se ven la sucesión `u_n = x_n/m` y su **histograma**.
- **Por qué sirve**: es la forma más rápida de **ver con tus ojos** por qué una mala elección de parámetros arruina la uniformidad. Ideal para fijar el concepto.
- **Nota**: el sitio usa applet Java/Flash; puede no andar en navegadores modernos.

---

## Lo que descarté y por qué

- **Todo el material de "prueba chi-cuadrado" orientado a contingencia/independencia**: correcto en la fórmula, **equivocado en el planteo** para la cátedra. Descartado como fuente principal.
- **Recursos de Q-Q plots y scipy/Python**: fuera del nivel y del lenguaje de la cátedra.
- **Blogs comerciales** ("guía completa de clasificación de modelos"): sin autoría académica, contenido genérico.

---

## Conclusión honesta

Para U2, **el video no alcanza**. Los dos videos buenos de chi-cuadrado son de **independencia**, no de ajuste. Lo que realmente complementa la cátedra es:

1. **OpenStax §11.2 y §11.7** — el método completo, en español, con el mismo ejemplo del supermercado y la exponencial.
2. **Abel Ranni (E)** y **el simbook (D)** — para los generadores congruenciales, donde la cátedra es pobre.
3. **El laboratorio de la UPV (H)** — para *ver* la uniformidad del GCL.
