# U1 — Sistemas y modelos (TEORÍA)

> **Fuente** `[DATO]`: `01_Sistemas Modelos y Simulacion/U1-Sistemas y Modelos.md`
> - Clase 1 — *Simulación 2025, Introducción* (presentación de cátedra, 9 págs.) → se cita `D1..D8`
> - U1 — *Sistemas y Modelos* (presentación de cátedra, 38 diapositivas, Prof. Bernardo G. López Armengol) → se cita `D1..D38`
> - Pardo, cap. 1 (*Introducción a la simulación*) → resumen de estudio
> - Coss Bu, cap. 1 (*Introducción*) → resumen de estudio

---

## 1. Las tres definiciones base

### SISTEMA `[DATO]` (D3)
> *"Colección de elementos y sus relaciones, definidas para conseguir un determinado **fin**. Dichos elementos pueden ser **reales o abstractos**."*

Todo sistema tiene tres componentes:
| Componente | Qué es |
|---|---|
| **Composición** | los elementos |
| **Estructura** | las relaciones entre elementos |
| **Ambiente** | la influencia de factores externos |

> ⚠️ **No confundir Ambiente con Frontera.** La **frontera** (D23) es el **borde** que delimita el sistema; el **ambiente** es la *influencia externa*. Son conceptos distintos y el material los presenta en diapositivas separadas.

### MODELO `[DATO]` (D4)
> *"Representación abstracta de un sistema. Puede ser **conceptual, gráfica, física, matemática**, etc."*

### MODELO COMPUTARIZADO `[DATO]` (D5)
> *"Programa de computadora que produce un **sistema sustituto** con variables cuyos valores a través del tiempo se determinan con las **mismas leyes dinámicas** que las correspondientes variables en el sistema real."*

### SIMULACIÓN `[DATO]` (D7)
> *"Ciencia y arte de **diseñar un modelo** de un sistema y **experimentar con este modelo**, con el propósito de **entender el comportamiento real** del sistema modelado."*

---

## 2. Formas de estudiar un sistema (D6) — **el cuadro del examen**

`[DATO]` Así aparece en la diapositiva:

```
FORMAS DE ESTUDIAR UN SISTEMA
│
├── Experimentar con el SISTEMA REAL
│
└── Experimentar con un MODELO DE SISTEMA
    ├── Modelo FÍSICO
    └── Modelo MATEMÁTICO
        ├── Solución ANALÍTICA
        └── SIMULACIÓN   ← acá vive la materia
```

`[INFERENCIA]` Es la respuesta a *"el cuadro de experimentación entre sistema real o modelo de sistema"*. La idea que transmite: se experimenta con el **modelo** cuando hacerlo con el **sistema real** no es conveniente o es imposible (D27); y dentro del modelo matemático, si hay solución analítica exacta **no se simula** (D33).

---

## 3. Para qué sirve la simulación

### Los 4 niveles de uso `[DATO]` (D8)
1. Para **definir** un sistema o proceso.
2. Como **herramienta de análisis y toma de decisiones**.
3. Como **asesoramiento** para evaluar o sintetizar soluciones.
4. Como **predictor** para planear futuros desarrollos.

### La cadena de valor `[DATO]` (D19, D20)
```
NECESIDAD → PROBLEMA →  distintas soluciones y herramientas  →  SIMULACIÓN
D A T O S → S I M U L A C I O N  (serie de experiencias con un programa) → I N F O R M A C I O N → TOMA DE DECISIONES
```
`[DATO]` (D19) Vida real: hay que **planificar, predecir, invertir, proyectar**. Ejemplos: demanda creciente de un producto; servicios de un banco.

---

## 4. EL PROCESO DE SIMULACIÓN — 10 pasos `[DATO]` (D9–D14)

| # | Paso | Qué incluye (literal de la cátedra) |
|---|---|---|
| 1 | **Formulación del problema** | Incluye determinación de objetivos |
| 2 | **Construcción del modelo** | Abstracción del problema en relaciones lógico-matemáticas de acuerdo con su formulación |
| 3 | **Toma de datos** | Identificación, especificación y colección de datos |
| 4 | **Traslado del modelo** | Preparación del modelo para pasarlo al computador |
| 5 | **Verificación** | Comprobar que **el computador hace lo que quiero**. Técnicas: (a) escribir y depurar en módulos/subprogramas; (b) correr con distintos parámetros y comprobar que la salida es razonable; (c) correr con hipótesis simplificadas con solución analítica conocida |
| 6 | **Validación** | Establece la **relación entre el modelo y el sistema real**. Pasos: (1) sugerir un modelo lógico; (2) validar empíricamente las suposiciones; (3) evaluar si los datos de salida son representativos |
| 7 | **Planeamiento estratégico y táctico** | Establece las **condiciones experimentales** de uso del modelo |
| 8 | **Experimentación** | Ejecución del modelo y obtención de resultados |
| 9 | **Análisis de resultados** | Analizar salidas para sacar conclusiones y formular recomendaciones |
| 10 | **Implementación y documentación** | Poner en práctica las decisiones y documentar el modelo y su operación |

