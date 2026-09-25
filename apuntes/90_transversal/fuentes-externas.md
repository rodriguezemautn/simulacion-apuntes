# Fuentes externas — material compartido

Registro de material que Emanuel comparte y que **no** está en el corpus local.
Cuando una fuente aporta contenido, se vuelca a la unidad correspondiente y se cita desde acá.

---

## 1. Video — "Trabajo Práctico de Simulación - Teoría de colas - Simulink"

- **URL**: https://www.youtube.com/watch?v=4OExuao4i9w
- **Qué es**: `[DATO]` solo el título (no se pudo extraer contenido de video).
- **Unidades**: U5 (teoría de colas) · U8 (software de simulación — Simulink).
- **Estado**: `[VERIFICAR]` pendiente que Emanuel describa qué modela el TP: sistema, parámetros, resultados.
- **Por qué importa**: conecta colas con Simulink, y el final del 24/04 preguntó por "constructores de Simulink".

---

## 2. MathWorks — SimEvents: *M/M/1 Queuing System* (tutorial)

- **URL**: https://la.mathworks.com/help/simevents/ug/m-m-1-queuing-system.html
- **Acceso**: `[DATO]` **403 Forbidden** al descargar. Contenido recuperado por búsqueda indexada.
- **Unidades**: U5 · U8.

### Qué modela

`[DATO]` Sistema de **una cola y un servidor**, con una fuente de tráfico y **capacidad de almacenamiento infinita**.
M/M/1 = **M**arkoviano: arribos **Poisson**, servicio **exponencial**, **1** servidor.
Propósito declarado: comparar los resultados **empíricos** de la simulación contra los resultados **teóricos** exactos de la teoría de colas.

### Bloques del modelo

| Bloque | Rol |
|---|---|
| **Entity Generator** | Modela el proceso de arribos Poisson generando entidades ("clientes") |
| **Simulink Function `exponentialArrivalTime()`** | Devuelve los tiempos **entre** arribos; en un proceso Poisson son **exponenciales** |
| **Entity Queue** | Almacena entidades sin servir, política **FIFO**, capacidad **inf** |
| **Entity Server** | Servidor con tiempo de servicio **exponencial** |
| **Entity Terminator** | Destruye las entidades servidas |

### Parámetros

- `[DATO]` Tasa de arribo `λ`: se elige con un bloque **Knob**; debe estar entre **0.1 y 0.999**; por defecto **0.5**.
- `[DATO]` Tasa de servicio `μ = 1` → **tiempo medio de servicio = 1**.
- `[DATO]` Subsystem `Exponential Distribution` agrupa los bloques Math Function + Sum que calculan los tiempos entre generaciones.
- `[DATO]` `Entity Generator`: Generation Method = *Time-based*, Time Source = *MATLAB action*, y la variable `dt` (intergeneration time) se define en la acción.
- `[DATO]` `Entity Server`: el tiempo de servicio se define con la variable `dt` en la *Service time action*.
- `[VERIFICAR]` la **expresión exacta** del tiempo de servicio (la búsqueda la devolvió incompleta).

### Estadísticas que reporta

`[DATO]` El bloque Queue expone en su pestaña **Statistics** el estadístico **Average wait, `w`**.
`[INFERENCIA]` Es el gancho natural para comparar contra `W[Q]` de la fórmula teórica M/M/1.

### Ciclo del modelo (comportamiento)

`[DATO]` El Entity Generator genera una entidad en el tiempo de inicio; al salir, toma `dt` y programa la siguiente. Las entidades esperan en la cola hasta que el servidor se libera; al terminar el servicio pasan al Entity Terminator; la siguiente entidad que cumple FIFO ocupa el servidor. El ciclo se repite hasta el `stop time`.

---

## 3. MathWorks — *Discrete-Event Simulation* (solutions)

- **URL**: https://la.mathworks.com/solutions/discrete-event-simulation.html
- **Qué es**: `[VERIFICAR]` por la ruta `/solutions/` parece una **página comercial** de producto, no documentación técnica. Valor de estudio probablemente bajo.
- **Estado**: pendiente de clasificar. No se descargó (403 esperado).

---

## Nota de método

Filtrar antes de sumar: una fuente entra a los apuntes **solo si aporta contenido evaluable** (definición, fórmula, procedimiento, ejemplo numérico). Las páginas de producto no se transcriben.
