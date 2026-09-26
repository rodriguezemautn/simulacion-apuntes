# U4 — Simulación de sistemas discretos y Simul8 (TEORÍA)

> **Fuentes**:
> - `10_Simulacion de Sistemas Discretos/8-1 Simulación orientada a eventos.pdf` (7 págs., **texto escaso pero legible**)
> - `10_Simulacion de Sistemas Discretos/Simulación de sistemas discretos 2025.pdf` — **68 págs. CASI TODO IMAGEN**: solo las diapositivas 24–28 tienen capa de texto (glosario de Simul8). El resto es inaccesible sin OCR.
> - Los tres `.docx` de ejercicios (legibles)
> - `Ejemplo 12-6-24.S8` (binario de Simul8, 159 KB)
> - `Version Academica 2008.zip` (instalador académico de Simul8, 125 MB)
> - `Bibliografia/DESS-JBanks-4thEd.pdf` — *Discrete-Event System Simulation*, Banks, Carson, Nelson, Nicol
>
> ⚠️ **Advertencia de cobertura**: buena parte del deck de 2025 es **imagen**. Lo que sigue está reconstruido del único deck legible, de los tres ejercicios y de Banks. **No es el 100% de lo que se dictó.**

---

## 1. Los tres primitivos que enseña la cátedra

El deck `8-1 Simulación orientada a eventos.pdf` define **exactamente tres cosas**:

- `[DATO]` **ESTADO** — *"Situación en la que se encuentra alguien o algo… La situación en la que se encuentra el sistema se define según la **medida de rendimiento** que se quiere evaluar."*
- `[DATO]` **VARIABLE DE ESTADO** — *"Variables de un sistema que pueden tomar diferentes valores definiendo su Estado."*
- `[DATO]` **EVENTO** — *"Suceso que ocurrió y que ha sido registrado… un evento sucede **instantáneamente** y puede provocar un cambio en las variables de estado del sistema."*

### Los dos ejemplos que da la clase `[DATO]`

| Sistema | Estado | Dimensión |
|---|---|---|
| Banco con **un** cajero y una fila | `(N, E)` con `N` = personas en la fila y `E` = estado del cajero (ocupado/vacío) | **bidimensional** |
| Tren de pasajeros con **2 trenes** y **4 estaciones** | `(F1, F2, N1, N2, N3, N4)` con `Fi` = estado del i-ésimo tren y `Nj` = personas en la j-ésima estación | **hexadimensional** |

`[DATO]` Ejemplo de evento: *"La llegada de un nuevo cliente a un banco es un evento que cambia la variable de estado `N`."*

`[INFERENCIA]` La idea que transmiten: **la dimensión del vector de estado depende de las variables que decidas observar**, y eso depende de la medida de rendimiento. Es la respuesta conceptual a "¿cómo se modela un sistema discreto?".

---

## 2. ⚠️ Lo que la cátedra NO da (y es grave)

`[DATO]` Contrastado contra el material:

| Tema esperado en U4 | ¿Está? |
|---|---|
| **Orientado a eventos vs orientado a procesos** | ❌ **NO**. Aparece solo en el programa analítico (U8). El deck de 2025 es un tutorial de Simul8 (estilo procesos) pero **nunca nombra ni compara los paradigmas** |
| **Reloj de simulación y mecanismos de avance** | ❌ NO. Solo un rastro indirecto: el ejercicio resuelto fija el fin de corrida con *Results Collection Period* (reloj **fijo**, no avance variable) |
| **FEL (lista de eventos futuros) y algoritmo de event scheduling** | ❌ NO está en la cátedra. Lo aporta **Banks** (ver §5) |
| **Entidades / atributos / recursos** | 🟡 Parcial. Los ejercicios dan el vocabulario operativo (Start Point, Queue, Activity, End, Resources), pero **no hay formalización**. "Atributos" recién aparece como **Labels** en el glosario |
| **Réplicas y estado estacionario** | ❌ NO. Solo hay un caso de warm-up (ver §4.3) |
| **Verificación y validación** | ❌ NO. El programa (U4) las anuncia, ningún deck las desarrolla |

`[INFERENCIA]` **Consecuencia práctica**: de U4 la cátedra evalúa **el modelado en la herramienta**, no la teoría de eventos discretos. La teoría la tenés que traer de Banks.

---

