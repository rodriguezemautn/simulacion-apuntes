# U7 — Simulación de sistemas continuos (TEORÍA)

> **Fuente**: `11_Simulacion Continua/Simulación Continua.pdf` (26 págs., título del deck: **SIMULACION CONTINUA / ECUACIONES DIFERENCIALES**).
>
> ⚠️ **Advertencia crítica**: el deck está **armado con las fórmulas en imágenes**. El texto se extrae, **las ecuaciones NO**. Todo lo que sigue está marcado según se pueda o no recuperar.

---

## 1. Alcance declarado `[DATO]`

El deck arranca desde el **análisis numérico**, no desde la modelización:

> *"Las ecuaciones diferenciales parciales constituyen una de las ramas del análisis numérico que más rápidamente se han desarrollado. Los campos de aplicación en los que ocurren las ecuaciones diferenciales parciales (**física nuclear y aerodinámica**, para nombrar únicamente dos) están adquiriendo cada vez mayor importancia."*

`[DATO]` Alcance: *"Trataremos **ecuaciones diferenciales parciales de segundo orden, lineales y con dos variables independientes**."*

`[DATO]` La única diapositiva definitoria dice *"Las ecuaciones diferenciales expresan el comportamiento de:"* — y **el objeto de la frase es una imagen**. **No hay definición explícita de "variable de estado".**

---

## 2. ⚠️ Lo que el programa promete y el material NO da

| El programa (U7) dice | ¿Está? |
|---|---|
| *"Su resolución por **ecuaciones diferenciales ordinarias**"* | ❌ **AUSENTE POR COMPLETO.** No hay una sola EDO, ni método analítico ni numérico. **No hay Euler, no hay Runge-Kutta, no hay tamaño de paso, no hay error ni estabilidad.** |
| *"Aplicación de estos métodos a la resolución de **modelos sencillos**"* | ❌ Ausente |
| *"EDP **parabólicas e hiperbólicas**"* | 🟡 **Solo nombradas.** No se desarrollan |
| Bibliografía: **Borelli y Coleman (2002)** y **M. Braun (1990)** | ❌ **No se referencia ninguna** |
| Trabajo práctico | ❌ **No hay TP, ni enunciado, ni entregable** |
| Herramienta de software | ❌ **No se nombra ninguna** — ni Simulink, ni PowerSim, ni Vensim, ni Stella, ni MATLAB |

`[INFERENCIA]` **U7 es un deck de una sola cosa**: diferencias finitas aplicadas a Laplace. Todo lo demás que promete el programa, no está.

---

## 3. Clasificación de las EDP `[DATO]`

Se nombran **tres tipos** de ecuaciones de segundo orden: **elíptica, parabólica e hiperbólica**.
⚠️ La **condición discriminante** (la fórmula que las distingue) **es una imagen: no se recupera**.

---

## 4. Condiciones de frontera e iniciales `[DATO]`

- Una **EDO** tiene **toda una familia de soluciones**; la **condición inicial** selecciona una en particular.
- Con **dos variables independientes**, las condiciones adicionales deben darse **a lo largo de una curva en el plano x-y**.
- Esas condiciones pueden referirse a **`u` y/o a sus derivadas**.
- La curva **puede ser cerrada o abierta** según el tipo de ecuación.

---

## 5. El método: diferencias finitas `[DATO]`

`[DATO]` *"El método se puede describir como la **sustitución de una derivada por una diferencia**"*, en ambas direcciones independientes.

Lo que el deck desarrolla:
1. **Serie de Taylor** de `u(x, y₀)` alrededor de `(x₀, y₀)` → fórmula **en imagen**.
2. **Diferencia hacia adelante** (*forward difference*), obtenida por una elección particular de `h`. El texto dice que **existe un error de truncamiento** (*"El error de truncamiento es…"*) pero **la fórmula está en imagen**.
3. **Diferencia hacia atrás** (*backward difference*).
4. **Segunda derivada**: se construye escribiendo una diferencia para la segunda derivada **en función de la primera** y sustituyendo las aproximaciones hacia adelante y hacia atrás.
5. `[DATO]` Observación fina del deck: la sustitución hacia adelante **sesga el resultado hacia adelante**, y *"compensamos este error utilizando las **diferencias hacia atrás**"*.

⚠️ Las fórmulas finales (*"Quedando finalmente: …"*) **están en imagen**.

---

## 6. El único caso desarrollado: ecuación de Laplace (elíptica) `[DATO]`

- Se resuelve `u = f(x, y)` sobre la **frontera `C`** de una región `R`.
- `C` se toma como **rectas paralelas a los ejes** → la región es un **rectángulo de ancho `A` y alto `B`**.
- `A` se divide en **`n` intervalos** y `B` en **`m`**.
- La ecuación se **aproxima por diferencias**; multiplicando y renombrando (los símbolos están en imagen) se llega a una **recurrencia resoluble**.
- `[DATO]` **Método de cálculo**: *"Se calcula **valor por valor** y la primera vez se toman los valores desconocidos **igual a cero**."*

`[INFERENCIA]` Ese barrido —calcular cada nodo con los vecinos disponibles, arrancando de cero— es el esquema **iterativo tipo Gauss-Seidel**.

## 7. Método de Liebmann (relajación) `[DATO]`

Se presenta como el **esquema de aceleración** de ese barrido:
- Usa un **peso `w`** (fórmula en imagen).
- `[DATO]` *"Con una buena elección de `w` se pueden producir **ahorros importantes de tiempo de computadora (del orden de 20 a 1)**."*
- ⚠️ El **diagrama en bloques** del método está en imagen.

---

## 8. ⚠️ Todo lo que solo existe como imagen

Si estudiás **solo desde el texto**, no podés recuperar:
- la forma general de la EDP,
- el **discriminante** de clasificación,
- las fórmulas de **Taylor**, diferencia hacia adelante y hacia atrás,
- la **expresión del error de truncamiento**,
- la fórmula de la **segunda derivada**,
- el **estencil de diferencias de Laplace**,
- la **fórmula de Liebmann** y su diagrama.

`[INFERENCIA]` **U7 es la unidad donde más depende de ir a la diapositiva original.** Es un deck para *mirar*, no para leer.

---

## 9. Notas para el examen

1. **Si te toca U7, el contenido real es acotado**: clasificación de EDP · condiciones de frontera · diferencias finitas (adelante, atrás, segunda derivada) · **Laplace por diferencias** · **relajación de Liebmann con peso `w`**.
2. **No busques EDO en este material.** El programa las promete, el deck no las da. Si te preguntan por resolución de EDO, la respuesta no está en la cátedra.
3. **Las EDP parabólicas e hiperbólicas son solo nombres.** Si te toca "clasifique las EDP", podés dar los tres tipos — pero el desarrollo real es **solo el elíptico**.
4. **Recordá el 20:1**: es el único número concreto que el deck afirma sobre rendimiento.
5. **Los "modelos sencillos" del programa no aparecen.** El único modelo es Laplace con condiciones de frontera genéricas, **sin números**.
