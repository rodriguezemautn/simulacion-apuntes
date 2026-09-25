# U1 — Recursos externos

> Complementos al material de cátedra. **Nada de acá reemplaza la clase**: la cátedra manda.
> Cada recurso dice qué aporta y si fue **verificado** (se leyó el contenido) o solo **identificado** (se conoce el título/URL, no el contenido completo).

---

## Videos

### 1. `[VERIFICADO]` Una aproximación a la simulación de eventos discretos y sus campos de aplicación
- **Canal**: ULLaudiovisual — Universidad de La Laguna
- **URL**: https://www.youtube.com/watch?v=-S6Z0wVlBCI
- **Qué aporta a U1**: es la mejor pieza audiovisual que encontré. Explica con claridad **discreto vs continuo** (el ejemplo del recorrido a la silla: muestreo por segundo vs solo los eventos clave), la idea de que un modelo discreto **conserva solo las ocurrencias fundamentales**, y el concepto de **interacción entre entidades** (competencia por recursos → aparecen las colas). Cierra con un caso completo: optimizar recursos de un **servicio quirúrgico**, donde desglosa variables de interés, entidades, atributos, recursos material/humano y eventos (ingreso, preoperatorio, cirugía, alta).
- **Por qué sirve**: aterriza D21 y D36 (discreto/continuo) y adelanta U4/U5 (entidades, recursos, colas) con un caso real.
- **Límite**: no cubre la clasificación de modelos de la cátedra ni el proceso de 10 pasos.

### 2. `[IDENTIFICADO]` ¿Qué es y qué pretende la modelización mediante dinámica de sistemas?
- **Canal**: scio_esp
- **URL**: https://www.youtube.com/watch?v=1BLpIOqEhbc
- **Qué aporta**: **no es de U1**. Es de dinámica de sistemas (carpeta 12 / U8). Introduce bucles de realimentación, arquetipos de Senge (límite del crecimiento, eroding goals, shifting the burden), con casos de gentrificación. **Guardar para U8.**

### 3. `[IDENTIFICADO]` Ejemplo de simulación de proceso con FlexSim
- **Canal**: Dr. Jonathan Cuevas Ortuño
- **URL**: https://www.youtube.com/watch?v=FGgKyKAdIBE
- **Qué aporta**: **no es de U1**. Es una demostración de modelado de un proceso productivo en FlexSim (7 operaciones, 70/30 bueno/malo, reproceso, paletizado, limitante de 5 tarimas). Útil para **U4/U8** como ejemplo de qué es un modelo discreto armado en software.
- **Nota**: la cátedra usa **Simul8**; FlexSim es otro simulador. Sirve para entender el concepto, no la herramienta.

### 4. `[IDENTIFICADO]` Playlist de Simio — Álvaro García
- **Origen**: citada en la guía docente de la UPM (asignatura de Simulación).
- **Qué aporta**: tutoriales de **Simio**, otro simulador de eventos discretos. Solo para **U8**, y solo si querés ver un simulador distinto.
- **Estado**: no verifiqué el contenido.

---

## Textos complementarios (no video)

### A. `[VERIFICADO por índice]` Introducción a la simulación — Pau Fonseca Casas (UOC)
- **URL**: https://openaccess.uoc.edu/server/api/core/bitstreams/a18111da-a1f0-4d11-b872-2aff35d0d8e3/content
- **Qué aporta**: es el complemento **más alineado** con U1 que encontré. Cubre:
  - definición de simulación (Shannon)
  - **clasificación de los sistemas de simulación** (Montecarlo, continuas, eventos discretos)
  - **periodo de carga vs periodo estacionario** (equivale al transitorio vs estable de Coss Bu)
  - **cuándo aplicar simulación**
  - **fases de un estudio de simulación**
  - **elementos de un modelo de simulación**
  - **estrategias de simulación discreta**: interacción de procesos, **programación de eventos** (event scheduling), exploración de actividades — y la estrategia **de tres fases** de Law & Kelton
  - el concepto de **réplica**
- **Por qué sirve**: cubre huecos que la clase de U1 no toca (estrategias de simulación, réplicas) y que reaparecen en U4.
- **Límite**: la terminología no es la de Bernardo. Usarlo para **complementar**, no para reemplazar.

### B. `[IDENTIFICADO]` Programa de Simulación — UTN FRBA
- **URL**: https://frba.utn.edu.ar/wp-content/uploads/2023/11/Simulacion_23.pdf
- **Qué aporta**: es la misma asignatura en **otra regional de la UTN**, con **los mismos 4 objetivos del DC** (discreta, continua y agentes; métodos estadísticos; verificación y validación; interpretar resultados). Útil para ver **cómo otra cátedra ordena lo mismo**, y trae contenidos mínimos (mecanismos de avance del tiempo, reducción de varianza, etc.).
- **Por qué sirve**: refuerza que los 4 objetivos del DC son institucionales, no una ocurrencia de esta cátedra.

---

## Lo que NO encontré (y no voy a inventar)

- **No hay una serie de videos buena y específica** para la introducción conceptual de U1 en español. La búsqueda devuelve mayormente clases sueltas, programas de materias y material de otras carreras.
- YouTube **bloquea la lectura directa** de resultados de búsqueda, así que no puedo armar una playlist curada y verificada sin que vos abras cada video.
- Aparición de ruido que **descarté**: análisis orientado a objetos, BIM, elementos finitos estructurales, Pumpsim (hidráulica de minas), cardiología computacional. Nada de eso es U1.

**Conclusión honesta**: para U1, el video aporta menos que el texto. Lo que realmente complementa tu resumen es el **documento de la UOC (A)**. Los videos sirven para *ver* la simulación en acción (ULL, FlexSim), no para estudiar los conceptos.