## 3. Simul8 — el modelo completo

### 3.1 Los cinco elementos `[DATO]`
Los nombres que usa **la cátedra**:

| Elemento de la cátedra | Qué hace |
|---|---|
| **Puntos de entrada de trabajo** (*Start Point*) | Definen los **tiempos de llegada**, la forma y los tipos de work item |
| **Puestos de trabajo** (*Activity*) | Donde se **realiza/transforma** el trabajo |
| **Almacenes** (*Queue*) | Espacio de **espera** entre la entrada y una actividad, o entre actividades |
| **Puntos de salida** (*End*) | Punto final que **retiene todas las unidades terminadas** |
| **Recursos** (*Resources*) | Recursos que el sistema puede usar |

### 3.2 Flujo de trabajo en la herramienta `[DATO]`
1. Conectar los objetos con **Edit Routing Arrow**.
2. Definir variables **doble clic** en cada icono, o seleccionando el elemento y escribiendo nombre/distribución arriba a la izquierda.
3. Fijar la duración de la corrida en **Data and Rules → Properties → Results Collection Period**.
4. **Run**.
5. Leer resultados en **Home → Result Manager** (por defecto **solo aparece el punto de salida**; se agregan los demás con **(+)**, y los resultados por objeto con doble clic → *results*).

### 3.3 Glosario del deck 2025 (diapositivas 24–28) `[DATO]`
| Función | Qué hace |
|---|---|
| **Memos** | Notas de documentación sobre cualquier objeto |
| **Batching Arrivals** | Si una llegada ocurre a las 10:30 y la cantidad de ítems está en *Fixed 20*, **llegan 20 ítems a las 10:30** |
| **Routing Out** desde un Work Center/Conveyor | Diálogo de enrutamiento; una conexión simple de una flecha no deja opciones |
| **Labels** | Se adjuntan a cualquier work item; texto o números; sirven para **seleccionar distribuciones, priorizar ítems en cola, controlar imagen/longitud, o agrupar** |
| **Erase** | *"Permite borrar el Punto de Entrada de Trabajo"* |
| **Shelf Life / Minimum Wait Time** | Máx/mín tiempo en un Storage Bin. Para que la **shelf life** funcione hay que enrutar a un Work Center con **ROUTING IN = "EXPIRED ONLY"** |
| **Initial contents in Storage Bins** | Arrancar una corrida con el almacén **no vacío** |
| **High Volume Work Centers** | Procesamiento por lotes con la **Quantity Label**: *"timing panel … FIXED 10 y el Quantity label … en 20 → tarda **200 minutos**"*. También hay batching-out y ruteo por porcentaje |
| **Work Centers – Graphics** | Imágenes por estado / animación |

### 3.4 ⚠️ Trampa de la herramienta `[DATO]`
> **Simul8 pide la MEDIA (μ) de la exponencial, NO λ.**

El ejercicio resuelto lo dice explícitamente y hace la conversión:
```
μ = 1/λ = 1/0,5 = 2 min
```
Si cargás `λ = 0.5` en el campo de la exponencial, **el modelo está mal y no te das cuenta**.

### 3.5 Distribuciones que usa la materia `[DATO]`
**Normal, Exponencial, Log-normal, Gamma, Uniforme y Triangular.**

---

## 4. Los tres ejercicios

### 4.1 Resuelto — fábrica de prendas (12-6-24) `[DATO]`

**Enunciado**: fábrica de prendas con **tres empleados**, cada uno en una máquina, que pulen y empaquetan piezas. Proceso continuo; **el operario que se libera toma la pieza siguiente**.

**Estructura esperada**: `Start Point → UN almacén (cola única) → TRES actividades en paralelo (una por operario) → End`.
*"El modelo inicial cuenta con un punto de entrada… después de este se ubica un almacén, donde se formará la cola de espera hasta que se desocupe un operario (máquina). Finalmente… un punto de salida."*

**Parámetros**:
| Etapa | Distribución |
|---|---|
| Arribos | **Normal, media 1 min, σ = 0.3** |
| Servicio 1 | **Exponencial λ = 0.5** → **μ = 2 min** |
| Servicio 2 | **Log-normal, media 2, σ = 0.4** |
| Servicio 3 | **Gamma, α = 1, β = 2** |

**Corrida**: **1000 minutos**, una sola corrida.

