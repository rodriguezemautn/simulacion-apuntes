# U8 — Dinámica de sistemas y software de simulación (TEORÍA)

> **Fuentes**:
> - `12_Simulacion de Sisremas Dinamicos/13-Introducción al pensamiento sistémico.pdf` (19 págs.)
> - `12_.../14-Introducción a la Dinámica de Sistemas 2024.pdf` (26 págs., **Prof. H. Zamorano**)
> - `12_.../Ejercicios Iniciales de Creación de Modelos.pdf` — **MIT D-4347-5** (Gary, 1993; trad. ITESM)
> - `12_.../Introducción a los sistemas con realimentación.pdf` — **MIT D-4691**, *An Introduction to Feedback*
>
> ⚠️ Varias diapositivas tienen los **diagramas y símbolos en imagen**: las convenciones gráficas no se recuperan del texto.

---

## 1. Pensamiento sistémico (deck 13)

### Definición `[DATO]`
Citando a **Joseph O'Connor e Ian McDermott**:
> *"El pensamiento sistémico es un método para **identificar algunas reglas, algunas series de patrones y sucesos** a fin de prepararnos de cara al futuro e **influir sobre él** en alguna medida. Nos aporta cierto control."*

Otra cita del deck: *"A menos que establezcamos una **relación entre causa y efecto**, será difícil aprender de la experiencia y tomar decisiones adecuadas."*

`[DATO]` El deck afirma que el pensamiento **lógico/analítico "no funciona cuando nos manejamos con sistemas"**, y lo ilustra con un ejemplo de **incendio forestal** (imagen).

### Las dos ideas que cuestiona `[DATO]`
Bajo *Modelos mentales* se ponen a prueba dos creencias:
1. **"El todo es la suma de las partes"** → se cuestiona: *"Algo equilibrado es el resultado de **todas las relaciones** que lo forman"*.
2. **"La estructura determina el comportamiento"**: *"la estructura de un sistema da lugar a su comportamiento"*.

`[DATO]` Primera lección del deck: **saber si tratamos con complejidad *simple* o *dinámica***. ⚠️ El contenido que las distingue **es una imagen**.

### Los bucles de realimentación `[DATO]`
> *"Bucles de realimentación: la esencia de los sistemas… **sin realimentación no hay sistema**."*

| Tipo | Qué hace |
|---|---|
| **Realimentación de REFUERZO** | **Amplifica** el cambio original |
| **Realimentación de COMPENSACIÓN** | Se **opone** al cambio, **estabiliza** |

`[DATO]` **Ejemplo numérico del refuerzo**: `$200.000` al **10 % anual** → año 1 interés $20.000 (total $220.000); año 2 interés $22.000 (total $242.000)… *"sólo al cabo de **siete años** el capital inicial se habrá duplicado."*

`[DATO]` **Ejemplos de compensación**: temperatura corporal · inventario · oferta y demanda · medio ambiente · depredador-presa. Los bucles de compensación *"persiguen un objetivo"* y requieren **medir la brecha** entre el estado actual y el deseado.

### ⚠️ Lo que NO está
- **"La quinta disciplina" aparece solo como TÍTULO de diapositiva.** **Senge no se nombra en el cuerpo** y su contenido no se desarrolla.
- **No hay Forrester, no hay Meadows.**
- **No hay definiciones rigurosas** de *emergencia*, *fronteras* ni de **holismo**.
- `[DATO]` El único autor citado en el cuerpo es **O'Connor & McDermott**.

---

## 2. Dinámica de sistemas (deck 14, Prof. H. Zamorano)

### Diagramas causales `[DATO]`
> *"Constituyen la herramienta por medio de la cual se expresarán las **relaciones causales**, conformando los denominados **bucles**."*

Las relaciones llevan **polaridad**:
- **`+`** → el cambio va **en el mismo sentido**
- **`−`** → el cambio va **en sentido opuesto**

`[DATO]` Ejemplos que da el deck:
- **Refuerzo**: *Clientes satisfechos → comentarios positivos → más ventas → más clientes satisfechos*.
- **Compensación**: *saldo de caja vs **saldo deseado*** — *"la diferencia constituye una **brecha** que tiende a cubrirse"*.

`[INFERENCIA]` **Los retardos (*delays*) no se formalizan** como constructo. Aparecen solo como expresiones textuales del tipo *"after a delay"* en el material del MIT.