> **Distinción clave de examen**: **verificación ≠ validación**.
> Verificación = *"¿el computador hace lo que yo quiero?"* (el modelo está bien construido).
> Validación = *"¿el modelo se corresponde con el sistema real?"* (el modelo correcto).

---

## 5. Ventajas y desventajas `[DATO]` (D15, D16)

### Ventajas (5)
1. Permite estudiar sistemas reales que **no se pueden evaluar analíticamente**.
2. Hace posible **estimar el comportamiento** de un sistema existente si se modifican condiciones actuales.
3. Se pueden **comparar alternativas de diseño** (o formas de operar) para ver cuál se comporta mejor.
4. Permite estudiar en poco tiempo la evolución de un sistema en un **periodo largo** (y al revés).
5. Se puede utilizar para **validar un modelo analítico**.

### Desventajas (4)
1. **No produce resultados exactos**, sino estimaciones → obliga a usar técnicas estadísticas.
2. Desarrollar un modelo suele ser **caro y lleva tiempo**.
3. Es **difícil demostrar la validez** del modelo; si no es válido, los resultados son poco útiles.
4. Es **difícil encontrar el óptimo**: solo se halla *el mejor entre varias alternativas*.

---

## 6. Clasificación de los SISTEMAS `[DATO]` (D24)

| # | De acuerdo a | Sistema | Ejemplo de la cátedra |
|---|---|---|---|
| 1 | **Su interacción con el medio ambiente** | Abierto | Servidor WEB de un diario |
| | | Cerrado | Aeropuertos |
| | | Aislado | Satélite en órbita |
| 2 | **Comportamiento de las variables de estado en el tiempo** | Continuo | Sistema que controla el llenado de una pileta |
| | | Discreto | Alumnos en el aula, que ingresan y se van |
| 3 | **La forma en que se producen los cambios** | Determinístico | Calentar agua |
| | | Estocástico | Número y tipo de llamadas a un Call Center |
| 4 | **La estabilidad que presente** | Estable | Ante una perturbación, vuelve a su estado original |
| | | Inestable | Ante una perturbación, NO vuelve a su estado original |

### Otra clasificación de los sistemas `[DATO]` (D25)
| # | Sistema | Ejemplo |
|---|---|---|
| 1 | Naturales | Árbol |
| | Artificiales | Computadora |
| 2 | Dinámicos | Sistema de peces, YouTube |
| | Estáticos | PowerPoint |
| 3 | Adaptativos | Hormigas y colonias |
| | Adaptativos complejos | (sin ejemplo en la diapositiva) |
| 4 | Repetible | (sin ejemplo) |
| | Recurrente o único | (sin ejemplo) |

---

## 7. Clasificación general de un MODELO `[DATO]` (D30–D31)

| # | De acuerdo a | Modelo | Ejemplo de la cátedra |
|---|---|---|---|
| 1 | Si refleja cambios a través del tiempo o no | **Estático** | Maqueta, plano |
| | | **Dinámico** | Crecimiento de un ser viviente |
| 2 | Los resultados que produce | **Determinístico** | Agua para el mate |
| | | **Estocástico** | Modelo de comportamiento del tránsito |
| 3 | Los cambios que se producen en el tiempo | **Continuo** | Movimiento de un vehículo |
| | | **Discreto** | Entrada de personas a un negocio |
| 4 | Su representación | **Físicos** | Escala, maqueta, avión |
| | | **Analógicos** | Representación gráfica de la producción en función del tiempo |
| 5 | Su representación | **Matemáticos** | Propiedades con símbolos (x,y) y relaciones entre propiedades (operaciones) |
| | | **Mental** | Equilibrio de un vaso |

`[DATO]` (D29) Clasificación práctica: **modelo NO simulable** → *un cuadro* · **modelo simulable** → *el plano de una casa*.

---

## 8. Clasificación de los modelos de SIMULACIÓN `[DATO]` (D34–D35)

| # | Modelo de simulación | Significado (literal) |
|---|---|---|
| 1 | **Estáticos** | Representación de un sistema en un momento particular, o cuando el tiempo no juega ningún rol. *Ej.: Montecarlo* |
| | **Dinámicos** | Representa un sistema a medida que evoluciona en el tiempo |
| 2 | **Determinístico** | Si no contiene componente probabilístico. *Ej.: ecuación diferencial* |
| | **Estocástico** | Si contiene al menos un componente aleatorio |
| 3 | **Continuos** | Relación con sistemas continuos |
| | **Discretos** | Relación con sistemas discretos |
| 4 | **Basados en Agentes** | Cuando los agentes interactúan en repetidas ocasiones para optimizar el resultado |

### Tipos de simulación `[DATO]` (D36)
| Simulación | Consiste en |
|---|---|
| **Discreta** | Las variables de estado cambian **instantáneamente**, cuando ocurren eventos |
| **Continua** | Las variables de estado cambian **continuamente** en el tiempo. Involucran ecuaciones diferenciales; si son simples se resuelven analíticamente, si no se usa cálculo numérico (**Runge-Kutta**) |
| **Discreta-Continua** | Combinación de ambas |
| **Basada en Agentes** | Enfoque computacional que permite crear **sociedades artificiales** para estudiar el comportamiento **global que emerge** de la interacción de agentes individuales, solo con la información y capacidad de procesamiento de cada uno |