**Solución (literal de la cátedra)**:
| Métrica | Valor |
|---|---|
| Tamaño promedio de la cola | **0.28** |
| Tiempo promedio de la cola (con cero) | **0.26 min** |
| Tiempo promedio de la cola (sin cero) | **1.07 min** |
| Eficiencia máquina 1 | **64.88 %** |
| Eficiencia máquina 2 | **69.55 %** |
| Eficiencia máquina 3 | **65.83 %** |
| Tamaño máximo de la cola | **5** |
| Máximo tiempo de servicio | **23.91 min** |

`[INFERENCIA]` Las tres distribuciones de servicio tienen **la misma media (2 min)** pero **distinta dispersión**: exponencial = Gamma(1,2), log-normal(2, 0.4), Gamma(1,2). Es una comparación deliberada de **"igual media, distinta variabilidad"**.

### 4.2 A resolver — pulido y empaque (19-6-24) `[DATO]`

**Enunciado**: fábrica con **tres pulidores en paralelo** cuya salida es empaquetada por **cuatro empaquetadores en paralelo**. Proceso continuo; el operario libre toma la pieza siguiente.

**Estructura**: `Start → Cola 1 → Actividad "pulir" (3 servidores) → Cola 2 → Actividad "empaque" (4 servidores) → End`

**Parámetros**: arribos Normal(1, 0.3) · pulidor 1 Exp λ=0.5 · pulidor 2 Log-normal(2, 0.4) · pulidor 3 Gamma(α=1, β=2) · **empaque Uniforme(0.5, 0.8)**

**Corrida**: **1000 minutos**.
**Entregable**: tamaño promedio de cola, tiempo promedio en cola (con y sin ceros), **tamaños máximos de ambas colas**, **% de ocupación de los empleados**, cantidad media de piezas empaquetadas, tiempo promedio de las piezas en el sistema, y **tiempo máximo total en el sistema**.
**⚠️ No trae respuestas.**

### 4.3 Ejercicio 01 — línea de producción `[DATO]`

**Enunciado**: sistema productivo de **dos líneas**. Materias primas **A** y **B**. **Buffers 1 a 6** son colas FIFO de **capacidad 50 cada una**. **Estaciones 1 a 5** son máquinas herramienta; **la estación 5 hace el ensamble final** (recibe de ambas líneas).

**Estructura**: Línea A: `A → Buffer 1 → Estación 1 → (demora) → Buffer 2 → Estación 2 → (demora) → Buffer 5 → Estación 5`. Línea B: `B → Buffer 3 → Estación 3 → (demora) → Buffer 4 → Estación 4 → (demora) → Buffer 6 → Estación 5`. **No hay punto de salida dibujado.**

**Parámetros**: A arribos **Exponencial media 2 min** · B arribos **Normal media 2, σ = 1** · Máquina 1 **Exp media 1.8** · Máquina 2 **exponencial desplazada** (localización fija ≥ 1 min + 1 min adicional de media) · Máquina 3 **Uniforme(1.5, 2.0)** · Máquina 4 **media 1.8 min** (sin distribución especificada) · Máquina 5 **Triangular(1.0, 1.5, 2.0)**.

**Corrida**: **2100 horas**, con **100 horas de estabilización (warm-up)** antes de recolectar.
*"Simule 2100 horas de trabajo (100 horas son necesarias para estabilizar el sistema) y comience a recolectar información después de cien (100) horas."*

**Entregable**: cantidad de A y B que llegaron · productos terminados que salen de la Máquina 5 · **utilización por máquina** · comportamiento global del sistema · estadísticas por buffer intermedio · **identificar cuellos de botella por línea y proponer soluciones**.

---

## 5. Banks — la metodología que la cátedra no da `[DATO]`

`[DATO]` La cátedra **no enumera pasos de modelado**. Banks sí:

### 5.1 Los 12 pasos de un estudio de simulación (Banks §1.11, Fig. 1.3)
1. Formulación del problema
2. Objetivos y plan general del proyecto
3. Conceptualización del modelo
4. Recolección de datos
5. Traslación del modelo
6. ¿Verificado?
7. ¿Validado?
8. Diseño experimental
9. Corridas de producción y análisis
10. ¿Más corridas?
11. Documentación y reportes
12. Implementación

