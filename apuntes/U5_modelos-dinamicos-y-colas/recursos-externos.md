# U5 — Recursos externos

> Complementos al material de cátedra. `[VERIFICADO]` = se leyó el contenido · `[IDENTIFICADO]` = solo título/URL.

---

## ⚠️ Tres cosas antes de mirar nada

1. **La cátedra usa notación de Kendall de 6 campos** (`A|B|X|Y|Z|V`), con `V` = cantidad de colas/canales. **Casi todos los libros usan 5.** Si un video te muestra 5 campos, no está mal: está incompleto respecto de tu materia.
2. **La cátedra NO deriva M/M/K (Erlang-C), M/M/1/K ni M/G/1.** Los nombra. **Buena parte de los videos sí los resuelven** — sirven para entender, pero no son contenido del programa.
3. **La cátedra deriva M/M/1 Y M/M/∞.** Ningún video que encontré hace M/M/∞ con la misma deducción. Para eso, el apunte manda.

---

## Videos

### 1. `[VERIFICADO]` Queuing Theory Tutorial — Kendall Notation, M/M/1
- **Canal**: Bikey Bonn Kleiford Seranilla
- **URL**: https://www.youtube.com/watch?v=SqSUJ0UYWMQ
- **Idioma**: inglés
- **Qué aporta**: es **la mejor pieza audiovisual** que encontré para esta unidad. Cubre:
  - **características de una cola**: cola vs sistema, tamaño finito/infinito, disciplinas (FCFS, LCFS, SIRO, prioridad),
  - **la notación de Kendall con SEIS campos** — igual que la cátedra: `A` (interarribos), `B` (servicio), `C` (canales), `D` (disciplina), `E` (máximo en el sistema), `F` (población fuente),
  - **simbología**: `λ`, `μ`, `ρ`, `n`, `Pₙ`, `W[S]`, `W[Q]`, `L[S]`, `L[Q]`,
  - **un M/M/1 resuelto completo** (estación de servicio: λ = 10/h, μ = 6/h → `ρ = 0.6`, `W[S] = 0.25 h = 15 min`, `W[Q]`, `L[S]`, `L[Q]`).
- **Ojo, aporte extra**: cubre **jockeying, balking y reneging** (cambiar de fila, no entrar a la fila, irse antes de ser atendido). **Eso NO está en el material de la cátedra** — es vocabulario de colas que te puede servir si el oral se abre.
- **Límite**: no cubre M/M/∞ ni QoS.

### 2. `[VERIFICADO]` Teoría de colas — Notación de Kendall, Little, M/M/1, teoría de costos (playlist)
- **URL**: https://www.youtube.com/playlist?list=PLEcTPrBsZaGAbDTxenpWtLfN9t0lYexJR
- **Qué aporta**: una **serie completa en español** cuyo temario es casi calcado al de la cátedra: *"Notación de Kendall · Ecuaciones de flujo · Little · M/M/1 un canal, fórmulas · Teoría de costos · Ejercicios resueltos"*.
- **Por qué sirve**: es lo más parecido a un curso completo de U5 en video. Y **"teoría de costos"** es justo lo que aparece en las aplicaciones de la cátedra (los camiones del supermercado, U3).
- **IPC study/estado**: no verifiqué video por video; la verificación es sobre el temario declarado de la lista.

### 3. `[VERIFICADO]` Teoría de colas — ejercicio M/M/1 resuelto (nivel básico)
- **Canal**: INGE-TIPS AKADEMY
- **URL**: https://www.youtube.com/watch?v=eAXxzY5TUCg
- **Idioma**: español
- **Qué aporta**: resuelve un **M/M/1 paso a paso** desde cero (mostrador de facturación de una aerolínea: λ = 45 clientes/h, μ = 60 clientes/h → `W[Q] = 3 min`, `W[S] = 4 min`, `L[Q] = 2.25`, `L[S] = 3`). Insiste en la interpretación física de cada medida y explica por qué la cola es la limitante del sistema.
- **Por qué sirve**: el nivel y el tono son exactamente los de la cátedra. Ideal para ver **cómo se escribe una resolución** en el final.
- **Límite**: no cubre Kendall de forma sistemática ni M/M/∞.

### 4. `[VERIFICADO]` TEORÍA DE COLAS | M/M/1, M/M/m, M/D/1, M/M/s — Capítulo 13
- **Canal**: Académicos PRO (profe DIEGO)
- **URL**: https://www.youtube.com/watch?v=iAbViQVZkP8
- **Idioma**: español
- **Qué aporta**: resuelve ejercicios tipo investigación operativa **con costos** (un silo de trigo: λ = 30 camiones/h, μ = 35 camiones/h, costo de espera 18 USD/h, 16 h/día → `L = 6`, `W[S] = 0.2 h = 12 min`, `ρ = 85.71 %`).
- **⚠️ Ojo**: también desarrolla **M/M/m, M/D/1 y M/M/s**, que **la cátedra no deriva**. Sirve como cultura, no como contenido.
- **Por qué sirve**: es el formato de **ejercicio con costos**, que en tu material aparece en el bloque de Montecarlo (camiones del supermercado).

