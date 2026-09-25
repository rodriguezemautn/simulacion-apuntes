# U1 — Autoevaluación

> **Formato real**: el final es **teoría a desarrollar**, se sortean **5 puntos al azar**.
> Condiciones: **sin mirar el apunte**, a mano, y después **defendé cada respuesta en voz alta** (Bernardo llama a oral si te ve flojo).
> Tiempo sugerido: 50 minutos para los 5 puntos.

---

## Punto 1 — Definiciones

Defina **SISTEMA**, **MODELO** y **SIMULACIÓN**.
Indique además:
- qué **componentes** tiene todo sistema,
- qué es la **frontera**,
- qué es un **modelo computarizado**.

> *"Colección de elementos y sus relaciones, definidas para conseguir un determinado **fin**. Dichos elementos pueden ser **reales o abstractos**."*

Todo sistema tiene tres componentes:
| Componente | Qué es |
|---|---|
| **Composición** | los elementos |
| **Estructura** | las relaciones entre elementos |
| **Ambiente / Frontera** | la influencia de factores externos (D23: la **frontera** señala el borde del sistema) |

### MODELO `[DATO]` (D4)
> *"Representación abstracta de un sistema. Puede ser **conceptual, gráfica, física, matemática**, etc."*

### MODELO COMPUTARIZADO `[DATO]` (D5)
> *"Programa de computadora que produce un **sistema sustituto** con variables cuyos valores a través del tiempo se determinan con las **mismas leyes dinámicas** que las correspondientes variables en el sistema real."*

### SIMULACIÓN `[DATO]` (D7)
> *"Ciencia y arte de **diseñar un modelo** de un sistema y **experimentar con este modelo**, con el propósito de **entender el comportamiento real** del sistema modelado."*

---

## Punto 2 — Formas de estudiar un sistema

Explique el **cuadro de formas de estudiar un sistema**: las alternativas que existen para estudiar un sistema y las ramas en que se subdivide cada una.
Indique **cuándo se recurre a la simulación** y **cuándo NO**, y justifique con el criterio de la solución analítica.

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

## Punto 3 — El proceso de simulación

Enumere y explique **las etapas del proceso de simulación** según la cátedra.
Para cada etapa, diga en una línea **en qué consiste**.

---

## Punto 4 — Verificación y validación

Explique la **diferencia entre verificación y validación**.
Indique las **técnicas** de verificación y los **pasos** para construir un modelo válido.
Explique además: ¿en qué momento aparece cada una dentro del proceso?

 # | Paso | Qué incluye (literal de la cátedra) |
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


---

## Punto 5 — Clasificación

Clasifique los **modelos de simulación** según los criterios vistos, dando **un ejemplo de cada tipo**.
Luego explique los **tipos de simulación** y qué caracteriza a cada uno.

---

## Punto extra (no entra en los 5, pero preparalo)

**Ventajas y desventajas de la simulación.** Enuncie al menos 4 ventajas y 3 desventajas.

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
---

> ## ⚠️ CORTÁ ACÁ
> Lo que sigue son **los criterios de corrección**. No los leas hasta haber escrito tus 5 respuestas completas.

---

## Criterios de corrección

### Punto 1 — Definiciones
- **Sistema (D3)**: *colección de elementos y sus relaciones definidas para conseguir un fin*; elementos **reales o abstractos**.
- **Componentes**: **Composición** (elementos) · **Estructura** (relaciones) · **Ambiente** (influencia de factores externos).
- **Frontera (D23)**: señala **el borde del sistema**.
- **Modelo (D4)**: **representación abstracta** de un sistema; puede ser **conceptual, gráfica, física, matemática**, etc.
- **Modelo computarizado (D5)**: **programa de computadora** que produce un **sistema sustituto**, con variables cuyos valores en el tiempo se determinan con **las mismas leyes dinámicas** que en el sistema real.
- **Simulación (D7)**: **ciencia y arte de diseñar un modelo** de un sistema y **experimentar con ese modelo**, para **entender el comportamiento real** del sistema modelado.
- *Si falta "ciencia y arte" o "entender el comportamiento real", la definición está incompleta.*