### Niveles y flujos `[DATO]`
> *"A partir de los diagramas causales, identificamos **los niveles y los flujos**… el soft, a partir de dicho dibujo, conformará el sistema de relaciones (de acuerdo con los símbolos utilizados: **flujos, variables auxiliares, niveles, constantes**)."*

Símbolos que lista: **NIVEL** · variable auxiliar · línea de flujo · parámetro regulador.
⚠️ **Los gráficos de esos símbolos están en imagen.**

### La ecuación del nivel — solo en forma INTEGRAL `[DATO]`
```
N(t) = N(0) + ∫₀ᵗ (FE − FS) dt
```
donde `FE` = flujo de entrada y `FS` = flujo de salida.

`[DATO]` La acumulación se describe como *"técnicas matemáticas del **cálculo integral** en cada intervalo de tiempo"*, y `∆X/∆T` se llama *"coeficiente de diferencia"*.

⚠️ `[DATO]` **La forma discreta estándar NO está escrita.** Es decir, el deck **no** escribe:
```
stock(t) = stock(t−dt) + dt·(entrada − salida)
```

### Métodos de integración — ⚠️ con un ERROR `[DATO]`
> *"Los métodos de integración proporcionados por los programas específicos son: **Euler, Runge-Kutta segundo, Runge-Kutta tercero, Runge-Kutta cuarto**; **los tres primeros tienen un tamaño de paso fijo y el último es variable**."*

⚠️ **Eso está mal como está escrito.** RK4 es el método **clásico de paso fijo**; RK2 y RK3 también usan paso fijo. La afirmación de la cátedra es **incorrecta**. En un oral, contestá lo que dice la cátedra **si te lo piden textual**, pero sabé que el estándar es que los cuatro son de paso fijo (y que los paquetes suelen ofrecer paso adaptativo aparte).

### Software de dinámica de sistemas `[DATO]`
El deck nombra **"Powersim, Vensim, Stella, Ithink, etc."**.

`[DATO]` El **ejemplo de población** no está rotulado con ningún paquete, pero su sintaxis es la de **Vensim**:
```
Población = INTEG(+Nacimientos - Mortalidad, 100000)
```
corridas `Current` / `current2`, *"Graph for Población"*, eje x *"Time (Month)"*.

### ⚠️ Arquetipos: NO ESTÁN
`[DATO]` **Ninguno**: ni límites al crecimiento, ni desplazamiento de la carga, ni metas decrecientes, ni tragedia de los comunes. **Ausentes por completo.**

### Ejemplo resuelto: evolución de la población `[DATO]`
```
Mortalidad = Población * tasa de mortalidad
Nacimientos = Población * tasa de natalidad
Población  = INTEG(+Nacimientos - Mortalidad, 100000)
tasa de mortalidad = 0.03
tasa de natalidad  = 0.05
```
**Corrida base**: la población crece **exponencialmente hasta ~800.000 en 100 meses**.
**Variante**: con `tasa de natalidad` de **0,05 → 0,06**, llega a **~2.000.000**.

`[DATO]` Referencia externa que da el deck: **MIT Road Maps** (`web.mit.edu/sysdyn/road-maps/toc.html`).

---

## 3. Ejercicios iniciales de creación de modelos `[DATO]`

**MIT D-4347-5** — *System Dynamics in Education Project*, Sloan School of Management. Autor: **Michael Shayne Gary**, con William A. Glass (8/3/1993); traducido por ITESM Monterrey y revisado por Juan Martín García (junio 2000).

**Premisa**: *"Todo lo que nos rodea en el mundo puede estar representado ya sea por un **nivel** o un **flujo**."*

| Ejercicio | Qué pide |
|---|---|
| **1A** | Clasificar como **nivel** o **flujo** y dibujar el diagrama: *población · personas infectadas · producción de fábrica · contaminación · interés · salario · distancia · carga eléctrica*. Aviso: *"algunas variables pueden ser tanto un nivel como un flujo, pero el diagrama debe ser coherente"* |
| **1B** | Para los niveles *ordenadores de una tienda · armas nucleares · libros de una biblioteca · árboles de un bosque · calor · distancia · velocidad*: identificar los **flujos asociados** y dar las **unidades** de flujos y niveles |
| **2A** | Sobre diagramas causales dados, asignar **`+` o `−`** a cada vínculo, y marcar **`+`** en el centro del bucle si es **refuerzo (crecimiento exponencial)** o **`−`** si es **compensación (estabilizador)**. ⚠️ Los diagramas están **en imagen** |
| **2B** | Redibujar **tres** de los sistemas del 2A como **diagramas de flujos**, agregando variables y flujos, y marcar el signo de los vínculos y los bucles |
| **2C** | Construir **tres modelos en STELLA** a partir de esos diagramas de flujos |