---

## 9. Cuándo usar simulación y cuándo NO `[DATO]` (D33)

> *"Si un modelo matemático es sencillo y se pueden trabajar sus relaciones y cantidades para obtener una **solución analítica exacta**, utilizamos ese modo y **NO** la simulación."*
> *"Si un modelo matemático es complejo, descartando toda posibilidad de solución analítica, debe ser estudiado por **simulación**. Otro caso es la combinación de reglas lógicas y matemáticas."*

`[DATO]` (D27) Modelizar es una metodología de trabajo para: **describir** el comportamiento de los sistemas · **hacer hipótesis** que expliquen lo observado · **predecir** cómo se comporta ante cambios.

---

## 10. Áreas de aplicación `[DATO]` (D37)
Comunicaciones · Educación · Entretenimientos · Servicios financieros · Servicios alimenticios · Sistemas de salud · Hotelería y transporte · Pronóstico del tiempo, medio ambiente y ecología.

---

## 11. Aporte de Pardo (cap. 1)

`[DATO]` **Origen**: el uso moderno del término se sitúa hacia **1949**, con el método de **Montecarlo** (Von Neumann y Ulam).
`[DATO]` **Definición adoptada (Shannon, 1975)**: simular es diseñar un modelo de un sistema real y experimentar con él para aprender su comportamiento o evaluar estrategias de funcionamiento.
`[DATO]` **Modelo según Minsky**: *X es modelo de Y para un observador Z si Z puede usar X para responder preguntas sobre Y*.
`[DATO]` **Dos vías para obtener modelos matemáticos**: análisis teórico (deductivo) · análisis experimental.
`[DATO]` **Idea central**: un modelo de simulación **no se "resuelve", se "hace funcionar"**; no devuelve un óptimo sino una descripción del comportamiento bajo las condiciones del experimentador.

**Cuándo conviene simular (Shannon, 1975) — 7 casos:**
(a) no hay formulación matemática o no hay métodos analíticos (dimensionar servicios de un aeropuerto); (b) hay modelo pero es laborioso y simular es más barato; (c) se quiere experimentar **antes de construir** el sistema (simulador de vuelo); (d) es **imposible** experimentar sobre el real (Apolo 13); (e) razones **éticas** lo impiden (sistemas biológicos humanos); (f) el sistema evoluciona **muy lentamente** y la simulación comprime el tiempo; (g) permite estudiar sistemas dinámicos en tiempo real.

**Inconvenientes:** (a) construir el modelo puede ser complejo, caro y lento (Forrester 1961: 8–10 años para un modelo socioeconómico); (b) omitir elementos "menores" puede falsear los resultados (modelos del Club de Roma); (c) es difícil conocer el grado de imprecisión de los resultados.

---

## 12. Aporte de Coss Bu (cap. 1)

`[DATO]` Tres definiciones: **Naylor** (técnica numérica para hacer experimentos en computadora con relaciones matemáticas y lógicas) · **Maisel y Gnugnoli** (versión más estricta: modelos de sistemas de negocios, económicos, sociales…) · **Shannon** (diseñar un modelo computarizado y experimentar para entender su comportamiento o evaluar estrategias).
`[DATO]` **8 etapas**: Definición del sistema → Formulación del modelo → Colección de datos → Implementación en computadora → Validación → Experimentación → Interpretación → Documentación.
`[DATO]` En **Interpretación**: *"La computadora no decide, informa"* (apoya decisiones semi-estructuradas).
`[DATO]` **Factores a considerar (1.3)**: variables aleatorias no uniformes · lenguajes de programación (GPSS, GASP…) · condiciones iniciales (transitorio vs estable: corrida larga, descartar el tramo inicial, o **simulación regenerativa** — el autor prefiere esta última) · tamaño de la muestra (nº de corridas, por intervalos de confianza) · diseño de experimentos (comparación de medias/varianzas, ANOVA y regresión, búsqueda de óptimos con Hooke y Jeeves).

---

## 13. Notas para el examen (trampas detectadas)

1. **El proceso de simulación tiene DOS versiones en el material de la cátedra**: la de la clase son **10 pasos**; Coss Bu lista **8 etapas**. Si te toca el tema, tirá **los 10 de la cátedra** y mencioná que Coss Bu los agrupa en 8.
2. **Verificación ≠ Validación.** Es la trampa conceptual más probable de U1.
3. **La clasificación tiene 4 tablas distintas** (sistemas D24, otra de sistemas D25, modelos D30-31, modelos de simulación D34-35). No alcanza con determinístico/estocástico.
4. **Los ejemplos son parte de la respuesta.** La cátedra da un ejemplo por celda (Call Center para estocástico, pileta para continuo, etc.). Reproducirlos suma.
5. **"Modelo NO simulable: cuadro / simulable: plano de una casa"** (D29) — es una respuesta de una línea que Bernardo eligió poner. Memorizala.
