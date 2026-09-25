# U5 — Modelos dinámicos y colas (TEORÍA)

> **Fuentes** (todas locales, `[DATO]` extraído por OCR/texto):
> - `06_Fenomenos de Espera/Clase 5.pdf` — *Fundamentos de Teoría de Colas — Introducción* (Francisco Roqué, 465 líneas)
> - `07_Teoria de Colas Fundamentos/Clase 6.pdf` — *Modelo M|M|1* (213 líneas)
> - `07_Teoria de Colas Fundamentos/Clase 6 - Parte 2.pdf` — *Modelo M|M|∞*
> - `07_Teoria de Colas Fundamentos/QoS.pdf` — QoS (Roqué, 2022)
> - TPs: `06_.../TP4.pdf` (Clase 5), `07_.../TP5.pdf` (Clase 6)
> - Externo: tutorial MathWorks SimEvents *M/M/1 Queuing System* (ver `90_transversal/fuentes-externas.md`)

---

## 1. Por qué existen las colas

- `[DATO]` La motivación de la clase es **DEMANDA > DISPONIBILIDAD**.
- `[DATO]` Ejemplos usados: compras, teléfonos, peajes, congestión de red.
- `[DATO]` La espera puede ser **económica o físicamente inevitable**.
- `[DATO]` La teoría de colas se presenta como *"un análisis matemático detallado"*.
- `[DATO]` Historia: **Erlang (1909)** aplicó el proceso de Poisson a la telefonía; la ingeniería de teletráfico usa *"procesos estocásticos, teoría de colas y simulación numérica"* (Iversen).
- `[DATO]` Definición: la teoría de colas analiza las líneas de espera; **los tiempos entre arribos y los tiempos de servicio son probabilísticos** (Varela, 1982).

## 2. Proceso de Poisson

- `[DATO]` El número de eventos en un intervalo `t` sigue `P(λ,t)` (Walpole).
- `[DATO]` Consecuencia que usa la cátedra: en un proceso Poisson, **los tiempos entre eventos son exponenciales** (esto es lo que el TP de Simulink implementa).

## 3. Notación de Kendall — ojo, la cátedra usa SEIS campos

`[DATO]` **`A | B | X | Y | Z | V`**

| Campo | Significado |
|---|---|
| **A** | Modelo de interarribos (`M` exponencial / `D` determinístico / `G` general) |
| **B** | Modelo de servicio (mismos códigos) |
| **X** | Cantidad de servidores |
| **Y** | Capacidad del sistema (se **omite** si es infinita) |
| **Z** | Disciplina de cola (`FCFS`/`FIFO`, `LCFS`, `SIRO`, `GD`) |
| **V** | Cantidad de colas / canales |

> **Trampa de examen**: la notación de los libros es de **5 campos**. La cátedra usa **6**. Si respondés con 5, te falta `V`.

`[DATO]` Mapeo a redes de datos: **clientes** = paquetes/segmentos/bits · **servidor** = procesador del switch/router · **cola** = buffer del dispositivo.
`[DATO]` Ejemplos mostrados: `M/M/1`, `M/M/K` (Ethereum, matchmaking de LoL, baños públicos), **redes de colas de Jackson** (arribos a un estadio).
`[DATO]` Ejercicios de detección de error: `G/G/15/9/FCFS/1` es incoherente (capacidad 9 < 15 servidores).

## 4. M|M|1 — derivación por balance

- `[DATO]` **Balance local**: `P_i = (λ/μ)^i · P_0`
- `[DATO]` **Balance global** → `P_0 = 1 − ρ`
- `[DATO]` Por lo tanto: **`P_i = (1 − ρ) · ρ^i`**
- `[DATO]` Intensidad de tráfico: **`ρ = λ/(kμ)`** (k = cantidad de núcleos/servidores), **válido solo si `ρ < 1`**.
- `[DATO]` `E[A] = 1/λ` · `E[S] = 1/μ`

## 5. Medidas de performance (Clase 6)

- `[DATO]` `E[L] = Σ i·P_i = ρ/(1−ρ)`
- `[DATO]` **Ley de Little**: `E[L] = λ · W[S]` (cita: Little & Graves, 2008)
- `[DATO]` `W[S] = E[L]/λ`
- `[DATO]` `W[S] = W[Q] + E[S]` → `W[Q] = W[S] − E[S]`
- `[DATO]` Little también vale por subsistemas: `E[L_q] = λ · W[Q]`
- `[DATO]` Probabilidad de tener al menos K paquetes: `B(K) = ρ^K`
- `[DATO]` La clase cita a **Gross et al. (2018), p.88**: el tiempo de procesamiento sigue una **Erlang tipo n**, `W[S] ~ Erlang(n+1, μ)`.

