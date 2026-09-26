# U5 — Autoevaluación

> **Formato real**: teoría a desarrollar, 5 puntos sorteados. U5 tiene derivación **y** cálculo.
> Condiciones: **sin mirar**, a mano, y después **defendé cada respuesta en voz alta**.
> Tiempo sugerido: 60 minutos.

---

## Punto 1 — Fenómenos de espera

¿Por qué existen las colas? Dé la **motivación** que usa la cátedra y **tres ejemplos**.
¿Qué es la **teoría de colas** y qué relación tiene con la **historia de la telefonía**?
Explique el **proceso de Poisson** y qué propiedad tiene sobre los tiempos entre eventos.

---

## Punto 2 — Notación de Kendall

Escriba la **notación de Kendall** tal como la usa la cátedra: **todos los campos** y qué significa cada uno.
Indique **por qué la versión de la cátedra tiene un campo más** que la de los libros.
Dé la notación para: un servidor con arribos exponenciales, servicio exponencial, capacidad infinita, FIFO.
Y explique **cuál es el error** en `G/G/10/3/FCFS/1`.

---

## Punto 3 — Modelo M|M|1

**Demuestre** las probabilidades de estado del M|M|1 usando **balance local y balance global**.
Indique el valor de **ρ** y la **condición de estabilidad**.
¿Qué significan `E[A]` y `E[S]`?

---

## Punto 4 — Medidas de performance

Escriba las fórmulas de: `E[L]`, la **Ley de Little**, `W[S]`, `W[Q]`, `E[L_q]` y `B(K)`.
Luego resuelva:

> **Banco con un solo cajero.** Los clientes llegan a razón de **1 cada 10 minutos** (exponencial) y el tiempo de servicio es exponencial con media de **8 minutos**.
> Calcule: `λ`, `μ`, `ρ`, `P_0`, `P_3`, `E[L]`, `W[S]`, `W[Q]`.

---

## Punto 5 — M|M|∞ y Calidad de Servicio

**Demuestre** las probabilidades de estado del modelo **M|M|∞** y diga qué distribución siguen.
Indique sus medidas de performance y **para qué tipo de modelos vale**.
Después, sobre **QoS**: ¿por qué se necesita? Nombre al menos **cuatro mecanismos** que la cátedra enseña y explique **DROP vs DELAY**.

---

## Punto extra (preparalo igual)

¿Qué modelos **nombra pero NO deriva** la cátedra? ¿Por qué es importante saberlo?

---
---

> ## ⚠️ CORTÁ ACÁ
> Lo que sigue son **los criterios de corrección**. No los leas hasta haber escrito tus 5 respuestas completas.

---

## Criterios de corrección

### Punto 1 — Fenómenos de espera
- **Motivación**: **DEMANDA > DISPONIBILIDAD**. Ejemplos de la clase: compras, teléfonos, peajes, congestión de red.
- La espera puede ser **económica o físicamente inevitable**.
- La teoría de colas se presenta como *"un análisis matemático detallado"*.
- **Historia**: **Erlang (1909)** aplicó el proceso de Poisson a la telefonía; el teletráfico usa *"procesos estocásticos, teoría de colas y simulación numérica"* (**Iversen**).
- **Definición**: analiza las líneas de espera; **los tiempos entre arribos y de servicio son probabilísticos** (**Varela, 1982**).
- **Proceso de Poisson**: el número de eventos en `t` sigue `P(λ,t)` (**Walpole**). Propiedad clave: **los tiempos entre eventos son exponenciales**.

### Punto 2 — Notación de Kendall (6 campos) ⚠️

```
A | B | X | Y | Z | V
```
| Campo | Significado |
|---|---|
| **A** | Modelo de **interarribos** (`M` exponencial / `D` determinístico / `G` general) |
| **B** | Modelo de **servicio** (mismos códigos) |
| **X** | Cantidad de **servidores** |
| **Y** | **Capacidad** del sistema (se **omite** si es infinita) |
| **Z** | **Disciplina** de la cola (`FCFS`/`FIFO`, `LCFS`, `SIRO`, `GD`) |
| **V** | Cantidad de **colas / canales** |