`[DATO]` Las **respuestas** están en **D-4356**, *"Respuestas a los Ejercicios Iniciales de Creación de Modelos"* (Gary, 1993) — **no está en el directorio**.

---

## 4. Material MIT de realimentación `[DATO]`

**Definición de realimentación** (citando a **Roberts et al., 1983**, *Introduction to Computer Simulation*, p. 16):
> *"process whereby an initial cause ripples through a chain of causation ultimately to reaffect itself"*

| Tipo | Comportamiento |
|---|---|
| **Positiva** | aumento → más aumento → **crecimiento (o decaimiento) exponencial** |
| **Negativa** | aumento → disminución → **asintótico u oscilatorio**, **búsqueda de meta** |

**Los números que da el material** (útiles para el oral porque son concretos):

| Ejemplo | Valor |
|---|---|
| **E. coli** | 100 → **25.600** en 4 horas (duplica cada 0,5 h) |
| **Carbono-14** | vida media **5.230 años**; 1000 núcleos a lo largo de 300 siglos (decaimiento asintótico) |
| **Dieta** | **200 lb → 150 lb en 24 semanas** |
| **Cuenta bancaria** | $200.000 al 10 % se duplica en **7 años** |

`[DATO]` **Cautela metodológica que aporta el propio material**: una **tasa de interés no es una "tasa" en el sentido de la dinámica de sistemas** — una *rate* es un **flujo**, no un porcentaje adimensional.

---

## 5. ⚠️ El hueco mayor: la clasificación del software

El programa **UNIDAD N° 8: SIMULACION DE SISTEMAS EN COMPUTADORAS** promete textualmente:
> *"Software de Simulación. Introducción. **Comparación de Lenguajes de Simulación con lenguajes de Propósitos Generales. Clasificación del Software de Simulación.** Lenguajes de Simulación. **Lenguajes de simulación orientados a eventos y a procesos.**"*

`[DATO]` **NINGUNO de los archivos de U8 desarrolla esto.** No hay:
- comparación de lenguajes de simulación vs lenguajes de propósito general,
- clasificación del software de simulación,
- lenguajes **orientados a eventos vs a procesos**,
- ni referencia a **Shannon** ni a **Law & Kelton** (la bibliografía del programa).

`[DATO]` Lo único que hay es una **lista pelada de paquetes de dinámica de sistemas** (*"Powersim, Vensim, Stella, Ithink, etc."*) y las notas sobre **STELLA** en los dos documentos del MIT.

`[INFERENCIA]` **Es un bloque vacío.** Si el final te toma "clasificación del software de simulación" o "orientados a eventos vs a procesos", la cátedra no te dio nada. Las fuentes para responder están en **U4** (Banks §3.1.2, las tres visiones del mundo) y en el deck de **U5** orientado a la herramienta. Banks sostiene que **todos los paquetes comerciales —incluido SIMUL8— adoptan la visión de *process interaction***.

---

## 6. Notas para el examen

### Para memorizar
```
N(t) = N(0) + ∫₀ᵗ (FE − FS) dt          (ecuación del nivel, forma integral)
Población = INTEG(+Nacimientos − Mortalidad, 100000)
Refuerzo  → exponencial        Compensación → asintótico / oscilatorio, busca meta
Métodos de integración: Euler, RK2, RK3, RK4
$200.000 al 10 % se duplica en 7 años
E. coli: 100 → 25.600 en 4 h
```

### Errores y rarezas del material
1. **⚠️ RK4 "de paso variable"**: el deck dice que *"los tres primeros tienen tamaño de paso fijo y el último es variable"*. **RK4 es el clásico de paso fijo.** Afirmación incorrecta.
2. **La ecuación del nivel solo está en forma integral**, no en la forma discreta estándar.
3. **Unidades incoherentes en el material MIT**: un ejemplo de nacimientos está rotulado `people/year` cuando habla de **zorrillos** (*skunks*).
4. **"La quinta disciplina" sin Senge**: título sin contenido.

### Anunciado y NO desarrollado
- Toda la **clasificación del software de simulación** y la comparación **lenguajes específicos vs de propósito general**.
- Los **lenguajes orientados a eventos vs a procesos**.
- Las fuentes **Shannon** y **Law & Kelton** que el programa cita para U8.
- Los **arquetipos** de dinámica de sistemas (no exigidos por el programa, pero habitualmente esperados).