## 6. M|M|∞ (Clase 6, Parte 2)

- `[DATO]` Con `λ_i = λ` y `μ_i = iμ`, el balance local da `P_i = (λ/μ)^i / i! · P_0`.
- `[DATO]` Usando la serie `Σ ρ^i/i! = e^ρ` → **`P_0 = e^{−ρ}`**
- `[DATO]` Resultado: **`P_i = e^{−ρ} · ρ^i / i!`** — los estados son **Poisson con media `ρ = λ/μ`**.
- `[DATO]` Es válido para cualquier **M|G|∞** (Gross, pp.108-109).
- `[DATO]` Medidas: `E[L] = ρ` · `W[S] = 1/μ` · `W[Q] = 0` · `E[L_q] = 0`

## 7. Calidad de Servicio — QoS (QoS.pdf, Roqué 2022)

`[DATO]` Contenido: **HTB** (Hierarchical Token Bucket) como evolución de CBQ en `tc-qdisc` de Linux · cola interna vs hoja · **CIR/MIR** · control de tráfico **DROP vs DELAY** · flujo de paquetes · algoritmos de procesamiento **FIFO / PFIFO / BFIFO** · **RED** (Random Early Drop) · **SFQ** (Stochastic Fairness Queuing) · **PCQ** (Per Connection Queue).

`[INFERENCIA]` QoS es lo que conecta la cola abstracta con el router real: es la base de las preguntas 3–9 y 17 del TP5.

## 8. Ejemplos numéricos resueltos en clase

| Caso | Datos | Resultado |
|---|---|---|
| Banco, 1 cajero | λ = 0,1/min · μ = 0,125/min | `ρ = 0,8` · `P_0 = 0,2` · `P_3 = 0,1024` |
| Switch | interarribos 0,01 s · se pide `ρ ≤ 0,95` | `W[S] = 0,19 s` |
| Bridge inalámbrico | μ = 6/s · λ = 4/s | `W[Q] = 0,333 s` |
| MikroTik CCR2216 (3789 Kpps) | P(<4 paquetes) = 15 % | `ρ = 0,96` · `λ = 44,17 Gbps` |
| M\|M\|∞ | μ = 5/s · λ = 4/s | `ρ = 0,8` · `P_1 ≈ 0,359` · `W[S] = 0,2 s` · `E[L] = 0,8` |

## 9. Lo que la cátedra NO derivó (trampa)

`[DATO]` **M/M/K (Erlang-C), M/M/1/K y M/G/1 se nombran pero no se derivan.** Aparecen en el título del TP5 y en ejemplos, pero las fórmulas de estado estacionario multi-servidor **no están en las clases**.

`[INFERENCIA]` Si te toca M/M/K, la cátedra espera que sepas *plantear* el modelo (Kendall + balance), no que recites Erlang-C.

## 10. Trabajos prácticos

- `[DATO]` **TP4** (Clase 5): 7 actividades — definir proceso Poisson para llamadas a una central IP, para qué sirve Kendall, dar Kendall de 3 casos de paquetes, encontrar el error en `G/G/10/3/FCFS/1`, comparar fuentes finitas `M/M/3/300` vs `M/M/3/100`, derivar `P_i` de M|M|1 por balance global y local, y el ejemplo del banco con el proceso de nacimiento y muerte.
- `[DATO]` **TP5** (Clase 6): 17 actividades — M|M|∞ (variables, estados, generación de variates), latencia en M|G|∞, por qué se necesita QoS, políticas QoS bajo Kendall, FIFO/PFIFO/BFIFO, HTB, DROP vs DELAY, lógica de RED, SFQ vs PCQ, capacidad de router, clasificación de modelos, óptimo entre 1 procesador vs 3 (justificado luego en **Simulink**), DES vs continuo, estado estacionario, y análisis del algoritmo RED con CDF y simulación en MATLAB.

## 11. Puente con la herramienta (SimEvents)

`[DATO]` El tutorial de MathWorks modela **M/M/1** con `Entity Generator` (arribos Poisson) → `Entity Queue` (FIFO, capacidad `inf`) → `Entity Server` (servicio exponencial) → `Entity Terminator`, con `λ` entre 0,1 y 0,999 y `μ = 1`. Declara como propósito **comparar lo empírico contra lo teórico**.

`[INFERENCIA]` Ese tutorial es el puente U5 ↔ U8: la misma fórmula que derivás a mano (`W[Q]`, `E[L]`) se mide en el bloque Queue como *Average wait*.
