# U8 — Bibliografía cruzada

> U8 tiene una particularidad: **la bibliografía del bloque de dinámica de sistemas SÍ está** (son los documentos del MIT), pero **la del bloque de software NO existe**.

---

## 1. La bibliografía del programa: una parte sí, otra no

`[DATO]` El programa cita para U8:
- **Shannon (1988)**
- **Law & Kelton (2014)**

`[DATO]` **Shannon está en el directorio pero es un escaneo sin capa de texto** (ver `90_transversal/bibliografia.md`). **Law & Kelton no está.**

`[INFERENCIA]` Es decir: **las dos fuentes que el programa cita para U8 son inutilizables.** Y justamente cubren el bloque que el material tampoco desarrolla.

---

## 2. Lo que SÍ tiene respaldo: la dinámica de sistemas

`[DATO]` Acá la situación se invierte. Los documentos de la carpeta **no son apuntes de cátedra: son material del MIT**, y son la fuente real:

| Documento | Origen |
|---|---|
| `Introducción a los sistemas con realimentación.pdf` | **MIT D-4691** — *An Introduction to Feedback* (© 1997 MIT) |
| `Ejercicios Iniciales de Creación de Modelos.pdf` | **MIT D-4347-5** — *System Dynamics in Education Project*, Sloan School of Management. **Michael Shayne Gary** con William A. Glass, 8/3/1993. Traducción de ITESM Monterrey, revisión de **Juan Martín García** (junio 2000) |

`[DATO]` **Las respuestas del cuadernillo de ejercicios están en otro documento del MIT: D-4356**, *"Respuestas a los Ejercicios Iniciales de Creación de Modelos"* (Gary, 1993) — **que NO está en el directorio**.

`[DATO]` El deck de dinámica de sistemas (Prof. **H. Zamorano**) cita como referencia externa el **MIT Road Maps** (`web.mit.edu/sysdyn/road-maps/toc.html`).

`[INFERENCIA]` Detalle interesante: **la bibliografía propia de U8 es material del MIT**, no los textos que el programa declara. Eso explica por qué el enfoque (niveles, flujos, `INTEG`) es el clásico de Forrester y no el de un manual genérico.

---

## 3. El bloque de software: sin fuente, ni propia ni bibliográfica

`[DATO]` El programa promete para U8: *"Comparación de Lenguajes de Simulación con lenguajes de Propósitos Generales. Clasificación del Software de Simulación. Lenguajes orientados a eventos y a procesos."*

**Ni el material de cátedra lo desarrolla, ni la bibliografía del programa está disponible.**

`[DATO]` Lo único que hay es:
- una **lista pelada** de paquetes de dinámica de sistemas (*"Powersim, Vensim, Stella, Ithink, etc."*) en el deck de Zamorano;
- las notas de **STELLA** en los dos documentos del MIT.

---

## 4. Dónde sí está la respuesta (fuera de U8)

`[INFERENCIA]` Si te toman **"lenguajes orientados a eventos vs a procesos"** o **"clasificación del software de simulación"**, la respuesta **no está en U8**. Está en **U4**:

`[DATO]` **Banks §3.1.2** da las **tres visiones del mundo**:
- **Event scheduling** (programación de eventos) → avance **variable** del tiempo
- **Process interaction** (interacción de procesos) → avance **variable**
- **Activity scanning** (exploración de actividades) → avance **fijo**, con la variante de **tres fases**

`[DATO]` Y Banks afirma algo que **cierra el punto**: *"All the packages described here take the **process-interaction worldview**"*, e incluye a **SIMUL8** entre ellos.

`[INFERENCIA]` O sea: la clasificación que U8 promete se puede responder **con Banks y con lo que ya sabés de Simul8**. Pero es un préstamo de U4, no contenido de U8.

---

## 5. Veredicto

| Bloque de U8 | Fuente real | ¿Usable? |
|---|---|---|
| **Pensamiento sistémico** | Deck 13 + **MIT D-4691** | ✅ Sí |
| **Dinámica de sistemas** (niveles, flujos, bucles) | Deck 14 (Zamorano) + material MIT | ✅ Sí |
| **Ejercicios de modelado** | **MIT D-4347-5** | ✅ Sí (pero **sin respuestas**: están en D-4356, ausente) |
| **Clasificación de software / eventos vs procesos** | ❌ **Nada** | ❌ No. Se resuelve con **Banks (U4)** |

**Para el bloque de dinámica de sistemas, la fuente principal es el MIT, no la cátedra.** Para el bloque de software, **no hay fuente** — y eso hay que saberlo antes de entrar al examen, no durante.