- **La cátedra agrega `V`** (nº de colas/canales). Los libros usan **5 campos**.
- Pedido: **`M/M/1/FCFS`** (capacidad infinita → `Y` se omite).
- **Error en `G/G/10/3/FCFS/1`**: la **capacidad (3) es menor que la cantidad de servidores (10)**. Es incoherente: no puede haber menos lugares en el sistema que servidores.

### Punto 3 — Modelo M|M|1
- **Balance local**: `P_i = (λ/μ)^i · P_0`
- **Balance global**: `Σ P_i = 1` → **`P_0 = 1 − ρ`**
- **Resultado**: **`P_i = (1 − ρ)·ρ^i`**
- **`ρ = λ/(k·μ)`**, con `k` = núcleos/servidores. **Condición: `ρ < 1`** (si no, el sistema es inestable y la cola crece indefinidamente).
- `E[A] = 1/λ` (tiempo medio entre arribos) · `E[S] = 1/μ` (tiempo medio de servicio).

### Punto 4 — Medidas de performance + ejercicio

**Fórmulas**:
```
E[L] = Σ i·P_i = ρ/(1−ρ)
Ley de Little:  E[L] = λ·W[S]
W[S] = E[L]/λ
W[S] = W[Q] + E[S]   →   W[Q] = W[S] − E[S]
Little por subsistemas:  E[L_q] = λ·W[Q]
B(K) = ρ^K      (probabilidad de al menos K paquetes)
```

**Ejercicio del banco**:

| Paso | Cálculo | Resultado |
|---|---|---|
| λ | 1 cada 10 min | **λ = 0.1 /min** |
| μ | media 8 min | **μ = 0.125 /min** |
| ρ | `0.1/0.125` | **ρ = 0.8** |
| `P_0` | `1 − ρ` | **0.2** |
| `P_3` | `(1−0.8)·0.8³ = 0.2 · 0.512` | **P_3 = 0.1024** |
| `E[L]` | `ρ/(1−ρ) = 0.8/0.2` | **4 clientes** |
| `W[S]` | `E[L]/λ = 4/0.1` | **40 min** |
| `W[Q]` | `40 − 8` | **32 min** |

*Verificación cruzada*: `W[Q] = E[L_q]/λ` con `E[L_q] = ρ²/(1−ρ) = 3.2` → `3.2/0.1 = 32 min`. ✓

### Punto 5 — M|M|∞ y QoS

**M|M|∞**:
- Con `λ_i = λ` y `μ_i = i·μ`, el balance local da `P_i = (λ/μ)^i / i! · P_0`
- Usando `Σ ρ^i/i! = e^ρ` → **`P_0 = e^(−ρ)`**
- **`P_i = e^(−ρ)·ρ^i / i!`** → los estados siguen una **distribución de Poisson** con media `ρ = λ/μ`
- **Vale para cualquier M|G|∞** (Gross et al., pp.108-109)
- Medidas: **`E[L] = ρ`** · **`W[S] = 1/μ`** · **`W[Q] = 0`** · **`E[L_q] = 0`**

**QoS**: se necesita porque la **demanda supera la disponibilidad** y el router debe decidir a quién atiende y a quién descarta. Mecanismos de la cátedra: **HTB** (evolución de CBQ en `tc-qdisc` de Linux) · cola **interna vs hoja** · **CIR/MIR** · **FIFO / PFIFO / BFIFO** · **RED** · **SFQ** · **PCQ**.
**DROP vs DELAY**: son las dos políticas frente a la congestión — **descartar** paquetes o **retardarlos** (encolarlos).

### Punto extra — Lo que la cátedra nombra pero NO deriva
**M/M/K (Erlang-C), M/M/1/K y M/G/1.** Aparecen en el título del TP5 y en ejemplos, pero **las fórmulas de estado estacionario multi-servidor no están en las clases**.
**Por qué importa**: si te toca M/M/K, la cátedra espera que sepas **plantear el modelo** (Kendall + balance), **no** que recites Erlang-C. Y si citás una fórmula que no está en el programa como si lo estuviera, quedás expuesto a que te repregunten de dónde la sacaste.