---

## Textos académicos

### A. `[VERIFICADO]` Notación Kendall-Lee — Libro Modelos Probabilísticos (IIND 2104)
- **URL**: https://modelos-inst.github.io/LibroModProb/content/lecturas_semanales/archivos/chapter12.html
- **Qué aporta**: es **la mejor referencia escrita en español** para esta unidad, y el único texto que encontré que **también usa 6 posiciones** de Kendall — igual que tu cátedra. Desarrolla M/M/1 **completo y formal**:
  - cadena de nacimiento y muerte, `c_j = (λ/μ)^j`,
  - convergencia de la serie ⇔ `ρ < 1`,
  - `π₀ = 1 − ρ`, `π_j = (1−ρ)ρ^j`,
  - utilización `= ρ`,
  - `L = ρ/(1−ρ)`, `L_s = ρ`, `L_q = ρ²/(1−ρ)`,
  - `W = 1/(μ−λ)`, `W_q = λ/[μ(μ−λ)]`,
  - **y valida `L_s = λ·W_s = ρ` aplicando Little al subsistema del servidor**.
- **Por qué sirve**: es **exactamente la derivación de la clase 6**, pero con el rigor que el deck no muestra. Si en el oral te piden "demuestre", acá está.
- **Ojo**: usa `π` para las probabilidades de estado, la cátedra usa `P_i`. Cambia la notación, no el contenido.

### B. `[VERIFICADO]` Teoría de colas: modelo M/M/1 — Portal Estadística Aplicada
- **URL**: https://estadistica.net/INSTRUMENTOS/Leccion-R1.pdf
- **Qué aporta**: PDF en español con la notación `A/S/c/K/N/D`, el formulario completo de M/M/1, **la teoría de costos** (`c_q`, `c_s`, costo de clientes, costo de capacidad) y **dos ejercicios resueltos** (facturación de aerolínea; lavado de coches: λ = 12/h, μ = 15/h → `ρ = 0.8`, `P(L>2) = 0.512`).
- **Por qué sirve**: tiene lo que a la cátedra le falta —**costos**— y ejercicios con respuesta.

### C. `[VERIFICADO]` Simulador de colas — M/M/1 y M/M/1/K
- **URL**: https://simuladorq.readthedocs.io/Modelos/
- **Qué aporta**: desarrollo de M/M/1 **más M/M/1/K** (capacidad limitada). Explica con detalle **el tiempo de espera en cola** (`n` servicios delante, con la **propiedad de pérdida de memoria** de la exponencial) y las **fórmulas de Little** con interpretación intuitiva.
- **Por qué sirve**: el **M/M/1/K** es uno de los modelos que la cátedra **nombra pero no deriva**. Si te lo repreguntan, acá está.

### D. `[DATO]` Bibliografía que la cátedra cita (ya en tu carpeta `Bibliografia/`)
- **`Fundamentals_of_queueing_theory.pdf`** — base teórica de colas.
- **`kendall.pdf`** — el paper de Kendall. **⚠️ Es un escaneo sin capa de texto**: no se puede leer ni buscar sin OCR.
- **`Erlang1909.pdf`** — el paper original de Erlang. **⚠️ También escaneo sin texto.**
- **`Iversen.pdf`** — teletráfico, el que la clase cita para la historia.
- **`Queueing Delays.pdf`**, **`Queueing-DNS-AMP.pdf`** — aplicaciones a redes.
- **`07_Teoria de Colas Fundamentos/QoS.pdf`** — el deck propio de la cátedra (Roqué).

---

## Lo que descarté

- **Videos que solo desarrollan M/M/m, M/D/1 o M/M/s**: correcto, pero **fuera del programa**. Los marqué como cultura, no como estudio.
- **Material de Python/SimPy**: otro enfoque de simulación de colas (por simulación, no analítico). No es lo que evalúa U5.
- **Notación de 5 campos sin aclararlo**: no es un error, pero incompleto respecto de la cátedra.

---

## Conclusión honesta

Para U5 hay **buen material y bien alineado**:

1. **Para arrancar**: el tutorial de **Kendall + M/M/1 (1)** — es el único que usa **6 campos** como tu cátedra y resuelve un M/M/1 completo.
2. **Para el formato de examen**: **INGE-TIPS (3)** y **Académicos PRO (4)** — ejercicios resueltos en español, con el nivel y el tono de la cátedra.
3. **Para el rigor y la demostración**: **el libro de modelos probabilísticos (A)** — es la clase 6, pero bien demostrada.
4. **Para la brecha de COSTOS**: **Portal Estadística Aplicada (B)**.
5. **Para el M/M/1/K** que la cátedra no deriva: **Simulador de colas (C)**.

**Lo que ningún recurso cubre**: la deducción de **M/M/∞** tal como la da la clase 6 parte 2. Para eso, el `formulario.md` y `teoria.md` de esta unidad son la única fuente.