### Punto 2 — Formas de estudiar un sistema (D6)
El cuadro debe quedar así:
```
Experimentar con el SISTEMA REAL
Experimentar con un MODELO DE SISTEMA
   ├── Modelo FÍSICO
   └── Modelo MATEMÁTICO
        ├── Solución ANALÍTICA
        └── SIMULACIÓN
```
- **Cuándo NO simular (D33)**: si el modelo matemático es **sencillo** y admite **solución analítica exacta**, se usa esa y **no** la simulación.
- **Cuándo SÍ**: si el modelo es **complejo** y se descarta toda posibilidad de solución analítica; también cuando hay **combinación de reglas lógicas y matemáticas**.
- *Punto clave*: se modela cuando experimentar con el sistema real **no es conveniente o es imposible** (D27).

### Punto 3 — Proceso de simulación (D9–D14): los 10 pasos
1. **Formulación del problema** — incluye determinación de objetivos.
2. **Construcción del modelo** — abstracción en relaciones lógico-matemáticas acordes a la formulación.
3. **Toma de datos** — identificación, especificación y colección.
4. **Traslado del modelo** — preparación para pasarlo al computador.
5. **Verificación** — comprobar que el computador hace lo que quiero.
6. **Validación** — relación entre el modelo y el sistema real.
7. **Planeamiento estratégico y táctico** — condiciones experimentales de uso del modelo.
8. **Experimentación** — ejecución y obtención de resultados.
9. **Análisis de resultados** — conclusiones y recomendaciones.
10. **Implementación y documentación** — poner en práctica y documentar.
- *Se acepta mencionar que Coss Bu los agrupa en 8 etapas, pero **la versión de la cátedra son 10**.*

### Punto 4 — Verificación vs validación (D12–D13)
- **Verificación** = *¿el computador hace lo que quiero?* Se verifica el **modelo operacional** contra el modelo conceptual.
  Técnicas: (a) escribir y **depurar en módulos y subprogramas**; (b) correr con **distintos parámetros** y comprobar que la salida es razonable; (c) correr con **hipótesis simplificadas** con solución analítica conocida.
- **Validación** = *¿el modelo representa al sistema real?* Establece la **relación modelo ↔ sistema real**.
  Pasos: (1) sugerir un **modelo lógico**; (2) **validar empíricamente** las suposiciones; (3) evaluar en qué medida los **datos de salida** son representativos.
- **Orden en el proceso**: verificación es el **paso 5** (antes), validación es el **paso 6** (después). Se verifica primero que el programa esté bien, y recién después que el modelo sirva.
- *Este es el punto donde más gente se cae. Si confundís los dos, perdés el punto.*

### Punto 5 — Clasificación
**Modelos de simulación (D34–D35):**
| Criterio | Tipos | Ejemplo |
|---|---|---|
| Tiempo | **Estáticos** | Montecarlo |
| | **Dinámicos** | Sistema que evoluciona en el tiempo |
| Certeza | **Determinístico** | Ecuación diferencial |
| | **Estocástico** | Contiene al menos un componente aleatorio |
| Variables | **Continuos** | Relación con sistemas continuos |
| | **Discretos** | Relación con sistemas discretos |
| | **Basados en Agentes** | Agentes que interactúan repetidas veces para optimizar el resultado |

**Tipos de simulación (D36):**
- **Discreta**: las variables de estado cambian **instantáneamente**, cuando ocurren eventos.
- **Continua**: las variables cambian **continuamente**; involucra ecuaciones diferenciales. Si son simples → solución analítica; si no → **cálculo numérico (Runge-Kutta)**.
- **Discreta-Continua**: combinación.
- **Basada en Agentes**: crear **sociedades artificiales** para estudiar el comportamiento **global que emerge** de la interacción de agentes individuales.
- *Bonus por clasificar además los SISTEMAS (D24: abierto/cerrado/aislado, continuo/discreto, determinístico/estocástico, estable/inestable) y los MODELOS en general (D30-31: estático/dinámico, determinístico/estocástico, continuo/discreto, físicos/analógicos, matemáticos/mental).*

### Punto extra — Ventajas (D15) y desventajas (D16)
**Ventajas**: estudiar sistemas que no se pueden evaluar analíticamente · estimar el comportamiento de un sistema existente si cambian las condiciones · comparar alternativas de diseño · estudiar en poco tiempo la evolución en un periodo largo (y al revés) · validar un modelo analítico.
**Desventajas**: no da resultados exactos sino **estimaciones** (exige estadística) · desarrollarlo es **caro y lento** · es **difícil demostrar la validez** · es difícil encontrar el **óptimo** (solo el mejor entre alternativas).