### 5.2 El algoritmo de avance del tiempo (Banks §3.1.1, Fig. 3.2)
Guiado por la **FEL (lista de eventos futuros)**, 5 pasos:
1. Sacar de la FEL el aviso del **evento inminente**.
2. Avanzar el **CLOCK** al tiempo de ese evento.
3. **Ejecutar** el evento (actualizar estado, atributos de entidades, pertenencia a conjuntos).
4. **Generar eventos futuros** y ordenar sus avisos en la FEL.
5. Actualizar **estadísticas acumuladas y contadores**.

### 5.3 Las tres visiones del mundo (Banks §3.1.2)
- **Event scheduling** (programación de eventos) → avance **variable** del tiempo.
- **Process interaction** (interacción de procesos) → avance **variable**.
- **Activity scanning** (exploración de actividades) → avance **fijo**, con la variante de **tres fases** (actividades B = obligatorias, C = condicionales).

`[DATO]` Banks afirma que **todos los paquetes comerciales —incluido SIMUL8— adoptan la visión de process interaction**. *"All the packages described here take the process-interaction worldview."*

### 5.4 Condición de parada `[DATO]`
*"Every simulation must have a stopping event"*: o se programa un evento de parada en un tiempo futuro `T_E`, o `T_E` lo determina la propia simulación.

`[INFERENCIA]` Bancos da **la teoría**; Simul8 da **la herramienta**. U4 se rinde con la herramienta, pero si el oral se abre, Banks es la respuesta.

---

## 6. Notas para el examen

### Fórmulas y parámetros que hay que tener
```
E[X] = μ = 1/λ              (exponencial — Simul8 pide μ, NO λ)
Gamma(α, β) → media = α·β   (α=1, β=2 ⇒ 2)
```
**Vocabulario de métricas** (así las pide la cátedra): tamaño promedio de la cola · tiempo promedio en cola **con y sin ceros** · eficiencia/ocupación · tamaño máximo de cola · máximo tiempo de servicio / tiempo total en el sistema.

**Valores del ejercicio resuelto** (para chequear si tu modelo está bien): cola 0.28 · 0.26 min / 1.07 min · eficiencias 64.88 / 69.55 / 65.83 % · cola máx. 5 · servicio máx. 23.91 min.

**Defaults del Ejercicio 01**: capacidad de buffer **50**, FIFO, corrida **2100 h**, warm-up **100 h**.

### Errores y rarezas del material
1. **Ejercicio 01 — conteo de estaciones**: el texto dice *"Station 1 a Station 6 son máquinas herramienta"*, pero solo se definen **cinco** máquinas (1–5) y el diagrama muestra **Estación 1–5** con la **5 compartida** para el ensamble. Los buffers sí son 1–6.
2. **Notación de demora no estándar**: *"ejemplo **/.2**, representa una demora de **2 minutos**"*. Se lee como el decimal **0.2**, pero significa **N minutos**.
3. **Unidad rara en el Ejercicio 01**: la corrida se pide en **"2100 horas"**, pero todos los tiempos del proceso están en **minutos** — probable desliz de unidad.
4. **Máquina 4 sin distribución**: solo dice "tiempo promedio de 1.8 minutos".
5. **El deck titulado "orientada a eventos" no enseña event scheduling**: solo estado, variable de estado y evento.
6. **El deck 2025 es casi todo imagen**: no se puede citar por texto.
7. **El ZIP académico no es de la UTN**: `S8INST.INI` registra a **"Andres Caminos / Universidad UADE / SERIAL=1565-4208-3298"**.

### Anunciado en el programa pero NO desarrollado
Modelado de **inventarios** · *"Planteo táctico y estratégico"* · **diseño de la experiencia** · análisis de resultados · *"Traslación del modelo a la computadora"* · **validación e implementación** · **orientados a eventos vs a procesos** y clasificación del software (U8) · **réplicas y estado estacionario** (solo el caso 2100 h / 100 h) · **metodología VIMS** (nombrada en RA04, **nunca definida**).

---

## 7. Nota de encuadre

`[INFERENCIA]` De las 8 unidades documentadas hasta ahora, **U4 es la peor cubierta por su propio material**: un deck casi todo imagen, otro deck que promete "orientada a eventos" y no lo desarrolla, y tres ejercicios como única fuente real de contenido. **La teoría de U4 hay que traerla de Banks.** Es el hueco más grande que encontré después de U6.
